// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_vehicle_cooling.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameVehicleCooling _$GameVehicleCoolingFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'GameVehicleCooling',
  json,
  ($checkedConvert) {
    final val = GameVehicleCooling(
      generationSegments: $checkedConvert(
        'generation_segments',
        (v) => v as num?,
      ),
      usageShieldsPct: $checkedConvert('usage_shields_pct', (v) => v as num?),
      usageQuantumPct: $checkedConvert('usage_quantum_pct', (v) => v as num?),
      usedSegmentsShields: $checkedConvert(
        'used_segments_shields',
        (v) => v as num?,
      ),
      usedSegmentsQuantum: $checkedConvert(
        'used_segments_quantum',
        (v) => v as num?,
      ),
      usedSegmentsShieldsGrouped: $checkedConvert(
        'used_segments_shields_grouped',
        (v) => (v as List<dynamic>?)?.map((e) => e as num).toList(),
      ),
      usedSegmentsQuantumGrouped: $checkedConvert(
        'used_segments_quantum_grouped',
        (v) => (v as List<dynamic>?)?.map((e) => e as num).toList(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'generationSegments': 'generation_segments',
    'usageShieldsPct': 'usage_shields_pct',
    'usageQuantumPct': 'usage_quantum_pct',
    'usedSegmentsShields': 'used_segments_shields',
    'usedSegmentsQuantum': 'used_segments_quantum',
    'usedSegmentsShieldsGrouped': 'used_segments_shields_grouped',
    'usedSegmentsQuantumGrouped': 'used_segments_quantum_grouped',
  },
);

Map<String, dynamic> _$GameVehicleCoolingToJson(GameVehicleCooling instance) =>
    <String, dynamic>{
      'generation_segments': ?instance.generationSegments,
      'usage_shields_pct': ?instance.usageShieldsPct,
      'usage_quantum_pct': ?instance.usageQuantumPct,
      'used_segments_shields': ?instance.usedSegmentsShields,
      'used_segments_quantum': ?instance.usedSegmentsQuantum,
      'used_segments_shields_grouped': ?instance.usedSegmentsShieldsGrouped,
      'used_segments_quantum_grouped': ?instance.usedSegmentsQuantumGrouped,
    };
