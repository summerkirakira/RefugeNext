// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'friend.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Friend _$FriendFromJson(Map<String, dynamic> json) {
  return _Friend.fromJson(json);
}

/// @nodoc
mixin _$Friend {
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  String get displayname => throw _privateConstructorUsedError;
  set displayname(String value) => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;
  set nickname(String value) => throw _privateConstructorUsedError;
  String get avatar => throw _privateConstructorUsedError;
  set avatar(String value) => throw _privateConstructorUsedError;
  String? get signature => throw _privateConstructorUsedError;
  set signature(String? value) => throw _privateConstructorUsedError;
  FriendMeta? get meta => throw _privateConstructorUsedError;
  set meta(FriendMeta? value) => throw _privateConstructorUsedError;
  bool get isGM => throw _privateConstructorUsedError;
  set isGM(bool value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'spoken_languages')
  List<String>? get spokenLanguages => throw _privateConstructorUsedError;
  @JsonKey(name: 'spoken_languages')
  set spokenLanguages(List<String>? value) =>
      throw _privateConstructorUsedError;
  FriendPresence? get presence => throw _privateConstructorUsedError;
  set presence(FriendPresence? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'common_communities')
  List<String>? get commonCommunities => throw _privateConstructorUsedError;
  @JsonKey(name: 'common_communities')
  set commonCommunities(List<String>? value) =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FriendCopyWith<Friend> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FriendCopyWith<$Res> {
  factory $FriendCopyWith(Friend value, $Res Function(Friend) then) =
      _$FriendCopyWithImpl<$Res, Friend>;
  @useResult
  $Res call(
      {String id,
      String displayname,
      String nickname,
      String avatar,
      String? signature,
      FriendMeta? meta,
      bool isGM,
      @JsonKey(name: 'spoken_languages') List<String>? spokenLanguages,
      FriendPresence? presence,
      @JsonKey(name: 'common_communities') List<String>? commonCommunities});

  $FriendMetaCopyWith<$Res>? get meta;
  $FriendPresenceCopyWith<$Res>? get presence;
}

/// @nodoc
class _$FriendCopyWithImpl<$Res, $Val extends Friend>
    implements $FriendCopyWith<$Res> {
  _$FriendCopyWithImpl(this._value, this._then);

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
    Object? avatar = null,
    Object? signature = freezed,
    Object? meta = freezed,
    Object? isGM = null,
    Object? spokenLanguages = freezed,
    Object? presence = freezed,
    Object? commonCommunities = freezed,
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
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      signature: freezed == signature
          ? _value.signature
          : signature // ignore: cast_nullable_to_non_nullable
              as String?,
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as FriendMeta?,
      isGM: null == isGM
          ? _value.isGM
          : isGM // ignore: cast_nullable_to_non_nullable
              as bool,
      spokenLanguages: freezed == spokenLanguages
          ? _value.spokenLanguages
          : spokenLanguages // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      presence: freezed == presence
          ? _value.presence
          : presence // ignore: cast_nullable_to_non_nullable
              as FriendPresence?,
      commonCommunities: freezed == commonCommunities
          ? _value.commonCommunities
          : commonCommunities // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FriendMetaCopyWith<$Res>? get meta {
    if (_value.meta == null) {
      return null;
    }

    return $FriendMetaCopyWith<$Res>(_value.meta!, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $FriendPresenceCopyWith<$Res>? get presence {
    if (_value.presence == null) {
      return null;
    }

    return $FriendPresenceCopyWith<$Res>(_value.presence!, (value) {
      return _then(_value.copyWith(presence: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FriendImplCopyWith<$Res> implements $FriendCopyWith<$Res> {
  factory _$$FriendImplCopyWith(
          _$FriendImpl value, $Res Function(_$FriendImpl) then) =
      __$$FriendImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String displayname,
      String nickname,
      String avatar,
      String? signature,
      FriendMeta? meta,
      bool isGM,
      @JsonKey(name: 'spoken_languages') List<String>? spokenLanguages,
      FriendPresence? presence,
      @JsonKey(name: 'common_communities') List<String>? commonCommunities});

  @override
  $FriendMetaCopyWith<$Res>? get meta;
  @override
  $FriendPresenceCopyWith<$Res>? get presence;
}

/// @nodoc
class __$$FriendImplCopyWithImpl<$Res>
    extends _$FriendCopyWithImpl<$Res, _$FriendImpl>
    implements _$$FriendImplCopyWith<$Res> {
  __$$FriendImplCopyWithImpl(
      _$FriendImpl _value, $Res Function(_$FriendImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? displayname = null,
    Object? nickname = null,
    Object? avatar = null,
    Object? signature = freezed,
    Object? meta = freezed,
    Object? isGM = null,
    Object? spokenLanguages = freezed,
    Object? presence = freezed,
    Object? commonCommunities = freezed,
  }) {
    return _then(_$FriendImpl(
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
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      signature: freezed == signature
          ? _value.signature
          : signature // ignore: cast_nullable_to_non_nullable
              as String?,
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as FriendMeta?,
      isGM: null == isGM
          ? _value.isGM
          : isGM // ignore: cast_nullable_to_non_nullable
              as bool,
      spokenLanguages: freezed == spokenLanguages
          ? _value.spokenLanguages
          : spokenLanguages // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      presence: freezed == presence
          ? _value.presence
          : presence // ignore: cast_nullable_to_non_nullable
              as FriendPresence?,
      commonCommunities: freezed == commonCommunities
          ? _value.commonCommunities
          : commonCommunities // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FriendImpl implements _Friend {
  _$FriendImpl(
      {required this.id,
      required this.displayname,
      required this.nickname,
      required this.avatar,
      this.signature,
      this.meta,
      this.isGM = false,
      @JsonKey(name: 'spoken_languages') this.spokenLanguages,
      this.presence,
      @JsonKey(name: 'common_communities') this.commonCommunities});

  factory _$FriendImpl.fromJson(Map<String, dynamic> json) =>
      _$$FriendImplFromJson(json);

  @override
  String id;
  @override
  String displayname;
  @override
  String nickname;
  @override
  String avatar;
  @override
  String? signature;
  @override
  FriendMeta? meta;
  @override
  @JsonKey()
  bool isGM;
  @override
  @JsonKey(name: 'spoken_languages')
  List<String>? spokenLanguages;
  @override
  FriendPresence? presence;
  @override
  @JsonKey(name: 'common_communities')
  List<String>? commonCommunities;

  @override
  String toString() {
    return 'Friend(id: $id, displayname: $displayname, nickname: $nickname, avatar: $avatar, signature: $signature, meta: $meta, isGM: $isGM, spokenLanguages: $spokenLanguages, presence: $presence, commonCommunities: $commonCommunities)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FriendImplCopyWith<_$FriendImpl> get copyWith =>
      __$$FriendImplCopyWithImpl<_$FriendImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FriendImplToJson(
      this,
    );
  }
}

abstract class _Friend implements Friend {
  factory _Friend(
      {required String id,
      required String displayname,
      required String nickname,
      required String avatar,
      String? signature,
      FriendMeta? meta,
      bool isGM,
      @JsonKey(name: 'spoken_languages') List<String>? spokenLanguages,
      FriendPresence? presence,
      @JsonKey(name: 'common_communities')
      List<String>? commonCommunities}) = _$FriendImpl;

  factory _Friend.fromJson(Map<String, dynamic> json) = _$FriendImpl.fromJson;

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
  String get avatar;
  set avatar(String value);
  @override
  String? get signature;
  set signature(String? value);
  @override
  FriendMeta? get meta;
  set meta(FriendMeta? value);
  @override
  bool get isGM;
  set isGM(bool value);
  @override
  @JsonKey(name: 'spoken_languages')
  List<String>? get spokenLanguages;
  @JsonKey(name: 'spoken_languages')
  set spokenLanguages(List<String>? value);
  @override
  FriendPresence? get presence;
  set presence(FriendPresence? value);
  @override
  @JsonKey(name: 'common_communities')
  List<String>? get commonCommunities;
  @JsonKey(name: 'common_communities')
  set commonCommunities(List<String>? value);
  @override
  @JsonKey(ignore: true)
  _$$FriendImplCopyWith<_$FriendImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FriendMeta _$FriendMetaFromJson(Map<String, dynamic> json) {
  return _FriendMeta.fromJson(json);
}

/// @nodoc
mixin _$FriendMeta {
  List<FriendBadge>? get badges => throw _privateConstructorUsedError;
  set badges(List<FriendBadge>? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FriendMetaCopyWith<FriendMeta> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FriendMetaCopyWith<$Res> {
  factory $FriendMetaCopyWith(
          FriendMeta value, $Res Function(FriendMeta) then) =
      _$FriendMetaCopyWithImpl<$Res, FriendMeta>;
  @useResult
  $Res call({List<FriendBadge>? badges});
}

/// @nodoc
class _$FriendMetaCopyWithImpl<$Res, $Val extends FriendMeta>
    implements $FriendMetaCopyWith<$Res> {
  _$FriendMetaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? badges = freezed,
  }) {
    return _then(_value.copyWith(
      badges: freezed == badges
          ? _value.badges
          : badges // ignore: cast_nullable_to_non_nullable
              as List<FriendBadge>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FriendMetaImplCopyWith<$Res>
    implements $FriendMetaCopyWith<$Res> {
  factory _$$FriendMetaImplCopyWith(
          _$FriendMetaImpl value, $Res Function(_$FriendMetaImpl) then) =
      __$$FriendMetaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<FriendBadge>? badges});
}

/// @nodoc
class __$$FriendMetaImplCopyWithImpl<$Res>
    extends _$FriendMetaCopyWithImpl<$Res, _$FriendMetaImpl>
    implements _$$FriendMetaImplCopyWith<$Res> {
  __$$FriendMetaImplCopyWithImpl(
      _$FriendMetaImpl _value, $Res Function(_$FriendMetaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? badges = freezed,
  }) {
    return _then(_$FriendMetaImpl(
      badges: freezed == badges
          ? _value.badges
          : badges // ignore: cast_nullable_to_non_nullable
              as List<FriendBadge>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FriendMetaImpl implements _FriendMeta {
  _$FriendMetaImpl({this.badges});

  factory _$FriendMetaImpl.fromJson(Map<String, dynamic> json) =>
      _$$FriendMetaImplFromJson(json);

  @override
  List<FriendBadge>? badges;

  @override
  String toString() {
    return 'FriendMeta(badges: $badges)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FriendMetaImplCopyWith<_$FriendMetaImpl> get copyWith =>
      __$$FriendMetaImplCopyWithImpl<_$FriendMetaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FriendMetaImplToJson(
      this,
    );
  }
}

abstract class _FriendMeta implements FriendMeta {
  factory _FriendMeta({List<FriendBadge>? badges}) = _$FriendMetaImpl;

  factory _FriendMeta.fromJson(Map<String, dynamic> json) =
      _$FriendMetaImpl.fromJson;

  @override
  List<FriendBadge>? get badges;
  set badges(List<FriendBadge>? value);
  @override
  @JsonKey(ignore: true)
  _$$FriendMetaImplCopyWith<_$FriendMetaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FriendBadge _$FriendBadgeFromJson(Map<String, dynamic> json) {
  return _FriendBadge.fromJson(json);
}

/// @nodoc
mixin _$FriendBadge {
  String get name => throw _privateConstructorUsedError;
  set name(String value) => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;
  set icon(String value) => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  set url(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FriendBadgeCopyWith<FriendBadge> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FriendBadgeCopyWith<$Res> {
  factory $FriendBadgeCopyWith(
          FriendBadge value, $Res Function(FriendBadge) then) =
      _$FriendBadgeCopyWithImpl<$Res, FriendBadge>;
  @useResult
  $Res call({String name, String icon, String? url});
}

/// @nodoc
class _$FriendBadgeCopyWithImpl<$Res, $Val extends FriendBadge>
    implements $FriendBadgeCopyWith<$Res> {
  _$FriendBadgeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? icon = null,
    Object? url = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FriendBadgeImplCopyWith<$Res>
    implements $FriendBadgeCopyWith<$Res> {
  factory _$$FriendBadgeImplCopyWith(
          _$FriendBadgeImpl value, $Res Function(_$FriendBadgeImpl) then) =
      __$$FriendBadgeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String icon, String? url});
}

/// @nodoc
class __$$FriendBadgeImplCopyWithImpl<$Res>
    extends _$FriendBadgeCopyWithImpl<$Res, _$FriendBadgeImpl>
    implements _$$FriendBadgeImplCopyWith<$Res> {
  __$$FriendBadgeImplCopyWithImpl(
      _$FriendBadgeImpl _value, $Res Function(_$FriendBadgeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? icon = null,
    Object? url = freezed,
  }) {
    return _then(_$FriendBadgeImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FriendBadgeImpl implements _FriendBadge {
  _$FriendBadgeImpl({required this.name, required this.icon, this.url});

  factory _$FriendBadgeImpl.fromJson(Map<String, dynamic> json) =>
      _$$FriendBadgeImplFromJson(json);

  @override
  String name;
  @override
  String icon;
  @override
  String? url;

  @override
  String toString() {
    return 'FriendBadge(name: $name, icon: $icon, url: $url)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FriendBadgeImplCopyWith<_$FriendBadgeImpl> get copyWith =>
      __$$FriendBadgeImplCopyWithImpl<_$FriendBadgeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FriendBadgeImplToJson(
      this,
    );
  }
}

abstract class _FriendBadge implements FriendBadge {
  factory _FriendBadge(
      {required String name,
      required String icon,
      String? url}) = _$FriendBadgeImpl;

  factory _FriendBadge.fromJson(Map<String, dynamic> json) =
      _$FriendBadgeImpl.fromJson;

  @override
  String get name;
  set name(String value);
  @override
  String get icon;
  set icon(String value);
  @override
  String? get url;
  set url(String? value);
  @override
  @JsonKey(ignore: true)
  _$$FriendBadgeImplCopyWith<_$FriendBadgeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FriendPresence _$FriendPresenceFromJson(Map<String, dynamic> json) {
  return _FriendPresence.fromJson(json);
}

/// @nodoc
mixin _$FriendPresence {
  String? get info => throw _privateConstructorUsedError;
  set info(String? value) => throw _privateConstructorUsedError;
  int? get since => throw _privateConstructorUsedError;
  set since(int? value) => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  set status(String value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FriendPresenceCopyWith<FriendPresence> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FriendPresenceCopyWith<$Res> {
  factory $FriendPresenceCopyWith(
          FriendPresence value, $Res Function(FriendPresence) then) =
      _$FriendPresenceCopyWithImpl<$Res, FriendPresence>;
  @useResult
  $Res call({String? info, int? since, String status});
}

/// @nodoc
class _$FriendPresenceCopyWithImpl<$Res, $Val extends FriendPresence>
    implements $FriendPresenceCopyWith<$Res> {
  _$FriendPresenceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? info = freezed,
    Object? since = freezed,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      info: freezed == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as String?,
      since: freezed == since
          ? _value.since
          : since // ignore: cast_nullable_to_non_nullable
              as int?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FriendPresenceImplCopyWith<$Res>
    implements $FriendPresenceCopyWith<$Res> {
  factory _$$FriendPresenceImplCopyWith(_$FriendPresenceImpl value,
          $Res Function(_$FriendPresenceImpl) then) =
      __$$FriendPresenceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? info, int? since, String status});
}

/// @nodoc
class __$$FriendPresenceImplCopyWithImpl<$Res>
    extends _$FriendPresenceCopyWithImpl<$Res, _$FriendPresenceImpl>
    implements _$$FriendPresenceImplCopyWith<$Res> {
  __$$FriendPresenceImplCopyWithImpl(
      _$FriendPresenceImpl _value, $Res Function(_$FriendPresenceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? info = freezed,
    Object? since = freezed,
    Object? status = null,
  }) {
    return _then(_$FriendPresenceImpl(
      info: freezed == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as String?,
      since: freezed == since
          ? _value.since
          : since // ignore: cast_nullable_to_non_nullable
              as int?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FriendPresenceImpl implements _FriendPresence {
  _$FriendPresenceImpl({this.info, this.since, required this.status});

  factory _$FriendPresenceImpl.fromJson(Map<String, dynamic> json) =>
      _$$FriendPresenceImplFromJson(json);

  @override
  String? info;
  @override
  int? since;
  @override
  String status;

  @override
  String toString() {
    return 'FriendPresence(info: $info, since: $since, status: $status)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FriendPresenceImplCopyWith<_$FriendPresenceImpl> get copyWith =>
      __$$FriendPresenceImplCopyWithImpl<_$FriendPresenceImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FriendPresenceImplToJson(
      this,
    );
  }
}

abstract class _FriendPresence implements FriendPresence {
  factory _FriendPresence({String? info, int? since, required String status}) =
      _$FriendPresenceImpl;

  factory _FriendPresence.fromJson(Map<String, dynamic> json) =
      _$FriendPresenceImpl.fromJson;

  @override
  String? get info;
  set info(String? value);
  @override
  int? get since;
  set since(int? value);
  @override
  String get status;
  set status(String value);
  @override
  @JsonKey(ignore: true)
  _$$FriendPresenceImplCopyWith<_$FriendPresenceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
