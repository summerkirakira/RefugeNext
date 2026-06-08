// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_weapon_mode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonalWeaponMode _$PersonalWeaponModeFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'PersonalWeaponMode',
  json,
  ($checkedConvert) {
    final val = PersonalWeaponMode(
      mode: $checkedConvert('mode', (v) => v as String?),
      localised: $checkedConvert('localised', (v) => v as String?),
      type: $checkedConvert('type', (v) => v as String?),
      rpm: $checkedConvert('rpm', (v) => (v as num?)?.toDouble()),
      ammoPerShot: $checkedConvert(
        'ammo_per_shot',
        (v) => (v as num?)?.toInt(),
      ),
      pelletsPerShot: $checkedConvert(
        'pellets_per_shot',
        (v) => (v as num?)?.toInt(),
      ),
      damagePerSecond: $checkedConvert(
        'damage_per_second',
        (v) => (v as num?)?.toDouble(),
      ),
      heatPerShot: $checkedConvert(
        'heat_per_shot',
        (v) => (v as num?)?.toDouble(),
      ),
      wearPerShot: $checkedConvert(
        'wear_per_shot',
        (v) => (v as num?)?.toDouble(),
      ),
      heatPerSecond: $checkedConvert(
        'heat_per_second',
        (v) => (v as num?)?.toDouble(),
      ),
      wearPerSecond: $checkedConvert(
        'wear_per_second',
        (v) => (v as num?)?.toDouble(),
      ),
      fireDuringSpinUp: $checkedConvert(
        'fire_during_spin_up',
        (v) => v as bool?,
      ),
      shotCount: $checkedConvert('shot_count', (v) => (v as num?)?.toInt()),
      cooldownTime: $checkedConvert(
        'cooldown_time',
        (v) => (v as num?)?.toDouble(),
      ),
      sequenceMode: $checkedConvert('sequence_mode', (v) => v as String?),
      chargeUpTime: $checkedConvert(
        'charge_up_time',
        (v) => (v as num?)?.toDouble(),
      ),
      chargeDownTime: $checkedConvert(
        'charge_down_time',
        (v) => (v as num?)?.toDouble(),
      ),
      fullDamageRange: $checkedConvert(
        'full_damage_range',
        (v) => (v as num?)?.toDouble(),
      ),
      zeroDamageRange: $checkedConvert(
        'zero_damage_range',
        (v) => (v as num?)?.toDouble(),
      ),
      hitType: $checkedConvert('hit_type', (v) => v as String?),
      hitRadius: $checkedConvert('hit_radius', (v) => (v as num?)?.toDouble()),
      minEnergyDraw: $checkedConvert(
        'min_energy_draw',
        (v) => (v as num?)?.toDouble(),
      ),
      maxEnergyDraw: $checkedConvert(
        'max_energy_draw',
        (v) => (v as num?)?.toDouble(),
      ),
      healingMode: $checkedConvert('healing_mode', (v) => v as String?),
      healingPerSecond: $checkedConvert(
        'healing_per_second',
        (v) => (v as num?)?.toDouble(),
      ),
      ammoPerMscu: $checkedConvert(
        'ammo_per_mscu',
        (v) => (v as num?)?.toDouble(),
      ),
      medicalAmmoType: $checkedConvert(
        'medical_ammo_type',
        (v) => v as String?,
      ),
      externalHealing: $checkedConvert('external_healing', (v) => v as String?),
      toggle: $checkedConvert('toggle', (v) => v as bool?),
      maxDistance: $checkedConvert(
        'max_distance',
        (v) => (v as num?)?.toDouble(),
      ),
      maxSensorDistance: $checkedConvert(
        'max_sensor_distance',
        (v) => (v as num?)?.toDouble(),
      ),
      autoDosageModifier: $checkedConvert(
        'auto_dosage_modifier',
        (v) => (v as num?)?.toDouble(),
      ),
      healingBreakTime: $checkedConvert(
        'healing_break_time',
        (v) => (v as num?)?.toDouble(),
      ),
      maxDoseForAutoAdjustment: $checkedConvert(
        'max_dose_for_auto_adjustment',
        (v) => (v as num?)?.toDouble(),
      ),
      batteryDrainPerSecond: $checkedConvert(
        'battery_drain_per_second',
        (v) => (v as num?)?.toDouble(),
      ),
      materialEfficiency: $checkedConvert(
        'material_efficiency',
        (v) => (v as num?)?.toDouble(),
      ),
      maxHealthRepairRate: $checkedConvert(
        'max_health_repair_rate',
        (v) => (v as num?)?.toDouble(),
      ),
      maxDamageMapRepairRate: $checkedConvert(
        'max_damage_map_repair_rate',
        (v) => (v as num?)?.toDouble(),
      ),
      healthToAmmoRatio: $checkedConvert(
        'health_to_ammo_ratio',
        (v) => (v as num?)?.toDouble(),
      ),
      rampUpTime: $checkedConvert(
        'ramp_up_time',
        (v) => (v as num?)?.toDouble(),
      ),
      rampDownTime: $checkedConvert(
        'ramp_down_time',
        (v) => (v as num?)?.toDouble(),
      ),
      maxVehicleDamageRatio: $checkedConvert(
        'max_vehicle_damage_ratio',
        (v) => (v as num?)?.toDouble(),
      ),
      repairedMaterialRatio: $checkedConvert(
        'repaired_material_ratio',
        (v) => (v as num?)?.toDouble(),
      ),
      salvageCanFireOnFull: $checkedConvert(
        'salvage_can_fire_on_full',
        (v) => v as bool?,
      ),
      damageThreshold: $checkedConvert(
        'damage_threshold',
        (v) => (v as num?)?.toDouble(),
      ),
      minimumDistance: $checkedConvert(
        'minimum_distance',
        (v) => (v as num?)?.toDouble(),
      ),
      maximumDistance: $checkedConvert(
        'maximum_distance',
        (v) => (v as num?)?.toDouble(),
      ),
      beamRadius: $checkedConvert(
        'beam_radius',
        (v) => (v as num?)?.toDouble(),
      ),
      collectionRate: $checkedConvert(
        'collection_rate',
        (v) => (v as num?)?.toDouble(),
      ),
      energyDraw: $checkedConvert(
        'energy_draw',
        (v) => (v as num?)?.toDouble(),
      ),
      miningExtractorTag: $checkedConvert(
        'mining_extractor_tag',
        (v) => v as String?,
      ),
      toggleMode: $checkedConvert('toggle_mode', (v) => v as bool?),
    );
    return val;
  },
  fieldKeyMap: const {
    'ammoPerShot': 'ammo_per_shot',
    'pelletsPerShot': 'pellets_per_shot',
    'damagePerSecond': 'damage_per_second',
    'heatPerShot': 'heat_per_shot',
    'wearPerShot': 'wear_per_shot',
    'heatPerSecond': 'heat_per_second',
    'wearPerSecond': 'wear_per_second',
    'fireDuringSpinUp': 'fire_during_spin_up',
    'shotCount': 'shot_count',
    'cooldownTime': 'cooldown_time',
    'sequenceMode': 'sequence_mode',
    'chargeUpTime': 'charge_up_time',
    'chargeDownTime': 'charge_down_time',
    'fullDamageRange': 'full_damage_range',
    'zeroDamageRange': 'zero_damage_range',
    'hitType': 'hit_type',
    'hitRadius': 'hit_radius',
    'minEnergyDraw': 'min_energy_draw',
    'maxEnergyDraw': 'max_energy_draw',
    'healingMode': 'healing_mode',
    'healingPerSecond': 'healing_per_second',
    'ammoPerMscu': 'ammo_per_mscu',
    'medicalAmmoType': 'medical_ammo_type',
    'externalHealing': 'external_healing',
    'maxDistance': 'max_distance',
    'maxSensorDistance': 'max_sensor_distance',
    'autoDosageModifier': 'auto_dosage_modifier',
    'healingBreakTime': 'healing_break_time',
    'maxDoseForAutoAdjustment': 'max_dose_for_auto_adjustment',
    'batteryDrainPerSecond': 'battery_drain_per_second',
    'materialEfficiency': 'material_efficiency',
    'maxHealthRepairRate': 'max_health_repair_rate',
    'maxDamageMapRepairRate': 'max_damage_map_repair_rate',
    'healthToAmmoRatio': 'health_to_ammo_ratio',
    'rampUpTime': 'ramp_up_time',
    'rampDownTime': 'ramp_down_time',
    'maxVehicleDamageRatio': 'max_vehicle_damage_ratio',
    'repairedMaterialRatio': 'repaired_material_ratio',
    'salvageCanFireOnFull': 'salvage_can_fire_on_full',
    'damageThreshold': 'damage_threshold',
    'minimumDistance': 'minimum_distance',
    'maximumDistance': 'maximum_distance',
    'beamRadius': 'beam_radius',
    'collectionRate': 'collection_rate',
    'energyDraw': 'energy_draw',
    'miningExtractorTag': 'mining_extractor_tag',
    'toggleMode': 'toggle_mode',
  },
);

Map<String, dynamic> _$PersonalWeaponModeToJson(PersonalWeaponMode instance) =>
    <String, dynamic>{
      'mode': ?instance.mode,
      'localised': ?instance.localised,
      'type': ?instance.type,
      'rpm': ?instance.rpm,
      'ammo_per_shot': ?instance.ammoPerShot,
      'pellets_per_shot': ?instance.pelletsPerShot,
      'damage_per_second': ?instance.damagePerSecond,
      'heat_per_shot': ?instance.heatPerShot,
      'wear_per_shot': ?instance.wearPerShot,
      'heat_per_second': ?instance.heatPerSecond,
      'wear_per_second': ?instance.wearPerSecond,
      'fire_during_spin_up': ?instance.fireDuringSpinUp,
      'shot_count': ?instance.shotCount,
      'cooldown_time': ?instance.cooldownTime,
      'sequence_mode': ?instance.sequenceMode,
      'charge_up_time': ?instance.chargeUpTime,
      'charge_down_time': ?instance.chargeDownTime,
      'full_damage_range': ?instance.fullDamageRange,
      'zero_damage_range': ?instance.zeroDamageRange,
      'hit_type': ?instance.hitType,
      'hit_radius': ?instance.hitRadius,
      'min_energy_draw': ?instance.minEnergyDraw,
      'max_energy_draw': ?instance.maxEnergyDraw,
      'healing_mode': ?instance.healingMode,
      'healing_per_second': ?instance.healingPerSecond,
      'ammo_per_mscu': ?instance.ammoPerMscu,
      'medical_ammo_type': ?instance.medicalAmmoType,
      'external_healing': ?instance.externalHealing,
      'toggle': ?instance.toggle,
      'max_distance': ?instance.maxDistance,
      'max_sensor_distance': ?instance.maxSensorDistance,
      'auto_dosage_modifier': ?instance.autoDosageModifier,
      'healing_break_time': ?instance.healingBreakTime,
      'max_dose_for_auto_adjustment': ?instance.maxDoseForAutoAdjustment,
      'battery_drain_per_second': ?instance.batteryDrainPerSecond,
      'material_efficiency': ?instance.materialEfficiency,
      'max_health_repair_rate': ?instance.maxHealthRepairRate,
      'max_damage_map_repair_rate': ?instance.maxDamageMapRepairRate,
      'health_to_ammo_ratio': ?instance.healthToAmmoRatio,
      'ramp_up_time': ?instance.rampUpTime,
      'ramp_down_time': ?instance.rampDownTime,
      'max_vehicle_damage_ratio': ?instance.maxVehicleDamageRatio,
      'repaired_material_ratio': ?instance.repairedMaterialRatio,
      'salvage_can_fire_on_full': ?instance.salvageCanFireOnFull,
      'damage_threshold': ?instance.damageThreshold,
      'minimum_distance': ?instance.minimumDistance,
      'maximum_distance': ?instance.maximumDistance,
      'beam_radius': ?instance.beamRadius,
      'collection_rate': ?instance.collectionRate,
      'energy_draw': ?instance.energyDraw,
      'mining_extractor_tag': ?instance.miningExtractorTag,
      'toggle_mode': ?instance.toggleMode,
    };
