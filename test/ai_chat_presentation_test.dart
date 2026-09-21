import 'package:flutter_test/flutter_test.dart';
import 'package:refuge_next/src/datasource/models/ai/ai_message.dart';
import 'package:refuge_next/src/datasource/models/ai/tool_call.dart';
import 'package:refuge_next/src/widgets/ai_chat/ai_chat_presentation.dart';

AiMessage call(String id, [String name = 'retrieve_docs']) =>
    AiMessage(role: 'assistant', toolCalls: [ToolCall(id: id, name: name)]);
AiMessage result(String id, Object? content) =>
    AiMessage(role: 'tool', toolCallId: id, content: content);

void main() {
  test('pairs results by ID in the same turn and preserves incomplete history',
      () {
    final entries = buildAiChatEntries(sessionId: 's', messages: [
      userMessage('one'),
      call('same'),
      userMessage('two'),
      call('same'),
      result('same', {'ok': true}),
    ]);
    final groups = entries.where((e) => e.kind == AiEntryKind.tools).toList();
    expect(groups[0].tools.single.state, AiToolState.incomplete);
    expect(groups[1].tools.single.state, AiToolState.returned);
  });
  test('groups adjacent tools but preserves text and business card order', () {
    final entries = buildAiChatEntries(sessionId: 's', messages: [
      userMessage('hi'),
      call('a'),
      result('a', {}),
      call('b'),
      result('b', {'error': 'unavailable'}),
      const AiMessage(role: 'assistant', content: '这是结果'),
      call('c', 'show_hangar_cards'),
      result('c', {}),
      call('d'),
    ]);
    expect(entries.map((e) => e.kind), [
      AiEntryKind.user,
      AiEntryKind.tools,
      AiEntryKind.assistant,
      AiEntryKind.cards,
      AiEntryKind.tools
    ]);
    expect(entries[1].tools.map((e) => e.state),
        [AiToolState.returned, AiToolState.failed]);
  });
  test('active calls distinguish running, waiting, failed and interrupted', () {
    final messages = [
      userMessage('hi'),
      call('a'),
      call('b'),
      call('c'),
      result('c', '{"is_error":true}')
    ];
    final active = buildAiChatEntries(
        sessionId: 's',
        messages: messages,
        generating: true,
        toolLabel: '正在调用工具…');
    expect(active.last.tools.map((e) => e.state),
        [AiToolState.running, AiToolState.waiting, AiToolState.failed]);
    final stopped = buildAiChatEntries(sessionId: 's', messages: messages);
    expect(stopped.last.tools.first.state, AiToolState.incomplete);
    expect(stopped.last.id, active.last.id);
  });
  test(
      'temporary progress is replaced by records without duplicate tool indicator',
      () {
    final before = buildAiChatEntries(
        sessionId: 's',
        messages: [userMessage('hi')],
        generating: true,
        toolLabel: '检索资料');
    expect(before.last.kind, AiEntryKind.activity);
    final after = buildAiChatEntries(
        sessionId: 's',
        messages: [userMessage('hi'), call('a')],
        generating: true,
        toolLabel: '检索资料');
    expect(after.where((e) => e.kind == AiEntryKind.activity), isEmpty);
    expect(after.last.tools.single.state, AiToolState.running);
  });
  test('old unresolved calls are not running in a new turn', () {
    final entries = buildAiChatEntries(
        sessionId: 's',
        messages: [userMessage('old'), call('a'), userMessage('new')],
        generating: true,
        streamingText: 'answer');
    expect(entries[1].tools.single.state, AiToolState.incomplete);
    expect(entries.last.text, 'answer▌');
  });
}
