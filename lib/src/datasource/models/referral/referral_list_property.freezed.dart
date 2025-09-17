// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'referral_list_property.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReferralRecruitsList _$ReferralRecruitsListFromJson(Map<String, dynamic> json) {
  return _ReferralRecruitsList.fromJson(json);
}

/// @nodoc
mixin _$ReferralRecruitsList {
  int get recruitsCount => throw _privateConstructorUsedError;
  int get prospectsCount => throw _privateConstructorUsedError;
  List<ReferralRecruitListData> get data => throw _privateConstructorUsedError;
  @JsonKey(name: '__typename')
  String? get typename => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReferralRecruitsListCopyWith<ReferralRecruitsList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReferralRecruitsListCopyWith<$Res> {
  factory $ReferralRecruitsListCopyWith(ReferralRecruitsList value,
          $Res Function(ReferralRecruitsList) then) =
      _$ReferralRecruitsListCopyWithImpl<$Res, ReferralRecruitsList>;
  @useResult
  $Res call(
      {int recruitsCount,
      int prospectsCount,
      List<ReferralRecruitListData> data,
      @JsonKey(name: '__typename') String? typename});
}

/// @nodoc
class _$ReferralRecruitsListCopyWithImpl<$Res,
        $Val extends ReferralRecruitsList>
    implements $ReferralRecruitsListCopyWith<$Res> {
  _$ReferralRecruitsListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recruitsCount = null,
    Object? prospectsCount = null,
    Object? data = null,
    Object? typename = freezed,
  }) {
    return _then(_value.copyWith(
      recruitsCount: null == recruitsCount
          ? _value.recruitsCount
          : recruitsCount // ignore: cast_nullable_to_non_nullable
              as int,
      prospectsCount: null == prospectsCount
          ? _value.prospectsCount
          : prospectsCount // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ReferralRecruitListData>,
      typename: freezed == typename
          ? _value.typename
          : typename // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReferralRecruitsListImplCopyWith<$Res>
    implements $ReferralRecruitsListCopyWith<$Res> {
  factory _$$ReferralRecruitsListImplCopyWith(_$ReferralRecruitsListImpl value,
          $Res Function(_$ReferralRecruitsListImpl) then) =
      __$$ReferralRecruitsListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int recruitsCount,
      int prospectsCount,
      List<ReferralRecruitListData> data,
      @JsonKey(name: '__typename') String? typename});
}

/// @nodoc
class __$$ReferralRecruitsListImplCopyWithImpl<$Res>
    extends _$ReferralRecruitsListCopyWithImpl<$Res, _$ReferralRecruitsListImpl>
    implements _$$ReferralRecruitsListImplCopyWith<$Res> {
  __$$ReferralRecruitsListImplCopyWithImpl(_$ReferralRecruitsListImpl _value,
      $Res Function(_$ReferralRecruitsListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recruitsCount = null,
    Object? prospectsCount = null,
    Object? data = null,
    Object? typename = freezed,
  }) {
    return _then(_$ReferralRecruitsListImpl(
      recruitsCount: null == recruitsCount
          ? _value.recruitsCount
          : recruitsCount // ignore: cast_nullable_to_non_nullable
              as int,
      prospectsCount: null == prospectsCount
          ? _value.prospectsCount
          : prospectsCount // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ReferralRecruitListData>,
      typename: freezed == typename
          ? _value.typename
          : typename // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReferralRecruitsListImpl implements _ReferralRecruitsList {
  const _$ReferralRecruitsListImpl(
      {required this.recruitsCount,
      required this.prospectsCount,
      required final List<ReferralRecruitListData> data,
      @JsonKey(name: '__typename') this.typename})
      : _data = data;

  factory _$ReferralRecruitsListImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReferralRecruitsListImplFromJson(json);

  @override
  final int recruitsCount;
  @override
  final int prospectsCount;
  final List<ReferralRecruitListData> _data;
  @override
  List<ReferralRecruitListData> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  @JsonKey(name: '__typename')
  final String? typename;

  @override
  String toString() {
    return 'ReferralRecruitsList(recruitsCount: $recruitsCount, prospectsCount: $prospectsCount, data: $data, typename: $typename)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReferralRecruitsListImpl &&
            (identical(other.recruitsCount, recruitsCount) ||
                other.recruitsCount == recruitsCount) &&
            (identical(other.prospectsCount, prospectsCount) ||
                other.prospectsCount == prospectsCount) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.typename, typename) ||
                other.typename == typename));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, recruitsCount, prospectsCount,
      const DeepCollectionEquality().hash(_data), typename);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReferralRecruitsListImplCopyWith<_$ReferralRecruitsListImpl>
      get copyWith =>
          __$$ReferralRecruitsListImplCopyWithImpl<_$ReferralRecruitsListImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReferralRecruitsListImplToJson(
      this,
    );
  }
}

abstract class _ReferralRecruitsList implements ReferralRecruitsList {
  const factory _ReferralRecruitsList(
          {required final int recruitsCount,
          required final int prospectsCount,
          required final List<ReferralRecruitListData> data,
          @JsonKey(name: '__typename') final String? typename}) =
      _$ReferralRecruitsListImpl;

  factory _ReferralRecruitsList.fromJson(Map<String, dynamic> json) =
      _$ReferralRecruitsListImpl.fromJson;

  @override
  int get recruitsCount;
  @override
  int get prospectsCount;
  @override
  List<ReferralRecruitListData> get data;
  @override
  @JsonKey(name: '__typename')
  String? get typename;
  @override
  @JsonKey(ignore: true)
  _$$ReferralRecruitsListImplCopyWith<_$ReferralRecruitsListImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ReferralRecruitListData _$ReferralRecruitListDataFromJson(
    Map<String, dynamic> json) {
  return _ReferralRecruitListData.fromJson(json);
}

/// @nodoc
mixin _$ReferralRecruitListData {
  String get id => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;
  String get avatar => throw _privateConstructorUsedError;
  String get enlistedOn => throw _privateConstructorUsedError;
  String? get convertedOn => throw _privateConstructorUsedError;
  @JsonKey(name: '__typename')
  String? get typename => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReferralRecruitListDataCopyWith<ReferralRecruitListData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReferralRecruitListDataCopyWith<$Res> {
  factory $ReferralRecruitListDataCopyWith(ReferralRecruitListData value,
          $Res Function(ReferralRecruitListData) then) =
      _$ReferralRecruitListDataCopyWithImpl<$Res, ReferralRecruitListData>;
  @useResult
  $Res call(
      {String id,
      String displayName,
      String nickname,
      String avatar,
      String enlistedOn,
      String? convertedOn,
      @JsonKey(name: '__typename') String? typename});
}

/// @nodoc
class _$ReferralRecruitListDataCopyWithImpl<$Res,
        $Val extends ReferralRecruitListData>
    implements $ReferralRecruitListDataCopyWith<$Res> {
  _$ReferralRecruitListDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? displayName = null,
    Object? nickname = null,
    Object? avatar = null,
    Object? enlistedOn = null,
    Object? convertedOn = freezed,
    Object? typename = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      enlistedOn: null == enlistedOn
          ? _value.enlistedOn
          : enlistedOn // ignore: cast_nullable_to_non_nullable
              as String,
      convertedOn: freezed == convertedOn
          ? _value.convertedOn
          : convertedOn // ignore: cast_nullable_to_non_nullable
              as String?,
      typename: freezed == typename
          ? _value.typename
          : typename // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReferralRecruitListDataImplCopyWith<$Res>
    implements $ReferralRecruitListDataCopyWith<$Res> {
  factory _$$ReferralRecruitListDataImplCopyWith(
          _$ReferralRecruitListDataImpl value,
          $Res Function(_$ReferralRecruitListDataImpl) then) =
      __$$ReferralRecruitListDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String displayName,
      String nickname,
      String avatar,
      String enlistedOn,
      String? convertedOn,
      @JsonKey(name: '__typename') String? typename});
}

/// @nodoc
class __$$ReferralRecruitListDataImplCopyWithImpl<$Res>
    extends _$ReferralRecruitListDataCopyWithImpl<$Res,
        _$ReferralRecruitListDataImpl>
    implements _$$ReferralRecruitListDataImplCopyWith<$Res> {
  __$$ReferralRecruitListDataImplCopyWithImpl(
      _$ReferralRecruitListDataImpl _value,
      $Res Function(_$ReferralRecruitListDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? displayName = null,
    Object? nickname = null,
    Object? avatar = null,
    Object? enlistedOn = null,
    Object? convertedOn = freezed,
    Object? typename = freezed,
  }) {
    return _then(_$ReferralRecruitListDataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      enlistedOn: null == enlistedOn
          ? _value.enlistedOn
          : enlistedOn // ignore: cast_nullable_to_non_nullable
              as String,
      convertedOn: freezed == convertedOn
          ? _value.convertedOn
          : convertedOn // ignore: cast_nullable_to_non_nullable
              as String?,
      typename: freezed == typename
          ? _value.typename
          : typename // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReferralRecruitListDataImpl implements _ReferralRecruitListData {
  const _$ReferralRecruitListDataImpl(
      {required this.id,
      required this.displayName,
      required this.nickname,
      required this.avatar,
      required this.enlistedOn,
      this.convertedOn,
      @JsonKey(name: '__typename') this.typename});

  factory _$ReferralRecruitListDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReferralRecruitListDataImplFromJson(json);

  @override
  final String id;
  @override
  final String displayName;
  @override
  final String nickname;
  @override
  final String avatar;
  @override
  final String enlistedOn;
  @override
  final String? convertedOn;
  @override
  @JsonKey(name: '__typename')
  final String? typename;

  @override
  String toString() {
    return 'ReferralRecruitListData(id: $id, displayName: $displayName, nickname: $nickname, avatar: $avatar, enlistedOn: $enlistedOn, convertedOn: $convertedOn, typename: $typename)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReferralRecruitListDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.enlistedOn, enlistedOn) ||
                other.enlistedOn == enlistedOn) &&
            (identical(other.convertedOn, convertedOn) ||
                other.convertedOn == convertedOn) &&
            (identical(other.typename, typename) ||
                other.typename == typename));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, displayName, nickname,
      avatar, enlistedOn, convertedOn, typename);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReferralRecruitListDataImplCopyWith<_$ReferralRecruitListDataImpl>
      get copyWith => __$$ReferralRecruitListDataImplCopyWithImpl<
          _$ReferralRecruitListDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReferralRecruitListDataImplToJson(
      this,
    );
  }
}

abstract class _ReferralRecruitListData implements ReferralRecruitListData {
  const factory _ReferralRecruitListData(
          {required final String id,
          required final String displayName,
          required final String nickname,
          required final String avatar,
          required final String enlistedOn,
          final String? convertedOn,
          @JsonKey(name: '__typename') final String? typename}) =
      _$ReferralRecruitListDataImpl;

  factory _ReferralRecruitListData.fromJson(Map<String, dynamic> json) =
      _$ReferralRecruitListDataImpl.fromJson;

  @override
  String get id;
  @override
  String get displayName;
  @override
  String get nickname;
  @override
  String get avatar;
  @override
  String get enlistedOn;
  @override
  String? get convertedOn;
  @override
  @JsonKey(name: '__typename')
  String? get typename;
  @override
  @JsonKey(ignore: true)
  _$$ReferralRecruitListDataImplCopyWith<_$ReferralRecruitListDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}
