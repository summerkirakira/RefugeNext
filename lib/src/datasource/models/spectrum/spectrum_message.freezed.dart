// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'spectrum_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SpectrumMessage _$SpectrumMessageFromJson(Map<String, dynamic> json) {
  return _SpectrumMessage.fromJson(json);
}

/// @nodoc
mixin _$SpectrumMessage {
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'time_created')
  int? get timeCreated => throw _privateConstructorUsedError;
  @JsonKey(name: 'time_created')
  set timeCreated(int? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'member_id')
  String? get memberId => throw _privateConstructorUsedError;
  @JsonKey(name: 'member_id')
  set memberId(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'lobby_id')
  String? get lobbyId => throw _privateConstructorUsedError;
  @JsonKey(name: 'lobby_id')
  set lobbyId(String? value) => throw _privateConstructorUsedError;
  String? get plaintext => throw _privateConstructorUsedError;
  set plaintext(String? value) => throw _privateConstructorUsedError;
  SpectrumMessageMember? get member => throw _privateConstructorUsedError;
  set member(SpectrumMessageMember? value) =>
      throw _privateConstructorUsedError;
  SpectrumMessageLobby? get lobby => throw _privateConstructorUsedError;
  set lobby(SpectrumMessageLobby? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SpectrumMessageCopyWith<SpectrumMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpectrumMessageCopyWith<$Res> {
  factory $SpectrumMessageCopyWith(
          SpectrumMessage value, $Res Function(SpectrumMessage) then) =
      _$SpectrumMessageCopyWithImpl<$Res, SpectrumMessage>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'time_created') int? timeCreated,
      @JsonKey(name: 'member_id') String? memberId,
      @JsonKey(name: 'lobby_id') String? lobbyId,
      String? plaintext,
      SpectrumMessageMember? member,
      SpectrumMessageLobby? lobby});

  $SpectrumMessageMemberCopyWith<$Res>? get member;
  $SpectrumMessageLobbyCopyWith<$Res>? get lobby;
}

/// @nodoc
class _$SpectrumMessageCopyWithImpl<$Res, $Val extends SpectrumMessage>
    implements $SpectrumMessageCopyWith<$Res> {
  _$SpectrumMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? timeCreated = freezed,
    Object? memberId = freezed,
    Object? lobbyId = freezed,
    Object? plaintext = freezed,
    Object? member = freezed,
    Object? lobby = freezed,
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
      memberId: freezed == memberId
          ? _value.memberId
          : memberId // ignore: cast_nullable_to_non_nullable
              as String?,
      lobbyId: freezed == lobbyId
          ? _value.lobbyId
          : lobbyId // ignore: cast_nullable_to_non_nullable
              as String?,
      plaintext: freezed == plaintext
          ? _value.plaintext
          : plaintext // ignore: cast_nullable_to_non_nullable
              as String?,
      member: freezed == member
          ? _value.member
          : member // ignore: cast_nullable_to_non_nullable
              as SpectrumMessageMember?,
      lobby: freezed == lobby
          ? _value.lobby
          : lobby // ignore: cast_nullable_to_non_nullable
              as SpectrumMessageLobby?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SpectrumMessageMemberCopyWith<$Res>? get member {
    if (_value.member == null) {
      return null;
    }

    return $SpectrumMessageMemberCopyWith<$Res>(_value.member!, (value) {
      return _then(_value.copyWith(member: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SpectrumMessageLobbyCopyWith<$Res>? get lobby {
    if (_value.lobby == null) {
      return null;
    }

    return $SpectrumMessageLobbyCopyWith<$Res>(_value.lobby!, (value) {
      return _then(_value.copyWith(lobby: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SpectrumMessageImplCopyWith<$Res>
    implements $SpectrumMessageCopyWith<$Res> {
  factory _$$SpectrumMessageImplCopyWith(_$SpectrumMessageImpl value,
          $Res Function(_$SpectrumMessageImpl) then) =
      __$$SpectrumMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'time_created') int? timeCreated,
      @JsonKey(name: 'member_id') String? memberId,
      @JsonKey(name: 'lobby_id') String? lobbyId,
      String? plaintext,
      SpectrumMessageMember? member,
      SpectrumMessageLobby? lobby});

  @override
  $SpectrumMessageMemberCopyWith<$Res>? get member;
  @override
  $SpectrumMessageLobbyCopyWith<$Res>? get lobby;
}

/// @nodoc
class __$$SpectrumMessageImplCopyWithImpl<$Res>
    extends _$SpectrumMessageCopyWithImpl<$Res, _$SpectrumMessageImpl>
    implements _$$SpectrumMessageImplCopyWith<$Res> {
  __$$SpectrumMessageImplCopyWithImpl(
      _$SpectrumMessageImpl _value, $Res Function(_$SpectrumMessageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? timeCreated = freezed,
    Object? memberId = freezed,
    Object? lobbyId = freezed,
    Object? plaintext = freezed,
    Object? member = freezed,
    Object? lobby = freezed,
  }) {
    return _then(_$SpectrumMessageImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      timeCreated: freezed == timeCreated
          ? _value.timeCreated
          : timeCreated // ignore: cast_nullable_to_non_nullable
              as int?,
      memberId: freezed == memberId
          ? _value.memberId
          : memberId // ignore: cast_nullable_to_non_nullable
              as String?,
      lobbyId: freezed == lobbyId
          ? _value.lobbyId
          : lobbyId // ignore: cast_nullable_to_non_nullable
              as String?,
      plaintext: freezed == plaintext
          ? _value.plaintext
          : plaintext // ignore: cast_nullable_to_non_nullable
              as String?,
      member: freezed == member
          ? _value.member
          : member // ignore: cast_nullable_to_non_nullable
              as SpectrumMessageMember?,
      lobby: freezed == lobby
          ? _value.lobby
          : lobby // ignore: cast_nullable_to_non_nullable
              as SpectrumMessageLobby?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SpectrumMessageImpl implements _SpectrumMessage {
  _$SpectrumMessageImpl(
      {required this.id,
      @JsonKey(name: 'time_created') this.timeCreated,
      @JsonKey(name: 'member_id') this.memberId,
      @JsonKey(name: 'lobby_id') this.lobbyId,
      this.plaintext,
      this.member,
      this.lobby});

  factory _$SpectrumMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$SpectrumMessageImplFromJson(json);

  @override
  String id;
  @override
  @JsonKey(name: 'time_created')
  int? timeCreated;
  @override
  @JsonKey(name: 'member_id')
  String? memberId;
  @override
  @JsonKey(name: 'lobby_id')
  String? lobbyId;
  @override
  String? plaintext;
  @override
  SpectrumMessageMember? member;
  @override
  SpectrumMessageLobby? lobby;

  @override
  String toString() {
    return 'SpectrumMessage(id: $id, timeCreated: $timeCreated, memberId: $memberId, lobbyId: $lobbyId, plaintext: $plaintext, member: $member, lobby: $lobby)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SpectrumMessageImplCopyWith<_$SpectrumMessageImpl> get copyWith =>
      __$$SpectrumMessageImplCopyWithImpl<_$SpectrumMessageImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SpectrumMessageImplToJson(
      this,
    );
  }
}

abstract class _SpectrumMessage implements SpectrumMessage {
  factory _SpectrumMessage(
      {required String id,
      @JsonKey(name: 'time_created') int? timeCreated,
      @JsonKey(name: 'member_id') String? memberId,
      @JsonKey(name: 'lobby_id') String? lobbyId,
      String? plaintext,
      SpectrumMessageMember? member,
      SpectrumMessageLobby? lobby}) = _$SpectrumMessageImpl;

  factory _SpectrumMessage.fromJson(Map<String, dynamic> json) =
      _$SpectrumMessageImpl.fromJson;

  @override
  String get id;
  set id(String value);
  @override
  @JsonKey(name: 'time_created')
  int? get timeCreated;
  @JsonKey(name: 'time_created')
  set timeCreated(int? value);
  @override
  @JsonKey(name: 'member_id')
  String? get memberId;
  @JsonKey(name: 'member_id')
  set memberId(String? value);
  @override
  @JsonKey(name: 'lobby_id')
  String? get lobbyId;
  @JsonKey(name: 'lobby_id')
  set lobbyId(String? value);
  @override
  String? get plaintext;
  set plaintext(String? value);
  @override
  SpectrumMessageMember? get member;
  set member(SpectrumMessageMember? value);
  @override
  SpectrumMessageLobby? get lobby;
  set lobby(SpectrumMessageLobby? value);
  @override
  @JsonKey(ignore: true)
  _$$SpectrumMessageImplCopyWith<_$SpectrumMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SpectrumMessageMember _$SpectrumMessageMemberFromJson(
    Map<String, dynamic> json) {
  return _SpectrumMessageMember.fromJson(json);
}

/// @nodoc
mixin _$SpectrumMessageMember {
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  String get displayname => throw _privateConstructorUsedError;
  set displayname(String value) => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;
  set nickname(String value) => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;
  set avatar(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SpectrumMessageMemberCopyWith<SpectrumMessageMember> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpectrumMessageMemberCopyWith<$Res> {
  factory $SpectrumMessageMemberCopyWith(SpectrumMessageMember value,
          $Res Function(SpectrumMessageMember) then) =
      _$SpectrumMessageMemberCopyWithImpl<$Res, SpectrumMessageMember>;
  @useResult
  $Res call({String id, String displayname, String nickname, String? avatar});
}

/// @nodoc
class _$SpectrumMessageMemberCopyWithImpl<$Res,
        $Val extends SpectrumMessageMember>
    implements $SpectrumMessageMemberCopyWith<$Res> {
  _$SpectrumMessageMemberCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? displayname = null,
    Object? nickname = null,
    Object? avatar = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      displayname: null == displayname
          ? _value.displayname
          : displayname // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SpectrumMessageMemberImplCopyWith<$Res>
    implements $SpectrumMessageMemberCopyWith<$Res> {
  factory _$$SpectrumMessageMemberImplCopyWith(
          _$SpectrumMessageMemberImpl value,
          $Res Function(_$SpectrumMessageMemberImpl) then) =
      __$$SpectrumMessageMemberImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String displayname, String nickname, String? avatar});
}

/// @nodoc
class __$$SpectrumMessageMemberImplCopyWithImpl<$Res>
    extends _$SpectrumMessageMemberCopyWithImpl<$Res,
        _$SpectrumMessageMemberImpl>
    implements _$$SpectrumMessageMemberImplCopyWith<$Res> {
  __$$SpectrumMessageMemberImplCopyWithImpl(_$SpectrumMessageMemberImpl _value,
      $Res Function(_$SpectrumMessageMemberImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? displayname = null,
    Object? nickname = null,
    Object? avatar = freezed,
  }) {
    return _then(_$SpectrumMessageMemberImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      displayname: null == displayname
          ? _value.displayname
          : displayname // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SpectrumMessageMemberImpl implements _SpectrumMessageMember {
  _$SpectrumMessageMemberImpl(
      {required this.id,
      required this.displayname,
      required this.nickname,
      this.avatar});

  factory _$SpectrumMessageMemberImpl.fromJson(Map<String, dynamic> json) =>
      _$$SpectrumMessageMemberImplFromJson(json);

  @override
  String id;
  @override
  String displayname;
  @override
  String nickname;
  @override
  String? avatar;

  @override
  String toString() {
    return 'SpectrumMessageMember(id: $id, displayname: $displayname, nickname: $nickname, avatar: $avatar)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SpectrumMessageMemberImplCopyWith<_$SpectrumMessageMemberImpl>
      get copyWith => __$$SpectrumMessageMemberImplCopyWithImpl<
          _$SpectrumMessageMemberImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SpectrumMessageMemberImplToJson(
      this,
    );
  }
}

abstract class _SpectrumMessageMember implements SpectrumMessageMember {
  factory _SpectrumMessageMember(
      {required String id,
      required String displayname,
      required String nickname,
      String? avatar}) = _$SpectrumMessageMemberImpl;

  factory _SpectrumMessageMember.fromJson(Map<String, dynamic> json) =
      _$SpectrumMessageMemberImpl.fromJson;

  @override
  String get id;
  set id(String value);
  @override
  String get displayname;
  set displayname(String value);
  @override
  String get nickname;
  set nickname(String value);
  @override
  String? get avatar;
  set avatar(String? value);
  @override
  @JsonKey(ignore: true)
  _$$SpectrumMessageMemberImplCopyWith<_$SpectrumMessageMemberImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SpectrumMessageLobby _$SpectrumMessageLobbyFromJson(Map<String, dynamic> json) {
  return _SpectrumMessageLobby.fromJson(json);
}

/// @nodoc
mixin _$SpectrumMessageLobby {
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  set type(String value) => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  set name(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SpectrumMessageLobbyCopyWith<SpectrumMessageLobby> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpectrumMessageLobbyCopyWith<$Res> {
  factory $SpectrumMessageLobbyCopyWith(SpectrumMessageLobby value,
          $Res Function(SpectrumMessageLobby) then) =
      _$SpectrumMessageLobbyCopyWithImpl<$Res, SpectrumMessageLobby>;
  @useResult
  $Res call({String id, String type, String? name});
}

/// @nodoc
class _$SpectrumMessageLobbyCopyWithImpl<$Res,
        $Val extends SpectrumMessageLobby>
    implements $SpectrumMessageLobbyCopyWith<$Res> {
  _$SpectrumMessageLobbyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? name = freezed,
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
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SpectrumMessageLobbyImplCopyWith<$Res>
    implements $SpectrumMessageLobbyCopyWith<$Res> {
  factory _$$SpectrumMessageLobbyImplCopyWith(_$SpectrumMessageLobbyImpl value,
          $Res Function(_$SpectrumMessageLobbyImpl) then) =
      __$$SpectrumMessageLobbyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String type, String? name});
}

/// @nodoc
class __$$SpectrumMessageLobbyImplCopyWithImpl<$Res>
    extends _$SpectrumMessageLobbyCopyWithImpl<$Res, _$SpectrumMessageLobbyImpl>
    implements _$$SpectrumMessageLobbyImplCopyWith<$Res> {
  __$$SpectrumMessageLobbyImplCopyWithImpl(_$SpectrumMessageLobbyImpl _value,
      $Res Function(_$SpectrumMessageLobbyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? name = freezed,
  }) {
    return _then(_$SpectrumMessageLobbyImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SpectrumMessageLobbyImpl implements _SpectrumMessageLobby {
  _$SpectrumMessageLobbyImpl({required this.id, required this.type, this.name});

  factory _$SpectrumMessageLobbyImpl.fromJson(Map<String, dynamic> json) =>
      _$$SpectrumMessageLobbyImplFromJson(json);

  @override
  String id;
  @override
  String type;
  @override
  String? name;

  @override
  String toString() {
    return 'SpectrumMessageLobby(id: $id, type: $type, name: $name)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SpectrumMessageLobbyImplCopyWith<_$SpectrumMessageLobbyImpl>
      get copyWith =>
          __$$SpectrumMessageLobbyImplCopyWithImpl<_$SpectrumMessageLobbyImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SpectrumMessageLobbyImplToJson(
      this,
    );
  }
}

abstract class _SpectrumMessageLobby implements SpectrumMessageLobby {
  factory _SpectrumMessageLobby(
      {required String id,
      required String type,
      String? name}) = _$SpectrumMessageLobbyImpl;

  factory _SpectrumMessageLobby.fromJson(Map<String, dynamic> json) =
      _$SpectrumMessageLobbyImpl.fromJson;

  @override
  String get id;
  set id(String value);
  @override
  String get type;
  set type(String value);
  @override
  String? get name;
  set name(String? value);
  @override
  @JsonKey(ignore: true)
  _$$SpectrumMessageLobbyImplCopyWith<_$SpectrumMessageLobbyImpl>
      get copyWith => throw _privateConstructorUsedError;
}
