// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ammunition_bullet_electron.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AmmunitionBulletElectron _$AmmunitionBulletElectronFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'AmmunitionBulletElectron',
  json,
  ($checkedConvert) {
    final val = AmmunitionBulletElectron(
      jumpRange: $checkedConvert('jump_range', (v) => (v as num?)?.toDouble()),
      maximumJumps: $checkedConvert(
        'maximum_jumps',
        (v) => (v as num?)?.toInt(),
      ),
      residualChargeMultiplier: $checkedConvert(
        'residual_charge_multiplier',
        (v) => (v as num?)?.toDouble(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'jumpRange': 'jump_range',
    'maximumJumps': 'maximum_jumps',
    'residualChargeMultiplier': 'residual_charge_multiplier',
  },
);

Map<String, dynamic> _$AmmunitionBulletElectronToJson(
  AmmunitionBulletElectron instance,
) => <String, dynamic>{
  'jump_range': ?instance.jumpRange,
  'maximum_jumps': ?instance.maximumJumps,
  'residual_charge_multiplier': ?instance.residualChargeMultiplier,
};
