// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_vehicle_weaponry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameVehicleWeaponry _$GameVehicleWeaponryFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'GameVehicleWeaponry',
      json,
      ($checkedConvert) {
        final val = GameVehicleWeaponry(
          pilotDps: $checkedConvert('pilot_dps', (v) => v as num?),
          pilotAlpha: $checkedConvert('pilot_alpha', (v) => v as num?),
          pilotSustainedDps: $checkedConvert(
            'pilot_sustained_dps',
            (v) => v as num?,
          ),
          turretDps: $checkedConvert('turret_dps', (v) => v as num?),
          turretAlpha: $checkedConvert('turret_alpha', (v) => v as num?),
          turretSustainedDps: $checkedConvert(
            'turret_sustained_dps',
            (v) => v as num?,
          ),
          fixedWeapons: $checkedConvert(
            'fixed_weapons',
            (v) => v == null
                ? null
                : GameVehicleWeaponryFixedWeapons.fromJson(
                    v as Map<String, dynamic>,
                  ),
          ),
          missiles: $checkedConvert(
            'missiles',
            (v) => v == null
                ? null
                : GameVehicleWeaponryMissiles.fromJson(
                    v as Map<String, dynamic>,
                  ),
          ),
          totalMissileDamage: $checkedConvert(
            'total_missile_damage',
            (v) => (v as num?)?.toInt(),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'pilotDps': 'pilot_dps',
        'pilotAlpha': 'pilot_alpha',
        'pilotSustainedDps': 'pilot_sustained_dps',
        'turretDps': 'turret_dps',
        'turretAlpha': 'turret_alpha',
        'turretSustainedDps': 'turret_sustained_dps',
        'fixedWeapons': 'fixed_weapons',
        'totalMissileDamage': 'total_missile_damage',
      },
    );

Map<String, dynamic> _$GameVehicleWeaponryToJson(
  GameVehicleWeaponry instance,
) => <String, dynamic>{
  'pilot_dps': ?instance.pilotDps,
  'pilot_alpha': ?instance.pilotAlpha,
  'pilot_sustained_dps': ?instance.pilotSustainedDps,
  'turret_dps': ?instance.turretDps,
  'turret_alpha': ?instance.turretAlpha,
  'turret_sustained_dps': ?instance.turretSustainedDps,
  'fixed_weapons': ?instance.fixedWeapons?.toJson(),
  'missiles': ?instance.missiles?.toJson(),
  'total_missile_damage': ?instance.totalMissileDamage,
};
