import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:refuge_next/src/datasource/models/ai/ai_message.dart';
import 'package:refuge_next/src/datasource/models/ai/tool_call.dart';

void main() {
  group('AiMessage JSON 持久化往返', () {
    test('完整会话（user + assistant带tool_calls + tool结果Map）encode->decode 不变', () {
      final history = <AiMessage>[
        userMessage('我想买条货船'),
        const AiMessage(
          role: 'assistant',
          content: '让我查下你的机库',
          toolCalls: [
            ToolCall(id: 'call_1', name: 'get_hangar', arguments: {'type': 'ship'}),
          ],
          providerState: 'opaque-sig',
        ),
        toolResultMessage(
          toolCallId: 'call_1',
          content: {
            'total': 2,
            'items': [
              {'name': 'Cutlass Black', 'type': 'ship', 'qty': 1},
            ],
          },
        ),
      ];

      // 模拟 saveHistory / loadHistory 的序列化路径
      final encoded = jsonEncode(history.map((m) => m.toJson()).toList());
      final decoded = (jsonDecode(encoded) as List)
          .map((e) => AiMessage.fromJson(e as Map<String, dynamic>))
          .toList();

      expect(decoded.length, 3);

      expect(decoded[0].role, 'user');
      expect(decoded[0].content, '我想买条货船');

      expect(decoded[1].role, 'assistant');
      expect(decoded[1].providerState, 'opaque-sig');
      expect(decoded[1].toolCalls!.single.name, 'get_hangar');
      expect(decoded[1].toolCalls!.single.arguments['type'], 'ship');

      expect(decoded[2].role, 'tool');
      expect(decoded[2].toolCallId, 'call_1');
      final toolContent = decoded[2].content as Map<String, dynamic>;
      expect(toolContent['total'], 2);
      expect((toolContent['items'] as List).single['name'], 'Cutlass Black');
    });

    test('线格式字段名为 snake_case', () {
      final json = const AiMessage(
        role: 'assistant',
        content: 'hi',
        toolCalls: [ToolCall(id: 'c1', name: 'get_user_info', arguments: {})],
        toolCallId: null,
        providerState: 'x',
      ).toJson();

      expect(json.containsKey('tool_calls'), true);
      expect(json.containsKey('provider_state'), true);
      expect(json.containsKey('toolCalls'), false);
    });
  });
}
