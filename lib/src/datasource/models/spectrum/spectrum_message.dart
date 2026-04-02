import 'package:freezed_annotation/freezed_annotation.dart';

part 'spectrum_message.freezed.dart';
part 'spectrum_message.g.dart';

@unfreezed
class SpectrumMessage with _$SpectrumMessage {
  factory SpectrumMessage({
    required String id,
    @JsonKey(name: 'time_created') int? timeCreated,
    @JsonKey(name: 'member_id') String? memberId,
    @JsonKey(name: 'lobby_id') String? lobbyId,
    String? plaintext,
    SpectrumMessageMember? member,
    SpectrumMessageLobby? lobby,
  }) = _SpectrumMessage;

  factory SpectrumMessage.fromJson(Map<String, dynamic> json) => _$SpectrumMessageFromJson(json);
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
