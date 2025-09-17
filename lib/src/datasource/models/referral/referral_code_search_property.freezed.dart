// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'referral_code_search_property.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReferralCodeSearchResponse _$ReferralCodeSearchResponseFromJson(
    Map<String, dynamic> json) {
  return _ReferralCodeSearchResponse.fromJson(json);
}

/// @nodoc
mixin _$ReferralCodeSearchResponse {
  ReferralCode get referralCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReferralCodeSearchResponseCopyWith<ReferralCodeSearchResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReferralCodeSearchResponseCopyWith<$Res> {
  factory $ReferralCodeSearchResponseCopyWith(ReferralCodeSearchResponse value,
          $Res Function(ReferralCodeSearchResponse) then) =
      _$ReferralCodeSearchResponseCopyWithImpl<$Res,
          ReferralCodeSearchResponse>;
  @useResult
  $Res call({ReferralCode referralCode});

  $ReferralCodeCopyWith<$Res> get referralCode;
}

/// @nodoc
class _$ReferralCodeSearchResponseCopyWithImpl<$Res,
        $Val extends ReferralCodeSearchResponse>
    implements $ReferralCodeSearchResponseCopyWith<$Res> {
  _$ReferralCodeSearchResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? referralCode = null,
  }) {
    return _then(_value.copyWith(
      referralCode: null == referralCode
          ? _value.referralCode
          : referralCode // ignore: cast_nullable_to_non_nullable
              as ReferralCode,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ReferralCodeCopyWith<$Res> get referralCode {
    return $ReferralCodeCopyWith<$Res>(_value.referralCode, (value) {
      return _then(_value.copyWith(referralCode: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ReferralCodeSearchResponseImplCopyWith<$Res>
    implements $ReferralCodeSearchResponseCopyWith<$Res> {
  factory _$$ReferralCodeSearchResponseImplCopyWith(
          _$ReferralCodeSearchResponseImpl value,
          $Res Function(_$ReferralCodeSearchResponseImpl) then) =
      __$$ReferralCodeSearchResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ReferralCode referralCode});

  @override
  $ReferralCodeCopyWith<$Res> get referralCode;
}

/// @nodoc
class __$$ReferralCodeSearchResponseImplCopyWithImpl<$Res>
    extends _$ReferralCodeSearchResponseCopyWithImpl<$Res,
        _$ReferralCodeSearchResponseImpl>
    implements _$$ReferralCodeSearchResponseImplCopyWith<$Res> {
  __$$ReferralCodeSearchResponseImplCopyWithImpl(
      _$ReferralCodeSearchResponseImpl _value,
      $Res Function(_$ReferralCodeSearchResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? referralCode = null,
  }) {
    return _then(_$ReferralCodeSearchResponseImpl(
      referralCode: null == referralCode
          ? _value.referralCode
          : referralCode // ignore: cast_nullable_to_non_nullable
              as ReferralCode,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReferralCodeSearchResponseImpl implements _ReferralCodeSearchResponse {
  const _$ReferralCodeSearchResponseImpl({required this.referralCode});

  factory _$ReferralCodeSearchResponseImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ReferralCodeSearchResponseImplFromJson(json);

  @override
  final ReferralCode referralCode;

  @override
  String toString() {
    return 'ReferralCodeSearchResponse(referralCode: $referralCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReferralCodeSearchResponseImpl &&
            (identical(other.referralCode, referralCode) ||
                other.referralCode == referralCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, referralCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReferralCodeSearchResponseImplCopyWith<_$ReferralCodeSearchResponseImpl>
      get copyWith => __$$ReferralCodeSearchResponseImplCopyWithImpl<
          _$ReferralCodeSearchResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReferralCodeSearchResponseImplToJson(
      this,
    );
  }
}

abstract class _ReferralCodeSearchResponse
    implements ReferralCodeSearchResponse {
  const factory _ReferralCodeSearchResponse(
          {required final ReferralCode referralCode}) =
      _$ReferralCodeSearchResponseImpl;

  factory _ReferralCodeSearchResponse.fromJson(Map<String, dynamic> json) =
      _$ReferralCodeSearchResponseImpl.fromJson;

  @override
  ReferralCode get referralCode;
  @override
  @JsonKey(ignore: true)
  _$$ReferralCodeSearchResponseImplCopyWith<_$ReferralCodeSearchResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ReferralCode _$ReferralCodeFromJson(Map<String, dynamic> json) {
  return _ReferralCode.fromJson(json);
}

/// @nodoc
mixin _$ReferralCode {
  ReferralCodeValidationPayload get validate =>
      throw _privateConstructorUsedError;
  @JsonKey(name: '__typename')
  String? get typename => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReferralCodeCopyWith<ReferralCode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReferralCodeCopyWith<$Res> {
  factory $ReferralCodeCopyWith(
          ReferralCode value, $Res Function(ReferralCode) then) =
      _$ReferralCodeCopyWithImpl<$Res, ReferralCode>;
  @useResult
  $Res call(
      {ReferralCodeValidationPayload validate,
      @JsonKey(name: '__typename') String? typename});

  $ReferralCodeValidationPayloadCopyWith<$Res> get validate;
}

/// @nodoc
class _$ReferralCodeCopyWithImpl<$Res, $Val extends ReferralCode>
    implements $ReferralCodeCopyWith<$Res> {
  _$ReferralCodeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? validate = null,
    Object? typename = freezed,
  }) {
    return _then(_value.copyWith(
      validate: null == validate
          ? _value.validate
          : validate // ignore: cast_nullable_to_non_nullable
              as ReferralCodeValidationPayload,
      typename: freezed == typename
          ? _value.typename
          : typename // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ReferralCodeValidationPayloadCopyWith<$Res> get validate {
    return $ReferralCodeValidationPayloadCopyWith<$Res>(_value.validate,
        (value) {
      return _then(_value.copyWith(validate: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ReferralCodeImplCopyWith<$Res>
    implements $ReferralCodeCopyWith<$Res> {
  factory _$$ReferralCodeImplCopyWith(
          _$ReferralCodeImpl value, $Res Function(_$ReferralCodeImpl) then) =
      __$$ReferralCodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ReferralCodeValidationPayload validate,
      @JsonKey(name: '__typename') String? typename});

  @override
  $ReferralCodeValidationPayloadCopyWith<$Res> get validate;
}

/// @nodoc
class __$$ReferralCodeImplCopyWithImpl<$Res>
    extends _$ReferralCodeCopyWithImpl<$Res, _$ReferralCodeImpl>
    implements _$$ReferralCodeImplCopyWith<$Res> {
  __$$ReferralCodeImplCopyWithImpl(
      _$ReferralCodeImpl _value, $Res Function(_$ReferralCodeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? validate = null,
    Object? typename = freezed,
  }) {
    return _then(_$ReferralCodeImpl(
      validate: null == validate
          ? _value.validate
          : validate // ignore: cast_nullable_to_non_nullable
              as ReferralCodeValidationPayload,
      typename: freezed == typename
          ? _value.typename
          : typename // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReferralCodeImpl implements _ReferralCode {
  const _$ReferralCodeImpl(
      {required this.validate, @JsonKey(name: '__typename') this.typename});

  factory _$ReferralCodeImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReferralCodeImplFromJson(json);

  @override
  final ReferralCodeValidationPayload validate;
  @override
  @JsonKey(name: '__typename')
  final String? typename;

  @override
  String toString() {
    return 'ReferralCode(validate: $validate, typename: $typename)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReferralCodeImpl &&
            (identical(other.validate, validate) ||
                other.validate == validate) &&
            (identical(other.typename, typename) ||
                other.typename == typename));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, validate, typename);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReferralCodeImplCopyWith<_$ReferralCodeImpl> get copyWith =>
      __$$ReferralCodeImplCopyWithImpl<_$ReferralCodeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReferralCodeImplToJson(
      this,
    );
  }
}

abstract class _ReferralCode implements ReferralCode {
  const factory _ReferralCode(
          {required final ReferralCodeValidationPayload validate,
          @JsonKey(name: '__typename') final String? typename}) =
      _$ReferralCodeImpl;

  factory _ReferralCode.fromJson(Map<String, dynamic> json) =
      _$ReferralCodeImpl.fromJson;

  @override
  ReferralCodeValidationPayload get validate;
  @override
  @JsonKey(name: '__typename')
  String? get typename;
  @override
  @JsonKey(ignore: true)
  _$$ReferralCodeImplCopyWith<_$ReferralCodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReferralCodeValidationPayload _$ReferralCodeValidationPayloadFromJson(
    Map<String, dynamic> json) {
  return _ReferralCodeValidationPayload.fromJson(json);
}

/// @nodoc
mixin _$ReferralCodeValidationPayload {
  bool get isValid => throw _privateConstructorUsedError;
  String get displayname => throw _privateConstructorUsedError;
  String get handle => throw _privateConstructorUsedError;
  String get avatar => throw _privateConstructorUsedError;
  ReferralCodeValidationNextReward get nextReward =>
      throw _privateConstructorUsedError;
  bool get cantValidateCaptcha => throw _privateConstructorUsedError;
  @JsonKey(name: '__typename')
  String? get typename => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReferralCodeValidationPayloadCopyWith<ReferralCodeValidationPayload>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReferralCodeValidationPayloadCopyWith<$Res> {
  factory $ReferralCodeValidationPayloadCopyWith(
          ReferralCodeValidationPayload value,
          $Res Function(ReferralCodeValidationPayload) then) =
      _$ReferralCodeValidationPayloadCopyWithImpl<$Res,
          ReferralCodeValidationPayload>;
  @useResult
  $Res call(
      {bool isValid,
      String displayname,
      String handle,
      String avatar,
      ReferralCodeValidationNextReward nextReward,
      bool cantValidateCaptcha,
      @JsonKey(name: '__typename') String? typename});

  $ReferralCodeValidationNextRewardCopyWith<$Res> get nextReward;
}

/// @nodoc
class _$ReferralCodeValidationPayloadCopyWithImpl<$Res,
        $Val extends ReferralCodeValidationPayload>
    implements $ReferralCodeValidationPayloadCopyWith<$Res> {
  _$ReferralCodeValidationPayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isValid = null,
    Object? displayname = null,
    Object? handle = null,
    Object? avatar = null,
    Object? nextReward = null,
    Object? cantValidateCaptcha = null,
    Object? typename = freezed,
  }) {
    return _then(_value.copyWith(
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
      displayname: null == displayname
          ? _value.displayname
          : displayname // ignore: cast_nullable_to_non_nullable
              as String,
      handle: null == handle
          ? _value.handle
          : handle // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      nextReward: null == nextReward
          ? _value.nextReward
          : nextReward // ignore: cast_nullable_to_non_nullable
              as ReferralCodeValidationNextReward,
      cantValidateCaptcha: null == cantValidateCaptcha
          ? _value.cantValidateCaptcha
          : cantValidateCaptcha // ignore: cast_nullable_to_non_nullable
              as bool,
      typename: freezed == typename
          ? _value.typename
          : typename // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ReferralCodeValidationNextRewardCopyWith<$Res> get nextReward {
    return $ReferralCodeValidationNextRewardCopyWith<$Res>(_value.nextReward,
        (value) {
      return _then(_value.copyWith(nextReward: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ReferralCodeValidationPayloadImplCopyWith<$Res>
    implements $ReferralCodeValidationPayloadCopyWith<$Res> {
  factory _$$ReferralCodeValidationPayloadImplCopyWith(
          _$ReferralCodeValidationPayloadImpl value,
          $Res Function(_$ReferralCodeValidationPayloadImpl) then) =
      __$$ReferralCodeValidationPayloadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isValid,
      String displayname,
      String handle,
      String avatar,
      ReferralCodeValidationNextReward nextReward,
      bool cantValidateCaptcha,
      @JsonKey(name: '__typename') String? typename});

  @override
  $ReferralCodeValidationNextRewardCopyWith<$Res> get nextReward;
}

/// @nodoc
class __$$ReferralCodeValidationPayloadImplCopyWithImpl<$Res>
    extends _$ReferralCodeValidationPayloadCopyWithImpl<$Res,
        _$ReferralCodeValidationPayloadImpl>
    implements _$$ReferralCodeValidationPayloadImplCopyWith<$Res> {
  __$$ReferralCodeValidationPayloadImplCopyWithImpl(
      _$ReferralCodeValidationPayloadImpl _value,
      $Res Function(_$ReferralCodeValidationPayloadImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isValid = null,
    Object? displayname = null,
    Object? handle = null,
    Object? avatar = null,
    Object? nextReward = null,
    Object? cantValidateCaptcha = null,
    Object? typename = freezed,
  }) {
    return _then(_$ReferralCodeValidationPayloadImpl(
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
      displayname: null == displayname
          ? _value.displayname
          : displayname // ignore: cast_nullable_to_non_nullable
              as String,
      handle: null == handle
          ? _value.handle
          : handle // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      nextReward: null == nextReward
          ? _value.nextReward
          : nextReward // ignore: cast_nullable_to_non_nullable
              as ReferralCodeValidationNextReward,
      cantValidateCaptcha: null == cantValidateCaptcha
          ? _value.cantValidateCaptcha
          : cantValidateCaptcha // ignore: cast_nullable_to_non_nullable
              as bool,
      typename: freezed == typename
          ? _value.typename
          : typename // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReferralCodeValidationPayloadImpl
    implements _ReferralCodeValidationPayload {
  const _$ReferralCodeValidationPayloadImpl(
      {required this.isValid,
      required this.displayname,
      required this.handle,
      required this.avatar,
      required this.nextReward,
      required this.cantValidateCaptcha,
      @JsonKey(name: '__typename') this.typename});

  factory _$ReferralCodeValidationPayloadImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ReferralCodeValidationPayloadImplFromJson(json);

  @override
  final bool isValid;
  @override
  final String displayname;
  @override
  final String handle;
  @override
  final String avatar;
  @override
  final ReferralCodeValidationNextReward nextReward;
  @override
  final bool cantValidateCaptcha;
  @override
  @JsonKey(name: '__typename')
  final String? typename;

  @override
  String toString() {
    return 'ReferralCodeValidationPayload(isValid: $isValid, displayname: $displayname, handle: $handle, avatar: $avatar, nextReward: $nextReward, cantValidateCaptcha: $cantValidateCaptcha, typename: $typename)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReferralCodeValidationPayloadImpl &&
            (identical(other.isValid, isValid) || other.isValid == isValid) &&
            (identical(other.displayname, displayname) ||
                other.displayname == displayname) &&
            (identical(other.handle, handle) || other.handle == handle) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.nextReward, nextReward) ||
                other.nextReward == nextReward) &&
            (identical(other.cantValidateCaptcha, cantValidateCaptcha) ||
                other.cantValidateCaptcha == cantValidateCaptcha) &&
            (identical(other.typename, typename) ||
                other.typename == typename));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isValid, displayname, handle,
      avatar, nextReward, cantValidateCaptcha, typename);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReferralCodeValidationPayloadImplCopyWith<
          _$ReferralCodeValidationPayloadImpl>
      get copyWith => __$$ReferralCodeValidationPayloadImplCopyWithImpl<
          _$ReferralCodeValidationPayloadImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReferralCodeValidationPayloadImplToJson(
      this,
    );
  }
}

abstract class _ReferralCodeValidationPayload
    implements ReferralCodeValidationPayload {
  const factory _ReferralCodeValidationPayload(
          {required final bool isValid,
          required final String displayname,
          required final String handle,
          required final String avatar,
          required final ReferralCodeValidationNextReward nextReward,
          required final bool cantValidateCaptcha,
          @JsonKey(name: '__typename') final String? typename}) =
      _$ReferralCodeValidationPayloadImpl;

  factory _ReferralCodeValidationPayload.fromJson(Map<String, dynamic> json) =
      _$ReferralCodeValidationPayloadImpl.fromJson;

  @override
  bool get isValid;
  @override
  String get displayname;
  @override
  String get handle;
  @override
  String get avatar;
  @override
  ReferralCodeValidationNextReward get nextReward;
  @override
  bool get cantValidateCaptcha;
  @override
  @JsonKey(name: '__typename')
  String? get typename;
  @override
  @JsonKey(ignore: true)
  _$$ReferralCodeValidationPayloadImplCopyWith<
          _$ReferralCodeValidationPayloadImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ReferralCodeValidationNextReward _$ReferralCodeValidationNextRewardFromJson(
    Map<String, dynamic> json) {
  return _ReferralCodeValidationNextReward.fromJson(json);
}

/// @nodoc
mixin _$ReferralCodeValidationNextReward {
  String get title => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  @JsonKey(name: '__typename')
  String? get typename => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReferralCodeValidationNextRewardCopyWith<ReferralCodeValidationNextReward>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReferralCodeValidationNextRewardCopyWith<$Res> {
  factory $ReferralCodeValidationNextRewardCopyWith(
          ReferralCodeValidationNextReward value,
          $Res Function(ReferralCodeValidationNextReward) then) =
      _$ReferralCodeValidationNextRewardCopyWithImpl<$Res,
          ReferralCodeValidationNextReward>;
  @useResult
  $Res call(
      {String title,
      String image,
      @JsonKey(name: '__typename') String? typename});
}

/// @nodoc
class _$ReferralCodeValidationNextRewardCopyWithImpl<$Res,
        $Val extends ReferralCodeValidationNextReward>
    implements $ReferralCodeValidationNextRewardCopyWith<$Res> {
  _$ReferralCodeValidationNextRewardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? image = null,
    Object? typename = freezed,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      typename: freezed == typename
          ? _value.typename
          : typename // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReferralCodeValidationNextRewardImplCopyWith<$Res>
    implements $ReferralCodeValidationNextRewardCopyWith<$Res> {
  factory _$$ReferralCodeValidationNextRewardImplCopyWith(
          _$ReferralCodeValidationNextRewardImpl value,
          $Res Function(_$ReferralCodeValidationNextRewardImpl) then) =
      __$$ReferralCodeValidationNextRewardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String image,
      @JsonKey(name: '__typename') String? typename});
}

/// @nodoc
class __$$ReferralCodeValidationNextRewardImplCopyWithImpl<$Res>
    extends _$ReferralCodeValidationNextRewardCopyWithImpl<$Res,
        _$ReferralCodeValidationNextRewardImpl>
    implements _$$ReferralCodeValidationNextRewardImplCopyWith<$Res> {
  __$$ReferralCodeValidationNextRewardImplCopyWithImpl(
      _$ReferralCodeValidationNextRewardImpl _value,
      $Res Function(_$ReferralCodeValidationNextRewardImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? image = null,
    Object? typename = freezed,
  }) {
    return _then(_$ReferralCodeValidationNextRewardImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      typename: freezed == typename
          ? _value.typename
          : typename // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReferralCodeValidationNextRewardImpl
    implements _ReferralCodeValidationNextReward {
  const _$ReferralCodeValidationNextRewardImpl(
      {required this.title,
      required this.image,
      @JsonKey(name: '__typename') this.typename});

  factory _$ReferralCodeValidationNextRewardImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ReferralCodeValidationNextRewardImplFromJson(json);

  @override
  final String title;
  @override
  final String image;
  @override
  @JsonKey(name: '__typename')
  final String? typename;

  @override
  String toString() {
    return 'ReferralCodeValidationNextReward(title: $title, image: $image, typename: $typename)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReferralCodeValidationNextRewardImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.typename, typename) ||
                other.typename == typename));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, image, typename);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReferralCodeValidationNextRewardImplCopyWith<
          _$ReferralCodeValidationNextRewardImpl>
      get copyWith => __$$ReferralCodeValidationNextRewardImplCopyWithImpl<
          _$ReferralCodeValidationNextRewardImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReferralCodeValidationNextRewardImplToJson(
      this,
    );
  }
}

abstract class _ReferralCodeValidationNextReward
    implements ReferralCodeValidationNextReward {
  const factory _ReferralCodeValidationNextReward(
          {required final String title,
          required final String image,
          @JsonKey(name: '__typename') final String? typename}) =
      _$ReferralCodeValidationNextRewardImpl;

  factory _ReferralCodeValidationNextReward.fromJson(
          Map<String, dynamic> json) =
      _$ReferralCodeValidationNextRewardImpl.fromJson;

  @override
  String get title;
  @override
  String get image;
  @override
  @JsonKey(name: '__typename')
  String? get typename;
  @override
  @JsonKey(ignore: true)
  _$$ReferralCodeValidationNextRewardImplCopyWith<
          _$ReferralCodeValidationNextRewardImpl>
      get copyWith => throw _privateConstructorUsedError;
}
