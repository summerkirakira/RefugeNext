//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'mining_module_modifiers.g.dart';


@Deprecated('MiningModuleModifiers has been deprecated')
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MiningModuleModifiers {
  /// Returns a new [MiningModuleModifiers] instance.
  MiningModuleModifiers({

     this.miningLaserPowerPercent,

     this.extractionLaserPowerPercent,

     this.optimalChargeWindowPercent,

     this.optimalChargeRatePercent,

     this.allChargeRatesPercent,

     this.inertMaterialModifierPercent,

     this.resistancePercent,

     this.instabilityPercent,

     this.shatterDamagePercent,

     this.overchargeRatePercent,

     this.clusterFactor,

     this.damageMultiplier,
  });

      /// Multiplicative change to mining laser power. 150 boosts power by 50%; 85 lowers by 15%.
  @Deprecated('miningLaserPowerPercent has been deprecated')
  @JsonKey(
    
    name: r'mining_laser_power_percent',
    required: false,
    includeIfNull: false,
  )


  final double? miningLaserPowerPercent;



      /// Multiplier on extraction beam power. Lower values mean slower extraction but often reduce inert material.
  @Deprecated('extractionLaserPowerPercent has been deprecated')
  @JsonKey(
    
    name: r'extraction_laser_power_percent',
    required: false,
    includeIfNull: false,
  )


  final double? extractionLaserPowerPercent;



      /// Change to the size of the optimal (green) window. Positive widens, negative shrinks. Range seen: -10 to +40.
  @Deprecated('optimalChargeWindowPercent has been deprecated')
  @JsonKey(
    
    name: r'optimal_charge_window_percent',
    required: false,
    includeIfNull: false,
  )


  final double? optimalChargeWindowPercent;



      /// Change to the ideal charge rate speed. Higher values speed charging; negatives slow it. Range seen: -20 to +60.
  @Deprecated('optimalChargeRatePercent has been deprecated')
  @JsonKey(
    
    name: r'optimal_charge_rate_percent',
    required: false,
    includeIfNull: false,
  )


  final double? optimalChargeRatePercent;



      /// Flat multiplier to all charge-rate bands when present. Range seen: +5 to +24.
  @Deprecated('allChargeRatesPercent has been deprecated')
  @JsonKey(
    
    name: r'all_charge_rates_percent',
    required: false,
    includeIfNull: false,
  )


  final double? allChargeRatesPercent;



      /// Reduction to inert material collected. Positive values in data mean less inert material (e.g., 6, 24).
  @Deprecated('inertMaterialModifierPercent has been deprecated')
  @JsonKey(
    
    name: r'inert_material_modifier_percent',
    required: false,
    includeIfNull: false,
  )


  final double? inertMaterialModifierPercent;



      /// Change to deposit resistance (hardness). Positive makes rock more resistant; negative softens. Range seen: -24.8 to +15.5.
  @Deprecated('resistancePercent has been deprecated')
  @JsonKey(
    
    name: r'resistance_percent',
    required: false,
    includeIfNull: false,
  )


  final double? resistancePercent;



      /// Change to laser instability. Negative stabilizes, positive increases jitter. Range seen: -20 to +10.
  @Deprecated('instabilityPercent has been deprecated')
  @JsonKey(
    
    name: r'instability_percent',
    required: false,
    includeIfNull: false,
  )


  final double? instabilityPercent;



      /// Change to damage taken when the rock shatters. Negative reduces hazard; positive increases. Range seen: -30 to +40.
  @Deprecated('shatterDamagePercent has been deprecated')
  @JsonKey(
    
    name: r'shatter_damage_percent',
    required: false,
    includeIfNull: false,
  )


  final double? shatterDamagePercent;



      /// Change to catastrophic/overcharge rate. Negative lowers risk, positive increases. Range seen: -80 to +60.
  @Deprecated('overchargeRatePercent has been deprecated')
  @JsonKey(
    
    name: r'overcharge_rate_percent',
    required: false,
    includeIfNull: false,
  )


  final double? overchargeRatePercent;



      /// Scaling applied to cluster-related calculations for fracture/extraction when present.
  @Deprecated('clusterFactor has been deprecated')
  @JsonKey(
    
    name: r'cluster_factor',
    required: false,
    includeIfNull: false,
  )


  final double? clusterFactor;



      /// General damage multiplier used by modules. Observed range: 0.85-1.50.
  @Deprecated('damageMultiplier has been deprecated')
  @JsonKey(
    
    name: r'damage_multiplier',
    required: false,
    includeIfNull: false,
  )


  final double? damageMultiplier;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MiningModuleModifiers &&
      other.miningLaserPowerPercent == miningLaserPowerPercent &&
      other.extractionLaserPowerPercent == extractionLaserPowerPercent &&
      other.optimalChargeWindowPercent == optimalChargeWindowPercent &&
      other.optimalChargeRatePercent == optimalChargeRatePercent &&
      other.allChargeRatesPercent == allChargeRatesPercent &&
      other.inertMaterialModifierPercent == inertMaterialModifierPercent &&
      other.resistancePercent == resistancePercent &&
      other.instabilityPercent == instabilityPercent &&
      other.shatterDamagePercent == shatterDamagePercent &&
      other.overchargeRatePercent == overchargeRatePercent &&
      other.clusterFactor == clusterFactor &&
      other.damageMultiplier == damageMultiplier;

    @override
    int get hashCode =>
        (miningLaserPowerPercent == null ? 0 : miningLaserPowerPercent.hashCode) +
        (extractionLaserPowerPercent == null ? 0 : extractionLaserPowerPercent.hashCode) +
        (optimalChargeWindowPercent == null ? 0 : optimalChargeWindowPercent.hashCode) +
        (optimalChargeRatePercent == null ? 0 : optimalChargeRatePercent.hashCode) +
        (allChargeRatesPercent == null ? 0 : allChargeRatesPercent.hashCode) +
        (inertMaterialModifierPercent == null ? 0 : inertMaterialModifierPercent.hashCode) +
        (resistancePercent == null ? 0 : resistancePercent.hashCode) +
        (instabilityPercent == null ? 0 : instabilityPercent.hashCode) +
        (shatterDamagePercent == null ? 0 : shatterDamagePercent.hashCode) +
        (overchargeRatePercent == null ? 0 : overchargeRatePercent.hashCode) +
        (clusterFactor == null ? 0 : clusterFactor.hashCode) +
        (damageMultiplier == null ? 0 : damageMultiplier.hashCode);

  factory MiningModuleModifiers.fromJson(Map<String, dynamic> json) => _$MiningModuleModifiersFromJson(json);

  Map<String, dynamic> toJson() => _$MiningModuleModifiersToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

