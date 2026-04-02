// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'friend_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FriendRequest _$FriendRequestFromJson(Map<String, dynamic> json) {
  return _FriendRequest.fromJson(json);
}

/// @nodoc
mixin _$FriendRequest {
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  List<Friend>? get members => throw _privateConstructorUsedError;
  set members(List<Friend>? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'requesting_member_id')
  String? get requestingMemberId => throw _privateConstructorUsedError;
  @JsonKey(name: 'requesting_member_id')
  set requestingMemberId(String? value) => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  set status(String value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'target_member_id')
  String? get targetMemberId => throw _privateConstructorUsedError;
  @JsonKey(name: 'target_member_id')
  set targetMemberId(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'time_created')
  int? get timeCreated => throw _privateConstructorUsedError;
  @JsonKey(name: 'time_created')
  set timeCreated(int? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'time_modified')
  int? get timeModified => throw _privateConstructorUsedError;
  @JsonKey(name: 'time_modified')
  set timeModified(int? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FriendRequestCopyWith<FriendRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FriendRequestCopyWith<$Res> {
  factory $FriendRequestCopyWith(
          FriendRequest value, $Res Function(FriendRequest) then) =
      _$FriendRequestCopyWithImpl<$Res, FriendRequest>;
  @useResult
  $Res call(
      {String id,
      List<Friend>? members,
      @JsonKey(name: 'requesting_member_id') String? requestingMemberId,
      String status,
      @JsonKey(name: 'target_member_id') String? targetMemberId,
      @JsonKey(name: 'time_created') int? timeCreated,
      @JsonKey(name: 'time_modified') int? timeModified});
}

/// @nodoc
class _$FriendRequestCopyWithImpl<$Res, $Val extends FriendRequest>
    implements $FriendRequestCopyWith<$Res> {
  _$FriendRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? members = freezed,
    Object? requestingMemberId = freezed,
    Object? status = null,
    Object? targetMemberId = freezed,
    Object? timeCreated = freezed,
    Object? timeModified = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      members: freezed == members
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<Friend>?,
      requestingMemberId: freezed == requestingMemberId
          ? _value.requestingMemberId
          : requestingMemberId // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      targetMemberId: freezed == targetMemberId
          ? _value.targetMemberId
          : targetMemberId // ignore: cast_nullable_to_non_nullable
              as String?,
      timeCreated: freezed == timeCreated
          ? _value.timeCreated
          : timeCreated // ignore: cast_nullable_to_non_nullable
              as int?,
      timeModified: freezed == timeModified
          ? _value.timeModified
          : timeModified // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FriendRequestImplCopyWith<$Res>
    implements $FriendRequestCopyWith<$Res> {
  factory _$$FriendRequestImplCopyWith(
          _$FriendRequestImpl value, $Res Function(_$FriendRequestImpl) then) =
      __$$FriendRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      List<Friend>? members,
      @JsonKey(name: 'requesting_member_id') String? requestingMemberId,
      String status,
      @JsonKey(name: 'target_member_id') String? targetMemberId,
      @JsonKey(name: 'time_created') int? timeCreated,
      @JsonKey(name: 'time_modified') int? timeModified});
}

/// @nodoc
class __$$FriendRequestImplCopyWithImpl<$Res>
    extends _$FriendRequestCopyWithImpl<$Res, _$FriendRequestImpl>
    implements _$$FriendRequestImplCopyWith<$Res> {
  __$$FriendRequestImplCopyWithImpl(
      _$FriendRequestImpl _value, $Res Function(_$FriendRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? members = freezed,
    Object? requestingMemberId = freezed,
    Object? status = null,
    Object? targetMemberId = freezed,
    Object? timeCreated = freezed,
    Object? timeModified = freezed,
  }) {
    return _then(_$FriendRequestImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      members: freezed == members
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<Friend>?,
      requestingMemberId: freezed == requestingMemberId
          ? _value.requestingMemberId
          : requestingMemberId // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      targetMemberId: freezed == targetMemberId
          ? _value.targetMemberId
          : targetMemberId // ignore: cast_nullable_to_non_nullable
              as String?,
      timeCreated: freezed == timeCreated
          ? _value.timeCreated
          : timeCreated // ignore: cast_nullable_to_non_nullable
              as int?,
      timeModified: freezed == timeModified
          ? _value.timeModified
          : timeModified // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FriendRequestImpl implements _FriendRequest {
  _$FriendRequestImpl(
      {required this.id,
      this.members,
      @JsonKey(name: 'requesting_member_id') this.requestingMemberId,
      this.status = 'pending',
      @JsonKey(name: 'target_member_id') this.targetMemberId,
      @JsonKey(name: 'time_created') this.timeCreated,
      @JsonKey(name: 'time_modified') this.timeModified});

  factory _$FriendRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$FriendRequestImplFromJson(json);

  @override
  String id;
  @override
  List<Friend>? members;
  @override
  @JsonKey(name: 'requesting_member_id')
  String? requestingMemberId;
  @override
  @JsonKey()
  String status;
  @override
  @JsonKey(name: 'target_member_id')
  String? targetMemberId;
  @override
  @JsonKey(name: 'time_created')
  int? timeCreated;
  @override
  @JsonKey(name: 'time_modified')
  int? timeModified;

  @override
  String toString() {
    return 'FriendRequest(id: $id, members: $members, requestingMemberId: $requestingMemberId, status: $status, targetMemberId: $targetMemberId, timeCreated: $timeCreated, timeModified: $timeModified)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FriendRequestImplCopyWith<_$FriendRequestImpl> get copyWith =>
      __$$FriendRequestImplCopyWithImpl<_$FriendRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FriendRequestImplToJson(
      this,
    );
  }
}

abstract class _FriendRequest implements FriendRequest {
  factory _FriendRequest(
      {required String id,
      List<Friend>? members,
      @JsonKey(name: 'requesting_member_id') String? requestingMemberId,
      String status,
      @JsonKey(name: 'target_member_id') String? targetMemberId,
      @JsonKey(name: 'time_created') int? timeCreated,
      @JsonKey(name: 'time_modified') int? timeModified}) = _$FriendRequestImpl;

  factory _FriendRequest.fromJson(Map<String, dynamic> json) =
      _$FriendRequestImpl.fromJson;

  @override
  String get id;
  set id(String value);
  @override
  List<Friend>? get members;
  set members(List<Friend>? value);
  @override
  @JsonKey(name: 'requesting_member_id')
  String? get requestingMemberId;
  @JsonKey(name: 'requesting_member_id')
  set requestingMemberId(String? value);
  @override
  String get status;
  set status(String value);
  @override
  @JsonKey(name: 'target_member_id')
  String? get targetMemberId;
  @JsonKey(name: 'target_member_id')
  set targetMemberId(String? value);
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
  @JsonKey(ignore: true)
  _$$FriendRequestImplCopyWith<_$FriendRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
