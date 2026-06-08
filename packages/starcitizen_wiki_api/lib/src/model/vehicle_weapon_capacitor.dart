//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'vehicle_weapon_capacitor.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class VehicleWeaponCapacitor {
  /// Returns a new [VehicleWeaponCapacitor] instance.
  VehicleWeaponCapacitor({

     this.maxAmmoLoad,

     this.regenPerSecond,

     this.cooldown,

     this.requestedAmmoLoad,

     this.costsPerShot,
  });

      /// Maximum capacitor ammo load.
  @JsonKey(
    
    name: r'max_ammo_load',
    required: false,
    includeIfNull: false,
  )


  final double? maxAmmoLoad;



      /// Capacitor regeneration per second.
  @JsonKey(
    
    name: r'regen_per_second',
    required: false,
    includeIfNull: false,
  )


  final double? regenPerSecond;



      /// Capacitor cooldown in seconds.
  @JsonKey(
    
    name: r'cooldown',
    required: false,
    includeIfNull: false,
  )


  final double? cooldown;



      /// Requested ammo load from capacitor.
  @JsonKey(
    
    name: r'requested_ammo_load',
    required: false,
    includeIfNull: false,
  )


  final double? requestedAmmoLoad;



      /// Capacitor cost per shot.
  @JsonKey(
    
    name: r'costs_per_shot',
    required: false,
    includeIfNull: false,
  )


  final double? costsPerShot;





    @override
    bool operator ==(Object other) => identical(this, other) || other is VehicleWeaponCapacitor &&
      other.maxAmmoLoad == maxAmmoLoad &&
      other.regenPerSecond == regenPerSecond &&
      other.cooldown == cooldown &&
      other.requestedAmmoLoad == requestedAmmoLoad &&
      other.costsPerShot == costsPerShot;

    @override
    int get hashCode =>
        (maxAmmoLoad == null ? 0 : maxAmmoLoad.hashCode) +
        (regenPerSecond == null ? 0 : regenPerSecond.hashCode) +
        (cooldown == null ? 0 : cooldown.hashCode) +
        (requestedAmmoLoad == null ? 0 : requestedAmmoLoad.hashCode) +
        (costsPerShot == null ? 0 : costsPerShot.hashCode);

  factory VehicleWeaponCapacitor.fromJson(Map<String, dynamic> json) => _$VehicleWeaponCapacitorFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleWeaponCapacitorToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

