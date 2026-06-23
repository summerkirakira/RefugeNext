import 'dart:io';

import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:share_plus/share_plus.dart';

import '../../funcs/toast.dart';
import '../../funcs/vehicle_rag_export.dart';

/// 调试入口:把有中文别名的舰船导出为单个 RAG JSON 数组文件。
class VehicleRagExportPage extends StatefulWidget {
  const VehicleRagExportPage({super.key});

  @override
  State<VehicleRagExportPage> createState() => _VehicleRagExportPageState();
}

class _VehicleRagExportPageState extends State<VehicleRagExportPage> {
  bool _busy = false;
  int _done = 0;
  int _total = 0;
  File? _file;
  int? _count;
  String? _error;

  Future<void> _export() async {
    setState(() {
      _busy = true;
      _done = 0;
      _total = 0;
      _file = null;
      _count = null;
      _error = null;
    });
    try {
      final file = await exportVehiclesRagJson(
        onProgress: (done, total) {
          if (!mounted) return;
          setState(() {
            _done = done;
            _total = total;
          });
        },
      );
      if (!mounted) return;
      setState(() {
        _file = file;
        _count = _total;
        _busy = false;
      });
      showToast(message: '已导出 $_total 条 → ${file.path}');
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _error = '$e';
        _busy = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('导出舰船 RAG JSON')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              '把当前版本下「有中文别名」的舰船导出为单个 JSON 数组文件,'
              '每艘船一条记录(key / name / name_en / class_name / ship_alias_id / content / source)。',
              style: TextStyle(fontSize: 13, color: Colors.grey[600]),
            ),
            const SizedBox(height: 20),
            FilledButton.icon(
              onPressed: _busy ? null : _export,
              icon: const Icon(Icons.download_outlined),
              label: Text(_busy ? '导出中…' : '导出舰船 RAG JSON'),
            ),
            const SizedBox(height: 16),
            if (_busy)
              Row(
                children: [
                  const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                  const SizedBox(width: 10),
                  Text(_total == 0 ? '准备中…' : '已处理 $_done / $_total'),
                ],
              ),
            if (_error != null)
              Text('导出失败:$_error',
                  style: const TextStyle(color: Colors.red)),
            if (_file != null) ...[
              Text('已导出 $_count 条记录',
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              SelectableText(_file!.path,
                  style: TextStyle(fontSize: 12, color: Colors.grey[700])),
              const SizedBox(height: 12),
              Row(
                children: [
                  OutlinedButton.icon(
                    onPressed: () => OpenFile.open(_file!.path),
                    icon: const Icon(Icons.open_in_new, size: 18),
                    label: const Text('打开'),
                  ),
                  const SizedBox(width: 10),
                  OutlinedButton.icon(
                    onPressed: () => SharePlus.instance.share(
                      ShareParams(
                        files: [XFile(_file!.path)],
                        text: '舰船 RAG 导出',
                      ),
                    ),
                    icon: const Icon(Icons.share, size: 18),
                    label: const Text('分享'),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
