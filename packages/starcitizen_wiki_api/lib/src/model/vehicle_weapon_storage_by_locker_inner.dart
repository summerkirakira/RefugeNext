//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'vehicle_weapon_storage_by_locker_inner.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class VehicleWeaponStorageByLockerInner {
  /// Returns a new [VehicleWeaponStorageByLockerInner] instance.
  VehicleWeaponStorageByLockerInner({

     this.count,

     this.name,

     this.className,

     this.port,

     this.slotsTotal,

     this.slotsRifle,

     this.slotsPistol,
  });

      /// Number of identical racks with this configuration.
  @JsonKey(
    
    name: r'count',
    required: false,
    includeIfNull: false,
  )


  final int? count;



      /// Locker display name.
  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



      /// Locker class name.
  @JsonKey(
    
    name: r'class_name',
    required: false,
    includeIfNull: false,
  )


  final String? className;



      /// Hardpoint port name.
  @JsonKey(
    
    name: r'port',
    required: false,
    includeIfNull: false,
  )


  final String? port;



      /// Total slots in this locker.
  @JsonKey(
    
    name: r'slots_total',
    required: false,
    includeIfNull: false,
  )


  final int? slotsTotal;



      /// Rifle slots in this locker.
  @JsonKey(
    
    name: r'slots_rifle',
    required: false,
    includeIfNull: false,
  )


  final int? slotsRifle;



      /// Pistol slots in this locker.
  @JsonKey(
    
    name: r'slots_pistol',
    required: false,
    includeIfNull: false,
  )


  final int? slotsPistol;





    @override
    bool operator ==(Object other) => identical(this, other) || other is VehicleWeaponStorageByLockerInner &&
      other.count == count &&
      other.name == name &&
      other.className == className &&
      other.port == port &&
      other.slotsTotal == slotsTotal &&
      other.slotsRifle == slotsRifle &&
      other.slotsPistol == slotsPistol;

    @override
    int get hashCode =>
        count.hashCode +
        name.hashCode +
        className.hashCode +
        port.hashCode +
        slotsTotal.hashCode +
        slotsRifle.hashCode +
        slotsPistol.hashCode;

  factory VehicleWeaponStorageByLockerInner.fromJson(Map<String, dynamic> json) => _$VehicleWeaponStorageByLockerInnerFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleWeaponStorageByLockerInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

