//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/vehicle_suit_storage_by_locker_inner.dart';
import 'package:json_annotation/json_annotation.dart';

part 'vehicle_suit_storage.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class VehicleSuitStorage {
  /// Returns a new [VehicleSuitStorage] instance.
  VehicleSuitStorage({

     this.lockers,

     this.slotsTotal,

     this.byLocker,
  });

      /// Number of suit lockers.
  @JsonKey(
    
    name: r'lockers',
    required: false,
    includeIfNull: false,
  )


  final int? lockers;



      /// Total suit slots across all lockers.
  @JsonKey(
    
    name: r'slots_total',
    required: false,
    includeIfNull: false,
  )


  final int? slotsTotal;



      /// Per-locker breakdown, grouped by identical configuration.
  @JsonKey(
    
    name: r'by_locker',
    required: false,
    includeIfNull: false,
  )


  final List<VehicleSuitStorageByLockerInner>? byLocker;





    @override
    bool operator ==(Object other) => identical(this, other) || other is VehicleSuitStorage &&
      other.lockers == lockers &&
      other.slotsTotal == slotsTotal &&
      other.byLocker == byLocker;

    @override
    int get hashCode =>
        lockers.hashCode +
        slotsTotal.hashCode +
        byLocker.hashCode;

  factory VehicleSuitStorage.fromJson(Map<String, dynamic> json) => _$VehicleSuitStorageFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleSuitStorageToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

