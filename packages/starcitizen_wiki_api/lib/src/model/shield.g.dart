// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shield.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Shield _$ShieldFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Shield',
  json,
  ($checkedConvert) {
    final val = Shield(
      maxHealth: $checkedConvert('max_health', (v) => (v as num?)?.toDouble()),
      regenRate: $checkedConvert('regen_rate', (v) => (v as num?)?.toDouble()),
      regenTime: $checkedConvert('regen_time', (v) => (v as num?)?.toDouble()),
      decayRatio: $checkedConvert(
        'decay_ratio',
        (v) => (v as num?)?.toDouble(),
      ),
      reservePool: $checkedConvert(
        'reserve_pool',
        (v) => v == null
            ? null
            : ShieldReservePool.fromJson(v as Map<String, dynamic>),
      ),
      regenDelay: $checkedConvert(
        'regen_delay',
        (v) => v == null
            ? null
            : ShieldRegenDelay.fromJson(v as Map<String, dynamic>),
      ),
      electricalChargeDamageResistance: $checkedConvert(
        'electrical_charge_damage_resistance',
        (v) => (v as num?)?.toDouble(),
      ),
      absorption: $checkedConvert(
        'absorption',
        (v) => v == null
            ? null
            : ShieldDamageMap.fromJson(v as Map<String, dynamic>),
      ),
      resistance: $checkedConvert(
        'resistance',
        (v) => v == null
            ? null
            : ShieldDamageMap.fromJson(v as Map<String, dynamic>),
      ),
      maxShieldHealth: $checkedConvert(
        'max_shield_health',
        (v) => (v as num?)?.toDouble(),
      ),
      maxShieldRegen: $checkedConvert(
        'max_shield_regen',
        (v) => (v as num?)?.toDouble(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'maxHealth': 'max_health',
    'regenRate': 'regen_rate',
    'regenTime': 'regen_time',
    'decayRatio': 'decay_ratio',
    'reservePool': 'reserve_pool',
    'regenDelay': 'regen_delay',
    'electricalChargeDamageResistance': 'electrical_charge_damage_resistance',
    'maxShieldHealth': 'max_shield_health',
    'maxShieldRegen': 'max_shield_regen',
  },
);

Map<String, dynamic> _$ShieldToJson(Shield instance) => <String, dynamic>{
  'max_health': ?instance.maxHealth,
  'regen_rate': ?instance.regenRate,
  'regen_time': ?instance.regenTime,
  'decay_ratio': ?instance.decayRatio,
  'reserve_pool': ?instance.reservePool?.toJson(),
  'regen_delay': ?instance.regenDelay?.toJson(),
  'electrical_charge_damage_resistance':
      ?instance.electricalChargeDamageResistance,
  'absorption': ?instance.absorption?.toJson(),
  'resistance': ?instance.resistance?.toJson(),
  'max_shield_health': ?instance.maxShieldHealth,
  'max_shield_regen': ?instance.maxShieldRegen,
};
