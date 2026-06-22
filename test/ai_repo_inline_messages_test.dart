import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:refuge_next/src/datasource/models/ai/ai_message.dart';
import 'package:refuge_next/src/datasource/models/ai/ai_stream_event.dart';
import 'package:refuge_next/src/datasource/models/ai/tool_call.dart';
import 'package:refuge_next/src/network/cirno/ai_chat_service.dart';
import 'package:refuge_next/src/repo/ai_chat.dart';

/// 假 SSE 服务：按调用次序回放脚本化事件，并记录每次续请求带来的 messages。
class FakeAiChatService extends AiChatService {
  final List<List<AiStreamEvent>> segments; // 每次 openStream 回放一段
  final List<List<AiMessage>> sentMessages = []; // 每次请求带的 messages 快照
  int _call = 0;

  FakeAiChatService(this.segments) : super(baseUrl: 'http://test/');

  @override
  Stream<AiStreamEvent> openStream({
    required String scene,
    required List<AiMessage> messages,
    List<String> clientTools = const [],
    String toolsVersion = '1',
    CancelToken? cancelToken,
  }) async* {
    sentMessages.add(List.of(messages));
    final seg = segments[_call++];
    for (final e in seg) {
      yield e;
    }
  }
}

/// 假端侧工具执行器：记录被实际执行的工具名。
class RecordingToolExecutor implements AiToolExecutor {
  final List<String> executed = [];

  @override
  List<String> get allowedToolNames => const ['get_hangar'];

  @override
  Future<Map<String, dynamic>> runTool(
      String name, Map<String, dynamic> arguments) async {
    executed.add(name);
    return {'total': 1};
  }
}

void main() {
  group('AiRepo.streamChat inline_messages', () {
    test('服务端内联往返按序插在最终 assistant 之前并回传，端侧不重跑服务端工具', () async {
      // 顺序场景：iter0 retrieve_docs（服务端，内联）→ iter1 get_hangar（端侧）→ tool_request。
      final retrieveAsst = const AiMessage(
        role: 'assistant',
        content: '我先查一下资料',
        toolCalls: [ToolCall(id: 's1', name: 'retrieve_docs', arguments: {})],
        providerState: '{"rc":"需要查飞船资料"}',
      );
      final retrieveResult = toolResultMessage(
        toolCallId: 's1',
        content: {
          'hits': [
            {'text': '货运船资料', 'source': 'kb'}
          ]
        },
      );
      final hangarAsst = const AiMessage(
        role: 'assistant',
        content: '我再看看你的机库',
        toolCalls: [ToolCall(id: 'c1', name: 'get_hangar', arguments: {})],
        providerState: '{"rc":"查到资料了，再看机库"}',
      );

      final service = FakeAiChatService([
        // 第一段：tool_request 带本段内联往返，段随之结束。
        [
          AiStreamEvent.toolRequest(hangarAsst,
              inlineMessages: [retrieveAsst, retrieveResult])
        ],
        // 第二段：续请求后给出最终答案。
        const [AiStreamEvent.token('你适合 Cutlass'), AiStreamEvent.done({})],
      ]);
      final tools = RecordingToolExecutor();
      final repo = AiRepo(service: service, tools: tools);

      final events = <AiStreamEvent>[];
      await for (final ev in repo.streamChat(
        scene: 'recommend',
        history: [userMessage('推荐条货船')],
      )) {
        events.add(ev);
      }

      // 端侧只执行了 get_hangar（c1），未执行服务端的 retrieve_docs（s1）。
      expect(tools.executed, ['get_hangar']);

      // repo 仅为端侧工具结果透出 toolResult（内联消息不重复 yield，由上层从事件读取）。
      final results = events.whereType<AiToolResultEvent>().toList();
      expect(results.length, 1);
      expect(results.single.message.toolCallId, 'c1');

      // 续请求（第二次）带的 messages 顺序：
      // user → assistant(retrieve) → tool(retrieve) → assistant(get_hangar) → tool(get_hangar)。
      expect(service.sentMessages.length, 2);
      final cont = service.sentMessages[1];
      expect(cont.map((m) => m.role).toList(),
          ['user', 'assistant', 'tool', 'assistant', 'tool']);
      expect(cont[1].toolCalls!.single.name, 'retrieve_docs');
      expect(cont[1].providerState, '{"rc":"需要查飞船资料"}'); // 服务端 assistant 轮的不透明状态回传
      expect(cont[2].toolCallId, 's1'); // 检索结果重新进入上下文
      expect(cont[3].toolCalls!.single.name, 'get_hangar');
      expect(cont[4].toolCallId, 'c1');
    });

    test('无 inline_messages 时行为不变：端侧执行 tool_call、无中间消息', () async {
      final assistant = const AiMessage(
        role: 'assistant',
        content: '查机库',
        toolCalls: [ToolCall(id: 'c1', name: 'get_hangar', arguments: {})],
      );
      final service = FakeAiChatService([
        [AiStreamEvent.toolRequest(assistant)],
        const [AiStreamEvent.token('好的'), AiStreamEvent.done({})],
      ]);
      final tools = RecordingToolExecutor();
      final repo = AiRepo(service: service, tools: tools);

      await repo
          .streamChat(scene: 'qa', history: [userMessage('我的船')])
          .toList();

      expect(tools.executed, ['get_hangar']);
      final cont = service.sentMessages[1];
      expect(cont.map((m) => m.role).toList(), ['user', 'assistant', 'tool']);
      expect(cont[2].toolCallId, 'c1');
    });
  });
}
