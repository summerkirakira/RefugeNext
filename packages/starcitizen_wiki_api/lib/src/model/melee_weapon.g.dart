// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'melee_weapon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MeleeWeapon _$MeleeWeaponFromJson(Map<String, dynamic> json) => $checkedCreate(
  'MeleeWeapon',
  json,
  ($checkedConvert) {
    final val = MeleeWeapon(
      canBeUsedForTakeDown: $checkedConvert(
        'can_be_used_for_take_down',
        (v) => v as bool?,
      ),
      canBlock: $checkedConvert('can_block', (v) => v as bool?),
      canBeUsedInProne: $checkedConvert(
        'can_be_used_in_prone',
        (v) => v as bool?,
      ),
      canDodge: $checkedConvert('can_dodge', (v) => v as bool?),
      stanceTransitionMeleeDelay: $checkedConvert(
        'stance_transition_melee_delay',
        (v) => (v as num?)?.toDouble(),
      ),
      meleeCombatConfig: $checkedConvert(
        'melee_combat_config',
        (v) => v as String?,
      ),
      attackModes: $checkedConvert(
        'attack_modes',
        (v) => (v as List<dynamic>?)
            ?.map(
              (e) => MeleeWeaponAttackMode.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'canBeUsedForTakeDown': 'can_be_used_for_take_down',
    'canBlock': 'can_block',
    'canBeUsedInProne': 'can_be_used_in_prone',
    'canDodge': 'can_dodge',
    'stanceTransitionMeleeDelay': 'stance_transition_melee_delay',
    'meleeCombatConfig': 'melee_combat_config',
    'attackModes': 'attack_modes',
  },
);

Map<String, dynamic> _$MeleeWeaponToJson(MeleeWeapon instance) =>
    <String, dynamic>{
      'can_be_used_for_take_down': ?instance.canBeUsedForTakeDown,
      'can_block': ?instance.canBlock,
      'can_be_used_in_prone': ?instance.canBeUsedInProne,
      'can_dodge': ?instance.canDodge,
      'stance_transition_melee_delay': ?instance.stanceTransitionMeleeDelay,
      'melee_combat_config': ?instance.meleeCombatConfig,
      'attack_modes': ?instance.attackModes?.map((e) => e.toJson()).toList(),
    };
