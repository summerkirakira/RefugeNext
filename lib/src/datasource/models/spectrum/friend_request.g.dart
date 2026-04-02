// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friend_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FriendRequestImpl _$$FriendRequestImplFromJson(Map<String, dynamic> json) =>
    _$FriendRequestImpl(
      id: json['id'] as String,
      members: (json['members'] as List<dynamic>?)
          ?.map((e) => Friend.fromJson(e as Map<String, dynamic>))
          .toList(),
      requestingMemberId: json['requesting_member_id'] as String?,
      status: json['status'] as String? ?? 'pending',
      targetMemberId: json['target_member_id'] as String?,
      timeCreated: (json['time_created'] as num?)?.toInt(),
      timeModified: (json['time_modified'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$FriendRequestImplToJson(_$FriendRequestImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'members': instance.members,
      'requesting_member_id': instance.requestingMemberId,
      'status': instance.status,
      'target_member_id': instance.targetMemberId,
      'time_created': instance.timeCreated,
      'time_modified': instance.timeModified,
    };
