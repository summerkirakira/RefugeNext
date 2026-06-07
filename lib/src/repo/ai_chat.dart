import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:synchronized/synchronized.dart';

import '../datasource/models/ai/ai_message.dart';
import '../datasource/models/ai/ai_stream_event.dart';
import '../datasource/models/ai/tool_call.dart';
import '../network/cirno/ai_chat_service.dart';
import '../utils/storage_path.dart';

/// 端侧工具执行接口。allowedToolNames 作为 client_tools 上报，runTool 执行单个工具。
/// 真实实现（映射到 hangarRepo/userRepo 等）见 planning/docs/ai_module_contract.md §4，留待后续阶段。
abstract class AiToolExecutor {
  List<String> get allowedToolNames;

  Future<Map<String, dynamic>> runTool(String name, Map<String, dynamic> arguments);
}

/// 占位实现：本阶段不实现端侧工具执行。
/// 不暴露任何工具，且 runTool 返回错误结果（而非抛异常），保证续跑循环不崩。
class NoopAiToolExecutor implements AiToolExecutor {
  @override
  List<String> get allowedToolNames => const [];

  @override
  Future<Map<String, dynamic>> runTool(
    String name,
    Map<String, dynamic> arguments,
  ) async {
    return {'is_error': true, 'error': 'tool execution not implemented: $name'};
  }
}

/// AI 对话仓库：把多段 SSE + 端侧工具往返封装成对 UI 透明的「一条连续流」。
class AiRepo {
  final AiChatService _service;
  final AiToolExecutor _tools;

  /// 历史读写锁，避免并发读写同一会话文件（同 UserRepo 的 synchronized 用法）。
  final Lock _historyLock = Lock();

  AiRepo({AiChatService? service, AiToolExecutor? tools})
      : _service = service ?? AiChatService(),
        _tools = tools ?? NoopAiToolExecutor();

  // ---- 历史持久化（对齐 UserRepo：Lock + StoragePath + json 文件）----
  // 每个会话一个文件 ai_chat_<sessionId>.json；单会话场景传一个固定 id 即可。

  Future<File> _historyFile(String sessionId) async {
    final path = await StoragePath.getAppDataPath();
    final safeId = sessionId.replaceAll(RegExp(r'[^A-Za-z0-9_-]'), '_');
    return File('$path/ai_chat_$safeId.json');
  }

  /// 读取某会话的历史；文件不存在或解析失败返回空列表（同 UserRepo.readUsers）。
  Future<List<AiMessage>> loadHistory(String sessionId) async {
    return await _historyLock.synchronized(() async {
      try {
        final file = await _historyFile(sessionId);
        final contents = await file.readAsString();
        final List<dynamic> json = jsonDecode(contents);
        return json
            .map((e) => AiMessage.fromJson(e as Map<String, dynamic>))
            .toList();
      } catch (e) {
        return [];
      }
    });
  }

  /// 覆盖写入某会话的完整历史（同 UserRepo.writeUsers，整文件重写）。
  Future<void> saveHistory(String sessionId, List<AiMessage> messages) async {
    await _historyLock.synchronized(() async {
      final file = await _historyFile(sessionId);
      await file.writeAsString(jsonEncode(messages.map((m) => m.toJson()).toList()));
    });
  }

  /// 删除某会话历史文件。
  Future<void> clearHistory(String sessionId) async {
    await _historyLock.synchronized(() async {
      final file = await _historyFile(sessionId);
      if (await file.exists()) {
        await file.delete();
      }
    });
  }

  /// 自动续跑循环：
  /// 消费一段流 → 遇 tool_request 则执行端侧工具、追加结果 → 发续请求继续；
  /// 遇 done/error 结束整轮。所有事件原样透传给上层。
  Stream<AiStreamEvent> streamChat({
    required String scene,
    required List<AiMessage> history,
    CancelToken? cancelToken,
  }) async* {
    final messages = [...history];

    while (true) {
      AiMessage? pending;

      await for (final ev in _service.openStream(
        scene: scene,
        messages: messages,
        clientTools: _tools.allowedToolNames,
        cancelToken: cancelToken,
      )) {
        yield ev;
        if (ev is AiToolRequestEvent) {
          pending = ev.assistant;
          break;
        }
        if (ev is AiDoneEvent || ev is AiErrorEvent) return;
      }

      // 流自然结束但无终结事件（异常断流等）：停止循环。
      if (pending == null) return;

      // 执行本轮全部端侧工具，追加 assistant 轮与各工具结果，再发续请求。
      messages.add(pending);
      for (final ToolCall call in pending.toolCalls ?? const <ToolCall>[]) {
        final result = await _tools.runTool(call.name, call.arguments);
        messages.add(toolResultMessage(toolCallId: call.id, content: result));
      }
    }
  }
}
