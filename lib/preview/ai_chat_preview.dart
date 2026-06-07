// 独立预览入口：无需登录 / 无需后端，直接预览 AI 聊天界面。
// 运行：flutter run -t lib/preview/ai_chat_preview.dart
import 'package:dio/dio.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../src/datasource/ai_chat_model.dart';
import '../src/datasource/models/ai/ai_message.dart';
import '../src/datasource/models/ai/ai_stream_event.dart';
import '../src/repo/ai_chat.dart';
import '../src/widgets/ai_chat/ai_chat_page.dart';

/// 假 repo：脚本化流式 Markdown 回复，绕开网络与磁盘。
class PreviewAiRepo extends AiRepo {
  static const _reply = '''
## 关于 **Carrack** 🪐

Anvil 出品的远征探索舰，适合：

1. 长途探索与测绘
2. 携带 **Pisces** 短途穿梭机
3. 模块化医疗 / 货运扩展

常用设置示例：

```bash
/fps max 60
```

需要我对比 `Carrack` 和 `600i` 吗？
''';

  @override
  Stream<AiStreamEvent> streamChat({
    required String scene,
    required List<AiMessage> history,
    CancelToken? cancelToken,
  }) async* {
    // 先停顿模拟「思考中」
    await Future.delayed(const Duration(milliseconds: 500));
    final chars = _reply.trim().runes.toList();
    for (var i = 0; i < chars.length; i += 2) {
      if (cancelToken?.isCancelled == true) return;
      final end = (i + 2 <= chars.length) ? i + 2 : chars.length;
      yield AiStreamEvent.token(String.fromCharCodes(chars.sublist(i, end)));
      await Future.delayed(const Duration(milliseconds: 18));
    }
    yield const AiStreamEvent.done({});
  }

  @override
  Future<List<AiMessage>> loadHistory(String sessionId) async => [
        userMessage('帮我推荐一条适合探索的船'),
        const AiMessage(
          role: 'assistant',
          content: '当然！你更看重**单人**还是**多人协作**？这会影响推荐方向。',
        ),
      ];

  @override
  Future<void> saveHistory(String sessionId, List<AiMessage> messages) async {}

  @override
  Future<void> clearHistory(String sessionId) async {}
}

void main() {
  runApp(const _PreviewApp());
}

class _PreviewApp extends StatefulWidget {
  const _PreviewApp();

  @override
  State<_PreviewApp> createState() => _PreviewAppState();
}

class _PreviewAppState extends State<_PreviewApp> {
  ThemeMode _mode = ThemeMode.light;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: FlexColorScheme.light(scheme: FlexScheme.material, useMaterial3: false).toTheme,
      darkTheme: FlexColorScheme.dark(scheme: FlexScheme.material, useMaterial3: false).toTheme,
      themeMode: _mode,
      home: ChangeNotifierProvider<AiChatModel>(
        create: (_) =>
            AiChatModel(sessionId: 'preview', repo: PreviewAiRepo())..loadFromDisk(),
        child: const AiChatPage(),
      ),
      builder: (context, child) => Stack(
        children: [
          child!,
          Positioned(
            right: 12,
            bottom: 96,
            child: FloatingActionButton.small(
              heroTag: 'previewThemeToggle',
              onPressed: () => setState(
                () => _mode = _mode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light,
              ),
              child: Icon(_mode == ThemeMode.light ? Icons.dark_mode : Icons.light_mode),
            ),
          ),
        ],
      ),
    );
  }
}
