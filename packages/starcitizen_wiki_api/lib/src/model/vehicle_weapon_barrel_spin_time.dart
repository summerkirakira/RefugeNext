//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'vehicle_weapon_barrel_spin_time.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class VehicleWeaponBarrelSpinTime {
  /// Returns a new [VehicleWeaponBarrelSpinTime] instance.
  VehicleWeaponBarrelSpinTime({

     this.up,

     this.down,
  });

      /// Spin-up time in seconds.
  @JsonKey(
    
    name: r'up',
    required: false,
    includeIfNull: false,
  )


  final double? up;



      /// Spin-down time in seconds.
  @JsonKey(
    
    name: r'down',
    required: false,
    includeIfNull: false,
  )


  final double? down;





    @override
    bool operator ==(Object other) => identical(this, other) || other is VehicleWeaponBarrelSpinTime &&
      other.up == up &&
      other.down == down;

    @override
    int get hashCode =>
        (up == null ? 0 : up.hashCode) +
        (down == null ? 0 : down.hashCode);

  factory VehicleWeaponBarrelSpinTime.fromJson(Map<String, dynamic> json) => _$VehicleWeaponBarrelSpinTimeFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleWeaponBarrelSpinTimeToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

