import 'package:archive/archive_io.dart';

/// Inspect central/local headers before archive 3.x inflates content or folds
/// duplicate names into a map. PowerShell ZIPs use Windows path separators.
Archive readDesktopZip(InputFileStream input, {required bool windows}) {
  final directory = ZipDirectory.read(input);
  if (directory.fileHeaders.length > 20000) {
    throw const FormatException('更新包文件过多');
  }
  var total = 0;
  final names = <String>{};
  for (final header in directory.fileHeaders) {
    final size = header.uncompressedSize ?? -1;
    total += size;
    final name =
        windows ? header.filename.replaceAll('\\', '/') : header.filename;
    final normalized =
        name.endsWith('/') ? name.substring(0, name.length - 1) : name;
    final link =
        ((header.externalFileAttributes ?? 0) >> 16) & 0xf000 == 0xa000;
    if (size < 0 ||
        total > 1024 * 1024 * 1024 ||
        (link && (windows || size > 4096)) ||
        header.generalPurposeBitFlag & 1 != 0 ||
        header.file?.filename != header.filename ||
        header.file?.uncompressedSize != size ||
        name.contains('\\') ||
        name.startsWith('/') ||
        normalized.split('/').any((s) => s.isEmpty || s == '.' || s == '..') ||
        !names.add(normalized.toLowerCase())) {
      throw const FormatException('更新包路径、大小或文件头无效');
    }
  }
  input.position = 0;
  final decoded = ZipDecoder().decodeBuffer(input, verify: true);
  if (!windows) return decoded;
  final archive = Archive();
  for (final entry in decoded) {
    entry.name = entry.name.replaceAll('\\', '/');
    archive.addFile(entry);
  }
  return archive;
}
