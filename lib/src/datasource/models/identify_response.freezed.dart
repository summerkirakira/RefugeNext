// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'identify_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

IdentifyResponse _$IdentifyResponseFromJson(Map<String, dynamic> json) {
  return _IdentifyResponse.fromJson(json);
}

/// @nodoc
mixin _$IdentifyResponse {
  int get success => throw _privateConstructorUsedError;
  set success(int value) => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  set code(String? value) => throw _privateConstructorUsedError;
  String? get msg => throw _privateConstructorUsedError;
  set msg(String? value) => throw _privateConstructorUsedError;
  IdentifyData? get data => throw _privateConstructorUsedError;
  set data(IdentifyData? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IdentifyResponseCopyWith<IdentifyResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IdentifyResponseCopyWith<$Res> {
  factory $IdentifyResponseCopyWith(
          IdentifyResponse value, $Res Function(IdentifyResponse) then) =
      _$IdentifyResponseCopyWithImpl<$Res, IdentifyResponse>;
  @useResult
  $Res call({int success, String? code, String? msg, IdentifyData? data});

  $IdentifyDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$IdentifyResponseCopyWithImpl<$Res, $Val extends IdentifyResponse>
    implements $IdentifyResponseCopyWith<$Res> {
  _$IdentifyResponseCopyWithImpl(this._value, this._then);

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
              as IdentifyData?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $IdentifyDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $IdentifyDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$IdentifyResponseImplCopyWith<$Res>
    implements $IdentifyResponseCopyWith<$Res> {
  factory _$$IdentifyResponseImplCopyWith(_$IdentifyResponseImpl value,
          $Res Function(_$IdentifyResponseImpl) then) =
      __$$IdentifyResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int success, String? code, String? msg, IdentifyData? data});

  @override
  $IdentifyDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$IdentifyResponseImplCopyWithImpl<$Res>
    extends _$IdentifyResponseCopyWithImpl<$Res, _$IdentifyResponseImpl>
    implements _$$IdentifyResponseImplCopyWith<$Res> {
  __$$IdentifyResponseImplCopyWithImpl(_$IdentifyResponseImpl _value,
      $Res Function(_$IdentifyResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? code = freezed,
    Object? msg = freezed,
    Object? data = freezed,
  }) {
    return _then(_$IdentifyResponseImpl(
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
              as IdentifyData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IdentifyResponseImpl implements _IdentifyResponse {
  _$IdentifyResponseImpl(
      {required this.success, this.code, this.msg, this.data});

  factory _$IdentifyResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$IdentifyResponseImplFromJson(json);

  @override
  int success;
  @override
  String? code;
  @override
  String? msg;
  @override
  IdentifyData? data;

  @override
  String toString() {
    return 'IdentifyResponse(success: $success, code: $code, msg: $msg, data: $data)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IdentifyResponseImplCopyWith<_$IdentifyResponseImpl> get copyWith =>
      __$$IdentifyResponseImplCopyWithImpl<_$IdentifyResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IdentifyResponseImplToJson(
      this,
    );
  }
}

abstract class _IdentifyResponse implements IdentifyResponse {
  factory _IdentifyResponse(
      {required int success,
      String? code,
      String? msg,
      IdentifyData? data}) = _$IdentifyResponseImpl;

  factory _IdentifyResponse.fromJson(Map<String, dynamic> json) =
      _$IdentifyResponseImpl.fromJson;

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
  IdentifyData? get data;
  set data(IdentifyData? value);
  @override
  @JsonKey(ignore: true)
  _$$IdentifyResponseImplCopyWith<_$IdentifyResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

IdentifyData _$IdentifyDataFromJson(Map<String, dynamic> json) {
  return _IdentifyData.fromJson(json);
}

/// @nodoc
mixin _$IdentifyData {
  List<Friend>? get friends => throw _privateConstructorUsedError;
  set friends(List<Friend>? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'private_lobbies')
  List<PrivateLobby>? get privateLobbies => throw _privateConstructorUsedError;
  @JsonKey(name: 'private_lobbies')
  set privateLobbies(List<PrivateLobby>? value) =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IdentifyDataCopyWith<IdentifyData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IdentifyDataCopyWith<$Res> {
  factory $IdentifyDataCopyWith(
          IdentifyData value, $Res Function(IdentifyData) then) =
      _$IdentifyDataCopyWithImpl<$Res, IdentifyData>;
  @useResult
  $Res call(
      {List<Friend>? friends,
      @JsonKey(name: 'private_lobbies') List<PrivateLobby>? privateLobbies});
}

/// @nodoc
class _$IdentifyDataCopyWithImpl<$Res, $Val extends IdentifyData>
    implements $IdentifyDataCopyWith<$Res> {
  _$IdentifyDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? friends = freezed,
    Object? privateLobbies = freezed,
  }) {
    return _then(_value.copyWith(
      friends: freezed == friends
          ? _value.friends
          : friends // ignore: cast_nullable_to_non_nullable
              as List<Friend>?,
      privateLobbies: freezed == privateLobbies
          ? _value.privateLobbies
          : privateLobbies // ignore: cast_nullable_to_non_nullable
              as List<PrivateLobby>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IdentifyDataImplCopyWith<$Res>
    implements $IdentifyDataCopyWith<$Res> {
  factory _$$IdentifyDataImplCopyWith(
          _$IdentifyDataImpl value, $Res Function(_$IdentifyDataImpl) then) =
      __$$IdentifyDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Friend>? friends,
      @JsonKey(name: 'private_lobbies') List<PrivateLobby>? privateLobbies});
}

/// @nodoc
class __$$IdentifyDataImplCopyWithImpl<$Res>
    extends _$IdentifyDataCopyWithImpl<$Res, _$IdentifyDataImpl>
    implements _$$IdentifyDataImplCopyWith<$Res> {
  __$$IdentifyDataImplCopyWithImpl(
      _$IdentifyDataImpl _value, $Res Function(_$IdentifyDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? friends = freezed,
    Object? privateLobbies = freezed,
  }) {
    return _then(_$IdentifyDataImpl(
      friends: freezed == friends
          ? _value.friends
          : friends // ignore: cast_nullable_to_non_nullable
              as List<Friend>?,
      privateLobbies: freezed == privateLobbies
          ? _value.privateLobbies
          : privateLobbies // ignore: cast_nullable_to_non_nullable
              as List<PrivateLobby>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IdentifyDataImpl implements _IdentifyData {
  _$IdentifyDataImpl(
      {this.friends, @JsonKey(name: 'private_lobbies') this.privateLobbies});

  factory _$IdentifyDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$IdentifyDataImplFromJson(json);

  @override
  List<Friend>? friends;
  @override
  @JsonKey(name: 'private_lobbies')
  List<PrivateLobby>? privateLobbies;

  @override
  String toString() {
    return 'IdentifyData(friends: $friends, privateLobbies: $privateLobbies)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IdentifyDataImplCopyWith<_$IdentifyDataImpl> get copyWith =>
      __$$IdentifyDataImplCopyWithImpl<_$IdentifyDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IdentifyDataImplToJson(
      this,
    );
  }
}

abstract class _IdentifyData implements IdentifyData {
  factory _IdentifyData(
      {List<Friend>? friends,
      @JsonKey(name: 'private_lobbies')
      List<PrivateLobby>? privateLobbies}) = _$IdentifyDataImpl;

  factory _IdentifyData.fromJson(Map<String, dynamic> json) =
      _$IdentifyDataImpl.fromJson;

  @override
  List<Friend>? get friends;
  set friends(List<Friend>? value);
  @override
  @JsonKey(name: 'private_lobbies')
  List<PrivateLobby>? get privateLobbies;
  @JsonKey(name: 'private_lobbies')
  set privateLobbies(List<PrivateLobby>? value);
  @override
  @JsonKey(ignore: true)
  _$$IdentifyDataImplCopyWith<_$IdentifyDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
