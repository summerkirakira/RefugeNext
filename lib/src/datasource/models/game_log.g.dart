// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GameLogImpl _$$GameLogImplFromJson(Map<String, dynamic> json) =>
    _$GameLogImpl(
      id: (json['id'] as num?)?.toInt(),
      timestamp: DateTime.parse(json['timestamp'] as String),
      logLevel: json['log_level'] as String,
      logType: json['log_type'] as String,
      subType: json['sub_type'] as String?,
      playerId: json['player_id'] as String?,
      playerName: json['player_name'] as String?,
      requestId: (json['request_id'] as num?)?.toInt(),
      entityId: json['entity_id'] as String?,
      entityName: json['entity_name'] as String?,
      entityClass: json['entity_class'] as String?,
      location: json['location'] as String?,
      inventoryId: json['inventory_id'] as String?,
      action: json['action'] as String?,
      result: json['result'] as String?,
      elapsed: (json['elapsed'] as num?)?.toDouble(),
      content: json['content'] as String,
      parsedData: json['parsed_data'] as Map<String, dynamic>?,
      account: json['account'] as String?,
    );

Map<String, dynamic> _$$GameLogImplToJson(_$GameLogImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'timestamp': instance.timestamp.toIso8601String(),
      'log_level': instance.logLevel,
      'log_type': instance.logType,
      'sub_type': instance.subType,
      'player_id': instance.playerId,
      'player_name': instance.playerName,
      'request_id': instance.requestId,
      'entity_id': instance.entityId,
      'entity_name': instance.entityName,
      'entity_class': instance.entityClass,
      'location': instance.location,
      'inventory_id': instance.inventoryId,
      'action': instance.action,
      'result': instance.result,
      'elapsed': instance.elapsed,
      'content': instance.content,
      'parsed_data': instance.parsedData,
      'account': instance.account,
    };
