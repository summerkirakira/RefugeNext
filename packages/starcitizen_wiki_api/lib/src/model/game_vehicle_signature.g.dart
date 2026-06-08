// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_vehicle_signature.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameVehicleSignature _$GameVehicleSignatureFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'GameVehicleSignature',
  json,
  ($checkedConvert) {
    final val = GameVehicleSignature(
      irQuantum: $checkedConvert('ir_quantum', (v) => v as num?),
      irShields: $checkedConvert('ir_shields', (v) => v as num?),
      emQuantum: $checkedConvert('em_quantum', (v) => v as num?),
      emShields: $checkedConvert('em_shields', (v) => v as num?),
      emGroupsQuantum: $checkedConvert(
        'em_groups_quantum',
        (v) => (v as List<dynamic>?)?.map((e) => e as num).toList(),
      ),
      emGroupsShields: $checkedConvert(
        'em_groups_shields',
        (v) => (v as List<dynamic>?)?.map((e) => e as num).toList(),
      ),
      emSegmentGroupsQuantum: $checkedConvert(
        'em_segment_groups_quantum',
        (v) => (v as List<dynamic>?)?.map((e) => e as num).toList(),
      ),
      emSegmentGroupsShields: $checkedConvert(
        'em_segment_groups_shields',
        (v) => (v as List<dynamic>?)?.map((e) => e as num).toList(),
      ),
      emPerSegment: $checkedConvert('em_per_segment', (v) => v as num?),
    );
    return val;
  },
  fieldKeyMap: const {
    'irQuantum': 'ir_quantum',
    'irShields': 'ir_shields',
    'emQuantum': 'em_quantum',
    'emShields': 'em_shields',
    'emGroupsQuantum': 'em_groups_quantum',
    'emGroupsShields': 'em_groups_shields',
    'emSegmentGroupsQuantum': 'em_segment_groups_quantum',
    'emSegmentGroupsShields': 'em_segment_groups_shields',
    'emPerSegment': 'em_per_segment',
  },
);

Map<String, dynamic> _$GameVehicleSignatureToJson(
  GameVehicleSignature instance,
) => <String, dynamic>{
  'ir_quantum': ?instance.irQuantum,
  'ir_shields': ?instance.irShields,
  'em_quantum': ?instance.emQuantum,
  'em_shields': ?instance.emShields,
  'em_groups_quantum': ?instance.emGroupsQuantum,
  'em_groups_shields': ?instance.emGroupsShields,
  'em_segment_groups_quantum': ?instance.emSegmentGroupsQuantum,
  'em_segment_groups_shields': ?instance.emSegmentGroupsShields,
  'em_per_segment': ?instance.emPerSegment,
};
