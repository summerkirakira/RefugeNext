//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'vehicle_armor_deflection.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class VehicleArmorDeflection {
  /// Returns a new [VehicleArmorDeflection] instance.
  VehicleArmorDeflection({

     this.physical,

     this.energy,

     this.distortion,

     this.thermal,

     this.biochemical,

     this.stun,
  });

      /// Physical deflection value.
  @JsonKey(
    
    name: r'physical',
    required: false,
    includeIfNull: false,
  )


  final double? physical;



      /// Energy deflection value.
  @JsonKey(
    
    name: r'energy',
    required: false,
    includeIfNull: false,
  )


  final double? energy;



      /// Distortion deflection value.
  @JsonKey(
    
    name: r'distortion',
    required: false,
    includeIfNull: false,
  )


  final double? distortion;



      /// Thermal deflection value.
  @JsonKey(
    
    name: r'thermal',
    required: false,
    includeIfNull: false,
  )


  final double? thermal;



      /// Biochemical deflection value.
  @JsonKey(
    
    name: r'biochemical',
    required: false,
    includeIfNull: false,
  )


  final double? biochemical;



      /// Stun deflection value.
  @JsonKey(
    
    name: r'stun',
    required: false,
    includeIfNull: false,
  )


  final double? stun;





    @override
    bool operator ==(Object other) => identical(this, other) || other is VehicleArmorDeflection &&
      other.physical == physical &&
      other.energy == energy &&
      other.distortion == distortion &&
      other.thermal == thermal &&
      other.biochemical == biochemical &&
      other.stun == stun;

    @override
    int get hashCode =>
        (physical == null ? 0 : physical.hashCode) +
        (energy == null ? 0 : energy.hashCode) +
        (distortion == null ? 0 : distortion.hashCode) +
        (thermal == null ? 0 : thermal.hashCode) +
        (biochemical == null ? 0 : biochemical.hashCode) +
        (stun == null ? 0 : stun.hashCode);

  factory VehicleArmorDeflection.fromJson(Map<String, dynamic> json) => _$VehicleArmorDeflectionFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleArmorDeflectionToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

