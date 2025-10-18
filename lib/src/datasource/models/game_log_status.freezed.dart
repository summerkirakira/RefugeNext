// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_log_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GameLogStatus _$GameLogStatusFromJson(Map<String, dynamic> json) {
  return _GameLogStatus.fromJson(json);
}

/// @nodoc
mixin _$GameLogStatus {
  /// 最近游戏时间（最新日志的时间戳）
  DateTime? get latestGameTime => throw _privateConstructorUsedError;

  /// 最后刷新时间（用于显示数据新鲜度）
  DateTime? get lastRefreshTime => throw _privateConstructorUsedError;

  /// 任务完成数（EndMission日志数量）
  int? get missionCompletedCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GameLogStatusCopyWith<GameLogStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameLogStatusCopyWith<$Res> {
  factory $GameLogStatusCopyWith(
          GameLogStatus value, $Res Function(GameLogStatus) then) =
      _$GameLogStatusCopyWithImpl<$Res, GameLogStatus>;
  @useResult
  $Res call(
      {DateTime? latestGameTime,
      DateTime? lastRefreshTime,
      int? missionCompletedCount});
}

/// @nodoc
class _$GameLogStatusCopyWithImpl<$Res, $Val extends GameLogStatus>
    implements $GameLogStatusCopyWith<$Res> {
  _$GameLogStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latestGameTime = freezed,
    Object? lastRefreshTime = freezed,
    Object? missionCompletedCount = freezed,
  }) {
    return _then(_value.copyWith(
      latestGameTime: freezed == latestGameTime
          ? _value.latestGameTime
          : latestGameTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastRefreshTime: freezed == lastRefreshTime
          ? _value.lastRefreshTime
          : lastRefreshTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      missionCompletedCount: freezed == missionCompletedCount
          ? _value.missionCompletedCount
          : missionCompletedCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GameLogStatusImplCopyWith<$Res>
    implements $GameLogStatusCopyWith<$Res> {
  factory _$$GameLogStatusImplCopyWith(
          _$GameLogStatusImpl value, $Res Function(_$GameLogStatusImpl) then) =
      __$$GameLogStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime? latestGameTime,
      DateTime? lastRefreshTime,
      int? missionCompletedCount});
}

/// @nodoc
class __$$GameLogStatusImplCopyWithImpl<$Res>
    extends _$GameLogStatusCopyWithImpl<$Res, _$GameLogStatusImpl>
    implements _$$GameLogStatusImplCopyWith<$Res> {
  __$$GameLogStatusImplCopyWithImpl(
      _$GameLogStatusImpl _value, $Res Function(_$GameLogStatusImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latestGameTime = freezed,
    Object? lastRefreshTime = freezed,
    Object? missionCompletedCount = freezed,
  }) {
    return _then(_$GameLogStatusImpl(
      latestGameTime: freezed == latestGameTime
          ? _value.latestGameTime
          : latestGameTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastRefreshTime: freezed == lastRefreshTime
          ? _value.lastRefreshTime
          : lastRefreshTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      missionCompletedCount: freezed == missionCompletedCount
          ? _value.missionCompletedCount
          : missionCompletedCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GameLogStatusImpl implements _GameLogStatus {
  const _$GameLogStatusImpl(
      {this.latestGameTime, this.lastRefreshTime, this.missionCompletedCount});

  factory _$GameLogStatusImpl.fromJson(Map<String, dynamic> json) =>
      _$$GameLogStatusImplFromJson(json);

  /// 最近游戏时间（最新日志的时间戳）
  @override
  final DateTime? latestGameTime;

  /// 最后刷新时间（用于显示数据新鲜度）
  @override
  final DateTime? lastRefreshTime;

  /// 任务完成数（EndMission日志数量）
  @override
  final int? missionCompletedCount;

  @override
  String toString() {
    return 'GameLogStatus(latestGameTime: $latestGameTime, lastRefreshTime: $lastRefreshTime, missionCompletedCount: $missionCompletedCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameLogStatusImpl &&
            (identical(other.latestGameTime, latestGameTime) ||
                other.latestGameTime == latestGameTime) &&
            (identical(other.lastRefreshTime, lastRefreshTime) ||
                other.lastRefreshTime == lastRefreshTime) &&
            (identical(other.missionCompletedCount, missionCompletedCount) ||
                other.missionCompletedCount == missionCompletedCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, latestGameTime, lastRefreshTime, missionCompletedCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GameLogStatusImplCopyWith<_$GameLogStatusImpl> get copyWith =>
      __$$GameLogStatusImplCopyWithImpl<_$GameLogStatusImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GameLogStatusImplToJson(
      this,
    );
  }
}

abstract class _GameLogStatus implements GameLogStatus {
  const factory _GameLogStatus(
      {final DateTime? latestGameTime,
      final DateTime? lastRefreshTime,
      final int? missionCompletedCount}) = _$GameLogStatusImpl;

  factory _GameLogStatus.fromJson(Map<String, dynamic> json) =
      _$GameLogStatusImpl.fromJson;

  @override

  /// 最近游戏时间（最新日志的时间戳）
  DateTime? get latestGameTime;
  @override

  /// 最后刷新时间（用于显示数据新鲜度）
  DateTime? get lastRefreshTime;
  @override

  /// 任务完成数（EndMission日志数量）
  int? get missionCompletedCount;
  @override
  @JsonKey(ignore: true)
  _$$GameLogStatusImplCopyWith<_$GameLogStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
