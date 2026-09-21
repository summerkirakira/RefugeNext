// 独立预览入口：无需登录 / 无需后端，直接预览 AI 聊天界面。
// 运行：flutter run -t lib/preview/ai_chat_preview.dart
import 'package:dio/dio.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../src/datasource/ai_chat_model.dart';
import '../src/datasource/models/ai/ai_message.dart';
import '../src/datasource/models/ai/ai_stream_event.dart';
import '../src/datasource/models/ai/ai_usage.dart';
import '../src/datasource/models/ai/tool_call.dart';
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

  final Map<String, List<AiMessage>> _history = {
    'preview': [
      userMessage('帮我对比 Carrack 和 600i，看看哪艘更适合探索'),
      const AiMessage(role: 'assistant', content: '我先查一下两艘船的资料。'),
      const AiMessage(role: 'assistant', toolCalls: [
        ToolCall(
            id: 'docs', name: 'retrieve_docs', arguments: {'query': '探索舰对比'}),
        ToolCall(id: 'spec', name: 'get_ship_spec'),
      ]),
      toolResultMessage(toolCallId: 'docs', content: {'documents': []}),
      toolResultMessage(toolCallId: 'spec', content: {
        'ships': ['Carrack', '600i']
      }),
      const AiMessage(role: 'assistant', content: _reply),
    ],
    'empty': [],
    'long': [
      for (var i = 1; i <= 18; i++) ...[
        userMessage('第 $i 个问题：探索舰如何选择？'),
        const AiMessage(role: 'assistant', content: _reply),
      ],
    ],
  };
  List<AiSessionMeta> _sessions = [
    AiSessionMeta(id: 'preview', title: '探索舰对比', updatedAt: 3),
    AiSessionMeta(id: 'empty', title: '新对话', updatedAt: 2),
    AiSessionMeta(id: 'long', title: '长对话与滚动', updatedAt: 1),
  ];

  @override
  Future<AiUsage> fetchUsage() async => const AiUsage(
      tier: 'free',
      usedTokens: 1200,
      dailyBudget: 10000,
      remainingTokens: 8800,
      unlimited: false,
      resetInSeconds: 3600);

  @override
  Future<List<AiSessionMeta>> loadSessions() async => [
        for (final session in _sessions)
          AiSessionMeta.fromJson(session.toJson()),
      ];

  @override
  Future<void> saveSessions(List<AiSessionMeta> sessions) async {
    _sessions = [
      for (final session in sessions) AiSessionMeta.fromJson(session.toJson())
    ];
  }

  @override
  Future<List<AiMessage>> loadHistory(String sessionId) async =>
      [...?_history[sessionId]];

  @override
  Future<void> saveHistory(String sessionId, List<AiMessage> messages) async {
    _history[sessionId] = [...messages];
  }

  @override
  Future<void> clearHistory(String sessionId) async =>
      _history.remove(sessionId);
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
  double? _width;
  late final AiChatModel _model = AiChatModel(repo: PreviewAiRepo())
    ..loadFromDisk();

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: FlexColorScheme.light(
                scheme: FlexScheme.material, useMaterial3: false)
            .toTheme,
        darkTheme: FlexColorScheme.dark(
                scheme: FlexScheme.material, useMaterial3: false)
            .toTheme,
        themeMode: _mode,
        home: Scaffold(
            body: SafeArea(
                child: Column(children: [
          Material(
              child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text('小九 · 离线预览')),
                for (final width in <double?>[390, 768, null])
                  TextButton(
                      onPressed: () => setState(() => _width = width),
                      child: Text(width == null ? '全宽' : '${width.toInt()}')),
                IconButton(
                    tooltip: '切换主题',
                    onPressed: () => setState(() => _mode =
                        _mode == ThemeMode.light
                            ? ThemeMode.dark
                            : ThemeMode.light),
                    icon: Icon(_mode == ThemeMode.light
                        ? Icons.dark_mode
                        : Icons.light_mode)),
              ])),
          Expanded(
              child: Center(
                  child: SizedBox(
                      width: _width ?? double.infinity,
                      child: ChangeNotifierProvider<AiChatModel>.value(
                          value: _model, child: const AiChatPage())))),
        ]))),
      );
}
