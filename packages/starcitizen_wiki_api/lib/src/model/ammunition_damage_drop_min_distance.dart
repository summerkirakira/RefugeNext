//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'ammunition_damage_drop_min_distance.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AmmunitionDamageDropMinDistance {
  /// Returns a new [AmmunitionDamageDropMinDistance] instance.
  AmmunitionDamageDropMinDistance({

     this.physical,

     this.energy,

     this.distortion,

     this.thermal,

     this.biochemical,

     this.stun,

     this.total,
  });

      /// Physical damage at start of falloff.
  @JsonKey(
    
    name: r'physical',
    required: false,
    includeIfNull: false,
  )


  final double? physical;



      /// Energy damage at start of falloff.
  @JsonKey(
    
    name: r'energy',
    required: false,
    includeIfNull: false,
  )


  final double? energy;



      /// Distortion damage at start of falloff.
  @JsonKey(
    
    name: r'distortion',
    required: false,
    includeIfNull: false,
  )


  final double? distortion;



      /// Thermal damage at start of falloff.
  @JsonKey(
    
    name: r'thermal',
    required: false,
    includeIfNull: false,
  )


  final double? thermal;



      /// Biochemical damage at start of falloff.
  @JsonKey(
    
    name: r'biochemical',
    required: false,
    includeIfNull: false,
  )


  final double? biochemical;



      /// Stun damage at start of falloff.
  @JsonKey(
    
    name: r'stun',
    required: false,
    includeIfNull: false,
  )


  final double? stun;



      /// Sum of all damage types.
  @JsonKey(
    
    name: r'total',
    required: false,
    includeIfNull: false,
  )


  final double? total;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AmmunitionDamageDropMinDistance &&
      other.physical == physical &&
      other.energy == energy &&
      other.distortion == distortion &&
      other.thermal == thermal &&
      other.biochemical == biochemical &&
      other.stun == stun &&
      other.total == total;

    @override
    int get hashCode =>
        (physical == null ? 0 : physical.hashCode) +
        (energy == null ? 0 : energy.hashCode) +
        (distortion == null ? 0 : distortion.hashCode) +
        (thermal == null ? 0 : thermal.hashCode) +
        (biochemical == null ? 0 : biochemical.hashCode) +
        (stun == null ? 0 : stun.hashCode) +
        (total == null ? 0 : total.hashCode);

  factory AmmunitionDamageDropMinDistance.fromJson(Map<String, dynamic> json) => _$AmmunitionDamageDropMinDistanceFromJson(json);

  Map<String, dynamic> toJson() => _$AmmunitionDamageDropMinDistanceToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

