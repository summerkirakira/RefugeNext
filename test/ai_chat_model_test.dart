import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:refuge_next/src/datasource/ai_chat_model.dart';
import 'package:refuge_next/src/datasource/models/ai/ai_message.dart';
import 'package:refuge_next/src/datasource/models/ai/ai_stream_event.dart';
import 'package:refuge_next/src/datasource/models/ai/tool_call.dart';
import 'package:refuge_next/src/repo/ai_chat.dart';

/// 用脚本化事件替代真实 SSE/IO 的假 repo。
class FakeAiRepo extends AiRepo {
  List<AiStreamEvent> events;
  List<AiMessage> preset;
  Map<String, List<AiMessage>> historyById; // 按会话 id 返回不同历史
  List<AiSessionMeta> sessionsSeed; // loadSessions 初值
  List<AiMessage>? lastSaved;
  List<AiSessionMeta>? lastSavedSessions;
  int saveCount = 0;
  int saveSessionsCount = 0;
  bool cleared = false;

  FakeAiRepo({
    this.events = const [],
    this.preset = const [],
    this.historyById = const {},
    this.sessionsSeed = const [],
  });

  @override
  Stream<AiStreamEvent> streamChat({
    required String scene,
    required List<AiMessage> history,
    CancelToken? cancelToken,
  }) async* {
    for (final e in events) {
      yield e;
    }
  }

  @override
  Future<List<AiMessage>> loadHistory(String sessionId) async =>
      historyById[sessionId] ?? List.of(preset);

  @override
  Future<void> saveHistory(String sessionId, List<AiMessage> messages) async {
    lastSaved = List.of(messages);
    saveCount++;
  }

  @override
  Future<void> clearHistory(String sessionId) async {
    cleared = true;
  }

  @override
  Future<List<AiSessionMeta>> loadSessions() async => List.of(sessionsSeed);

  @override
  Future<void> saveSessions(List<AiSessionMeta> sessions) async {
    lastSavedSessions = List.of(sessions);
    saveSessionsCount++;
  }
}

void main() {
  group('AiChatModel', () {
    test('send：累积 token → done → 提交助手消息并持久化', () async {
      final repo = FakeAiRepo(events: const [
        AiStreamEvent.token('你好'),
        AiStreamEvent.token('，世界'),
        AiStreamEvent.done({}),
      ]);
      final model = AiChatModel(sessionId: 's1', repo: repo);

      await model.send('在吗');

      expect(model.isGenerating, false);
      expect(model.streamingText, '');
      expect(model.messages.length, 2);
      expect(model.messages[0].role, 'user');
      expect(model.messages[0].content, '在吗');
      expect(model.messages[1].role, 'assistant');
      expect(model.messages[1].content, '你好，世界');
      expect(repo.saveCount, 1); // 自动持久化
      expect(repo.lastSaved!.length, 2);
    });

    test('KEEP：完整保存工具往返（assistant(tool_calls)+tool 结果+终文本）并持久化', () async {
      final asst = const AiMessage(
        role: 'assistant',
        content: '让我查一下你的机库',
        toolCalls: [ToolCall(id: 'c1', name: 'get_hangar', arguments: {})],
        providerState: 'sig-123',
      );
      final toolMsg = const AiMessage(
        role: 'tool',
        toolCallId: 'c1',
        content: {'total': 1},
      );
      final repo = FakeAiRepo(events: [
        AiStreamEvent.toolRequest(asst),
        AiStreamEvent.toolResult(toolMsg),
        const AiStreamEvent.token('你有 1 条船'),
        const AiStreamEvent.done({}),
      ]);
      final model = AiChatModel(sessionId: 's1', repo: repo);

      await model.send('我有几条船');

      // 完整 transcript：user + assistant(tool_calls,provider_state) + tool 结果 + 终文本
      expect(model.messages.length, 4);
      expect(model.messages[0].role, 'user');
      expect(model.messages[1].role, 'assistant');
      expect(model.messages[1].toolCalls!.single.name, 'get_hangar');
      expect(model.messages[1].providerState, 'sig-123');
      expect(model.messages[2].role, 'tool');
      expect(model.messages[2].toolCallId, 'c1');
      expect(model.messages[3].role, 'assistant');
      expect(model.messages[3].content, '你有 1 条船');
      // 持久化的是完整 transcript
      expect(repo.lastSaved!.length, 4);
    });

    test('inline_messages：服务端内联往返按序排在最终 assistant 之前并持久化', () async {
      final retrieveAsst = const AiMessage(
        role: 'assistant',
        content: '我先查资料',
        toolCalls: [ToolCall(id: 's1', name: 'retrieve_docs', arguments: {})],
        providerState: 'rc-1',
      );
      final retrieveResult = const AiMessage(
        role: 'tool',
        toolCallId: 's1',
        content: {'hits': 1},
      );
      final hangarAsst = const AiMessage(
        role: 'assistant',
        content: '再看机库',
        toolCalls: [ToolCall(id: 'c1', name: 'get_hangar', arguments: {})],
      );
      final hangarResult = const AiMessage(
        role: 'tool',
        toolCallId: 'c1',
        content: {'total': 1},
      );
      final repo = FakeAiRepo(events: [
        AiStreamEvent.toolRequest(hangarAsst,
            inlineMessages: [retrieveAsst, retrieveResult]),
        AiStreamEvent.toolResult(hangarResult),
        const AiStreamEvent.token('你有 1 条船'),
        const AiStreamEvent.done({}),
      ]);
      final model = AiChatModel(sessionId: 's1', repo: repo);

      await model.send('推荐货船');

      // user + asst(retrieve) + tool(retrieve) + asst(get_hangar) + tool(get_hangar) + 终文本
      expect(model.messages.map((m) => m.role).toList(),
          ['user', 'assistant', 'tool', 'assistant', 'tool', 'assistant']);
      expect(model.messages[1].toolCalls!.single.name, 'retrieve_docs');
      expect(model.messages[1].providerState, 'rc-1');
      expect(model.messages[2].toolCallId, 's1');
      expect(model.messages[3].toolCalls!.single.name, 'get_hangar');
      expect(model.messages[4].toolCallId, 'c1');
      expect(model.messages[5].content, '你有 1 条船');
      expect(repo.lastSaved!.length, 6); // 完整 transcript 持久化
    });

    test('纯 RAG：done 的 inline_messages 纳入历史，且调工具前文本不重复', () async {
      final retrieveAsst = const AiMessage(
        role: 'assistant',
        content: '我先查一下资料',
        toolCalls: [ToolCall(id: 's1', name: 'retrieve_docs', arguments: {})],
        providerState: 'rc-1',
      );
      final retrieveResult = const AiMessage(
        role: 'tool',
        toolCallId: 's1',
        content: {'hits': 1},
      );
      final repo = FakeAiRepo(events: [
        const AiStreamEvent.token('我先查一下资料'),
        const AiStreamEvent.toolRunning('检索资料'),
        const AiStreamEvent.token('Avenger Titan 适合新手'),
        AiStreamEvent.done(const {}, inlineMessages: [retrieveAsst, retrieveResult]),
      ]);
      final model = AiChatModel(sessionId: 's1', repo: repo);

      await model.send('Avenger Titan 怎么样');

      // user + asst(retrieve_docs) + tool + asst(最终答案)
      expect(model.messages.map((m) => m.role).toList(),
          ['user', 'assistant', 'tool', 'assistant']);
      expect(model.messages[1].toolCalls!.single.name, 'retrieve_docs');
      expect(model.messages[1].content, '我先查一下资料');
      expect(model.messages[2].toolCallId, 's1');
      // 最终答案只含调工具后的文本——"我先查一下资料"不重复
      expect(model.messages[3].content, 'Avenger Titan 适合新手');
      expect(repo.lastSaved!.length, 4);
    });

    test('error 事件：不提交助手消息，设置 errorMessage', () async {
      final repo = FakeAiRepo(events: const [
        AiStreamEvent.token('半截'),
        AiStreamEvent.error('boom', retryable: true),
      ]);
      final model = AiChatModel(sessionId: 's1', repo: repo);

      await model.send('test');

      expect(model.errorMessage, 'boom');
      expect(model.lastErrorRetryable, true); // 来自 error 事件的 retryable
      expect(model.isGenerating, false);
      expect(model.messages.length, 1); // 只有 user
      expect(repo.saveCount, 0); // 出错不持久化
    });

    test('loadFromDisk：载入预置历史', () async {
      final repo = FakeAiRepo(preset: [
        userMessage('上次的问题'),
        const AiMessage(role: 'assistant', content: '上次的回答'),
      ]);
      final model = AiChatModel(sessionId: 's1', repo: repo);

      await model.loadFromDisk();

      expect(model.messages.length, 2);
      expect(model.messages.last.content, '上次的回答');
    });

    test('regenerate：丢弃末尾助手回复并重跑', () async {
      final repo = FakeAiRepo(
        preset: [
          userMessage('问题'),
          const AiMessage(role: 'assistant', content: '旧回答'),
        ],
        events: const [
          AiStreamEvent.token('新回答'),
          AiStreamEvent.done({}),
        ],
      );
      final model = AiChatModel(sessionId: 's1', repo: repo);
      await model.loadFromDisk();

      await model.regenerate();

      expect(model.messages.length, 2);
      expect(model.messages.first.role, 'user');
      expect(model.messages.last.role, 'assistant');
      expect(model.messages.last.content, '新回答');
    });

    test('toolRunning：过程中更新 toolStatusLabel，结束后清空', () async {
      final repo = FakeAiRepo(events: const [
        AiStreamEvent.toolRunning('正在检索资料'),
        AiStreamEvent.token('答案'),
        AiStreamEvent.done({}),
      ]);
      final model = AiChatModel(sessionId: 's1', repo: repo);

      final labels = <String?>[];
      model.addListener(() => labels.add(model.toolStatusLabel));

      await model.send('q');

      expect(labels.contains('正在检索资料'), true);
      expect(model.toolStatusLabel, null);
      expect(model.messages.last.content, '答案');
    });

    test('clear：清空内存与磁盘', () async {
      final repo = FakeAiRepo(preset: [userMessage('x')]);
      final model = AiChatModel(repo: repo);
      await model.loadFromDisk();

      await model.clear();

      expect(model.messages, isEmpty);
      expect(repo.cleared, true);
    });
  });

  group('AiChatModel 多会话', () {
    test('loadFromDisk：会话列表为空时建默认会话', () async {
      final repo = FakeAiRepo();
      final model = AiChatModel(repo: repo);
      await model.loadFromDisk();
      expect(model.sessions.length, 1);
      expect(model.currentSessionId, 'main');
    });

    test('newSession：新增空白会话并切为当前', () async {
      final repo = FakeAiRepo(preset: [userMessage('旧')]);
      final model = AiChatModel(repo: repo);
      await model.loadFromDisk();
      final before = model.sessions.length;

      await model.newSession();

      expect(model.sessions.length, before + 1);
      expect(model.messages, isEmpty); // 新会话空白
      expect(model.currentSessionId != 'main', true);
      expect(repo.saveSessionsCount > 0, true);
    });

    test('send：标题取首条用户消息、updatedAt 刷新、saveSessions 被调', () async {
      final repo = FakeAiRepo(events: const [
        AiStreamEvent.token('好的'),
        AiStreamEvent.done({}),
      ]);
      final model = AiChatModel(repo: repo);
      await model.loadFromDisk();

      await model.send('帮我推荐一条货船');

      expect(model.currentTitle, '帮我推荐一条货船');
      expect(repo.lastSavedSessions, isNotNull);
    });

    test('switchSession：切换后载入该会话历史', () async {
      final repo = FakeAiRepo(
        sessionsSeed: [
          AiSessionMeta(id: 'a', title: 'A', updatedAt: 200),
          AiSessionMeta(id: 'b', title: 'B', updatedAt: 100),
        ],
        historyById: {
          'a': [userMessage('问A')],
          'b': [userMessage('问B'), const AiMessage(role: 'assistant', content: '答B')],
        },
      );
      final model = AiChatModel(repo: repo);
      await model.loadFromDisk();
      expect(model.currentSessionId, 'a'); // 最近更新的 a
      expect(model.messages.length, 1);

      await model.switchSession('b');
      expect(model.currentSessionId, 'b');
      expect(model.messages.length, 2);
      expect(model.messages.last.content, '答B');
    });

    test('deleteSession：删除当前会话后自动切到剩余会话', () async {
      final repo = FakeAiRepo(
        sessionsSeed: [
          AiSessionMeta(id: 'a', title: 'A', updatedAt: 200),
          AiSessionMeta(id: 'b', title: 'B', updatedAt: 100),
        ],
        historyById: {
          'a': [userMessage('问A')],
          'b': [userMessage('问B')],
        },
      );
      final model = AiChatModel(repo: repo);
      await model.loadFromDisk();
      expect(model.currentSessionId, 'a');

      await model.deleteSession('a');

      expect(model.sessions.length, 1);
      expect(model.currentSessionId, 'b');
      expect(repo.cleared, true);
    });
  });
}
