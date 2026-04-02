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
  @JsonKey(name: 'content_state')
  SpectrumContentState? get contentState => throw _privateConstructorUsedError;
  @JsonKey(name: 'content_state')
  set contentState(SpectrumContentState? value) =>
      throw _privateConstructorUsedError;
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
      @JsonKey(name: 'content_state') SpectrumContentState? contentState,
      SpectrumMessageMember? member,
      SpectrumMessageLobby? lobby});

  $SpectrumContentStateCopyWith<$Res>? get contentState;
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
    Object? contentState = freezed,
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
      contentState: freezed == contentState
          ? _value.contentState
          : contentState // ignore: cast_nullable_to_non_nullable
              as SpectrumContentState?,
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
  $SpectrumContentStateCopyWith<$Res>? get contentState {
    if (_value.contentState == null) {
      return null;
    }

    return $SpectrumContentStateCopyWith<$Res>(_value.contentState!, (value) {
      return _then(_value.copyWith(contentState: value) as $Val);
    });
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
      @JsonKey(name: 'content_state') SpectrumContentState? contentState,
      SpectrumMessageMember? member,
      SpectrumMessageLobby? lobby});

  @override
  $SpectrumContentStateCopyWith<$Res>? get contentState;
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
    Object? contentState = freezed,
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
      contentState: freezed == contentState
          ? _value.contentState
          : contentState // ignore: cast_nullable_to_non_nullable
              as SpectrumContentState?,
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
class _$SpectrumMessageImpl extends _SpectrumMessage {
  _$SpectrumMessageImpl(
      {required this.id,
      @JsonKey(name: 'time_created') this.timeCreated,
      @JsonKey(name: 'member_id') this.memberId,
      @JsonKey(name: 'lobby_id') this.lobbyId,
      this.plaintext,
      @JsonKey(name: 'content_state') this.contentState,
      this.member,
      this.lobby})
      : super._();

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
  @JsonKey(name: 'content_state')
  SpectrumContentState? contentState;
  @override
  SpectrumMessageMember? member;
  @override
  SpectrumMessageLobby? lobby;

  @override
  String toString() {
    return 'SpectrumMessage(id: $id, timeCreated: $timeCreated, memberId: $memberId, lobbyId: $lobbyId, plaintext: $plaintext, contentState: $contentState, member: $member, lobby: $lobby)';
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

abstract class _SpectrumMessage extends SpectrumMessage {
  factory _SpectrumMessage(
      {required String id,
      @JsonKey(name: 'time_created') int? timeCreated,
      @JsonKey(name: 'member_id') String? memberId,
      @JsonKey(name: 'lobby_id') String? lobbyId,
      String? plaintext,
      @JsonKey(name: 'content_state') SpectrumContentState? contentState,
      SpectrumMessageMember? member,
      SpectrumMessageLobby? lobby}) = _$SpectrumMessageImpl;
  _SpectrumMessage._() : super._();

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
  @JsonKey(name: 'content_state')
  SpectrumContentState? get contentState;
  @JsonKey(name: 'content_state')
  set contentState(SpectrumContentState? value);
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

SpectrumContentState _$SpectrumContentStateFromJson(Map<String, dynamic> json) {
  return _SpectrumContentState.fromJson(json);
}

/// @nodoc
mixin _$SpectrumContentState {
  List<SpectrumContentBlock>? get blocks => throw _privateConstructorUsedError;
  set blocks(List<SpectrumContentBlock>? value) =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SpectrumContentStateCopyWith<SpectrumContentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpectrumContentStateCopyWith<$Res> {
  factory $SpectrumContentStateCopyWith(SpectrumContentState value,
          $Res Function(SpectrumContentState) then) =
      _$SpectrumContentStateCopyWithImpl<$Res, SpectrumContentState>;
  @useResult
  $Res call({List<SpectrumContentBlock>? blocks});
}

/// @nodoc
class _$SpectrumContentStateCopyWithImpl<$Res,
        $Val extends SpectrumContentState>
    implements $SpectrumContentStateCopyWith<$Res> {
  _$SpectrumContentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? blocks = freezed,
  }) {
    return _then(_value.copyWith(
      blocks: freezed == blocks
          ? _value.blocks
          : blocks // ignore: cast_nullable_to_non_nullable
              as List<SpectrumContentBlock>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SpectrumContentStateImplCopyWith<$Res>
    implements $SpectrumContentStateCopyWith<$Res> {
  factory _$$SpectrumContentStateImplCopyWith(_$SpectrumContentStateImpl value,
          $Res Function(_$SpectrumContentStateImpl) then) =
      __$$SpectrumContentStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<SpectrumContentBlock>? blocks});
}

/// @nodoc
class __$$SpectrumContentStateImplCopyWithImpl<$Res>
    extends _$SpectrumContentStateCopyWithImpl<$Res, _$SpectrumContentStateImpl>
    implements _$$SpectrumContentStateImplCopyWith<$Res> {
  __$$SpectrumContentStateImplCopyWithImpl(_$SpectrumContentStateImpl _value,
      $Res Function(_$SpectrumContentStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? blocks = freezed,
  }) {
    return _then(_$SpectrumContentStateImpl(
      blocks: freezed == blocks
          ? _value.blocks
          : blocks // ignore: cast_nullable_to_non_nullable
              as List<SpectrumContentBlock>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SpectrumContentStateImpl implements _SpectrumContentState {
  _$SpectrumContentStateImpl({this.blocks});

  factory _$SpectrumContentStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$SpectrumContentStateImplFromJson(json);

  @override
  List<SpectrumContentBlock>? blocks;

  @override
  String toString() {
    return 'SpectrumContentState(blocks: $blocks)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SpectrumContentStateImplCopyWith<_$SpectrumContentStateImpl>
      get copyWith =>
          __$$SpectrumContentStateImplCopyWithImpl<_$SpectrumContentStateImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SpectrumContentStateImplToJson(
      this,
    );
  }
}

abstract class _SpectrumContentState implements SpectrumContentState {
  factory _SpectrumContentState({List<SpectrumContentBlock>? blocks}) =
      _$SpectrumContentStateImpl;

  factory _SpectrumContentState.fromJson(Map<String, dynamic> json) =
      _$SpectrumContentStateImpl.fromJson;

  @override
  List<SpectrumContentBlock>? get blocks;
  set blocks(List<SpectrumContentBlock>? value);
  @override
  @JsonKey(ignore: true)
  _$$SpectrumContentStateImplCopyWith<_$SpectrumContentStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SpectrumContentBlock _$SpectrumContentBlockFromJson(Map<String, dynamic> json) {
  return _SpectrumContentBlock.fromJson(json);
}

/// @nodoc
mixin _$SpectrumContentBlock {
  String? get key => throw _privateConstructorUsedError;
  set key(String? value) => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  set text(String value) => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  set type(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SpectrumContentBlockCopyWith<SpectrumContentBlock> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpectrumContentBlockCopyWith<$Res> {
  factory $SpectrumContentBlockCopyWith(SpectrumContentBlock value,
          $Res Function(SpectrumContentBlock) then) =
      _$SpectrumContentBlockCopyWithImpl<$Res, SpectrumContentBlock>;
  @useResult
  $Res call({String? key, String text, String? type});
}

/// @nodoc
class _$SpectrumContentBlockCopyWithImpl<$Res,
        $Val extends SpectrumContentBlock>
    implements $SpectrumContentBlockCopyWith<$Res> {
  _$SpectrumContentBlockCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = freezed,
    Object? text = null,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      key: freezed == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String?,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SpectrumContentBlockImplCopyWith<$Res>
    implements $SpectrumContentBlockCopyWith<$Res> {
  factory _$$SpectrumContentBlockImplCopyWith(_$SpectrumContentBlockImpl value,
          $Res Function(_$SpectrumContentBlockImpl) then) =
      __$$SpectrumContentBlockImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? key, String text, String? type});
}

/// @nodoc
class __$$SpectrumContentBlockImplCopyWithImpl<$Res>
    extends _$SpectrumContentBlockCopyWithImpl<$Res, _$SpectrumContentBlockImpl>
    implements _$$SpectrumContentBlockImplCopyWith<$Res> {
  __$$SpectrumContentBlockImplCopyWithImpl(_$SpectrumContentBlockImpl _value,
      $Res Function(_$SpectrumContentBlockImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = freezed,
    Object? text = null,
    Object? type = freezed,
  }) {
    return _then(_$SpectrumContentBlockImpl(
      key: freezed == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String?,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SpectrumContentBlockImpl implements _SpectrumContentBlock {
  _$SpectrumContentBlockImpl({this.key, this.text = '', this.type});

  factory _$SpectrumContentBlockImpl.fromJson(Map<String, dynamic> json) =>
      _$$SpectrumContentBlockImplFromJson(json);

  @override
  String? key;
  @override
  @JsonKey()
  String text;
  @override
  String? type;

  @override
  String toString() {
    return 'SpectrumContentBlock(key: $key, text: $text, type: $type)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SpectrumContentBlockImplCopyWith<_$SpectrumContentBlockImpl>
      get copyWith =>
          __$$SpectrumContentBlockImplCopyWithImpl<_$SpectrumContentBlockImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SpectrumContentBlockImplToJson(
      this,
    );
  }
}

abstract class _SpectrumContentBlock implements SpectrumContentBlock {
  factory _SpectrumContentBlock({String? key, String text, String? type}) =
      _$SpectrumContentBlockImpl;

  factory _SpectrumContentBlock.fromJson(Map<String, dynamic> json) =
      _$SpectrumContentBlockImpl.fromJson;

  @override
  String? get key;
  set key(String? value);
  @override
  String get text;
  set text(String value);
  @override
  String? get type;
  set type(String? value);
  @override
  @JsonKey(ignore: true)
  _$$SpectrumContentBlockImplCopyWith<_$SpectrumContentBlockImpl>
      get copyWith => throw _privateConstructorUsedError;
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
