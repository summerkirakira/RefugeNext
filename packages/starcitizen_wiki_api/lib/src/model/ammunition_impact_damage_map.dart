//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'ammunition_impact_damage_map.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AmmunitionImpactDamageMap {
  /// Returns a new [AmmunitionImpactDamageMap] instance.
  AmmunitionImpactDamageMap({

     this.physical,

     this.energy,

     this.distortion,

     this.thermal,

     this.biochemical,

     this.stun,
  });

      /// Physical impact damage.
  @JsonKey(
    
    name: r'physical',
    required: false,
    includeIfNull: false,
  )


  final double? physical;



      /// Energy impact damage.
  @JsonKey(
    
    name: r'energy',
    required: false,
    includeIfNull: false,
  )


  final double? energy;



      /// Distortion impact damage.
  @JsonKey(
    
    name: r'distortion',
    required: false,
    includeIfNull: false,
  )


  final double? distortion;



      /// Thermal impact damage.
  @JsonKey(
    
    name: r'thermal',
    required: false,
    includeIfNull: false,
  )


  final double? thermal;



      /// Biochemical impact damage.
  @JsonKey(
    
    name: r'biochemical',
    required: false,
    includeIfNull: false,
  )


  final double? biochemical;



      /// Stun impact damage.
  @JsonKey(
    
    name: r'stun',
    required: false,
    includeIfNull: false,
  )


  final double? stun;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AmmunitionImpactDamageMap &&
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

  factory AmmunitionImpactDamageMap.fromJson(Map<String, dynamic> json) => _$AmmunitionImpactDamageMapFromJson(json);

  Map<String, dynamic> toJson() => _$AmmunitionImpactDamageMapToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

