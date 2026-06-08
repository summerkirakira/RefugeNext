// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shield_controller.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShieldController _$ShieldControllerFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ShieldController',
      json,
      ($checkedConvert) {
        final val = ShieldController(
          faceType: $checkedConvert('face_type', (v) => v as String?),
          maxReallocation: $checkedConvert(
            'max_reallocation',
            (v) => (v as num?)?.toDouble(),
          ),
          reconfigurationCooldown: $checkedConvert(
            'reconfiguration_cooldown',
            (v) => (v as num?)?.toDouble(),
          ),
          maxElectricalChargeDamageRate: $checkedConvert(
            'max_electrical_charge_damage_rate',
            (v) => (v as num?)?.toDouble(),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'faceType': 'face_type',
        'maxReallocation': 'max_reallocation',
        'reconfigurationCooldown': 'reconfiguration_cooldown',
        'maxElectricalChargeDamageRate': 'max_electrical_charge_damage_rate',
      },
    );

Map<String, dynamic> _$ShieldControllerToJson(
  ShieldController instance,
) => <String, dynamic>{
  'face_type': ?instance.faceType,
  'max_reallocation': ?instance.maxReallocation,
  'reconfiguration_cooldown': ?instance.reconfigurationCooldown,
  'max_electrical_charge_damage_rate': ?instance.maxElectricalChargeDamageRate,
};
