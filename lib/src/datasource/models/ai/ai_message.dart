import 'package:freezed_annotation/freezed_annotation.dart';

import 'tool_call.dart';

part 'ai_message.freezed.dart';
part 'ai_message.g.dart';

/// 对话消息，OpenAI 风格、以 role 判别。线格式见 planning/docs/ai_module_contract.md §3.1。
/// - user/assistant 的 content 为 String，tool 的 content 为 Map。
/// - providerState 为不透明字符串（如 Claude thinking signature），原样存、原样回传，不解析。
@freezed
abstract class AiMessage with _$AiMessage {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory AiMessage({
    required String role, // user | assistant | tool
    Object? content,
    List<ToolCall>? toolCalls, // -> tool_calls
    String? toolCallId, // -> tool_call_id
    String? providerState, // -> provider_state
  }) = _AiMessage;

  factory AiMessage.fromJson(Map<String, dynamic> json) => _$AiMessageFromJson(json);
}

/// 便捷构造：用户消息。
AiMessage userMessage(String text) => AiMessage(role: 'user', content: text);

/// 便捷构造：端侧工具结果消息。
AiMessage toolResultMessage({
  required String toolCallId,
  required Map<String, dynamic> content,
}) =>
    AiMessage(role: 'tool', toolCallId: toolCallId, content: content);
