// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hangar_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HangarLogImpl _$$HangarLogImplFromJson(Map<String, dynamic> json) =>
    _$HangarLogImpl(
      id: json['id'] as String,
      time: (json['time'] as num).toInt(),
      type: json['type'] as String,
      name: json['name'] as String,
      chineseName: json['chinese_name'] as String?,
      price: (json['price'] as num?)?.toInt(),
      source: json['source'] as String?,
      target: json['target'] as String?,
      operator: json['operator'] as String?,
      reason: json['reason'] as String?,
      order: json['order'] as String?,
      insertTime: (json['insert_time'] as num).toInt(),
    );

Map<String, dynamic> _$$HangarLogImplToJson(_$HangarLogImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'time': instance.time,
      'type': instance.type,
      'name': instance.name,
      'chinese_name': instance.chineseName,
      'price': instance.price,
      'source': instance.source,
      'target': instance.target,
      'operator': instance.operator,
      'reason': instance.reason,
      'order': instance.order,
      'insert_time': instance.insertTime,
    };
