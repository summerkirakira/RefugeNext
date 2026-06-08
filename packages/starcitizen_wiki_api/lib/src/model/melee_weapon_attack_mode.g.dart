// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'melee_weapon_attack_mode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MeleeWeaponAttackMode _$MeleeWeaponAttackModeFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'MeleeWeaponAttackMode',
  json,
  ($checkedConvert) {
    final val = MeleeWeaponAttackMode(
      category: $checkedConvert('category', (v) => v as String?),
      damage: $checkedConvert('damage', (v) => (v as num?)?.toDouble()),
      stunRecoveryModifier: $checkedConvert(
        'stun_recovery_modifier',
        (v) => (v as num?)?.toDouble(),
      ),
      blockStunReductionModifier: $checkedConvert(
        'block_stun_reduction_modifier',
        (v) => (v as num?)?.toDouble(),
      ),
      blockStunStaminaModifier: $checkedConvert(
        'block_stun_stamina_modifier',
        (v) => (v as num?)?.toDouble(),
      ),
      attackImpulse: $checkedConvert(
        'attack_impulse',
        (v) => (v as num?)?.toDouble(),
      ),
      ignoreBodyPartImpulseScale: $checkedConvert(
        'ignore_body_part_impulse_scale',
        (v) => v as bool?,
      ),
      forceKnockdown: $checkedConvert('force_knockdown', (v) => v as String?),
      damages: $checkedConvert(
        'damages',
        (v) => v == null
            ? null
            : MeleeWeaponAttackDamages.fromJson(v as Map<String, dynamic>),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'stunRecoveryModifier': 'stun_recovery_modifier',
    'blockStunReductionModifier': 'block_stun_reduction_modifier',
    'blockStunStaminaModifier': 'block_stun_stamina_modifier',
    'attackImpulse': 'attack_impulse',
    'ignoreBodyPartImpulseScale': 'ignore_body_part_impulse_scale',
    'forceKnockdown': 'force_knockdown',
  },
);

Map<String, dynamic> _$MeleeWeaponAttackModeToJson(
  MeleeWeaponAttackMode instance,
) => <String, dynamic>{
  'category': ?instance.category,
  'damage': ?instance.damage,
  'stun_recovery_modifier': ?instance.stunRecoveryModifier,
  'block_stun_reduction_modifier': ?instance.blockStunReductionModifier,
  'block_stun_stamina_modifier': ?instance.blockStunStaminaModifier,
  'attack_impulse': ?instance.attackImpulse,
  'ignore_body_part_impulse_scale': ?instance.ignoreBodyPartImpulseScale,
  'force_knockdown': ?instance.forceKnockdown,
  'damages': ?instance.damages?.toJson(),
};
