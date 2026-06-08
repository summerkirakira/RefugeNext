//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'vehicle_suit_storage_by_locker_inner.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class VehicleSuitStorageByLockerInner {
  /// Returns a new [VehicleSuitStorageByLockerInner] instance.
  VehicleSuitStorageByLockerInner({

     this.count,

     this.name,

     this.className,

     this.port,

     this.slotsTotal,
  });

      /// Number of identical lockers with this configuration.
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





    @override
    bool operator ==(Object other) => identical(this, other) || other is VehicleSuitStorageByLockerInner &&
      other.count == count &&
      other.name == name &&
      other.className == className &&
      other.port == port &&
      other.slotsTotal == slotsTotal;

    @override
    int get hashCode =>
        count.hashCode +
        name.hashCode +
        className.hashCode +
        port.hashCode +
        slotsTotal.hashCode;

  factory VehicleSuitStorageByLockerInner.fromJson(Map<String, dynamic> json) => _$VehicleSuitStorageByLockerInnerFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleSuitStorageByLockerInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

