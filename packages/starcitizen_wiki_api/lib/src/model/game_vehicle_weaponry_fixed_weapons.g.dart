// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_vehicle_weaponry_fixed_weapons.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameVehicleWeaponryFixedWeapons _$GameVehicleWeaponryFixedWeaponsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'GameVehicleWeaponryFixedWeapons',
  json,
  ($checkedConvert) {
    final val = GameVehicleWeaponryFixedWeapons(
      dpsTotal: $checkedConvert('dps_total', (v) => v as num?),
      sustainedDpsTotal: $checkedConvert(
        'sustained_dps_total',
        (v) => v as num?,
      ),
      alphaTotal: $checkedConvert('alpha_total', (v) => v as num?),
      weapons: $checkedConvert(
        'weapons',
        (v) => (v as List<dynamic>?)
            ?.map(
              (e) => GameVehicleWeaponryFixedWeaponsWeaponsInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'dpsTotal': 'dps_total',
    'sustainedDpsTotal': 'sustained_dps_total',
    'alphaTotal': 'alpha_total',
  },
);

Map<String, dynamic> _$GameVehicleWeaponryFixedWeaponsToJson(
  GameVehicleWeaponryFixedWeapons instance,
) => <String, dynamic>{
  'dps_total': ?instance.dpsTotal,
  'sustained_dps_total': ?instance.sustainedDpsTotal,
  'alpha_total': ?instance.alphaTotal,
  'weapons': ?instance.weapons?.map((e) => e.toJson()).toList(),
};
