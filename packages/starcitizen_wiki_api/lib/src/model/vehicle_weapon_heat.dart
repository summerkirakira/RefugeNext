//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'vehicle_weapon_heat.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class VehicleWeaponHeat {
  /// Returns a new [VehicleWeaponHeat] instance.
  VehicleWeaponHeat({

     this.perShot,

     this.coolingDelay,

     this.coolingPerSecond,

     this.overheatMaxShots,

     this.overheatMaxTime,

     this.overheatCooldown,
  });

      /// Heat generated per shot.
  @JsonKey(
    
    name: r'per_shot',
    required: false,
    includeIfNull: false,
  )


  final double? perShot;



      /// Delay before cooling begins in seconds.
  @JsonKey(
    
    name: r'cooling_delay',
    required: false,
    includeIfNull: false,
  )


  final double? coolingDelay;



      /// Cooling rate per second.
  @JsonKey(
    
    name: r'cooling_per_second',
    required: false,
    includeIfNull: false,
  )


  final double? coolingPerSecond;



      /// Number of shots to trigger overheat.
  @JsonKey(
    
    name: r'overheat_max_shots',
    required: false,
    includeIfNull: false,
  )


  final double? overheatMaxShots;



      /// Time to trigger overheat in seconds.
  @JsonKey(
    
    name: r'overheat_max_time',
    required: false,
    includeIfNull: false,
  )


  final double? overheatMaxTime;



      /// Overheat recovery time in seconds.
  @JsonKey(
    
    name: r'overheat_cooldown',
    required: false,
    includeIfNull: false,
  )


  final double? overheatCooldown;





    @override
    bool operator ==(Object other) => identical(this, other) || other is VehicleWeaponHeat &&
      other.perShot == perShot &&
      other.coolingDelay == coolingDelay &&
      other.coolingPerSecond == coolingPerSecond &&
      other.overheatMaxShots == overheatMaxShots &&
      other.overheatMaxTime == overheatMaxTime &&
      other.overheatCooldown == overheatCooldown;

    @override
    int get hashCode =>
        (perShot == null ? 0 : perShot.hashCode) +
        (coolingDelay == null ? 0 : coolingDelay.hashCode) +
        (coolingPerSecond == null ? 0 : coolingPerSecond.hashCode) +
        (overheatMaxShots == null ? 0 : overheatMaxShots.hashCode) +
        (overheatMaxTime == null ? 0 : overheatMaxTime.hashCode) +
        (overheatCooldown == null ? 0 : overheatCooldown.hashCode);

  factory VehicleWeaponHeat.fromJson(Map<String, dynamic> json) => _$VehicleWeaponHeatFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleWeaponHeatToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

