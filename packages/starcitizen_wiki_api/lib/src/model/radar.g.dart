// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'radar.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Radar _$RadarFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Radar',
  json,
  ($checkedConvert) {
    final val = Radar(
      detectionLifetime: $checkedConvert(
        'detection_lifetime',
        (v) => (v as num?)?.toDouble(),
      ),
      altitudeCeiling: $checkedConvert(
        'altitude_ceiling',
        (v) => (v as num?)?.toDouble(),
      ),
      enableCrossSectionOcclusion: $checkedConvert(
        'enable_cross_section_occlusion',
        (v) => v as bool?,
      ),
      cooldown: $checkedConvert('cooldown', (v) => (v as num?)?.toDouble()),
      sensitivity: $checkedConvert(
        'sensitivity',
        (v) => v == null
            ? null
            : RadarSensitivityBlock.fromJson(v as Map<String, dynamic>),
      ),
      groundVehicleSensitivity: $checkedConvert(
        'ground_vehicle_sensitivity',
        (v) => v == null
            ? null
            : RadarSensitivityBlock.fromJson(v as Map<String, dynamic>),
      ),
      piercing: $checkedConvert(
        'piercing',
        (v) => v == null
            ? null
            : RadarSensitivityBlock.fromJson(v as Map<String, dynamic>),
      ),
      aimAssist: $checkedConvert(
        'aim_assist',
        (v) => v == null
            ? null
            : RadarAimAssistBlock.fromJson(v as Map<String, dynamic>),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'detectionLifetime': 'detection_lifetime',
    'altitudeCeiling': 'altitude_ceiling',
    'enableCrossSectionOcclusion': 'enable_cross_section_occlusion',
    'groundVehicleSensitivity': 'ground_vehicle_sensitivity',
    'aimAssist': 'aim_assist',
  },
);

Map<String, dynamic> _$RadarToJson(Radar instance) => <String, dynamic>{
  'detection_lifetime': ?instance.detectionLifetime,
  'altitude_ceiling': ?instance.altitudeCeiling,
  'enable_cross_section_occlusion': ?instance.enableCrossSectionOcclusion,
  'cooldown': ?instance.cooldown,
  'sensitivity': ?instance.sensitivity?.toJson(),
  'ground_vehicle_sensitivity': ?instance.groundVehicleSensitivity?.toJson(),
  'piercing': ?instance.piercing?.toJson(),
  'aim_assist': ?instance.aimAssist?.toJson(),
};
