import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:refuge_next/src/datasource/models/ai/ai_stream_event.dart';
import 'package:refuge_next/src/network/cirno/ai_chat_service.dart';

void main() {
  group('parseSseFrame', () {
    test('token -> AiTokenEvent', () {
      final ev = parseSseFrame('token', jsonEncode({'text': '你好'}));
      expect(ev, isA<AiTokenEvent>());
      expect((ev as AiTokenEvent).text, '你好');
    });

    test('tool_running -> AiToolRunningEvent', () {
      final ev = parseSseFrame(
          'tool_running', jsonEncode({'name': 'search_knowledge', 'label': '正在检索资料'}));
      expect(ev, isA<AiToolRunningEvent>());
      expect((ev as AiToolRunningEvent).label, '正在检索资料');
    });

    test('tool_request -> assistant 消息含 tool_calls', () {
      final data = jsonEncode({
        'assistant': {
          'role': 'assistant',
          'content': '让我查一下你的机库',
          'tool_calls': [
            {
              'id': 'call_1',
              'name': 'get_hangar',
              'arguments': {'type': 'ship', 'limit': 20},
            }
          ],
        }
      });
      final ev = parseSseFrame('tool_request', data);
      expect(ev, isA<AiToolRequestEvent>());
      final msg = (ev as AiToolRequestEvent).assistant;
      expect(msg.role, 'assistant');
      expect(msg.content, '让我查一下你的机库');
      expect(msg.toolCalls, isNotNull);
      expect(msg.toolCalls!.single.id, 'call_1');
      expect(msg.toolCalls!.single.name, 'get_hangar');
      expect(msg.toolCalls!.single.arguments['type'], 'ship');
      expect(msg.toolCalls!.single.arguments['limit'], 20);
    });

    test('card -> AiCardEvent 保留整个 data', () {
      final ev = parseSseFrame('card', jsonEncode({'type': 'ship', 'name': 'Cutlass Black'}));
      expect(ev, isA<AiCardEvent>());
      expect((ev as AiCardEvent).data['name'], 'Cutlass Black');
    });

    test('done -> AiDoneEvent 取 usage', () {
      final ev = parseSseFrame(
          'done', jsonEncode({'finish_reason': 'stop', 'usage': {'output_tokens': 3}}));
      expect(ev, isA<AiDoneEvent>());
      expect((ev as AiDoneEvent).usage['output_tokens'], 3);
    });

    test('error -> AiErrorEvent 含 retryable', () {
      final ev = parseSseFrame('error', jsonEncode({'message': 'boom', 'retryable': true}));
      expect(ev, isA<AiErrorEvent>());
      expect((ev as AiErrorEvent).message, 'boom');
      expect(ev.retryable, true);
    });

    test('未知事件 / 空类型 -> null', () {
      expect(parseSseFrame('whatever', '{}'), isNull);
      expect(parseSseFrame(null, ''), isNull);
    });

    test('缺字段时用安全默认值', () {
      expect((parseSseFrame('token', '{}') as AiTokenEvent).text, '');
      expect((parseSseFrame('error', '{}') as AiErrorEvent).retryable, false);
      expect((parseSseFrame('done', '{}') as AiDoneEvent).usage, isEmpty);
    });
  });
}
