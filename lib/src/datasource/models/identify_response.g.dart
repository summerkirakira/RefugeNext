// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'identify_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IdentifyResponseImpl _$$IdentifyResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$IdentifyResponseImpl(
      success: (json['success'] as num).toInt(),
      code: json['code'] as String?,
      msg: json['msg'] as String?,
      data: json['data'] == null
          ? null
          : IdentifyData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$IdentifyResponseImplToJson(
        _$IdentifyResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data,
    };

_$IdentifyDataImpl _$$IdentifyDataImplFromJson(Map<String, dynamic> json) =>
    _$IdentifyDataImpl(
      friends: (json['friends'] as List<dynamic>?)
          ?.map((e) => Friend.fromJson(e as Map<String, dynamic>))
          .toList(),
      privateLobbies: (json['private_lobbies'] as List<dynamic>?)
          ?.map((e) => PrivateLobby.fromJson(e as Map<String, dynamic>))
          .toList(),
      friendRequests: (json['friend_requests'] as List<dynamic>?)
          ?.map((e) => FriendRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$IdentifyDataImplToJson(_$IdentifyDataImpl instance) =>
    <String, dynamic>{
      'friends': instance.friends,
      'private_lobbies': instance.privateLobbies,
      'friend_requests': instance.friendRequests,
    };
