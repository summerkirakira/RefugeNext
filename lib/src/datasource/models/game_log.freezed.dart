// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GameLog _$GameLogFromJson(Map<String, dynamic> json) {
  return _GameLog.fromJson(json);
}

/// @nodoc
mixin _$GameLog {
  int? get id => throw _privateConstructorUsedError; // 自增主键，插入时为null
  DateTime get timestamp => throw _privateConstructorUsedError; // 日志时间戳
  String get logLevel =>
      throw _privateConstructorUsedError; // 日志级别 (Notice, Warning, Error等)
  String get logType =>
      throw _privateConstructorUsedError; // 主类型 (StoreItem, InventoryManagement, AttachmentReceived等)
  String? get subType =>
      throw _privateConstructorUsedError; // 子类型 (Team_CoreGameplayFeatures, Team_ActorFeatures等)
  String? get playerId => throw _privateConstructorUsedError; // 玩家ID
  String? get playerName => throw _privateConstructorUsedError; // 玩家名称
  int? get requestId => throw _privateConstructorUsedError; // 请求ID
  String? get entityId => throw _privateConstructorUsedError; // 实体/物品ID
  String? get entityName => throw _privateConstructorUsedError; // 实体/物品名称
  String? get entityClass =>
      throw _privateConstructorUsedError; // 实体类型 (如 behr_rifle_ballistic_01)
  String? get location =>
      throw _privateConstructorUsedError; // 位置信息 (inventory, port等)
  String? get inventoryId => throw _privateConstructorUsedError; // 库存ID
  String? get action =>
      throw _privateConstructorUsedError; // 动作类型 (Store, Take, Attach等)
  String? get result =>
      throw _privateConstructorUsedError; // 操作结果 (Succeed, Failed等)
  double? get elapsed => throw _privateConstructorUsedError; // 耗时（秒）
  String get content => throw _privateConstructorUsedError; // 完整日志内容
  Map<String, dynamic>? get parsedData =>
      throw _privateConstructorUsedError; // 解析后的额外数据
  String? get account => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GameLogCopyWith<GameLog> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameLogCopyWith<$Res> {
  factory $GameLogCopyWith(GameLog value, $Res Function(GameLog) then) =
      _$GameLogCopyWithImpl<$Res, GameLog>;
  @useResult
  $Res call(
      {int? id,
      DateTime timestamp,
      String logLevel,
      String logType,
      String? subType,
      String? playerId,
      String? playerName,
      int? requestId,
      String? entityId,
      String? entityName,
      String? entityClass,
      String? location,
      String? inventoryId,
      String? action,
      String? result,
      double? elapsed,
      String content,
      Map<String, dynamic>? parsedData,
      String? account});
}

/// @nodoc
class _$GameLogCopyWithImpl<$Res, $Val extends GameLog>
    implements $GameLogCopyWith<$Res> {
  _$GameLogCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? timestamp = null,
    Object? logLevel = null,
    Object? logType = null,
    Object? subType = freezed,
    Object? playerId = freezed,
    Object? playerName = freezed,
    Object? requestId = freezed,
    Object? entityId = freezed,
    Object? entityName = freezed,
    Object? entityClass = freezed,
    Object? location = freezed,
    Object? inventoryId = freezed,
    Object? action = freezed,
    Object? result = freezed,
    Object? elapsed = freezed,
    Object? content = null,
    Object? parsedData = freezed,
    Object? account = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      logLevel: null == logLevel
          ? _value.logLevel
          : logLevel // ignore: cast_nullable_to_non_nullable
              as String,
      logType: null == logType
          ? _value.logType
          : logType // ignore: cast_nullable_to_non_nullable
              as String,
      subType: freezed == subType
          ? _value.subType
          : subType // ignore: cast_nullable_to_non_nullable
              as String?,
      playerId: freezed == playerId
          ? _value.playerId
          : playerId // ignore: cast_nullable_to_non_nullable
              as String?,
      playerName: freezed == playerName
          ? _value.playerName
          : playerName // ignore: cast_nullable_to_non_nullable
              as String?,
      requestId: freezed == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as int?,
      entityId: freezed == entityId
          ? _value.entityId
          : entityId // ignore: cast_nullable_to_non_nullable
              as String?,
      entityName: freezed == entityName
          ? _value.entityName
          : entityName // ignore: cast_nullable_to_non_nullable
              as String?,
      entityClass: freezed == entityClass
          ? _value.entityClass
          : entityClass // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      inventoryId: freezed == inventoryId
          ? _value.inventoryId
          : inventoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      action: freezed == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String?,
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String?,
      elapsed: freezed == elapsed
          ? _value.elapsed
          : elapsed // ignore: cast_nullable_to_non_nullable
              as double?,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      parsedData: freezed == parsedData
          ? _value.parsedData
          : parsedData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      account: freezed == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GameLogImplCopyWith<$Res> implements $GameLogCopyWith<$Res> {
  factory _$$GameLogImplCopyWith(
          _$GameLogImpl value, $Res Function(_$GameLogImpl) then) =
      __$$GameLogImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      DateTime timestamp,
      String logLevel,
      String logType,
      String? subType,
      String? playerId,
      String? playerName,
      int? requestId,
      String? entityId,
      String? entityName,
      String? entityClass,
      String? location,
      String? inventoryId,
      String? action,
      String? result,
      double? elapsed,
      String content,
      Map<String, dynamic>? parsedData,
      String? account});
}

/// @nodoc
class __$$GameLogImplCopyWithImpl<$Res>
    extends _$GameLogCopyWithImpl<$Res, _$GameLogImpl>
    implements _$$GameLogImplCopyWith<$Res> {
  __$$GameLogImplCopyWithImpl(
      _$GameLogImpl _value, $Res Function(_$GameLogImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? timestamp = null,
    Object? logLevel = null,
    Object? logType = null,
    Object? subType = freezed,
    Object? playerId = freezed,
    Object? playerName = freezed,
    Object? requestId = freezed,
    Object? entityId = freezed,
    Object? entityName = freezed,
    Object? entityClass = freezed,
    Object? location = freezed,
    Object? inventoryId = freezed,
    Object? action = freezed,
    Object? result = freezed,
    Object? elapsed = freezed,
    Object? content = null,
    Object? parsedData = freezed,
    Object? account = freezed,
  }) {
    return _then(_$GameLogImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      logLevel: null == logLevel
          ? _value.logLevel
          : logLevel // ignore: cast_nullable_to_non_nullable
              as String,
      logType: null == logType
          ? _value.logType
          : logType // ignore: cast_nullable_to_non_nullable
              as String,
      subType: freezed == subType
          ? _value.subType
          : subType // ignore: cast_nullable_to_non_nullable
              as String?,
      playerId: freezed == playerId
          ? _value.playerId
          : playerId // ignore: cast_nullable_to_non_nullable
              as String?,
      playerName: freezed == playerName
          ? _value.playerName
          : playerName // ignore: cast_nullable_to_non_nullable
              as String?,
      requestId: freezed == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as int?,
      entityId: freezed == entityId
          ? _value.entityId
          : entityId // ignore: cast_nullable_to_non_nullable
              as String?,
      entityName: freezed == entityName
          ? _value.entityName
          : entityName // ignore: cast_nullable_to_non_nullable
              as String?,
      entityClass: freezed == entityClass
          ? _value.entityClass
          : entityClass // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      inventoryId: freezed == inventoryId
          ? _value.inventoryId
          : inventoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      action: freezed == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String?,
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String?,
      elapsed: freezed == elapsed
          ? _value.elapsed
          : elapsed // ignore: cast_nullable_to_non_nullable
              as double?,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      parsedData: freezed == parsedData
          ? _value._parsedData
          : parsedData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      account: freezed == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$GameLogImpl implements _GameLog {
  const _$GameLogImpl(
      {this.id,
      required this.timestamp,
      required this.logLevel,
      required this.logType,
      this.subType,
      this.playerId,
      this.playerName,
      this.requestId,
      this.entityId,
      this.entityName,
      this.entityClass,
      this.location,
      this.inventoryId,
      this.action,
      this.result,
      this.elapsed,
      required this.content,
      final Map<String, dynamic>? parsedData,
      this.account})
      : _parsedData = parsedData;

  factory _$GameLogImpl.fromJson(Map<String, dynamic> json) =>
      _$$GameLogImplFromJson(json);

  @override
  final int? id;
// 自增主键，插入时为null
  @override
  final DateTime timestamp;
// 日志时间戳
  @override
  final String logLevel;
// 日志级别 (Notice, Warning, Error等)
  @override
  final String logType;
// 主类型 (StoreItem, InventoryManagement, AttachmentReceived等)
  @override
  final String? subType;
// 子类型 (Team_CoreGameplayFeatures, Team_ActorFeatures等)
  @override
  final String? playerId;
// 玩家ID
  @override
  final String? playerName;
// 玩家名称
  @override
  final int? requestId;
// 请求ID
  @override
  final String? entityId;
// 实体/物品ID
  @override
  final String? entityName;
// 实体/物品名称
  @override
  final String? entityClass;
// 实体类型 (如 behr_rifle_ballistic_01)
  @override
  final String? location;
// 位置信息 (inventory, port等)
  @override
  final String? inventoryId;
// 库存ID
  @override
  final String? action;
// 动作类型 (Store, Take, Attach等)
  @override
  final String? result;
// 操作结果 (Succeed, Failed等)
  @override
  final double? elapsed;
// 耗时（秒）
  @override
  final String content;
// 完整日志内容
  final Map<String, dynamic>? _parsedData;
// 完整日志内容
  @override
  Map<String, dynamic>? get parsedData {
    final value = _parsedData;
    if (value == null) return null;
    if (_parsedData is EqualUnmodifiableMapView) return _parsedData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

// 解析后的额外数据
  @override
  final String? account;

  @override
  String toString() {
    return 'GameLog(id: $id, timestamp: $timestamp, logLevel: $logLevel, logType: $logType, subType: $subType, playerId: $playerId, playerName: $playerName, requestId: $requestId, entityId: $entityId, entityName: $entityName, entityClass: $entityClass, location: $location, inventoryId: $inventoryId, action: $action, result: $result, elapsed: $elapsed, content: $content, parsedData: $parsedData, account: $account)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameLogImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.logLevel, logLevel) ||
                other.logLevel == logLevel) &&
            (identical(other.logType, logType) || other.logType == logType) &&
            (identical(other.subType, subType) || other.subType == subType) &&
            (identical(other.playerId, playerId) ||
                other.playerId == playerId) &&
            (identical(other.playerName, playerName) ||
                other.playerName == playerName) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId) &&
            (identical(other.entityId, entityId) ||
                other.entityId == entityId) &&
            (identical(other.entityName, entityName) ||
                other.entityName == entityName) &&
            (identical(other.entityClass, entityClass) ||
                other.entityClass == entityClass) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.inventoryId, inventoryId) ||
                other.inventoryId == inventoryId) &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.elapsed, elapsed) || other.elapsed == elapsed) &&
            (identical(other.content, content) || other.content == content) &&
            const DeepCollectionEquality()
                .equals(other._parsedData, _parsedData) &&
            (identical(other.account, account) || other.account == account));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        timestamp,
        logLevel,
        logType,
        subType,
        playerId,
        playerName,
        requestId,
        entityId,
        entityName,
        entityClass,
        location,
        inventoryId,
        action,
        result,
        elapsed,
        content,
        const DeepCollectionEquality().hash(_parsedData),
        account
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GameLogImplCopyWith<_$GameLogImpl> get copyWith =>
      __$$GameLogImplCopyWithImpl<_$GameLogImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GameLogImplToJson(
      this,
    );
  }
}

abstract class _GameLog implements GameLog {
  const factory _GameLog(
      {final int? id,
      required final DateTime timestamp,
      required final String logLevel,
      required final String logType,
      final String? subType,
      final String? playerId,
      final String? playerName,
      final int? requestId,
      final String? entityId,
      final String? entityName,
      final String? entityClass,
      final String? location,
      final String? inventoryId,
      final String? action,
      final String? result,
      final double? elapsed,
      required final String content,
      final Map<String, dynamic>? parsedData,
      final String? account}) = _$GameLogImpl;

  factory _GameLog.fromJson(Map<String, dynamic> json) = _$GameLogImpl.fromJson;

  @override
  int? get id;
  @override // 自增主键，插入时为null
  DateTime get timestamp;
  @override // 日志时间戳
  String get logLevel;
  @override // 日志级别 (Notice, Warning, Error等)
  String get logType;
  @override // 主类型 (StoreItem, InventoryManagement, AttachmentReceived等)
  String? get subType;
  @override // 子类型 (Team_CoreGameplayFeatures, Team_ActorFeatures等)
  String? get playerId;
  @override // 玩家ID
  String? get playerName;
  @override // 玩家名称
  int? get requestId;
  @override // 请求ID
  String? get entityId;
  @override // 实体/物品ID
  String? get entityName;
  @override // 实体/物品名称
  String? get entityClass;
  @override // 实体类型 (如 behr_rifle_ballistic_01)
  String? get location;
  @override // 位置信息 (inventory, port等)
  String? get inventoryId;
  @override // 库存ID
  String? get action;
  @override // 动作类型 (Store, Take, Attach等)
  String? get result;
  @override // 操作结果 (Succeed, Failed等)
  double? get elapsed;
  @override // 耗时（秒）
  String get content;
  @override // 完整日志内容
  Map<String, dynamic>? get parsedData;
  @override // 解析后的额外数据
  String? get account;
  @override
  @JsonKey(ignore: true)
  _$$GameLogImplCopyWith<_$GameLogImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
