//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'ammunition_damage_falloff.g.dart';


@Deprecated('AmmunitionDamageFalloff has been deprecated')
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AmmunitionDamageFalloff {
  /// Returns a new [AmmunitionDamageFalloff] instance.
  AmmunitionDamageFalloff({

     this.physical,

     this.energy,

     this.distortion,

     this.thermal,

     this.biochemical,

     this.stun,
  });

  @JsonKey(
    
    name: r'Physical',
    required: false,
    includeIfNull: false,
  )


  final double? physical;



  @JsonKey(
    
    name: r'Energy',
    required: false,
    includeIfNull: false,
  )


  final double? energy;



  @JsonKey(
    
    name: r'Distortion',
    required: false,
    includeIfNull: false,
  )


  final double? distortion;



  @JsonKey(
    
    name: r'Thermal',
    required: false,
    includeIfNull: false,
  )


  final double? thermal;



  @JsonKey(
    
    name: r'Biochemical',
    required: false,
    includeIfNull: false,
  )


  final double? biochemical;



  @JsonKey(
    
    name: r'Stun',
    required: false,
    includeIfNull: false,
  )


  final double? stun;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AmmunitionDamageFalloff &&
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

  factory AmmunitionDamageFalloff.fromJson(Map<String, dynamic> json) => _$AmmunitionDamageFalloffFromJson(json);

  Map<String, dynamic> toJson() => _$AmmunitionDamageFalloffToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

