import 'package:freezed_annotation/freezed_annotation.dart';
import '../friend.dart';

part 'friend_request.freezed.dart';
part 'friend_request.g.dart';

@unfreezed
class FriendRequest with _$FriendRequest {
  factory FriendRequest({
    required String id,
    List<Friend>? members,
    @JsonKey(name: 'requesting_member_id') String? requestingMemberId,
    @Default('pending') String status,
    @JsonKey(name: 'target_member_id') String? targetMemberId,
    @JsonKey(name: 'time_created') int? timeCreated,
    @JsonKey(name: 'time_modified') int? timeModified,
  }) = _FriendRequest;

  factory FriendRequest.fromJson(Map<String, dynamic> json) => _$FriendRequestFromJson(json);
}
