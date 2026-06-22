import 'package:flutter_test/flutter_test.dart';
import 'package:refuge_next/src/datasource/models/ai/ai_message.dart';
import 'package:refuge_next/src/datasource/models/ai/server_tools.dart';
import 'package:refuge_next/src/datasource/models/ai/tool_call.dart';
import 'package:refuge_next/src/widgets/ai_chat/ai_chat_page.dart';

void main() {
  group('serverToolLabel', () {
    test('命中服务端工具 + query -> 「标签：query」', () {
      expect(serverToolLabel('retrieve_docs', query: '货运船'), '检索资料：货运船');
    });

    test('命中但无 query -> 纯标签', () {
      expect(serverToolLabel('retrieve_docs'), '检索资料');
      expect(serverToolLabel('get_ship_spec', query: '  '), '查询舰船参数');
    });

    test('非服务端工具 -> null', () {
      expect(serverToolLabel('get_hangar', query: 'x'), isNull);
    });
  });

  group('serverToolLabelsOf', () {
    test('从 assistant 的 tool_calls 里挑出服务端工具文案', () {
      final m = const AiMessage(
        role: 'assistant',
        content: '',
        toolCalls: [
          ToolCall(id: 's1', name: 'retrieve_docs', arguments: {'query': '货船'}),
          ToolCall(id: 'c1', name: 'get_hangar', arguments: {}), // 端侧工具，不计入
        ],
      );
      expect(serverToolLabelsOf(m), ['检索资料：货船']);
    });

    test('非 assistant 或无服务端工具 -> 空', () {
      expect(serverToolLabelsOf(const AiMessage(role: 'tool', toolCallId: 's1')), isEmpty);
      expect(
        serverToolLabelsOf(const AiMessage(
          role: 'assistant',
          content: 'hi',
          toolCalls: [ToolCall(id: 'c1', name: 'get_hangar', arguments: {})],
        )),
        isEmpty,
      );
    });
  });
}
