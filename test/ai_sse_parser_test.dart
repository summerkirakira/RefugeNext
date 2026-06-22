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

    test('tool_running -> AiToolRunningEvent（优先 label）', () {
      final ev = parseSseFrame(
          'tool_running', jsonEncode({'name': 'search_knowledge', 'label': '正在检索资料'}));
      expect(ev, isA<AiToolRunningEvent>());
      expect((ev as AiToolRunningEvent).label, '正在检索资料');
    });

    test('tool_running -> 无 label 时按 {tool,query} 生成文案', () {
      final ev = parseSseFrame(
          'tool_running', jsonEncode({'tool': 'retrieve_docs', 'query': '货运船'}));
      expect((ev as AiToolRunningEvent).label, '检索资料：货运船');
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

    test('tool_request -> 解析 inline_messages 为完整消息（assistant+tool）', () {
      final data = jsonEncode({
        'assistant': {
          'role': 'assistant',
          'content': '我再看看你的机库',
          'tool_calls': [
            {'id': 'c1', 'name': 'get_hangar', 'arguments': {}},
          ],
        },
        'inline_messages': [
          {
            'role': 'assistant',
            'content': '我先查一下资料',
            'tool_calls': [
              {'id': 's1', 'name': 'retrieve_docs', 'arguments': {}}
            ],
            'provider_state': '{"rc":"需要查飞船资料"}',
          },
          {
            'role': 'tool',
            'tool_call_id': 's1',
            'content': {
              'hits': [
                {'text': '货运船资料', 'source': 'kb'}
              ]
            },
          },
        ],
      });
      final ev = parseSseFrame('tool_request', data) as AiToolRequestEvent;
      expect(ev.assistant.toolCalls!.single.name, 'get_hangar');
      expect(ev.inlineMessages.length, 2);
      // [0] 服务端 assistant 轮，含 tool_calls 与 provider_state
      expect(ev.inlineMessages[0].role, 'assistant');
      expect(ev.inlineMessages[0].toolCalls!.single.name, 'retrieve_docs');
      expect(ev.inlineMessages[0].providerState, '{"rc":"需要查飞船资料"}');
      // [1] 服务端 tool 结果
      expect(ev.inlineMessages[1].role, 'tool');
      expect(ev.inlineMessages[1].toolCallId, 's1');
      expect((ev.inlineMessages[1].content as Map)['hits'], isNotEmpty);
    });

    test('tool_request 无 inline_messages -> inlineMessages 为空（向后兼容）', () {
      final data = jsonEncode({
        'assistant': {
          'role': 'assistant',
          'content': '查机库',
          'tool_calls': [
            {'id': 'c1', 'name': 'get_hangar', 'arguments': {}}
          ],
        }
      });
      final ev = parseSseFrame('tool_request', data) as AiToolRequestEvent;
      expect(ev.inlineMessages, isEmpty);
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
      expect(ev.inlineMessages, isEmpty); // 无 inline_messages 时为空（向后兼容）
    });

    test('done -> 解析纯 RAG 段的 inline_messages', () {
      final data = jsonEncode({
        'finish_reason': 'stop',
        'usage': {},
        'inline_messages': [
          {
            'role': 'assistant',
            'content': '我先查一下资料',
            'tool_calls': [
              {'id': 's1', 'name': 'retrieve_docs', 'arguments': {}}
            ],
            'provider_state': '{"rc":"需要查资料"}',
          },
          {'role': 'tool', 'tool_call_id': 's1', 'content': {'hits': []}},
        ],
      });
      final ev = parseSseFrame('done', data) as AiDoneEvent;
      expect(ev.inlineMessages.length, 2);
      expect(ev.inlineMessages[0].role, 'assistant');
      expect(ev.inlineMessages[0].toolCalls!.single.name, 'retrieve_docs');
      expect(ev.inlineMessages[0].providerState, '{"rc":"需要查资料"}');
      expect(ev.inlineMessages[1].role, 'tool');
      expect(ev.inlineMessages[1].toolCallId, 's1');
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
