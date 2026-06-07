import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:refuge_next/src/datasource/ai_chat_model.dart';
import 'package:refuge_next/src/datasource/models/ai/ai_message.dart';
import 'package:refuge_next/src/datasource/models/ai/ai_stream_event.dart';
import 'package:refuge_next/src/repo/ai_chat.dart';

/// 用脚本化事件替代真实 SSE/IO 的假 repo。
class FakeAiRepo extends AiRepo {
  List<AiStreamEvent> events;
  List<AiMessage> preset;
  List<AiMessage>? lastSaved;
  int saveCount = 0;
  bool cleared = false;

  FakeAiRepo({this.events = const [], this.preset = const []});

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
  Future<List<AiMessage>> loadHistory(String sessionId) async => List.of(preset);

  @override
  Future<void> saveHistory(String sessionId, List<AiMessage> messages) async {
    lastSaved = List.of(messages);
    saveCount++;
  }

  @override
  Future<void> clearHistory(String sessionId) async {
    cleared = true;
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
      final model = AiChatModel(sessionId: 's1', repo: repo);
      await model.loadFromDisk();

      await model.clear();

      expect(model.messages, isEmpty);
      expect(repo.cleared, true);
    });
  });
}
