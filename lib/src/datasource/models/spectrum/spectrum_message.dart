import 'package:freezed_annotation/freezed_annotation.dart';

part 'spectrum_message.freezed.dart';
part 'spectrum_message.g.dart';

@unfreezed
class SpectrumMessage with _$SpectrumMessage {
  SpectrumMessage._();

  factory SpectrumMessage({
    required String id,
    @JsonKey(name: 'time_created') int? timeCreated,
    @JsonKey(name: 'member_id') String? memberId,
    @JsonKey(name: 'lobby_id') String? lobbyId,
    String? plaintext,
    @JsonKey(name: 'content_state') SpectrumContentState? contentState,
    SpectrumMessageMember? member,
    SpectrumMessageLobby? lobby,
  }) = _SpectrumMessage;

  /// 优先取 plaintext，否则从 content_state.blocks 拼接
  String get displayText {
    if (plaintext != null && plaintext!.isNotEmpty) return plaintext!;
    if (contentState?.blocks == null) return '';
    return contentState!.blocks!.map((b) => b.text).join('\n');
  }

  factory SpectrumMessage.fromJson(Map<String, dynamic> json) => _$SpectrumMessageFromJson(json);
}

@unfreezed
class SpectrumContentState with _$SpectrumContentState {
  factory SpectrumContentState({
    List<SpectrumContentBlock>? blocks,
  }) = _SpectrumContentState;

  factory SpectrumContentState.fromJson(Map<String, dynamic> json) => _$SpectrumContentStateFromJson(json);
}

@unfreezed
class SpectrumContentBlock with _$SpectrumContentBlock {
  factory SpectrumContentBlock({
    String? key,
    @Default('') String text,
    String? type,
  }) = _SpectrumContentBlock;

  factory SpectrumContentBlock.fromJson(Map<String, dynamic> json) => _$SpectrumContentBlockFromJson(json);
}

@unfreezed
class SpectrumMessageMember with _$SpectrumMessageMember {
  factory SpectrumMessageMember({
    required String id,
    required String displayname,
    required String nickname,
    String? avatar,
  }) = _SpectrumMessageMember;

  factory SpectrumMessageMember.fromJson(Map<String, dynamic> json) => _$SpectrumMessageMemberFromJson(json);
}

@unfreezed
class SpectrumMessageLobby with _$SpectrumMessageLobby {
  factory SpectrumMessageLobby({
    required String id,
    required String type,
    String? name,
  }) = _SpectrumMessageLobby;

  factory SpectrumMessageLobby.fromJson(Map<String, dynamic> json) => _$SpectrumMessageLobbyFromJson(json);
}
