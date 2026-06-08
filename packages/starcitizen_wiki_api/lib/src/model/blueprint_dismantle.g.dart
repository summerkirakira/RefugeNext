// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blueprint_dismantle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlueprintDismantle _$BlueprintDismantleFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'BlueprintDismantle',
  json,
  ($checkedConvert) {
    final val = BlueprintDismantle(
      timeSeconds: $checkedConvert('time_seconds', (v) => (v as num?)?.toInt()),
      timeLabel: $checkedConvert('time_label', (v) => v as String?),
      efficiency: $checkedConvert('efficiency', (v) => (v as num?)?.toDouble()),
    );
    return val;
  },
  fieldKeyMap: const {'timeSeconds': 'time_seconds', 'timeLabel': 'time_label'},
);

Map<String, dynamic> _$BlueprintDismantleToJson(BlueprintDismantle instance) =>
    <String, dynamic>{
      'time_seconds': ?instance.timeSeconds,
      'time_label': ?instance.timeLabel,
      'efficiency': ?instance.efficiency,
    };
