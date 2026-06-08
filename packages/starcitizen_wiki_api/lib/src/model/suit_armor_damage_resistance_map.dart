//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'suit_armor_damage_resistance_map.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SuitArmorDamageResistanceMap {
  /// Returns a new [SuitArmorDamageResistanceMap] instance.
  SuitArmorDamageResistanceMap({

     this.impact,

     this.impactChange,

     this.physical,

     this.physicalChange,

     this.energy,

     this.energyChange,

     this.distortion,

     this.distortionChange,

     this.thermal,

     this.thermalChange,

     this.biochemical,

     this.biochemicalChange,

     this.stun,

     this.stunChange,
  });

      /// Impact damage multiplier.
  @JsonKey(
    
    name: r'impact',
    required: false,
    includeIfNull: false,
  )


  final double? impact;



      /// Impact multiplier delta from 1.0 (negative = resistance).
  @JsonKey(
    
    name: r'impact_change',
    required: false,
    includeIfNull: false,
  )


  final double? impactChange;



      /// Physical damage multiplier.
  @JsonKey(
    
    name: r'physical',
    required: false,
    includeIfNull: false,
  )


  final double? physical;



      /// Physical multiplier delta from 1.0 (negative = resistance).
  @JsonKey(
    
    name: r'physical_change',
    required: false,
    includeIfNull: false,
  )


  final double? physicalChange;



      /// Energy damage multiplier.
  @JsonKey(
    
    name: r'energy',
    required: false,
    includeIfNull: false,
  )


  final double? energy;



      /// Energy multiplier delta from 1.0 (negative = resistance).
  @JsonKey(
    
    name: r'energy_change',
    required: false,
    includeIfNull: false,
  )


  final double? energyChange;



      /// Distortion damage multiplier.
  @JsonKey(
    
    name: r'distortion',
    required: false,
    includeIfNull: false,
  )


  final double? distortion;



      /// Distortion multiplier delta from 1.0 (negative = resistance).
  @JsonKey(
    
    name: r'distortion_change',
    required: false,
    includeIfNull: false,
  )


  final double? distortionChange;



      /// Thermal damage multiplier.
  @JsonKey(
    
    name: r'thermal',
    required: false,
    includeIfNull: false,
  )


  final double? thermal;



      /// Thermal multiplier delta from 1.0 (negative = resistance).
  @JsonKey(
    
    name: r'thermal_change',
    required: false,
    includeIfNull: false,
  )


  final double? thermalChange;



      /// Biochemical damage multiplier.
  @JsonKey(
    
    name: r'biochemical',
    required: false,
    includeIfNull: false,
  )


  final double? biochemical;



      /// Biochemical multiplier delta from 1.0 (negative = resistance).
  @JsonKey(
    
    name: r'biochemical_change',
    required: false,
    includeIfNull: false,
  )


  final double? biochemicalChange;



      /// Stun damage multiplier.
  @JsonKey(
    
    name: r'stun',
    required: false,
    includeIfNull: false,
  )


  final double? stun;



      /// Stun multiplier delta from 1.0 (negative = resistance).
  @JsonKey(
    
    name: r'stun_change',
    required: false,
    includeIfNull: false,
  )


  final double? stunChange;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SuitArmorDamageResistanceMap &&
      other.impact == impact &&
      other.impactChange == impactChange &&
      other.physical == physical &&
      other.physicalChange == physicalChange &&
      other.energy == energy &&
      other.energyChange == energyChange &&
      other.distortion == distortion &&
      other.distortionChange == distortionChange &&
      other.thermal == thermal &&
      other.thermalChange == thermalChange &&
      other.biochemical == biochemical &&
      other.biochemicalChange == biochemicalChange &&
      other.stun == stun &&
      other.stunChange == stunChange;

    @override
    int get hashCode =>
        (impact == null ? 0 : impact.hashCode) +
        (impactChange == null ? 0 : impactChange.hashCode) +
        (physical == null ? 0 : physical.hashCode) +
        (physicalChange == null ? 0 : physicalChange.hashCode) +
        (energy == null ? 0 : energy.hashCode) +
        (energyChange == null ? 0 : energyChange.hashCode) +
        (distortion == null ? 0 : distortion.hashCode) +
        (distortionChange == null ? 0 : distortionChange.hashCode) +
        (thermal == null ? 0 : thermal.hashCode) +
        (thermalChange == null ? 0 : thermalChange.hashCode) +
        (biochemical == null ? 0 : biochemical.hashCode) +
        (biochemicalChange == null ? 0 : biochemicalChange.hashCode) +
        (stun == null ? 0 : stun.hashCode) +
        (stunChange == null ? 0 : stunChange.hashCode);

  factory SuitArmorDamageResistanceMap.fromJson(Map<String, dynamic> json) => _$SuitArmorDamageResistanceMapFromJson(json);

  Map<String, dynamic> toJson() => _$SuitArmorDamageResistanceMapToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

