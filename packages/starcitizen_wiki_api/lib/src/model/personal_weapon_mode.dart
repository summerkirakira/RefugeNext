//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'personal_weapon_mode.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PersonalWeaponMode {
  /// Returns a new [PersonalWeaponMode] instance.
  PersonalWeaponMode({

     this.mode,

     this.localised,

     this.type,

     this.rpm,

     this.ammoPerShot,

     this.pelletsPerShot,

     this.damagePerSecond,

     this.heatPerShot,

     this.wearPerShot,

     this.heatPerSecond,

     this.wearPerSecond,

     this.fireDuringSpinUp,

     this.shotCount,

     this.cooldownTime,

     this.sequenceMode,

     this.chargeUpTime,

     this.chargeDownTime,

     this.fullDamageRange,

     this.zeroDamageRange,

     this.hitType,

     this.hitRadius,

     this.minEnergyDraw,

     this.maxEnergyDraw,

     this.healingMode,

     this.healingPerSecond,

     this.ammoPerMscu,

     this.medicalAmmoType,

     this.externalHealing,

     this.toggle,

     this.maxDistance,

     this.maxSensorDistance,

     this.autoDosageModifier,

     this.healingBreakTime,

     this.maxDoseForAutoAdjustment,

     this.batteryDrainPerSecond,

     this.materialEfficiency,

     this.maxHealthRepairRate,

     this.maxDamageMapRepairRate,

     this.healthToAmmoRatio,

     this.rampUpTime,

     this.rampDownTime,

     this.maxVehicleDamageRatio,

     this.repairedMaterialRatio,

     this.salvageCanFireOnFull,

     this.damageThreshold,

     this.minimumDistance,

     this.maximumDistance,

     this.beamRadius,

     this.collectionRate,

     this.energyDraw,

     this.miningExtractorTag,

     this.toggleMode,
  });

      /// Mode name.
  @JsonKey(
    
    name: r'mode',
    required: false,
    includeIfNull: false,
  )


  final String? mode;



      /// Localized label.
  @JsonKey(
    
    name: r'localised',
    required: false,
    includeIfNull: false,
  )


  final String? localised;



      /// Fire type.
  @JsonKey(
    
    name: r'type',
    required: false,
    includeIfNull: false,
  )


  final String? type;



      /// Rounds per minute.
  @JsonKey(
    
    name: r'rpm',
    required: false,
    includeIfNull: false,
  )


  final double? rpm;



      /// Ammo consumed per shot.
  @JsonKey(
    
    name: r'ammo_per_shot',
    required: false,
    includeIfNull: false,
  )


  final int? ammoPerShot;



      /// Pellets per shot.
  @JsonKey(
    
    name: r'pellets_per_shot',
    required: false,
    includeIfNull: false,
  )


  final int? pelletsPerShot;



      /// Damage per second.
  @JsonKey(
    
    name: r'damage_per_second',
    required: false,
    includeIfNull: false,
  )


  final double? damagePerSecond;



      /// Heat generated per shot (projectile modes).
  @JsonKey(
    
    name: r'heat_per_shot',
    required: false,
    includeIfNull: false,
  )


  final double? heatPerShot;



      /// Durability lost per shot (projectile modes).
  @JsonKey(
    
    name: r'wear_per_shot',
    required: false,
    includeIfNull: false,
  )


  final double? wearPerShot;



      /// Heat generated per second (beam / continuous-fire modes).
  @JsonKey(
    
    name: r'heat_per_second',
    required: false,
    includeIfNull: false,
  )


  final double? heatPerSecond;



      /// Durability lost per second (beam / continuous-fire modes).
  @JsonKey(
    
    name: r'wear_per_second',
    required: false,
    includeIfNull: false,
  )


  final double? wearPerSecond;



      /// Whether the weapon fires during barrel spin-up (rapid mode).
  @JsonKey(
    
    name: r'fire_during_spin_up',
    required: false,
    includeIfNull: false,
  )


  final bool? fireDuringSpinUp;



      /// Number of shots per burst (burst mode).
  @JsonKey(
    
    name: r'shot_count',
    required: false,
    includeIfNull: false,
  )


  final int? shotCount;



      /// Cooldown time between bursts in seconds (burst mode).
  @JsonKey(
    
    name: r'cooldown_time',
    required: false,
    includeIfNull: false,
  )


  final double? cooldownTime;



      /// Sequence mode identifier (sequence mode).
  @JsonKey(
    
    name: r'sequence_mode',
    required: false,
    includeIfNull: false,
  )


  final String? sequenceMode;



      /// Beam spool-up time in seconds (beam mode).
  @JsonKey(
    
    name: r'charge_up_time',
    required: false,
    includeIfNull: false,
  )


  final double? chargeUpTime;



      /// Beam spool-down time in seconds (beam mode).
  @JsonKey(
    
    name: r'charge_down_time',
    required: false,
    includeIfNull: false,
  )


  final double? chargeDownTime;



      /// Range at which full damage is applied (beam mode).
  @JsonKey(
    
    name: r'full_damage_range',
    required: false,
    includeIfNull: false,
  )


  final double? fullDamageRange;



      /// Range at which damage drops to zero (beam mode).
  @JsonKey(
    
    name: r'zero_damage_range',
    required: false,
    includeIfNull: false,
  )


  final double? zeroDamageRange;



      /// Beam hit registration type (beam mode).
  @JsonKey(
    
    name: r'hit_type',
    required: false,
    includeIfNull: false,
  )


  final String? hitType;



      /// Beam impact radius (beam / salvage mode).
  @JsonKey(
    
    name: r'hit_radius',
    required: false,
    includeIfNull: false,
  )


  final double? hitRadius;



      /// Minimum power draw (beam / salvage mode).
  @JsonKey(
    
    name: r'min_energy_draw',
    required: false,
    includeIfNull: false,
  )


  final double? minEnergyDraw;



      /// Maximum power draw (beam / salvage mode).
  @JsonKey(
    
    name: r'max_energy_draw',
    required: false,
    includeIfNull: false,
  )


  final double? maxEnergyDraw;



      /// Healing mode identifier (healingbeam mode).
  @JsonKey(
    
    name: r'healing_mode',
    required: false,
    includeIfNull: false,
  )


  final String? healingMode;



      /// SCU healed per second (healingbeam mode).
  @JsonKey(
    
    name: r'healing_per_second',
    required: false,
    includeIfNull: false,
  )


  final double? healingPerSecond;



      /// Ammo consumed per medical SCU (healingbeam mode).
  @JsonKey(
    
    name: r'ammo_per_mscu',
    required: false,
    includeIfNull: false,
  )


  final double? ammoPerMscu;



      /// Medical ammo type tag (healingbeam mode).
  @JsonKey(
    
    name: r'medical_ammo_type',
    required: false,
    includeIfNull: false,
  )


  final String? medicalAmmoType;



      /// External healing mode (healingbeam mode).
  @JsonKey(
    
    name: r'external_healing',
    required: false,
    includeIfNull: false,
  )


  final String? externalHealing;



      /// Toggle mode flag (healingbeam mode).
  @JsonKey(
    
    name: r'toggle',
    required: false,
    includeIfNull: false,
  )


  final bool? toggle;



      /// Maximum healing distance (healingbeam mode).
  @JsonKey(
    
    name: r'max_distance',
    required: false,
    includeIfNull: false,
  )


  final double? maxDistance;



      /// Maximum sensor range for target detection (healingbeam mode).
  @JsonKey(
    
    name: r'max_sensor_distance',
    required: false,
    includeIfNull: false,
  )


  final double? maxSensorDistance;



      /// Auto-dosage BDL modifier (healingbeam mode).
  @JsonKey(
    
    name: r'auto_dosage_modifier',
    required: false,
    includeIfNull: false,
  )


  final double? autoDosageModifier;



      /// Time before healing breaks in seconds (healingbeam mode).
  @JsonKey(
    
    name: r'healing_break_time',
    required: false,
    includeIfNull: false,
  )


  final double? healingBreakTime;



      /// Max dose for auto-adjustment (healingbeam mode).
  @JsonKey(
    
    name: r'max_dose_for_auto_adjustment',
    required: false,
    includeIfNull: false,
  )


  final double? maxDoseForAutoAdjustment;



      /// Battery drain per second (healingbeam mode).
  @JsonKey(
    
    name: r'battery_drain_per_second',
    required: false,
    includeIfNull: false,
  )


  final double? batteryDrainPerSecond;



      /// Material recovery rate (salvage mode).
  @JsonKey(
    
    name: r'material_efficiency',
    required: false,
    includeIfNull: false,
  )


  final double? materialEfficiency;



      /// Max hull repair rate (salvage mode).
  @JsonKey(
    
    name: r'max_health_repair_rate',
    required: false,
    includeIfNull: false,
  )


  final double? maxHealthRepairRate;



      /// Max damage-map repair rate (salvage mode).
  @JsonKey(
    
    name: r'max_damage_map_repair_rate',
    required: false,
    includeIfNull: false,
  )


  final double? maxDamageMapRepairRate;



      /// Health restored per ammo unit (salvage mode).
  @JsonKey(
    
    name: r'health_to_ammo_ratio',
    required: false,
    includeIfNull: false,
  )


  final double? healthToAmmoRatio;



      /// Beam ramp-up time in seconds (salvage mode).
  @JsonKey(
    
    name: r'ramp_up_time',
    required: false,
    includeIfNull: false,
  )


  final double? rampUpTime;



      /// Beam ramp-down time in seconds (salvage mode).
  @JsonKey(
    
    name: r'ramp_down_time',
    required: false,
    includeIfNull: false,
  )


  final double? rampDownTime;



      /// Max vehicle damage ratio (salvage mode).
  @JsonKey(
    
    name: r'max_vehicle_damage_ratio',
    required: false,
    includeIfNull: false,
  )


  final double? maxVehicleDamageRatio;



      /// Ratio of repaired material (salvage mode).
  @JsonKey(
    
    name: r'repaired_material_ratio',
    required: false,
    includeIfNull: false,
  )


  final double? repairedMaterialRatio;



      /// Can fire when target is at full health (salvage mode).
  @JsonKey(
    
    name: r'salvage_can_fire_on_full',
    required: false,
    includeIfNull: false,
  )


  final bool? salvageCanFireOnFull;



      /// Damage threshold for salvage operations (salvage mode).
  @JsonKey(
    
    name: r'damage_threshold',
    required: false,
    includeIfNull: false,
  )


  final double? damageThreshold;



      /// Minimum mining distance (collectionbeam mode).
  @JsonKey(
    
    name: r'minimum_distance',
    required: false,
    includeIfNull: false,
  )


  final double? minimumDistance;



      /// Maximum mining distance (collectionbeam mode).
  @JsonKey(
    
    name: r'maximum_distance',
    required: false,
    includeIfNull: false,
  )


  final double? maximumDistance;



      /// Collection beam radius (collectionbeam mode).
  @JsonKey(
    
    name: r'beam_radius',
    required: false,
    includeIfNull: false,
  )


  final double? beamRadius;



      /// Ore collection rate (collectionbeam mode).
  @JsonKey(
    
    name: r'collection_rate',
    required: false,
    includeIfNull: false,
  )


  final double? collectionRate;



      /// Power consumption (collectionbeam mode).
  @JsonKey(
    
    name: r'energy_draw',
    required: false,
    includeIfNull: false,
  )


  final double? energyDraw;



      /// Extractor classification tag (collectionbeam mode).
  @JsonKey(
    
    name: r'mining_extractor_tag',
    required: false,
    includeIfNull: false,
  )


  final String? miningExtractorTag;



      /// Toggle mode flag (tractorbeam mode).
  @JsonKey(
    
    name: r'toggle_mode',
    required: false,
    includeIfNull: false,
  )


  final bool? toggleMode;





    @override
    bool operator ==(Object other) => identical(this, other) || other is PersonalWeaponMode &&
      other.mode == mode &&
      other.localised == localised &&
      other.type == type &&
      other.rpm == rpm &&
      other.ammoPerShot == ammoPerShot &&
      other.pelletsPerShot == pelletsPerShot &&
      other.damagePerSecond == damagePerSecond &&
      other.heatPerShot == heatPerShot &&
      other.wearPerShot == wearPerShot &&
      other.heatPerSecond == heatPerSecond &&
      other.wearPerSecond == wearPerSecond &&
      other.fireDuringSpinUp == fireDuringSpinUp &&
      other.shotCount == shotCount &&
      other.cooldownTime == cooldownTime &&
      other.sequenceMode == sequenceMode &&
      other.chargeUpTime == chargeUpTime &&
      other.chargeDownTime == chargeDownTime &&
      other.fullDamageRange == fullDamageRange &&
      other.zeroDamageRange == zeroDamageRange &&
      other.hitType == hitType &&
      other.hitRadius == hitRadius &&
      other.minEnergyDraw == minEnergyDraw &&
      other.maxEnergyDraw == maxEnergyDraw &&
      other.healingMode == healingMode &&
      other.healingPerSecond == healingPerSecond &&
      other.ammoPerMscu == ammoPerMscu &&
      other.medicalAmmoType == medicalAmmoType &&
      other.externalHealing == externalHealing &&
      other.toggle == toggle &&
      other.maxDistance == maxDistance &&
      other.maxSensorDistance == maxSensorDistance &&
      other.autoDosageModifier == autoDosageModifier &&
      other.healingBreakTime == healingBreakTime &&
      other.maxDoseForAutoAdjustment == maxDoseForAutoAdjustment &&
      other.batteryDrainPerSecond == batteryDrainPerSecond &&
      other.materialEfficiency == materialEfficiency &&
      other.maxHealthRepairRate == maxHealthRepairRate &&
      other.maxDamageMapRepairRate == maxDamageMapRepairRate &&
      other.healthToAmmoRatio == healthToAmmoRatio &&
      other.rampUpTime == rampUpTime &&
      other.rampDownTime == rampDownTime &&
      other.maxVehicleDamageRatio == maxVehicleDamageRatio &&
      other.repairedMaterialRatio == repairedMaterialRatio &&
      other.salvageCanFireOnFull == salvageCanFireOnFull &&
      other.damageThreshold == damageThreshold &&
      other.minimumDistance == minimumDistance &&
      other.maximumDistance == maximumDistance &&
      other.beamRadius == beamRadius &&
      other.collectionRate == collectionRate &&
      other.energyDraw == energyDraw &&
      other.miningExtractorTag == miningExtractorTag &&
      other.toggleMode == toggleMode;

    @override
    int get hashCode =>
        (mode == null ? 0 : mode.hashCode) +
        (localised == null ? 0 : localised.hashCode) +
        (type == null ? 0 : type.hashCode) +
        (rpm == null ? 0 : rpm.hashCode) +
        (ammoPerShot == null ? 0 : ammoPerShot.hashCode) +
        (pelletsPerShot == null ? 0 : pelletsPerShot.hashCode) +
        (damagePerSecond == null ? 0 : damagePerSecond.hashCode) +
        (heatPerShot == null ? 0 : heatPerShot.hashCode) +
        (wearPerShot == null ? 0 : wearPerShot.hashCode) +
        (heatPerSecond == null ? 0 : heatPerSecond.hashCode) +
        (wearPerSecond == null ? 0 : wearPerSecond.hashCode) +
        (fireDuringSpinUp == null ? 0 : fireDuringSpinUp.hashCode) +
        (shotCount == null ? 0 : shotCount.hashCode) +
        (cooldownTime == null ? 0 : cooldownTime.hashCode) +
        (sequenceMode == null ? 0 : sequenceMode.hashCode) +
        (chargeUpTime == null ? 0 : chargeUpTime.hashCode) +
        (chargeDownTime == null ? 0 : chargeDownTime.hashCode) +
        (fullDamageRange == null ? 0 : fullDamageRange.hashCode) +
        (zeroDamageRange == null ? 0 : zeroDamageRange.hashCode) +
        (hitType == null ? 0 : hitType.hashCode) +
        (hitRadius == null ? 0 : hitRadius.hashCode) +
        (minEnergyDraw == null ? 0 : minEnergyDraw.hashCode) +
        (maxEnergyDraw == null ? 0 : maxEnergyDraw.hashCode) +
        (healingMode == null ? 0 : healingMode.hashCode) +
        (healingPerSecond == null ? 0 : healingPerSecond.hashCode) +
        (ammoPerMscu == null ? 0 : ammoPerMscu.hashCode) +
        (medicalAmmoType == null ? 0 : medicalAmmoType.hashCode) +
        (externalHealing == null ? 0 : externalHealing.hashCode) +
        (toggle == null ? 0 : toggle.hashCode) +
        (maxDistance == null ? 0 : maxDistance.hashCode) +
        (maxSensorDistance == null ? 0 : maxSensorDistance.hashCode) +
        (autoDosageModifier == null ? 0 : autoDosageModifier.hashCode) +
        (healingBreakTime == null ? 0 : healingBreakTime.hashCode) +
        (maxDoseForAutoAdjustment == null ? 0 : maxDoseForAutoAdjustment.hashCode) +
        (batteryDrainPerSecond == null ? 0 : batteryDrainPerSecond.hashCode) +
        (materialEfficiency == null ? 0 : materialEfficiency.hashCode) +
        (maxHealthRepairRate == null ? 0 : maxHealthRepairRate.hashCode) +
        (maxDamageMapRepairRate == null ? 0 : maxDamageMapRepairRate.hashCode) +
        (healthToAmmoRatio == null ? 0 : healthToAmmoRatio.hashCode) +
        (rampUpTime == null ? 0 : rampUpTime.hashCode) +
        (rampDownTime == null ? 0 : rampDownTime.hashCode) +
        (maxVehicleDamageRatio == null ? 0 : maxVehicleDamageRatio.hashCode) +
        (repairedMaterialRatio == null ? 0 : repairedMaterialRatio.hashCode) +
        (salvageCanFireOnFull == null ? 0 : salvageCanFireOnFull.hashCode) +
        (damageThreshold == null ? 0 : damageThreshold.hashCode) +
        (minimumDistance == null ? 0 : minimumDistance.hashCode) +
        (maximumDistance == null ? 0 : maximumDistance.hashCode) +
        (beamRadius == null ? 0 : beamRadius.hashCode) +
        (collectionRate == null ? 0 : collectionRate.hashCode) +
        (energyDraw == null ? 0 : energyDraw.hashCode) +
        (miningExtractorTag == null ? 0 : miningExtractorTag.hashCode) +
        (toggleMode == null ? 0 : toggleMode.hashCode);

  factory PersonalWeaponMode.fromJson(Map<String, dynamic> json) => _$PersonalWeaponModeFromJson(json);

  Map<String, dynamic> toJson() => _$PersonalWeaponModeToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

