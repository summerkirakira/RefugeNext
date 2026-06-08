//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'vehicle_armor_damage_multiplier.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class VehicleArmorDamageMultiplier {
  /// Returns a new [VehicleArmorDamageMultiplier] instance.
  VehicleArmorDamageMultiplier({

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

      /// Physical damage multiplier. Typical value 0.62 (38% reduction).
  @JsonKey(
    
    name: r'physical',
    required: false,
    includeIfNull: false,
  )


  final double? physical;



      /// Physical resistance change from neutral (multiplier - 1). Negative = more resistant.
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



      /// Energy resistance change from neutral.
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



      /// Distortion resistance change from neutral.
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



      /// Thermal resistance change from neutral.
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



      /// Biochemical resistance change from neutral.
  @JsonKey(
    
    name: r'biochemical_change',
    required: false,
    includeIfNull: false,
  )


  final double? biochemicalChange;



      /// Stun damage multiplier. 0 = complete immunity.
  @JsonKey(
    
    name: r'stun',
    required: false,
    includeIfNull: false,
  )


  final double? stun;



      /// Stun resistance change from neutral.
  @JsonKey(
    
    name: r'stun_change',
    required: false,
    includeIfNull: false,
  )


  final double? stunChange;





    @override
    bool operator ==(Object other) => identical(this, other) || other is VehicleArmorDamageMultiplier &&
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

  factory VehicleArmorDamageMultiplier.fromJson(Map<String, dynamic> json) => _$VehicleArmorDamageMultiplierFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleArmorDamageMultiplierToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

