//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/vehicle_weapon_storage_by_locker_inner.dart';
import 'package:json_annotation/json_annotation.dart';

part 'vehicle_weapon_storage.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class VehicleWeaponStorage {
  /// Returns a new [VehicleWeaponStorage] instance.
  VehicleWeaponStorage({

     this.lockers,

     this.slotsTotal,

     this.slotsRifle,

     this.slotsPistol,

     this.byLocker,
  });

      /// Number of weapon lockers.
  @JsonKey(
    
    name: r'lockers',
    required: false,
    includeIfNull: false,
  )


  final int? lockers;



      /// Total weapon slots across all lockers.
  @JsonKey(
    
    name: r'slots_total',
    required: false,
    includeIfNull: false,
  )


  final int? slotsTotal;



      /// Total rifle slots across all lockers.
  @JsonKey(
    
    name: r'slots_rifle',
    required: false,
    includeIfNull: false,
  )


  final int? slotsRifle;



      /// Total pistol slots across all lockers.
  @JsonKey(
    
    name: r'slots_pistol',
    required: false,
    includeIfNull: false,
  )


  final int? slotsPistol;



      /// Per-locker breakdown, grouped by identical configuration.
  @JsonKey(
    
    name: r'by_locker',
    required: false,
    includeIfNull: false,
  )


  final List<VehicleWeaponStorageByLockerInner>? byLocker;





    @override
    bool operator ==(Object other) => identical(this, other) || other is VehicleWeaponStorage &&
      other.lockers == lockers &&
      other.slotsTotal == slotsTotal &&
      other.slotsRifle == slotsRifle &&
      other.slotsPistol == slotsPistol &&
      other.byLocker == byLocker;

    @override
    int get hashCode =>
        lockers.hashCode +
        slotsTotal.hashCode +
        slotsRifle.hashCode +
        slotsPistol.hashCode +
        byLocker.hashCode;

  factory VehicleWeaponStorage.fromJson(Map<String, dynamic> json) => _$VehicleWeaponStorageFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleWeaponStorageToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

