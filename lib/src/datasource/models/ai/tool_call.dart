import 'package:freezed_annotation/freezed_annotation.dart';

part 'tool_call.freezed.dart';
part 'tool_call.g.dart';

/// 模型一次工具调用（assistant 消息里的 tool_calls 元素）。
/// 线格式见 planning/docs/ai_module_contract.md §3.2。
@freezed
abstract class ToolCall with _$ToolCall {
  const factory ToolCall({
    required String id,
    required String name,
    @Default(<String, dynamic>{}) Map<String, dynamic> arguments,
  }) = _ToolCall;

  factory ToolCall.fromJson(Map<String, dynamic> json) => _$ToolCallFromJson(json);
}
