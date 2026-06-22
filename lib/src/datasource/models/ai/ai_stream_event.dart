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
  /// assistant 含 content + tool_calls + provider_state，须纳入完整历史。
  /// inlineMessages：本段服务端内联工具往返的**完整消息**（assistant 轮 + tool 结果，含
  /// provider_state），客户端须按序插入到最终 assistant **之前**纳入历史并随续请求回传，
  /// 从而避免服务端检索上下文丢失。见 contract §7。默认空，向后兼容。
  const factory AiStreamEvent.toolRequest(
    AiMessage assistant, {
    @Default(<AiMessage>[]) List<AiMessage> inlineMessages,
  }) = AiToolRequestEvent;

  /// 端侧工具执行后的结果消息（role=tool）。由 AiRepo 在执行工具后透出，
  /// 供上层把完整工具往返纳入会话历史（KEEP 完整 transcript）。
  const factory AiStreamEvent.toolResult(AiMessage message) = AiToolResultEvent;

  /// 结构化结果（船卡片等），与 token 穿插。
  const factory AiStreamEvent.card(Map<String, dynamic> data) = AiCardEvent;

  /// 整轮结束。
  /// inlineMessages：纯 RAG 段（无端侧工具）服务端内联工具往返的完整消息（assistant 轮 + tool 结果，
  /// 含 provider_state），客户端须在最终答案 assistant 之前按序纳入历史。见 contract §3.3/§7。默认空。
  const factory AiStreamEvent.done(
    Map<String, dynamic> usage, {
    @Default(<AiMessage>[]) List<AiMessage> inlineMessages,
  }) = AiDoneEvent;

  /// 业务错误。
  const factory AiStreamEvent.error(String message, {@Default(false) bool retryable}) =
      AiErrorEvent;
}
