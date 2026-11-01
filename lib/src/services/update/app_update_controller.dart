import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'app_update_backend.dart';
import 'desktop_update_backend.dart';

export 'app_update_backend.dart' show AppRelease, InstalledApp;

enum UpdatePhase {
  idle,
  checking,
  available,
  downloading,
  validating,
  ready,
  permissionRequired,
  installRequested,
  upToDate,
  unavailable,
  restarting,
  error,
}

enum UpdateFailure { check, download, install }

class AppUpdateController extends ChangeNotifier {
  AppUpdateController(this.backend);
  static final instance = AppUpdateController(
      Platform.isWindows || Platform.isMacOS
          ? DesktopUpdateBackend()
          : AndroidUpdateBackend());
  final AppUpdateBackend backend;
  UpdatePhase phase = UpdatePhase.idle;
  UpdateFailure? failure;
  String? error;
  AppRelease? release;
  InstalledApp? installed;
  int received = 0;
  int total = 0;
  Future<void>? _initialization;
  Future<void>? _check;
  Future<bool>? _download;
  Future<void>? _install;
  Directory? _directory;
  CancelToken? _cancel;
  bool _disposed = false;
  int? _completeSize;

  bool get requiresRestart => backend.requiresRestart;
  static bool get supported =>
      Platform.isAndroid || Platform.isWindows || Platform.isMacOS;

  bool get busy =>
      phase == UpdatePhase.restarting ||
      phase == UpdatePhase.downloading ||
      phase == UpdatePhase.validating ||
      phase == UpdatePhase.checking;
  bool get hasPackage => _completeSize != null;
  double? get progress => total > 0 ? (received / total).clamp(0, 1) : null;
  File get _record => File('${_directory!.path}/update.json');
  File _apk(AppRelease value) =>
      File('${_directory!.path}/refuge-${value.code}.${value.extension}');
  File _part(AppRelease value) =>
      File('${_directory!.path}/refuge-${value.code}.part');

  void _emit() {
    if (!_disposed) notifyListeners();
  }

  void _fail(UpdateFailure kind, String message) {
    failure = kind;
    error = message;
    phase = UpdatePhase.error;
    _emit();
  }

  Future<void> initialize() =>
      _initialization ??= _restore().catchError((Object e) {
        // Keep this retryable when storage or platform initialization is unavailable.
        _initialization = null;
        throw e;
      });

  Future<void> _restore() async {
    installed = await backend.installedApp();
    _directory = await backend.directory();
    await _directory!.create(recursive: true);
    // Only files created by this updater may be removed.
    for (final entry in await _directory!.list().toList()) {
      final match = RegExp(r'^refuge-(\d+)\.(apk|zip|part)$')
          .firstMatch(entry.uri.pathSegments.last);
      if (entry is File &&
          match != null &&
          ((!requiresRestart && int.parse(match[1]!) <= installed!.code) ||
              match[2] == 'part')) {
        await entry.delete();
      }
    }
    if (!await _record.exists()) return;
    try {
      final json =
          jsonDecode(await _record.readAsString()) as Map<String, dynamic>;
      final saved =
          AppRelease.fromJson(json['release'] as Map<String, dynamic>);
      if (!backend.isNewer(saved, installed!)) {
        await _deleteIfExists(_apk(saved));
        await _record.delete();
        return;
      }
      release = saved;
      final size = json['size'] as int?;
      if (size != null && await _valid(_apk(saved), saved, size)) {
        _completeSize = size;
        phase = UpdatePhase.ready;
      } else {
        await _deleteIfExists(_apk(saved));
        phase = UpdatePhase.error;
        failure = UpdateFailure.download;
        error = '上次下载未完成，请重新下载';
      }
    } on FileSystemException {
      rethrow;
    } catch (_) {
      await _deleteIfExists(_record);
      release = null;
      _completeSize = null;
      phase = UpdatePhase.idle;
    }
    _emit();
  }

  Future<void> check({bool refresh = true}) {
    if (_download != null || _install != null) return Future.value();
    return _check ??= _runCheck(refresh).whenComplete(() => _check = null);
  }

  Future<void> _runCheck(bool refresh) async {
    try {
      await initialize();
      phase = UpdatePhase.checking;
      error = null;
      failure = null;
      _emit();
      final latest = await backend.latest(refresh: refresh);
      if (_disposed) return;
      if (!backend.isNewer(latest, installed!)) {
        await _forgetPackage();
        release = null;
        phase = UpdatePhase.upToDate;
      } else {
        final uri = Uri.tryParse(latest.url);
        if (uri == null || uri.scheme != 'https' || uri.host.isEmpty) {
          throw const FormatException('Invalid update URL');
        }
        if (release?.code != latest.code ||
            release?.url != latest.url ||
            release?.sha256 != latest.sha256 ||
            release?.name != latest.name) {
          await _forgetPackage();
        }
        release = latest;
        phase = hasPackage ? UpdatePhase.ready : UpdatePhase.available;
      }
      error ??= await backend.previousResult();
      _emit();
    } catch (exception) {
      if (exception is UpdateUnavailable && !hasPackage) {
        release = null;
        phase = UpdatePhase.unavailable;
        error = exception.message;
        _emit();
        return;
      }
      final message = _checkErrorMessage(exception);
      debugPrint('[AppUpdate] check failed: ${exception.runtimeType}'
          '${exception is DioException ? ' ${exception.type.name} HTTP ${exception.response?.statusCode ?? "none"}' : ''}');
      if (hasPackage) {
        phase = UpdatePhase.ready;
        error = '$message；仍可安装已下载的版本';
        _emit();
      } else {
        _fail(UpdateFailure.check, message);
      }
    }
  }

  String _checkErrorMessage(Object exception) {
    if (exception is TimeoutException ||
        (exception is DioException &&
            const {
              DioExceptionType.connectionTimeout,
              DioExceptionType.sendTimeout,
              DioExceptionType.receiveTimeout,
            }.contains(exception.type))) {
      return '检查更新超时，请稍后重试';
    }
    if (exception is DioException && exception.response?.statusCode != null) {
      return '版本服务暂不可用（${exception.response!.statusCode}），请稍后重试';
    }
    if (exception is FormatException || exception is TypeError) {
      return '版本信息格式异常，请稍后重试';
    }
    if (exception is FileSystemException) {
      return '无法读取本地更新文件，请检查存储空间后重试';
    }
    if (exception is PlatformException || exception is MissingPluginException) {
      return '无法初始化更新功能，请重新打开应用';
    }
    return '无法连接版本服务，请检查网络后重试';
  }

  Future<void> _save({int? size}) async {
    final temporary = File('${_record.path}.tmp');
    await temporary.writeAsString(
        jsonEncode({
          'release': release!.toJson(),
          'size': size,
        }),
        flush: true);
    await temporary.rename(_record.path);
  }

  Future<bool> _valid(File file, AppRelease value, int size) async {
    if (size <= 0 || !await file.exists() || await file.length() != size) {
      return false;
    }
    return backend.validatePackage(file.path, value, installed!);
  }

  Future<void> _forgetPackage() async {
    _completeSize = null;
    if (release != null) {
      await _deleteIfExists(_apk(release!));
      await _deleteIfExists(_part(release!));
    }
    await _deleteIfExists(_record);
    _completeSize = null;
  }

  Future<bool> download() {
    if (_check != null || _install != null || release == null) {
      return Future.value(false);
    }
    return _download ??= _runDownload().whenComplete(() => _download = null);
  }

  Future<bool> _runDownload() async {
    final target = release!;
    final token = CancelToken();
    _cancel = token;
    received = total = 0;
    error = null;
    failure = null;
    phase = UpdatePhase.downloading;
    _emit();
    final part = _part(target);
    final apk = _apk(target);
    try {
      await _save();
      await backend.download(target.url, part.path, token, (count, length) {
        if (_disposed || token.isCancelled) return;
        received = count;
        total = length;
        _emit();
      });
      if (token.isCancelled) throw const _Cancelled();
      phase = UpdatePhase.validating;
      _emit();
      final size = await part.length();
      // Native archive parsing operates on APK filenames.
      await part.rename(apk.path);
      if (!await _valid(apk, target, size) || (total > 0 && size != total)) {
        throw const FormatException('Invalid APK identity or size');
      }
      if (token.isCancelled) throw const _Cancelled();
      await _save(size: size);
      _completeSize = size;
      phase = UpdatePhase.ready;
      _emit();
      return true;
    } catch (e) {
      _completeSize = null;
      try {
        await _deleteIfExists(part);
        await _deleteIfExists(apk);
        if (token.isCancelled || e is _Cancelled) {
          await _deleteIfExists(_record);
        }
      } on FileSystemException {
        _fail(UpdateFailure.download, '无法清理未完成的安装包，请检查存储空间后重试');
        return false;
      }
      if (token.isCancelled || e is _Cancelled) {
        phase = UpdatePhase.available;
        error = null;
        _emit();
      } else {
        final cause = e is DioException ? e.error ?? e : e;
        _fail(
            UpdateFailure.download,
            cause is FileSystemException
                ? '无法保存安装包，请检查可用存储空间后重试'
                : e is FormatException || e is PlatformException
                    ? '安装包无法验证，或与目标版本不符，请重新下载'
                    : '下载失败，请检查网络后重试');
      }
      return false;
    } finally {
      _cancel = null;
    }
  }

  Future<void> cancelDownload() async {
    _cancel?.cancel();
    await _download;
  }

  Future<void> install() {
    if (!hasPackage || _check != null || _download != null) {
      return Future.value();
    }
    return _install ??= _runInstall().whenComplete(() => _install = null);
  }

  Future<void> _runInstall() async {
    error = null;
    failure = null;
    try {
      var valid = false;
      try {
        valid = await _valid(_apk(release!), release!, _completeSize!);
      } on FormatException {
        // An archive can become corrupt after a previous successful validation.
      } on PlatformException {
        // Native archive parsing rejected the file.
      }
      if (!valid) {
        await _forgetPackage();
        _fail(UpdateFailure.download, '安装包已失效，请重新下载');
        return;
      }
      if (!await backend.canInstall()) {
        phase = UpdatePhase.permissionRequired;
        _emit();
        return;
      }
      if (requiresRestart) {
        phase = UpdatePhase.restarting;
        _emit();
      }
      await backend.installRelease(_apk(release!).path, release!);
      phase = UpdatePhase.installRequested;
      _emit();
    } catch (e) {
      _fail(
          UpdateFailure.install,
          requiresRestart
              ? (e is PlatformException
                  ? e.message ?? '更新失败，请重试'
                  : e is FileSystemException
                      ? '无法写入安装目录，请将程序移至用户可写目录后重试'
                      : e is FormatException
                          ? e.message
                          : '更新失败，程序已保留，请重试')
              : '无法打开系统安装器，请重试');
    }
  }

  Future<bool> openPermissionSettings() async {
    try {
      await backend.openPermissionSettings();
      return true;
    } catch (_) {
      _fail(UpdateFailure.install, '无法打开安装权限设置，请重试');
      return false;
    }
  }

  Future<void> refreshPermission() async {
    if (phase != UpdatePhase.permissionRequired) return;
    try {
      final allowed = await backend.canInstall();
      if (allowed && phase == UpdatePhase.permissionRequired) {
        phase = UpdatePhase.ready;
        _emit();
      }
    } catch (_) {
      _fail(UpdateFailure.install, '无法检查安装权限，请重试');
    }
  }

  Future<void> resumePermission() async {
    if (phase != UpdatePhase.permissionRequired) return;
    // Recheck through the same guarded installation path, including APK identity.
    await install();
  }

  static Future<void> _deleteIfExists(File file) async {
    if (await file.exists()) await file.delete();
  }

  @override
  void dispose() {
    _disposed = true;
    _cancel?.cancel();
    super.dispose();
  }
}

class _Cancelled {
  const _Cancelled();
}
