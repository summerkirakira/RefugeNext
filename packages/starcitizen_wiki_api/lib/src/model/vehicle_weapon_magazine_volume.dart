//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'vehicle_weapon_magazine_volume.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class VehicleWeaponMagazineVolume {
  /// Returns a new [VehicleWeaponMagazineVolume] instance.
  VehicleWeaponMagazineVolume({

     this.microScu,

     this.scu,
  });

      /// Volume in microSCU.
  @JsonKey(
    
    name: r'micro_scu',
    required: false,
    includeIfNull: false,
  )


  final int? microScu;



      /// Volume in SCU.
  @JsonKey(
    
    name: r'scu',
    required: false,
    includeIfNull: false,
  )


  final double? scu;





    @override
    bool operator ==(Object other) => identical(this, other) || other is VehicleWeaponMagazineVolume &&
      other.microScu == microScu &&
      other.scu == scu;

    @override
    int get hashCode =>
        (microScu == null ? 0 : microScu.hashCode) +
        (scu == null ? 0 : scu.hashCode);

  factory VehicleWeaponMagazineVolume.fromJson(Map<String, dynamic> json) => _$VehicleWeaponMagazineVolumeFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleWeaponMagazineVolumeToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

