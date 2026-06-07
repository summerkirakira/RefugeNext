import 'package:freezed_annotation/freezed_annotation.dart';

import 'ai_message.dart';

part 'ai_stream_event.freezed.dart';

/// 解析后的 SSE 事件。仅在 Dart 端从 SSE 帧构造，不做 JSON 序列化，故无 .g.dart。
/// 事件协议见 planning/docs/ai_module_contract.md §3.3。
@freezed
sealed class AiStreamEvent with _$AiStreamEvent {
  /// 增量文本（打字机）。
  const factory AiStreamEvent.token(String text) = AiTokenEvent;

  /// 服务端工具进行中，仅展示，无需客户端动作。
  const factory AiStreamEvent.toolRunning(String label) = AiToolRunningEvent;

  /// 端侧工具调用：客户端须执行 assistant.toolCalls 并发起续请求，本段流随后结束。
  const factory AiStreamEvent.toolRequest(AiMessage assistant) = AiToolRequestEvent;

  /// 结构化结果（船卡片等），与 token 穿插。
  const factory AiStreamEvent.card(Map<String, dynamic> data) = AiCardEvent;

  /// 整轮结束。
  const factory AiStreamEvent.done(Map<String, dynamic> usage) = AiDoneEvent;

  /// 业务错误。
  const factory AiStreamEvent.error(String message, {@Default(false) bool retryable}) =
      AiErrorEvent;
}
