// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_vehicle_shield.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameVehicleShield _$GameVehicleShieldFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'GameVehicleShield',
  json,
  ($checkedConvert) {
    final val = GameVehicleShield(
      hp: $checkedConvert('hp', (v) => v as num?),
      regeneration: $checkedConvert('regeneration', (v) => v as num?),
      regenerationTime: $checkedConvert('regeneration_time', (v) => v as num?),
      faceType: $checkedConvert('face_type', (v) => v as String?),
      maxReallocation: $checkedConvert('max_reallocation', (v) => v as num?),
      reconfigurationCooldown: $checkedConvert(
        'reconfiguration_cooldown',
        (v) => v as num?,
      ),
      maxElectricalChargeDamageRate: $checkedConvert(
        'max_electrical_charge_damage_rate',
        (v) => v as num?,
      ),
      resistance: $checkedConvert(
        'resistance',
        (v) => v == null
            ? null
            : GameVehicleShieldResistance.fromJson(v as Map<String, dynamic>),
      ),
      absorption: $checkedConvert(
        'absorption',
        (v) => v == null
            ? null
            : GameVehicleShieldAbsorption.fromJson(v as Map<String, dynamic>),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'regenerationTime': 'regeneration_time',
    'faceType': 'face_type',
    'maxReallocation': 'max_reallocation',
    'reconfigurationCooldown': 'reconfiguration_cooldown',
    'maxElectricalChargeDamageRate': 'max_electrical_charge_damage_rate',
  },
);

Map<String, dynamic> _$GameVehicleShieldToJson(
  GameVehicleShield instance,
) => <String, dynamic>{
  'hp': ?instance.hp,
  'regeneration': ?instance.regeneration,
  'regeneration_time': ?instance.regenerationTime,
  'face_type': ?instance.faceType,
  'max_reallocation': ?instance.maxReallocation,
  'reconfiguration_cooldown': ?instance.reconfigurationCooldown,
  'max_electrical_charge_damage_rate': ?instance.maxElectricalChargeDamageRate,
  'resistance': ?instance.resistance?.toJson(),
  'absorption': ?instance.absorption?.toJson(),
};
