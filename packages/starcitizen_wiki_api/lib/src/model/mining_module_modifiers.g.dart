// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mining_module_modifiers.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MiningModuleModifiers _$MiningModuleModifiersFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'MiningModuleModifiers',
  json,
  ($checkedConvert) {
    final val = MiningModuleModifiers(
      miningLaserPowerPercent: $checkedConvert(
        'mining_laser_power_percent',
        (v) => (v as num?)?.toDouble(),
      ),
      extractionLaserPowerPercent: $checkedConvert(
        'extraction_laser_power_percent',
        (v) => (v as num?)?.toDouble(),
      ),
      optimalChargeWindowPercent: $checkedConvert(
        'optimal_charge_window_percent',
        (v) => (v as num?)?.toDouble(),
      ),
      optimalChargeRatePercent: $checkedConvert(
        'optimal_charge_rate_percent',
        (v) => (v as num?)?.toDouble(),
      ),
      allChargeRatesPercent: $checkedConvert(
        'all_charge_rates_percent',
        (v) => (v as num?)?.toDouble(),
      ),
      inertMaterialModifierPercent: $checkedConvert(
        'inert_material_modifier_percent',
        (v) => (v as num?)?.toDouble(),
      ),
      resistancePercent: $checkedConvert(
        'resistance_percent',
        (v) => (v as num?)?.toDouble(),
      ),
      instabilityPercent: $checkedConvert(
        'instability_percent',
        (v) => (v as num?)?.toDouble(),
      ),
      shatterDamagePercent: $checkedConvert(
        'shatter_damage_percent',
        (v) => (v as num?)?.toDouble(),
      ),
      overchargeRatePercent: $checkedConvert(
        'overcharge_rate_percent',
        (v) => (v as num?)?.toDouble(),
      ),
      clusterFactor: $checkedConvert(
        'cluster_factor',
        (v) => (v as num?)?.toDouble(),
      ),
      damageMultiplier: $checkedConvert(
        'damage_multiplier',
        (v) => (v as num?)?.toDouble(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'miningLaserPowerPercent': 'mining_laser_power_percent',
    'extractionLaserPowerPercent': 'extraction_laser_power_percent',
    'optimalChargeWindowPercent': 'optimal_charge_window_percent',
    'optimalChargeRatePercent': 'optimal_charge_rate_percent',
    'allChargeRatesPercent': 'all_charge_rates_percent',
    'inertMaterialModifierPercent': 'inert_material_modifier_percent',
    'resistancePercent': 'resistance_percent',
    'instabilityPercent': 'instability_percent',
    'shatterDamagePercent': 'shatter_damage_percent',
    'overchargeRatePercent': 'overcharge_rate_percent',
    'clusterFactor': 'cluster_factor',
    'damageMultiplier': 'damage_multiplier',
  },
);

Map<String, dynamic> _$MiningModuleModifiersToJson(
  MiningModuleModifiers instance,
) => <String, dynamic>{
  'mining_laser_power_percent': ?instance.miningLaserPowerPercent,
  'extraction_laser_power_percent': ?instance.extractionLaserPowerPercent,
  'optimal_charge_window_percent': ?instance.optimalChargeWindowPercent,
  'optimal_charge_rate_percent': ?instance.optimalChargeRatePercent,
  'all_charge_rates_percent': ?instance.allChargeRatesPercent,
  'inert_material_modifier_percent': ?instance.inertMaterialModifierPercent,
  'resistance_percent': ?instance.resistancePercent,
  'instability_percent': ?instance.instabilityPercent,
  'shatter_damage_percent': ?instance.shatterDamagePercent,
  'overcharge_rate_percent': ?instance.overchargeRatePercent,
  'cluster_factor': ?instance.clusterFactor,
  'damage_multiplier': ?instance.damageMultiplier,
};
