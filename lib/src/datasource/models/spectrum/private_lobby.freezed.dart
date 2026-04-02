// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'private_lobby.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PrivateLobby _$PrivateLobbyFromJson(Map<String, dynamic> json) {
  return _PrivateLobby.fromJson(json);
}

/// @nodoc
mixin _$PrivateLobby {
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  set type(String value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'community_id')
  String? get communityId => throw _privateConstructorUsedError;
  @JsonKey(name: 'community_id')
  set communityId(String? value) => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  set name(String? value) => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  set description(String? value) => throw _privateConstructorUsedError;
  String? get color => throw _privateConstructorUsedError;
  set color(String? value) => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;
  set icon(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'time_created')
  int? get timeCreated => throw _privateConstructorUsedError;
  @JsonKey(name: 'time_created')
  set timeCreated(int? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'subscription_key')
  String? get subscriptionKey => throw _privateConstructorUsedError;
  @JsonKey(name: 'subscription_key')
  set subscriptionKey(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'leader_id')
  String? get leaderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'leader_id')
  set leaderId(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'online_members_count')
  int? get onlineMembersCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'online_members_count')
  set onlineMembersCount(int? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_read')
  int? get lastRead => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_read')
  set lastRead(int? value) => throw _privateConstructorUsedError;
  int? get latest => throw _privateConstructorUsedError;
  set latest(int? value) => throw _privateConstructorUsedError;
  List<Friend>? get members => throw _privateConstructorUsedError;
  set members(List<Friend>? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'new_messages')
  int get newMessages => throw _privateConstructorUsedError;
  @JsonKey(name: 'new_messages')
  set newMessages(int value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_message')
  LobbyLastMessage? get lastMessage => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_message')
  set lastMessage(LobbyLastMessage? value) =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'blocked_recipients')
  bool get blockedRecipients => throw _privateConstructorUsedError;
  @JsonKey(name: 'blocked_recipients')
  set blockedRecipients(bool value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PrivateLobbyCopyWith<PrivateLobby> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrivateLobbyCopyWith<$Res> {
  factory $PrivateLobbyCopyWith(
          PrivateLobby value, $Res Function(PrivateLobby) then) =
      _$PrivateLobbyCopyWithImpl<$Res, PrivateLobby>;
  @useResult
  $Res call(
      {String id,
      String type,
      @JsonKey(name: 'community_id') String? communityId,
      String? name,
      String? description,
      String? color,
      String? icon,
      @JsonKey(name: 'time_created') int? timeCreated,
      @JsonKey(name: 'subscription_key') String? subscriptionKey,
      @JsonKey(name: 'leader_id') String? leaderId,
      @JsonKey(name: 'online_members_count') int? onlineMembersCount,
      @JsonKey(name: 'last_read') int? lastRead,
      int? latest,
      List<Friend>? members,
      @JsonKey(name: 'new_messages') int newMessages,
      @JsonKey(name: 'last_message') LobbyLastMessage? lastMessage,
      @JsonKey(name: 'blocked_recipients') bool blockedRecipients});

  $LobbyLastMessageCopyWith<$Res>? get lastMessage;
}

/// @nodoc
class _$PrivateLobbyCopyWithImpl<$Res, $Val extends PrivateLobby>
    implements $PrivateLobbyCopyWith<$Res> {
  _$PrivateLobbyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? communityId = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? color = freezed,
    Object? icon = freezed,
    Object? timeCreated = freezed,
    Object? subscriptionKey = freezed,
    Object? leaderId = freezed,
    Object? onlineMembersCount = freezed,
    Object? lastRead = freezed,
    Object? latest = freezed,
    Object? members = freezed,
    Object? newMessages = null,
    Object? lastMessage = freezed,
    Object? blockedRecipients = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      communityId: freezed == communityId
          ? _value.communityId
          : communityId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      timeCreated: freezed == timeCreated
          ? _value.timeCreated
          : timeCreated // ignore: cast_nullable_to_non_nullable
              as int?,
      subscriptionKey: freezed == subscriptionKey
          ? _value.subscriptionKey
          : subscriptionKey // ignore: cast_nullable_to_non_nullable
              as String?,
      leaderId: freezed == leaderId
          ? _value.leaderId
          : leaderId // ignore: cast_nullable_to_non_nullable
              as String?,
      onlineMembersCount: freezed == onlineMembersCount
          ? _value.onlineMembersCount
          : onlineMembersCount // ignore: cast_nullable_to_non_nullable
              as int?,
      lastRead: freezed == lastRead
          ? _value.lastRead
          : lastRead // ignore: cast_nullable_to_non_nullable
              as int?,
      latest: freezed == latest
          ? _value.latest
          : latest // ignore: cast_nullable_to_non_nullable
              as int?,
      members: freezed == members
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<Friend>?,
      newMessages: null == newMessages
          ? _value.newMessages
          : newMessages // ignore: cast_nullable_to_non_nullable
              as int,
      lastMessage: freezed == lastMessage
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as LobbyLastMessage?,
      blockedRecipients: null == blockedRecipients
          ? _value.blockedRecipients
          : blockedRecipients // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LobbyLastMessageCopyWith<$Res>? get lastMessage {
    if (_value.lastMessage == null) {
      return null;
    }

    return $LobbyLastMessageCopyWith<$Res>(_value.lastMessage!, (value) {
      return _then(_value.copyWith(lastMessage: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PrivateLobbyImplCopyWith<$Res>
    implements $PrivateLobbyCopyWith<$Res> {
  factory _$$PrivateLobbyImplCopyWith(
          _$PrivateLobbyImpl value, $Res Function(_$PrivateLobbyImpl) then) =
      __$$PrivateLobbyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String type,
      @JsonKey(name: 'community_id') String? communityId,
      String? name,
      String? description,
      String? color,
      String? icon,
      @JsonKey(name: 'time_created') int? timeCreated,
      @JsonKey(name: 'subscription_key') String? subscriptionKey,
      @JsonKey(name: 'leader_id') String? leaderId,
      @JsonKey(name: 'online_members_count') int? onlineMembersCount,
      @JsonKey(name: 'last_read') int? lastRead,
      int? latest,
      List<Friend>? members,
      @JsonKey(name: 'new_messages') int newMessages,
      @JsonKey(name: 'last_message') LobbyLastMessage? lastMessage,
      @JsonKey(name: 'blocked_recipients') bool blockedRecipients});

  @override
  $LobbyLastMessageCopyWith<$Res>? get lastMessage;
}

/// @nodoc
class __$$PrivateLobbyImplCopyWithImpl<$Res>
    extends _$PrivateLobbyCopyWithImpl<$Res, _$PrivateLobbyImpl>
    implements _$$PrivateLobbyImplCopyWith<$Res> {
  __$$PrivateLobbyImplCopyWithImpl(
      _$PrivateLobbyImpl _value, $Res Function(_$PrivateLobbyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? communityId = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? color = freezed,
    Object? icon = freezed,
    Object? timeCreated = freezed,
    Object? subscriptionKey = freezed,
    Object? leaderId = freezed,
    Object? onlineMembersCount = freezed,
    Object? lastRead = freezed,
    Object? latest = freezed,
    Object? members = freezed,
    Object? newMessages = null,
    Object? lastMessage = freezed,
    Object? blockedRecipients = null,
  }) {
    return _then(_$PrivateLobbyImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      communityId: freezed == communityId
          ? _value.communityId
          : communityId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      timeCreated: freezed == timeCreated
          ? _value.timeCreated
          : timeCreated // ignore: cast_nullable_to_non_nullable
              as int?,
      subscriptionKey: freezed == subscriptionKey
          ? _value.subscriptionKey
          : subscriptionKey // ignore: cast_nullable_to_non_nullable
              as String?,
      leaderId: freezed == leaderId
          ? _value.leaderId
          : leaderId // ignore: cast_nullable_to_non_nullable
              as String?,
      onlineMembersCount: freezed == onlineMembersCount
          ? _value.onlineMembersCount
          : onlineMembersCount // ignore: cast_nullable_to_non_nullable
              as int?,
      lastRead: freezed == lastRead
          ? _value.lastRead
          : lastRead // ignore: cast_nullable_to_non_nullable
              as int?,
      latest: freezed == latest
          ? _value.latest
          : latest // ignore: cast_nullable_to_non_nullable
              as int?,
      members: freezed == members
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<Friend>?,
      newMessages: null == newMessages
          ? _value.newMessages
          : newMessages // ignore: cast_nullable_to_non_nullable
              as int,
      lastMessage: freezed == lastMessage
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as LobbyLastMessage?,
      blockedRecipients: null == blockedRecipients
          ? _value.blockedRecipients
          : blockedRecipients // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PrivateLobbyImpl implements _PrivateLobby {
  _$PrivateLobbyImpl(
      {required this.id,
      required this.type,
      @JsonKey(name: 'community_id') this.communityId,
      this.name,
      this.description,
      this.color,
      this.icon,
      @JsonKey(name: 'time_created') this.timeCreated,
      @JsonKey(name: 'subscription_key') this.subscriptionKey,
      @JsonKey(name: 'leader_id') this.leaderId,
      @JsonKey(name: 'online_members_count') this.onlineMembersCount,
      @JsonKey(name: 'last_read') this.lastRead,
      this.latest,
      this.members,
      @JsonKey(name: 'new_messages') this.newMessages = 0,
      @JsonKey(name: 'last_message') this.lastMessage,
      @JsonKey(name: 'blocked_recipients') this.blockedRecipients = false});

  factory _$PrivateLobbyImpl.fromJson(Map<String, dynamic> json) =>
      _$$PrivateLobbyImplFromJson(json);

  @override
  String id;
  @override
  String type;
  @override
  @JsonKey(name: 'community_id')
  String? communityId;
  @override
  String? name;
  @override
  String? description;
  @override
  String? color;
  @override
  String? icon;
  @override
  @JsonKey(name: 'time_created')
  int? timeCreated;
  @override
  @JsonKey(name: 'subscription_key')
  String? subscriptionKey;
  @override
  @JsonKey(name: 'leader_id')
  String? leaderId;
  @override
  @JsonKey(name: 'online_members_count')
  int? onlineMembersCount;
  @override
  @JsonKey(name: 'last_read')
  int? lastRead;
  @override
  int? latest;
  @override
  List<Friend>? members;
  @override
  @JsonKey(name: 'new_messages')
  int newMessages;
  @override
  @JsonKey(name: 'last_message')
  LobbyLastMessage? lastMessage;
  @override
  @JsonKey(name: 'blocked_recipients')
  bool blockedRecipients;

  @override
  String toString() {
    return 'PrivateLobby(id: $id, type: $type, communityId: $communityId, name: $name, description: $description, color: $color, icon: $icon, timeCreated: $timeCreated, subscriptionKey: $subscriptionKey, leaderId: $leaderId, onlineMembersCount: $onlineMembersCount, lastRead: $lastRead, latest: $latest, members: $members, newMessages: $newMessages, lastMessage: $lastMessage, blockedRecipients: $blockedRecipients)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PrivateLobbyImplCopyWith<_$PrivateLobbyImpl> get copyWith =>
      __$$PrivateLobbyImplCopyWithImpl<_$PrivateLobbyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PrivateLobbyImplToJson(
      this,
    );
  }
}

abstract class _PrivateLobby implements PrivateLobby {
  factory _PrivateLobby(
          {required String id,
          required String type,
          @JsonKey(name: 'community_id') String? communityId,
          String? name,
          String? description,
          String? color,
          String? icon,
          @JsonKey(name: 'time_created') int? timeCreated,
          @JsonKey(name: 'subscription_key') String? subscriptionKey,
          @JsonKey(name: 'leader_id') String? leaderId,
          @JsonKey(name: 'online_members_count') int? onlineMembersCount,
          @JsonKey(name: 'last_read') int? lastRead,
          int? latest,
          List<Friend>? members,
          @JsonKey(name: 'new_messages') int newMessages,
          @JsonKey(name: 'last_message') LobbyLastMessage? lastMessage,
          @JsonKey(name: 'blocked_recipients') bool blockedRecipients}) =
      _$PrivateLobbyImpl;

  factory _PrivateLobby.fromJson(Map<String, dynamic> json) =
      _$PrivateLobbyImpl.fromJson;

  @override
  String get id;
  set id(String value);
  @override
  String get type;
  set type(String value);
  @override
  @JsonKey(name: 'community_id')
  String? get communityId;
  @JsonKey(name: 'community_id')
  set communityId(String? value);
  @override
  String? get name;
  set name(String? value);
  @override
  String? get description;
  set description(String? value);
  @override
  String? get color;
  set color(String? value);
  @override
  String? get icon;
  set icon(String? value);
  @override
  @JsonKey(name: 'time_created')
  int? get timeCreated;
  @JsonKey(name: 'time_created')
  set timeCreated(int? value);
  @override
  @JsonKey(name: 'subscription_key')
  String? get subscriptionKey;
  @JsonKey(name: 'subscription_key')
  set subscriptionKey(String? value);
  @override
  @JsonKey(name: 'leader_id')
  String? get leaderId;
  @JsonKey(name: 'leader_id')
  set leaderId(String? value);
  @override
  @JsonKey(name: 'online_members_count')
  int? get onlineMembersCount;
  @JsonKey(name: 'online_members_count')
  set onlineMembersCount(int? value);
  @override
  @JsonKey(name: 'last_read')
  int? get lastRead;
  @JsonKey(name: 'last_read')
  set lastRead(int? value);
  @override
  int? get latest;
  set latest(int? value);
  @override
  List<Friend>? get members;
  set members(List<Friend>? value);
  @override
  @JsonKey(name: 'new_messages')
  int get newMessages;
  @JsonKey(name: 'new_messages')
  set newMessages(int value);
  @override
  @JsonKey(name: 'last_message')
  LobbyLastMessage? get lastMessage;
  @JsonKey(name: 'last_message')
  set lastMessage(LobbyLastMessage? value);
  @override
  @JsonKey(name: 'blocked_recipients')
  bool get blockedRecipients;
  @JsonKey(name: 'blocked_recipients')
  set blockedRecipients(bool value);
  @override
  @JsonKey(ignore: true)
  _$$PrivateLobbyImplCopyWith<_$PrivateLobbyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LobbyLastMessage _$LobbyLastMessageFromJson(Map<String, dynamic> json) {
  return _LobbyLastMessage.fromJson(json);
}

/// @nodoc
mixin _$LobbyLastMessage {
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'time_created')
  int? get timeCreated => throw _privateConstructorUsedError;
  @JsonKey(name: 'time_created')
  set timeCreated(int? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'time_modified')
  int? get timeModified => throw _privateConstructorUsedError;
  @JsonKey(name: 'time_modified')
  set timeModified(int? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'lobby_id')
  String? get lobbyId => throw _privateConstructorUsedError;
  @JsonKey(name: 'lobby_id')
  set lobbyId(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'member_id')
  String? get memberId => throw _privateConstructorUsedError;
  @JsonKey(name: 'member_id')
  set memberId(String? value) => throw _privateConstructorUsedError;
  String? get plaintext => throw _privateConstructorUsedError;
  set plaintext(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_erased')
  bool get isErased => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_erased')
  set isErased(bool value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LobbyLastMessageCopyWith<LobbyLastMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LobbyLastMessageCopyWith<$Res> {
  factory $LobbyLastMessageCopyWith(
          LobbyLastMessage value, $Res Function(LobbyLastMessage) then) =
      _$LobbyLastMessageCopyWithImpl<$Res, LobbyLastMessage>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'time_created') int? timeCreated,
      @JsonKey(name: 'time_modified') int? timeModified,
      @JsonKey(name: 'lobby_id') String? lobbyId,
      @JsonKey(name: 'member_id') String? memberId,
      String? plaintext,
      @JsonKey(name: 'is_erased') bool isErased});
}

/// @nodoc
class _$LobbyLastMessageCopyWithImpl<$Res, $Val extends LobbyLastMessage>
    implements $LobbyLastMessageCopyWith<$Res> {
  _$LobbyLastMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? timeCreated = freezed,
    Object? timeModified = freezed,
    Object? lobbyId = freezed,
    Object? memberId = freezed,
    Object? plaintext = freezed,
    Object? isErased = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      timeCreated: freezed == timeCreated
          ? _value.timeCreated
          : timeCreated // ignore: cast_nullable_to_non_nullable
              as int?,
      timeModified: freezed == timeModified
          ? _value.timeModified
          : timeModified // ignore: cast_nullable_to_non_nullable
              as int?,
      lobbyId: freezed == lobbyId
          ? _value.lobbyId
          : lobbyId // ignore: cast_nullable_to_non_nullable
              as String?,
      memberId: freezed == memberId
          ? _value.memberId
          : memberId // ignore: cast_nullable_to_non_nullable
              as String?,
      plaintext: freezed == plaintext
          ? _value.plaintext
          : plaintext // ignore: cast_nullable_to_non_nullable
              as String?,
      isErased: null == isErased
          ? _value.isErased
          : isErased // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LobbyLastMessageImplCopyWith<$Res>
    implements $LobbyLastMessageCopyWith<$Res> {
  factory _$$LobbyLastMessageImplCopyWith(_$LobbyLastMessageImpl value,
          $Res Function(_$LobbyLastMessageImpl) then) =
      __$$LobbyLastMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'time_created') int? timeCreated,
      @JsonKey(name: 'time_modified') int? timeModified,
      @JsonKey(name: 'lobby_id') String? lobbyId,
      @JsonKey(name: 'member_id') String? memberId,
      String? plaintext,
      @JsonKey(name: 'is_erased') bool isErased});
}

/// @nodoc
class __$$LobbyLastMessageImplCopyWithImpl<$Res>
    extends _$LobbyLastMessageCopyWithImpl<$Res, _$LobbyLastMessageImpl>
    implements _$$LobbyLastMessageImplCopyWith<$Res> {
  __$$LobbyLastMessageImplCopyWithImpl(_$LobbyLastMessageImpl _value,
      $Res Function(_$LobbyLastMessageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? timeCreated = freezed,
    Object? timeModified = freezed,
    Object? lobbyId = freezed,
    Object? memberId = freezed,
    Object? plaintext = freezed,
    Object? isErased = null,
  }) {
    return _then(_$LobbyLastMessageImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      timeCreated: freezed == timeCreated
          ? _value.timeCreated
          : timeCreated // ignore: cast_nullable_to_non_nullable
              as int?,
      timeModified: freezed == timeModified
          ? _value.timeModified
          : timeModified // ignore: cast_nullable_to_non_nullable
              as int?,
      lobbyId: freezed == lobbyId
          ? _value.lobbyId
          : lobbyId // ignore: cast_nullable_to_non_nullable
              as String?,
      memberId: freezed == memberId
          ? _value.memberId
          : memberId // ignore: cast_nullable_to_non_nullable
              as String?,
      plaintext: freezed == plaintext
          ? _value.plaintext
          : plaintext // ignore: cast_nullable_to_non_nullable
              as String?,
      isErased: null == isErased
          ? _value.isErased
          : isErased // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LobbyLastMessageImpl implements _LobbyLastMessage {
  _$LobbyLastMessageImpl(
      {required this.id,
      @JsonKey(name: 'time_created') this.timeCreated,
      @JsonKey(name: 'time_modified') this.timeModified,
      @JsonKey(name: 'lobby_id') this.lobbyId,
      @JsonKey(name: 'member_id') this.memberId,
      this.plaintext,
      @JsonKey(name: 'is_erased') this.isErased = false});

  factory _$LobbyLastMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$LobbyLastMessageImplFromJson(json);

  @override
  String id;
  @override
  @JsonKey(name: 'time_created')
  int? timeCreated;
  @override
  @JsonKey(name: 'time_modified')
  int? timeModified;
  @override
  @JsonKey(name: 'lobby_id')
  String? lobbyId;
  @override
  @JsonKey(name: 'member_id')
  String? memberId;
  @override
  String? plaintext;
  @override
  @JsonKey(name: 'is_erased')
  bool isErased;

  @override
  String toString() {
    return 'LobbyLastMessage(id: $id, timeCreated: $timeCreated, timeModified: $timeModified, lobbyId: $lobbyId, memberId: $memberId, plaintext: $plaintext, isErased: $isErased)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LobbyLastMessageImplCopyWith<_$LobbyLastMessageImpl> get copyWith =>
      __$$LobbyLastMessageImplCopyWithImpl<_$LobbyLastMessageImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LobbyLastMessageImplToJson(
      this,
    );
  }
}

abstract class _LobbyLastMessage implements LobbyLastMessage {
  factory _LobbyLastMessage(
      {required String id,
      @JsonKey(name: 'time_created') int? timeCreated,
      @JsonKey(name: 'time_modified') int? timeModified,
      @JsonKey(name: 'lobby_id') String? lobbyId,
      @JsonKey(name: 'member_id') String? memberId,
      String? plaintext,
      @JsonKey(name: 'is_erased') bool isErased}) = _$LobbyLastMessageImpl;

  factory _LobbyLastMessage.fromJson(Map<String, dynamic> json) =
      _$LobbyLastMessageImpl.fromJson;

  @override
  String get id;
  set id(String value);
  @override
  @JsonKey(name: 'time_created')
  int? get timeCreated;
  @JsonKey(name: 'time_created')
  set timeCreated(int? value);
  @override
  @JsonKey(name: 'time_modified')
  int? get timeModified;
  @JsonKey(name: 'time_modified')
  set timeModified(int? value);
  @override
  @JsonKey(name: 'lobby_id')
  String? get lobbyId;
  @JsonKey(name: 'lobby_id')
  set lobbyId(String? value);
  @override
  @JsonKey(name: 'member_id')
  String? get memberId;
  @JsonKey(name: 'member_id')
  set memberId(String? value);
  @override
  String? get plaintext;
  set plaintext(String? value);
  @override
  @JsonKey(name: 'is_erased')
  bool get isErased;
  @JsonKey(name: 'is_erased')
  set isErased(bool value);
  @override
  @JsonKey(ignore: true)
  _$$LobbyLastMessageImplCopyWith<_$LobbyLastMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
