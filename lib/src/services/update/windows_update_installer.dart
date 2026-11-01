import 'dart:convert';
import 'dart:io';
import 'dart:isolate';
import 'dart:math';

import 'package:archive/archive_io.dart';
import 'package:crypto/crypto.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'app_update_backend.dart';
import 'desktop_archive.dart';

typedef WindowsUpdaterLauncher = Future<void> Function(
    String executable, String requestPath);

class PreparedWindowsUpdate {
  const PreparedWindowsUpdate(this.transactionPath);
  final String transactionPath;

  Future<void> commit() async {
    if (await File(p.join(transactionPath, 'cancel')).exists()) {
      throw StateError('更新已取消');
    }
    await File(
      p.join(transactionPath, 'commit'),
    ).writeAsString('committed', flush: true);
  }

  Future<void> cancel() => File(
        p.join(transactionPath, 'cancel'),
      ).writeAsString('cancelled', flush: true);
}

/// Stages the complete bundle beside the installation before any app exits.
/// The helper lives outside that installation and acknowledges readiness first.
class WindowsUpdateInstaller {
  WindowsUpdateInstaller({
    String? executablePath,
    Future<Directory> Function()? supportDirectory,
    WindowsUpdaterLauncher? launcher,
    this.readyTimeout = const Duration(seconds: 60),
  })  : _executablePath = executablePath ?? Platform.resolvedExecutable,
        _supportDirectory = supportDirectory ?? getApplicationSupportDirectory,
        _launcher = launcher ?? _launch;

  final String _executablePath;
  final Future<Directory> Function() _supportDirectory;
  final WindowsUpdaterLauncher _launcher;
  final Duration readyTimeout;

  static Future<void> _launch(String executable, String requestPath) async {
    await Process.start(
      executable,
      [requestPath],
      workingDirectory: p.dirname(executable),
      mode: ProcessStartMode.detached,
    );
  }

  Future<PreparedWindowsUpdate> prepareAndLaunch(
    AppRelease release,
    String zipPath,
  ) async {
    final asset = release;
    final zip = File(zipPath);
    if (await zip.length() != asset.size ||
        (await sha256.bind(zip.openRead()).first).toString() != asset.sha256) {
      throw const FormatException('更新包校验失败，请重新下载');
    }
    final install = await Directory(
      p.dirname(_executablePath),
    ).resolveSymbolicLinks();
    final support = (await _supportDirectory()).absolute.path;
    if (p.equals(install, support) || p.isWithin(install, support)) {
      throw const FormatException('请将程序放在用户数据目录之外再更新');
    }
    final id = List.generate(
      16,
      (_) => Random.secure().nextInt(256).toRadixString(16).padLeft(2, '0'),
    ).join();
    final staged = Directory(
      p.join(p.dirname(install), '.${p.basename(install)}-update-$id'),
    );
    final transaction = Directory(
      p.join(support, 'updates', 'windows', 'transactions', id),
    );
    var launched = false;
    try {
      await staged.create();
      await transaction.create(recursive: true);
      final stagedPath = staged.path;
      final files = await Isolate.run(
        () => extractWindowsUpdate(zipPath, stagedPath),
      );
      for (final required in windowsBundleFiles) {
        if (!files.containsKey(required)) {
          throw FormatException('Windows 更新包缺少 $required');
        }
      }
      if (!await Directory(
        p.join(staged.path, 'data', 'flutter_assets'),
      ).exists()) {
        throw const FormatException('Windows 更新包缺少 Flutter 资源');
      }
      final currentHelper = File(p.join(install, 'refuge_updater.exe'));
      final helper = p.join(transaction.path, 'refuge_updater.exe');
      await currentHelper.copy(helper);
      final requestPath = p.join(transaction.path, 'request.json');
      await File(requestPath).writeAsString(
        jsonEncode({
          'schemaVersion': 1,
          'requiresCommit': true,
          'parentPid': pid,
          'installPath': install,
          'stagedPath': staged.path,
          'transactionPath': transaction.path,
          'zipPath': p.absolute(zipPath),
          'zipSize': asset.size,
          'zipSha256': asset.sha256,
          'version': '${release.name}+${release.code}',
          'files': files,
        }),
        flush: true,
      );
      final prepared = PreparedWindowsUpdate(transaction.path);
      // Used to surface helper failures on the next application start.
      await File(
        p.join(support, 'updates', 'windows', 'last-transaction.json'),
      ).writeAsString(jsonEncode({'id': id}), flush: true);
      await _launcher(helper, requestPath);
      launched = true;
      final ready = File(p.join(transaction.path, 'ready.json'));
      final deadline = DateTime.now().add(readyTimeout);
      while (DateTime.now().isBefore(deadline)) {
        if (await ready.exists()) {
          final data = jsonDecode(await ready.readAsString()) as Map;
          if (data['state'] == 'ready') return prepared;
          throw FormatException(data['message'] as String? ?? '更新器启动失败');
        }
        await Future<void>.delayed(const Duration(milliseconds: 100));
      }
      await prepared.cancel();
      throw const FormatException('更新器未能启动，程序保持运行，请重试');
    } on Object {
      if (launched) {
        // A helper may still be starting. It must not apply a cancelled job.
        await PreparedWindowsUpdate(transaction.path).cancel();
      } else if (await staged.exists()) {
        await staged.delete(recursive: true);
      }
      rethrow;
    }
  }
}

const windowsBundleFiles = [
  'refuge_next.exe',
  'refuge_updater.exe',
  'flutter_windows.dll',
  'sqlite3.dll',
  'data/icudtl.dat',
  'data/app.so',
];

/// Runs in a worker isolate; paths use ZIP separators on every host platform.
Map<String, String> extractWindowsUpdate(String zipPath, String stagedPath) {
  final input = InputFileStream(zipPath);
  final files = <String, String>{};
  final names = <String>{};
  var expanded = 0;
  try {
    final archive = readDesktopZip(input, windows: true);
    if (archive.length > 10000) throw const FormatException('更新包文件过多');
    for (final entry in archive) {
      final name = entry.name.replaceAll('\\', '/');
      final components =
          name.split('/').where((value) => value.isNotEmpty).toList();
      if (entry.isSymbolicLink ||
          name.startsWith('/') ||
          components.isEmpty ||
          components.length > 64 ||
          components.any(
            (part) =>
                part == '.' ||
                part == '..' ||
                RegExp(r'[<>:"|?*\x00-\x1f]').hasMatch(part) ||
                part.endsWith('.') ||
                part.endsWith(' ') ||
                RegExp(
                  r'^(con|prn|aux|nul|com[1-9]|lpt[1-9])(\.|$)',
                  caseSensitive: false,
                ).hasMatch(part),
          ) ||
          !names.add(components.join('/').toLowerCase())) {
        throw const FormatException('Windows 更新包包含不安全的文件路径');
      }
      final destination = p.joinAll([stagedPath, ...components]);
      if (!entry.isFile) {
        Directory(destination).createSync(recursive: true);
        continue;
      }
      expanded += entry.size;
      if (expanded > 1024 * 1024 * 1024) {
        throw const FormatException('更新包解压后过大');
      }
      File(destination).parent.createSync(recursive: true);
      final output = OutputFileStream(destination);
      try {
        entry.writeContent(output);
      } finally {
        output.closeSync();
      }
      final file = File(destination);
      if (file.lengthSync() != entry.size) {
        throw const FormatException('更新包文件大小不一致');
      }
      // Small bounded chunks avoid loading the complete AOT library twice.
      final digestResult = _DigestSink();
      final sink = sha256.startChunkedConversion(digestResult);
      final reader = file.openSync();
      try {
        while (true) {
          final bytes = reader.readSync(1024 * 1024);
          if (bytes.isEmpty) break;
          sink.add(bytes);
        }
      } finally {
        reader.closeSync();
      }
      sink.close();
      files[components.join('/')] = digestResult.value!.toString();
    }
  } finally {
    input.closeSync();
  }
  return files;
}

class _DigestSink implements Sink<Digest> {
  Digest? value;
  @override
  void add(Digest data) => value = data;
  @override
  void close() {}
}
