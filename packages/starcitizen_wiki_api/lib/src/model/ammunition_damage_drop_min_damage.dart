//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'ammunition_damage_drop_min_damage.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AmmunitionDamageDropMinDamage {
  /// Returns a new [AmmunitionDamageDropMinDamage] instance.
  AmmunitionDamageDropMinDamage({

     this.physical,

     this.energy,

     this.distortion,

     this.thermal,

     this.biochemical,

     this.stun,

     this.total,
  });

      /// Minimum physical damage floor.
  @JsonKey(
    
    name: r'physical',
    required: false,
    includeIfNull: false,
  )


  final double? physical;



      /// Minimum energy damage floor.
  @JsonKey(
    
    name: r'energy',
    required: false,
    includeIfNull: false,
  )


  final double? energy;



      /// Minimum distortion damage floor.
  @JsonKey(
    
    name: r'distortion',
    required: false,
    includeIfNull: false,
  )


  final double? distortion;



      /// Minimum thermal damage floor.
  @JsonKey(
    
    name: r'thermal',
    required: false,
    includeIfNull: false,
  )


  final double? thermal;



      /// Minimum biochemical damage floor.
  @JsonKey(
    
    name: r'biochemical',
    required: false,
    includeIfNull: false,
  )


  final double? biochemical;



      /// Minimum stun damage floor.
  @JsonKey(
    
    name: r'stun',
    required: false,
    includeIfNull: false,
  )


  final double? stun;



      /// Sum of all minimum damage floors.
  @JsonKey(
    
    name: r'total',
    required: false,
    includeIfNull: false,
  )


  final double? total;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AmmunitionDamageDropMinDamage &&
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

  factory AmmunitionDamageDropMinDamage.fromJson(Map<String, dynamic> json) => _$AmmunitionDamageDropMinDamageFromJson(json);

  Map<String, dynamic> toJson() => _$AmmunitionDamageDropMinDamageToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

