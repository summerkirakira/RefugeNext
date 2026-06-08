//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'vehicle_armor_penetration_resistance.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class VehicleArmorPenetrationResistance {
  /// Returns a new [VehicleArmorPenetrationResistance] instance.
  VehicleArmorPenetrationResistance({

     this.base_,

     this.physical,

     this.energy,

     this.distortion,

     this.thermal,

     this.biochemical,

     this.stun,
  });

      /// Base penetration resistance value.
  @JsonKey(
    
    name: r'base',
    required: false,
    includeIfNull: false,
  )


  final double? base_;



      /// Physical penetration resistance.
  @JsonKey(
    
    name: r'physical',
    required: false,
    includeIfNull: false,
  )


  final double? physical;



      /// Energy penetration resistance.
  @JsonKey(
    
    name: r'energy',
    required: false,
    includeIfNull: false,
  )


  final double? energy;



      /// Distortion penetration resistance.
  @JsonKey(
    
    name: r'distortion',
    required: false,
    includeIfNull: false,
  )


  final double? distortion;



      /// Thermal penetration resistance.
  @JsonKey(
    
    name: r'thermal',
    required: false,
    includeIfNull: false,
  )


  final double? thermal;



      /// Biochemical penetration resistance.
  @JsonKey(
    
    name: r'biochemical',
    required: false,
    includeIfNull: false,
  )


  final double? biochemical;



      /// Stun penetration resistance.
  @JsonKey(
    
    name: r'stun',
    required: false,
    includeIfNull: false,
  )


  final double? stun;





    @override
    bool operator ==(Object other) => identical(this, other) || other is VehicleArmorPenetrationResistance &&
      other.base_ == base_ &&
      other.physical == physical &&
      other.energy == energy &&
      other.distortion == distortion &&
      other.thermal == thermal &&
      other.biochemical == biochemical &&
      other.stun == stun;

    @override
    int get hashCode =>
        (base_ == null ? 0 : base_.hashCode) +
        (physical == null ? 0 : physical.hashCode) +
        (energy == null ? 0 : energy.hashCode) +
        (distortion == null ? 0 : distortion.hashCode) +
        (thermal == null ? 0 : thermal.hashCode) +
        (biochemical == null ? 0 : biochemical.hashCode) +
        (stun == null ? 0 : stun.hashCode);

  factory VehicleArmorPenetrationResistance.fromJson(Map<String, dynamic> json) => _$VehicleArmorPenetrationResistanceFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleArmorPenetrationResistanceToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

