import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show kDebugMode;

import '../../datasource/models/ai/ai_message.dart';
import '../../datasource/models/ai/ai_stream_event.dart';
import 'cirno_api.dart';

/// debug 模式下 AI 请求默认指向的本地测试服务器；release 用生产地址（null → CirnoApiClient 默认）。
const String? kDebugAiBaseUrl = 'http://localhost:8080/';

/// 把单个 SSE 帧（事件类型 + data 文本）解析成 AiStreamEvent。
/// 未知类型、空类型返回 null。提为顶层函数便于单测（test/ai_sse_parser_test.dart）。
/// 事件协议见 planning/docs/ai_module_contract.md §3.3。
AiStreamEvent? parseSseFrame(String? type, String data) {
  if (type == null) return null;
  final j = data.isEmpty
      ? const <String, dynamic>{}
      : jsonDecode(data) as Map<String, dynamic>;
  switch (type) {
    case 'token':
      return AiStreamEvent.token(j['text'] as String? ?? '');
    case 'tool_running':
      return AiStreamEvent.toolRunning(j['label'] as String? ?? '');
    case 'tool_request':
      return AiStreamEvent.toolRequest(
        AiMessage.fromJson(j['assistant'] as Map<String, dynamic>),
      );
    case 'card':
      return AiStreamEvent.card(j);
    case 'done':
      return AiStreamEvent.done((j['usage'] as Map<String, dynamic>?) ?? const {});
    case 'error':
      return AiStreamEvent.error(
        j['message'] as String? ?? 'unknown',
        retryable: j['retryable'] as bool? ?? false,
      );
    default:
      return null; // 未知事件忽略
  }
}

/// AI 对话的 SSE 传输与解析。一次 openStream = 一段流：
/// 服务端工具内联消化（不中断），遇端侧工具发 tool_request 后结束本段，
/// 或在 done/error 收尾。自动续跑由 AiRepo 负责。
class AiChatService {
  /// base URL 覆盖：显式传则用之；否则 debug→本地测试服务器，release→生产（CirnoApiClient 默认）。
  final String? baseUrl;

  AiChatService({String? baseUrl})
      : baseUrl = baseUrl ?? (kDebugMode ? kDebugAiBaseUrl : null);

  /// 发起 POST /ai/chat 并把 SSE 帧流式解析为 AiStreamEvent。
  Stream<AiStreamEvent> openStream({
    required String scene,
    required List<AiMessage> messages,
    List<String> clientTools = const [],
    String toolsVersion = '1',
    CancelToken? cancelToken,
  }) async* {
    final body = {
      'scene': scene,
      'messages': messages.map((m) => m.toJson()).toList(),
      'client_tools': clientTools,
      'tools_version': toolsVersion,
    };

    final ResponseBody respBody = await CirnoApiClient().postSse(
      endpoint: 'ai/chat',
      data: body,
      cancelToken: cancelToken,
      baseUrlOverride: baseUrl,
    );

    String? eventType;
    final dataLines = <String>[];

    // utf8.decoder + LineSplitter：避免多字节跨块截断；空行作帧边界。
    await for (final line in respBody.stream
        .cast<List<int>>()
        .transform(utf8.decoder)
        .transform(const LineSplitter())) {
      if (line.isEmpty) {
        final ev = parseSseFrame(eventType, dataLines.join('\n'));
        eventType = null;
        dataLines.clear();
        if (ev != null) yield ev;
      } else if (line.startsWith('event:')) {
        eventType = line.substring(6).trim();
      } else if (line.startsWith('data:')) {
        dataLines.add(line.substring(5).trim());
      }
      // ':' 注释行与其它 SSE 字段忽略
    }

    // 流结束时仍有未闭合帧（末尾无空行）时兜底输出。
    if (eventType != null) {
      final ev = parseSseFrame(eventType, dataLines.join('\n'));
      if (ev != null) yield ev;
    }
  }
}
