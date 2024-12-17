import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:archive/archive.dart';

/// 下载并解压文件
/// [url] 下载文件的URL
/// [extractPath] 解压目标路径（相对于应用文档目录的路径）
/// [onProgress] 下载进度回调函数，返回 0.0 到 1.0 的进度值
/// [onStatus] 状态信息回调函数
/// 返回解压后的目录路径
Future<String> downloadAndExtractFile({
  required String url,
  required String extractPath,
  void Function(double progress)? onProgress,
  void Function(String status)? onStatus,
}) async {
  try {
    // 获取应用文档目录
    final appDir = await getApplicationDocumentsDirectory();
    final tempZipPath = '${appDir.path}/temp_download.zip';
    final extractFullPath = '${appDir.path}/$extractPath';

    // 更新状态：开始下载
    onStatus?.call('开始下载文件...');

    // 下载文件
    final file = File(tempZipPath);
    final response = await http.Client().send(
        http.Request('GET', Uri.parse(url))
    );

    final contentLength = response.contentLength ?? 0;
    int received = 0;

    final sink = file.openWrite();
    await response.stream.listen(
          (List<int> chunk) {
        sink.add(chunk);
        received += chunk.length;
        if (contentLength > 0 && onProgress != null) {
          final progress = received / contentLength;
          onProgress(progress);
        }
      },
      onDone: () async {
        await sink.close();
      },
      cancelOnError: true,
    ).asFuture();

    // 更新状态：开始解压
    onStatus?.call('下载完成，开始解压...');

    // 读取zip文件
    final bytes = await file.readAsBytes();
    final archive = ZipDecoder().decodeBytes(bytes);

    // 创建解压目标目录
    final extractDir = Directory(extractFullPath);
    if (!await extractDir.exists()) {
      await extractDir.create(recursive: true);
    }

    // 解压文件
    for (final file in archive) {
      final filename = file.name;
      if (file.isFile) {
        final data = file.content as List<int>;
        File('${extractDir.path}/$filename')
          ..createSync(recursive: true)
          ..writeAsBytesSync(data);
      } else {
        await Directory('${extractDir.path}/$filename')
            .create(recursive: true);
      }
    }

    // 删除临时zip文件
    await file.delete();

    // 更新状态：完成
    onStatus?.call('解压完成！');

    return extractFullPath;
  } catch (e) {
    // 确保清理临时文件
    final tempFile = File('${(await getApplicationDocumentsDirectory()).path}/temp_download.zip');
    if (await tempFile.exists()) {
      await tempFile.delete();
    }
    rethrow;
  }
}

/// 下载并解压文件（简化版，不带进度和状态回调）
Future<String> downloadAndExtractSimple({
  required String url,
  required String extractPath,
}) async {
  return downloadAndExtractFile(
    url: url,
    extractPath: extractPath,
  );
}
