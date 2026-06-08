//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'game_vehicle_weaponry_missiles_damage.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GameVehicleWeaponryMissilesDamage {
  /// Returns a new [GameVehicleWeaponryMissilesDamage] instance.
  GameVehicleWeaponryMissilesDamage({

     this.physical,

     this.energy,

     this.distortion,

     this.thermal,

     this.biochemical,

     this.stun,

     this.total,
  });

  @JsonKey(
    
    name: r'physical',
    required: false,
    includeIfNull: false,
  )


  final num? physical;



  @JsonKey(
    
    name: r'energy',
    required: false,
    includeIfNull: false,
  )


  final num? energy;



  @JsonKey(
    
    name: r'distortion',
    required: false,
    includeIfNull: false,
  )


  final num? distortion;



  @JsonKey(
    
    name: r'thermal',
    required: false,
    includeIfNull: false,
  )


  final num? thermal;



  @JsonKey(
    
    name: r'biochemical',
    required: false,
    includeIfNull: false,
  )


  final num? biochemical;



  @JsonKey(
    
    name: r'stun',
    required: false,
    includeIfNull: false,
  )


  final num? stun;



  @JsonKey(
    
    name: r'total',
    required: false,
    includeIfNull: false,
  )


  final num? total;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GameVehicleWeaponryMissilesDamage &&
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

  factory GameVehicleWeaponryMissilesDamage.fromJson(Map<String, dynamic> json) => _$GameVehicleWeaponryMissilesDamageFromJson(json);

  Map<String, dynamic> toJson() => _$GameVehicleWeaponryMissilesDamageToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

