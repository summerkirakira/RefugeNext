// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'spectrum_auth_property.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SpectrumAuthProperty _$SpectrumAuthPropertyFromJson(Map<String, dynamic> json) {
  return _SpectrumAuthProperty.fromJson(json);
}

/// @nodoc
mixin _$SpectrumAuthProperty {
  int get success => throw _privateConstructorUsedError;
  set success(int value) => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  set code(String? value) => throw _privateConstructorUsedError;
  String? get msg => throw _privateConstructorUsedError;
  set msg(String? value) => throw _privateConstructorUsedError;
  SpectrumAuthData? get data => throw _privateConstructorUsedError;
  set data(SpectrumAuthData? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SpectrumAuthPropertyCopyWith<SpectrumAuthProperty> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpectrumAuthPropertyCopyWith<$Res> {
  factory $SpectrumAuthPropertyCopyWith(SpectrumAuthProperty value,
          $Res Function(SpectrumAuthProperty) then) =
      _$SpectrumAuthPropertyCopyWithImpl<$Res, SpectrumAuthProperty>;
  @useResult
  $Res call({int success, String? code, String? msg, SpectrumAuthData? data});

  $SpectrumAuthDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$SpectrumAuthPropertyCopyWithImpl<$Res,
        $Val extends SpectrumAuthProperty>
    implements $SpectrumAuthPropertyCopyWith<$Res> {
  _$SpectrumAuthPropertyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? code = freezed,
    Object? msg = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as int,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      msg: freezed == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as SpectrumAuthData?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SpectrumAuthDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $SpectrumAuthDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SpectrumAuthPropertyImplCopyWith<$Res>
    implements $SpectrumAuthPropertyCopyWith<$Res> {
  factory _$$SpectrumAuthPropertyImplCopyWith(_$SpectrumAuthPropertyImpl value,
          $Res Function(_$SpectrumAuthPropertyImpl) then) =
      __$$SpectrumAuthPropertyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int success, String? code, String? msg, SpectrumAuthData? data});

  @override
  $SpectrumAuthDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$SpectrumAuthPropertyImplCopyWithImpl<$Res>
    extends _$SpectrumAuthPropertyCopyWithImpl<$Res, _$SpectrumAuthPropertyImpl>
    implements _$$SpectrumAuthPropertyImplCopyWith<$Res> {
  __$$SpectrumAuthPropertyImplCopyWithImpl(_$SpectrumAuthPropertyImpl _value,
      $Res Function(_$SpectrumAuthPropertyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? code = freezed,
    Object? msg = freezed,
    Object? data = freezed,
  }) {
    return _then(_$SpectrumAuthPropertyImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as int,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      msg: freezed == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as SpectrumAuthData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SpectrumAuthPropertyImpl implements _SpectrumAuthProperty {
  _$SpectrumAuthPropertyImpl(
      {required this.success, this.code, this.msg, this.data});

  factory _$SpectrumAuthPropertyImpl.fromJson(Map<String, dynamic> json) =>
      _$$SpectrumAuthPropertyImplFromJson(json);

  @override
  int success;
  @override
  String? code;
  @override
  String? msg;
  @override
  SpectrumAuthData? data;

  @override
  String toString() {
    return 'SpectrumAuthProperty(success: $success, code: $code, msg: $msg, data: $data)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SpectrumAuthPropertyImplCopyWith<_$SpectrumAuthPropertyImpl>
      get copyWith =>
          __$$SpectrumAuthPropertyImplCopyWithImpl<_$SpectrumAuthPropertyImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SpectrumAuthPropertyImplToJson(
      this,
    );
  }
}

abstract class _SpectrumAuthProperty implements SpectrumAuthProperty {
  factory _SpectrumAuthProperty(
      {required int success,
      String? code,
      String? msg,
      SpectrumAuthData? data}) = _$SpectrumAuthPropertyImpl;

  factory _SpectrumAuthProperty.fromJson(Map<String, dynamic> json) =
      _$SpectrumAuthPropertyImpl.fromJson;

  @override
  int get success;
  set success(int value);
  @override
  String? get code;
  set code(String? value);
  @override
  String? get msg;
  set msg(String? value);
  @override
  SpectrumAuthData? get data;
  set data(SpectrumAuthData? value);
  @override
  @JsonKey(ignore: true)
  _$$SpectrumAuthPropertyImplCopyWith<_$SpectrumAuthPropertyImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SpectrumAuthData _$SpectrumAuthDataFromJson(Map<String, dynamic> json) {
  return _SpectrumAuthData.fromJson(json);
}

/// @nodoc
mixin _$SpectrumAuthData {
  String? get spectrumToken => throw _privateConstructorUsedError;
  set spectrumToken(String? value) => throw _privateConstructorUsedError;
  String? get gameToken => throw _privateConstructorUsedError;
  set gameToken(String? value) => throw _privateConstructorUsedError;
  SpectrumFeatureFlags? get featureFlags => throw _privateConstructorUsedError;
  set featureFlags(SpectrumFeatureFlags? value) =>
      throw _privateConstructorUsedError;
  SpectrumSubscriptionsKeys? get subscriptionsKeys =>
      throw _privateConstructorUsedError;
  set subscriptionsKeys(SpectrumSubscriptionsKeys? value) =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SpectrumAuthDataCopyWith<SpectrumAuthData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpectrumAuthDataCopyWith<$Res> {
  factory $SpectrumAuthDataCopyWith(
          SpectrumAuthData value, $Res Function(SpectrumAuthData) then) =
      _$SpectrumAuthDataCopyWithImpl<$Res, SpectrumAuthData>;
  @useResult
  $Res call(
      {String? spectrumToken,
      String? gameToken,
      SpectrumFeatureFlags? featureFlags,
      SpectrumSubscriptionsKeys? subscriptionsKeys});

  $SpectrumFeatureFlagsCopyWith<$Res>? get featureFlags;
  $SpectrumSubscriptionsKeysCopyWith<$Res>? get subscriptionsKeys;
}

/// @nodoc
class _$SpectrumAuthDataCopyWithImpl<$Res, $Val extends SpectrumAuthData>
    implements $SpectrumAuthDataCopyWith<$Res> {
  _$SpectrumAuthDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? spectrumToken = freezed,
    Object? gameToken = freezed,
    Object? featureFlags = freezed,
    Object? subscriptionsKeys = freezed,
  }) {
    return _then(_value.copyWith(
      spectrumToken: freezed == spectrumToken
          ? _value.spectrumToken
          : spectrumToken // ignore: cast_nullable_to_non_nullable
              as String?,
      gameToken: freezed == gameToken
          ? _value.gameToken
          : gameToken // ignore: cast_nullable_to_non_nullable
              as String?,
      featureFlags: freezed == featureFlags
          ? _value.featureFlags
          : featureFlags // ignore: cast_nullable_to_non_nullable
              as SpectrumFeatureFlags?,
      subscriptionsKeys: freezed == subscriptionsKeys
          ? _value.subscriptionsKeys
          : subscriptionsKeys // ignore: cast_nullable_to_non_nullable
              as SpectrumSubscriptionsKeys?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SpectrumFeatureFlagsCopyWith<$Res>? get featureFlags {
    if (_value.featureFlags == null) {
      return null;
    }

    return $SpectrumFeatureFlagsCopyWith<$Res>(_value.featureFlags!, (value) {
      return _then(_value.copyWith(featureFlags: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SpectrumSubscriptionsKeysCopyWith<$Res>? get subscriptionsKeys {
    if (_value.subscriptionsKeys == null) {
      return null;
    }

    return $SpectrumSubscriptionsKeysCopyWith<$Res>(_value.subscriptionsKeys!,
        (value) {
      return _then(_value.copyWith(subscriptionsKeys: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SpectrumAuthDataImplCopyWith<$Res>
    implements $SpectrumAuthDataCopyWith<$Res> {
  factory _$$SpectrumAuthDataImplCopyWith(_$SpectrumAuthDataImpl value,
          $Res Function(_$SpectrumAuthDataImpl) then) =
      __$$SpectrumAuthDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? spectrumToken,
      String? gameToken,
      SpectrumFeatureFlags? featureFlags,
      SpectrumSubscriptionsKeys? subscriptionsKeys});

  @override
  $SpectrumFeatureFlagsCopyWith<$Res>? get featureFlags;
  @override
  $SpectrumSubscriptionsKeysCopyWith<$Res>? get subscriptionsKeys;
}

/// @nodoc
class __$$SpectrumAuthDataImplCopyWithImpl<$Res>
    extends _$SpectrumAuthDataCopyWithImpl<$Res, _$SpectrumAuthDataImpl>
    implements _$$SpectrumAuthDataImplCopyWith<$Res> {
  __$$SpectrumAuthDataImplCopyWithImpl(_$SpectrumAuthDataImpl _value,
      $Res Function(_$SpectrumAuthDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? spectrumToken = freezed,
    Object? gameToken = freezed,
    Object? featureFlags = freezed,
    Object? subscriptionsKeys = freezed,
  }) {
    return _then(_$SpectrumAuthDataImpl(
      spectrumToken: freezed == spectrumToken
          ? _value.spectrumToken
          : spectrumToken // ignore: cast_nullable_to_non_nullable
              as String?,
      gameToken: freezed == gameToken
          ? _value.gameToken
          : gameToken // ignore: cast_nullable_to_non_nullable
              as String?,
      featureFlags: freezed == featureFlags
          ? _value.featureFlags
          : featureFlags // ignore: cast_nullable_to_non_nullable
              as SpectrumFeatureFlags?,
      subscriptionsKeys: freezed == subscriptionsKeys
          ? _value.subscriptionsKeys
          : subscriptionsKeys // ignore: cast_nullable_to_non_nullable
              as SpectrumSubscriptionsKeys?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SpectrumAuthDataImpl implements _SpectrumAuthData {
  _$SpectrumAuthDataImpl(
      {this.spectrumToken,
      this.gameToken,
      this.featureFlags,
      this.subscriptionsKeys});

  factory _$SpectrumAuthDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$SpectrumAuthDataImplFromJson(json);

  @override
  String? spectrumToken;
  @override
  String? gameToken;
  @override
  SpectrumFeatureFlags? featureFlags;
  @override
  SpectrumSubscriptionsKeys? subscriptionsKeys;

  @override
  String toString() {
    return 'SpectrumAuthData(spectrumToken: $spectrumToken, gameToken: $gameToken, featureFlags: $featureFlags, subscriptionsKeys: $subscriptionsKeys)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SpectrumAuthDataImplCopyWith<_$SpectrumAuthDataImpl> get copyWith =>
      __$$SpectrumAuthDataImplCopyWithImpl<_$SpectrumAuthDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SpectrumAuthDataImplToJson(
      this,
    );
  }
}

abstract class _SpectrumAuthData implements SpectrumAuthData {
  factory _SpectrumAuthData(
      {String? spectrumToken,
      String? gameToken,
      SpectrumFeatureFlags? featureFlags,
      SpectrumSubscriptionsKeys? subscriptionsKeys}) = _$SpectrumAuthDataImpl;

  factory _SpectrumAuthData.fromJson(Map<String, dynamic> json) =
      _$SpectrumAuthDataImpl.fromJson;

  @override
  String? get spectrumToken;
  set spectrumToken(String? value);
  @override
  String? get gameToken;
  set gameToken(String? value);
  @override
  SpectrumFeatureFlags? get featureFlags;
  set featureFlags(SpectrumFeatureFlags? value);
  @override
  SpectrumSubscriptionsKeys? get subscriptionsKeys;
  set subscriptionsKeys(SpectrumSubscriptionsKeys? value);
  @override
  @JsonKey(ignore: true)
  _$$SpectrumAuthDataImplCopyWith<_$SpectrumAuthDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SpectrumFeatureFlags _$SpectrumFeatureFlagsFromJson(Map<String, dynamic> json) {
  return _SpectrumFeatureFlags.fromJson(json);
}

/// @nodoc
mixin _$SpectrumFeatureFlags {
  bool? get gs => throw _privateConstructorUsedError;
  set gs(bool? value) => throw _privateConstructorUsedError;
  bool? get pf => throw _privateConstructorUsedError;
  set pf(bool? value) => throw _privateConstructorUsedError;
  bool? get nn => throw _privateConstructorUsedError;
  set nn(bool? value) => throw _privateConstructorUsedError;
  bool? get nh => throw _privateConstructorUsedError;
  set nh(bool? value) => throw _privateConstructorUsedError;
  bool? get nf => throw _privateConstructorUsedError;
  set nf(bool? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SpectrumFeatureFlagsCopyWith<SpectrumFeatureFlags> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpectrumFeatureFlagsCopyWith<$Res> {
  factory $SpectrumFeatureFlagsCopyWith(SpectrumFeatureFlags value,
          $Res Function(SpectrumFeatureFlags) then) =
      _$SpectrumFeatureFlagsCopyWithImpl<$Res, SpectrumFeatureFlags>;
  @useResult
  $Res call({bool? gs, bool? pf, bool? nn, bool? nh, bool? nf});
}

/// @nodoc
class _$SpectrumFeatureFlagsCopyWithImpl<$Res,
        $Val extends SpectrumFeatureFlags>
    implements $SpectrumFeatureFlagsCopyWith<$Res> {
  _$SpectrumFeatureFlagsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gs = freezed,
    Object? pf = freezed,
    Object? nn = freezed,
    Object? nh = freezed,
    Object? nf = freezed,
  }) {
    return _then(_value.copyWith(
      gs: freezed == gs
          ? _value.gs
          : gs // ignore: cast_nullable_to_non_nullable
              as bool?,
      pf: freezed == pf
          ? _value.pf
          : pf // ignore: cast_nullable_to_non_nullable
              as bool?,
      nn: freezed == nn
          ? _value.nn
          : nn // ignore: cast_nullable_to_non_nullable
              as bool?,
      nh: freezed == nh
          ? _value.nh
          : nh // ignore: cast_nullable_to_non_nullable
              as bool?,
      nf: freezed == nf
          ? _value.nf
          : nf // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SpectrumFeatureFlagsImplCopyWith<$Res>
    implements $SpectrumFeatureFlagsCopyWith<$Res> {
  factory _$$SpectrumFeatureFlagsImplCopyWith(_$SpectrumFeatureFlagsImpl value,
          $Res Function(_$SpectrumFeatureFlagsImpl) then) =
      __$$SpectrumFeatureFlagsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? gs, bool? pf, bool? nn, bool? nh, bool? nf});
}

/// @nodoc
class __$$SpectrumFeatureFlagsImplCopyWithImpl<$Res>
    extends _$SpectrumFeatureFlagsCopyWithImpl<$Res, _$SpectrumFeatureFlagsImpl>
    implements _$$SpectrumFeatureFlagsImplCopyWith<$Res> {
  __$$SpectrumFeatureFlagsImplCopyWithImpl(_$SpectrumFeatureFlagsImpl _value,
      $Res Function(_$SpectrumFeatureFlagsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gs = freezed,
    Object? pf = freezed,
    Object? nn = freezed,
    Object? nh = freezed,
    Object? nf = freezed,
  }) {
    return _then(_$SpectrumFeatureFlagsImpl(
      gs: freezed == gs
          ? _value.gs
          : gs // ignore: cast_nullable_to_non_nullable
              as bool?,
      pf: freezed == pf
          ? _value.pf
          : pf // ignore: cast_nullable_to_non_nullable
              as bool?,
      nn: freezed == nn
          ? _value.nn
          : nn // ignore: cast_nullable_to_non_nullable
              as bool?,
      nh: freezed == nh
          ? _value.nh
          : nh // ignore: cast_nullable_to_non_nullable
              as bool?,
      nf: freezed == nf
          ? _value.nf
          : nf // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SpectrumFeatureFlagsImpl implements _SpectrumFeatureFlags {
  _$SpectrumFeatureFlagsImpl({this.gs, this.pf, this.nn, this.nh, this.nf});

  factory _$SpectrumFeatureFlagsImpl.fromJson(Map<String, dynamic> json) =>
      _$$SpectrumFeatureFlagsImplFromJson(json);

  @override
  bool? gs;
  @override
  bool? pf;
  @override
  bool? nn;
  @override
  bool? nh;
  @override
  bool? nf;

  @override
  String toString() {
    return 'SpectrumFeatureFlags(gs: $gs, pf: $pf, nn: $nn, nh: $nh, nf: $nf)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SpectrumFeatureFlagsImplCopyWith<_$SpectrumFeatureFlagsImpl>
      get copyWith =>
          __$$SpectrumFeatureFlagsImplCopyWithImpl<_$SpectrumFeatureFlagsImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SpectrumFeatureFlagsImplToJson(
      this,
    );
  }
}

abstract class _SpectrumFeatureFlags implements SpectrumFeatureFlags {
  factory _SpectrumFeatureFlags(
      {bool? gs,
      bool? pf,
      bool? nn,
      bool? nh,
      bool? nf}) = _$SpectrumFeatureFlagsImpl;

  factory _SpectrumFeatureFlags.fromJson(Map<String, dynamic> json) =
      _$SpectrumFeatureFlagsImpl.fromJson;

  @override
  bool? get gs;
  set gs(bool? value);
  @override
  bool? get pf;
  set pf(bool? value);
  @override
  bool? get nn;
  set nn(bool? value);
  @override
  bool? get nh;
  set nh(bool? value);
  @override
  bool? get nf;
  set nf(bool? value);
  @override
  @JsonKey(ignore: true)
  _$$SpectrumFeatureFlagsImplCopyWith<_$SpectrumFeatureFlagsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SpectrumSubscriptionsKeys _$SpectrumSubscriptionsKeysFromJson(
    Map<String, dynamic> json) {
  return _SpectrumSubscriptionsKeys.fromJson(json);
}

/// @nodoc
mixin _$SpectrumSubscriptionsKeys {
  String? get broadcast => throw _privateConstructorUsedError;
  set broadcast(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SpectrumSubscriptionsKeysCopyWith<SpectrumSubscriptionsKeys> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpectrumSubscriptionsKeysCopyWith<$Res> {
  factory $SpectrumSubscriptionsKeysCopyWith(SpectrumSubscriptionsKeys value,
          $Res Function(SpectrumSubscriptionsKeys) then) =
      _$SpectrumSubscriptionsKeysCopyWithImpl<$Res, SpectrumSubscriptionsKeys>;
  @useResult
  $Res call({String? broadcast});
}

/// @nodoc
class _$SpectrumSubscriptionsKeysCopyWithImpl<$Res,
        $Val extends SpectrumSubscriptionsKeys>
    implements $SpectrumSubscriptionsKeysCopyWith<$Res> {
  _$SpectrumSubscriptionsKeysCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? broadcast = freezed,
  }) {
    return _then(_value.copyWith(
      broadcast: freezed == broadcast
          ? _value.broadcast
          : broadcast // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SpectrumSubscriptionsKeysImplCopyWith<$Res>
    implements $SpectrumSubscriptionsKeysCopyWith<$Res> {
  factory _$$SpectrumSubscriptionsKeysImplCopyWith(
          _$SpectrumSubscriptionsKeysImpl value,
          $Res Function(_$SpectrumSubscriptionsKeysImpl) then) =
      __$$SpectrumSubscriptionsKeysImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? broadcast});
}

/// @nodoc
class __$$SpectrumSubscriptionsKeysImplCopyWithImpl<$Res>
    extends _$SpectrumSubscriptionsKeysCopyWithImpl<$Res,
        _$SpectrumSubscriptionsKeysImpl>
    implements _$$SpectrumSubscriptionsKeysImplCopyWith<$Res> {
  __$$SpectrumSubscriptionsKeysImplCopyWithImpl(
      _$SpectrumSubscriptionsKeysImpl _value,
      $Res Function(_$SpectrumSubscriptionsKeysImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? broadcast = freezed,
  }) {
    return _then(_$SpectrumSubscriptionsKeysImpl(
      broadcast: freezed == broadcast
          ? _value.broadcast
          : broadcast // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SpectrumSubscriptionsKeysImpl implements _SpectrumSubscriptionsKeys {
  _$SpectrumSubscriptionsKeysImpl({this.broadcast});

  factory _$SpectrumSubscriptionsKeysImpl.fromJson(Map<String, dynamic> json) =>
      _$$SpectrumSubscriptionsKeysImplFromJson(json);

  @override
  String? broadcast;

  @override
  String toString() {
    return 'SpectrumSubscriptionsKeys(broadcast: $broadcast)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SpectrumSubscriptionsKeysImplCopyWith<_$SpectrumSubscriptionsKeysImpl>
      get copyWith => __$$SpectrumSubscriptionsKeysImplCopyWithImpl<
          _$SpectrumSubscriptionsKeysImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SpectrumSubscriptionsKeysImplToJson(
      this,
    );
  }
}

abstract class _SpectrumSubscriptionsKeys implements SpectrumSubscriptionsKeys {
  factory _SpectrumSubscriptionsKeys({String? broadcast}) =
      _$SpectrumSubscriptionsKeysImpl;

  factory _SpectrumSubscriptionsKeys.fromJson(Map<String, dynamic> json) =
      _$SpectrumSubscriptionsKeysImpl.fromJson;

  @override
  String? get broadcast;
  set broadcast(String? value);
  @override
  @JsonKey(ignore: true)
  _$$SpectrumSubscriptionsKeysImplCopyWith<_$SpectrumSubscriptionsKeysImpl>
      get copyWith => throw _privateConstructorUsedError;
}
