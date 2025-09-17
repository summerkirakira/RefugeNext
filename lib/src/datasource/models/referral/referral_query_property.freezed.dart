// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'referral_query_property.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReferralQueryResponse _$ReferralQueryResponseFromJson(
    Map<String, dynamic> json) {
  return _ReferralQueryResponse.fromJson(json);
}

/// @nodoc
mixin _$ReferralQueryResponse {
  ReferralData get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReferralQueryResponseCopyWith<ReferralQueryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReferralQueryResponseCopyWith<$Res> {
  factory $ReferralQueryResponseCopyWith(ReferralQueryResponse value,
          $Res Function(ReferralQueryResponse) then) =
      _$ReferralQueryResponseCopyWithImpl<$Res, ReferralQueryResponse>;
  @useResult
  $Res call({ReferralData data});

  $ReferralDataCopyWith<$Res> get data;
}

/// @nodoc
class _$ReferralQueryResponseCopyWithImpl<$Res,
        $Val extends ReferralQueryResponse>
    implements $ReferralQueryResponseCopyWith<$Res> {
  _$ReferralQueryResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ReferralData,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ReferralDataCopyWith<$Res> get data {
    return $ReferralDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ReferralQueryResponseImplCopyWith<$Res>
    implements $ReferralQueryResponseCopyWith<$Res> {
  factory _$$ReferralQueryResponseImplCopyWith(
          _$ReferralQueryResponseImpl value,
          $Res Function(_$ReferralQueryResponseImpl) then) =
      __$$ReferralQueryResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ReferralData data});

  @override
  $ReferralDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$ReferralQueryResponseImplCopyWithImpl<$Res>
    extends _$ReferralQueryResponseCopyWithImpl<$Res,
        _$ReferralQueryResponseImpl>
    implements _$$ReferralQueryResponseImplCopyWith<$Res> {
  __$$ReferralQueryResponseImplCopyWithImpl(_$ReferralQueryResponseImpl _value,
      $Res Function(_$ReferralQueryResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$ReferralQueryResponseImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ReferralData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReferralQueryResponseImpl implements _ReferralQueryResponse {
  const _$ReferralQueryResponseImpl({required this.data});

  factory _$ReferralQueryResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReferralQueryResponseImplFromJson(json);

  @override
  final ReferralData data;

  @override
  String toString() {
    return 'ReferralQueryResponse(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReferralQueryResponseImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReferralQueryResponseImplCopyWith<_$ReferralQueryResponseImpl>
      get copyWith => __$$ReferralQueryResponseImplCopyWithImpl<
          _$ReferralQueryResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReferralQueryResponseImplToJson(
      this,
    );
  }
}

abstract class _ReferralQueryResponse implements ReferralQueryResponse {
  const factory _ReferralQueryResponse({required final ReferralData data}) =
      _$ReferralQueryResponseImpl;

  factory _ReferralQueryResponse.fromJson(Map<String, dynamic> json) =
      _$ReferralQueryResponseImpl.fromJson;

  @override
  ReferralData get data;
  @override
  @JsonKey(ignore: true)
  _$$ReferralQueryResponseImplCopyWith<_$ReferralQueryResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ReferralData _$ReferralDataFromJson(Map<String, dynamic> json) {
  return _ReferralData.fromJson(json);
}

/// @nodoc
mixin _$ReferralData {
  int get referralCountByCampaign => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReferralDataCopyWith<ReferralData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReferralDataCopyWith<$Res> {
  factory $ReferralDataCopyWith(
          ReferralData value, $Res Function(ReferralData) then) =
      _$ReferralDataCopyWithImpl<$Res, ReferralData>;
  @useResult
  $Res call({int referralCountByCampaign});
}

/// @nodoc
class _$ReferralDataCopyWithImpl<$Res, $Val extends ReferralData>
    implements $ReferralDataCopyWith<$Res> {
  _$ReferralDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? referralCountByCampaign = null,
  }) {
    return _then(_value.copyWith(
      referralCountByCampaign: null == referralCountByCampaign
          ? _value.referralCountByCampaign
          : referralCountByCampaign // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReferralDataImplCopyWith<$Res>
    implements $ReferralDataCopyWith<$Res> {
  factory _$$ReferralDataImplCopyWith(
          _$ReferralDataImpl value, $Res Function(_$ReferralDataImpl) then) =
      __$$ReferralDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int referralCountByCampaign});
}

/// @nodoc
class __$$ReferralDataImplCopyWithImpl<$Res>
    extends _$ReferralDataCopyWithImpl<$Res, _$ReferralDataImpl>
    implements _$$ReferralDataImplCopyWith<$Res> {
  __$$ReferralDataImplCopyWithImpl(
      _$ReferralDataImpl _value, $Res Function(_$ReferralDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? referralCountByCampaign = null,
  }) {
    return _then(_$ReferralDataImpl(
      referralCountByCampaign: null == referralCountByCampaign
          ? _value.referralCountByCampaign
          : referralCountByCampaign // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReferralDataImpl implements _ReferralData {
  const _$ReferralDataImpl({required this.referralCountByCampaign});

  factory _$ReferralDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReferralDataImplFromJson(json);

  @override
  final int referralCountByCampaign;

  @override
  String toString() {
    return 'ReferralData(referralCountByCampaign: $referralCountByCampaign)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReferralDataImpl &&
            (identical(
                    other.referralCountByCampaign, referralCountByCampaign) ||
                other.referralCountByCampaign == referralCountByCampaign));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, referralCountByCampaign);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReferralDataImplCopyWith<_$ReferralDataImpl> get copyWith =>
      __$$ReferralDataImplCopyWithImpl<_$ReferralDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReferralDataImplToJson(
      this,
    );
  }
}

abstract class _ReferralData implements ReferralData {
  const factory _ReferralData({required final int referralCountByCampaign}) =
      _$ReferralDataImpl;

  factory _ReferralData.fromJson(Map<String, dynamic> json) =
      _$ReferralDataImpl.fromJson;

  @override
  int get referralCountByCampaign;
  @override
  @JsonKey(ignore: true)
  _$$ReferralDataImplCopyWith<_$ReferralDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
