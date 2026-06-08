//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/vehicle_relay_entry_connected_hardpoints_inner.dart';
import 'package:json_annotation/json_annotation.dart';

part 'vehicle_relay_entry.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class VehicleRelayEntry {
  /// Returns a new [VehicleRelayEntry] instance.
  VehicleRelayEntry({

     this.hardpoint,

     this.className,

     this.fuseSlots,

     this.room,

     this.connectionCount,

     this.connectedHardpoints,
  });

      /// Relay hardpoint name.
  @JsonKey(
    
    name: r'hardpoint',
    required: false,
    includeIfNull: false,
  )


  final String? hardpoint;



      /// Relay entity class name.
  @JsonKey(
    
    name: r'class_name',
    required: false,
    includeIfNull: false,
  )


  final String? className;



      /// Number of fuse slots on this relay.
  @JsonKey(
    
    name: r'fuse_slots',
    required: false,
    includeIfNull: false,
  )


  final int? fuseSlots;



      /// Room/bone name where the relay is located.
  @JsonKey(
    
    name: r'room',
    required: false,
    includeIfNull: false,
  )


  final String? room;



      /// Total number of connected hardpoints.
  @JsonKey(
    
    name: r'connection_count',
    required: false,
    includeIfNull: false,
  )


  final int? connectionCount;



      /// Hardpoints powered by this relay, grouped by equipment category.
  @JsonKey(
    
    name: r'connected_hardpoints',
    required: false,
    includeIfNull: false,
  )


  final List<VehicleRelayEntryConnectedHardpointsInner>? connectedHardpoints;





    @override
    bool operator ==(Object other) => identical(this, other) || other is VehicleRelayEntry &&
      other.hardpoint == hardpoint &&
      other.className == className &&
      other.fuseSlots == fuseSlots &&
      other.room == room &&
      other.connectionCount == connectionCount &&
      other.connectedHardpoints == connectedHardpoints;

    @override
    int get hashCode =>
        hardpoint.hashCode +
        (className == null ? 0 : className.hashCode) +
        fuseSlots.hashCode +
        (room == null ? 0 : room.hashCode) +
        connectionCount.hashCode +
        (connectedHardpoints == null ? 0 : connectedHardpoints.hashCode);

  factory VehicleRelayEntry.fromJson(Map<String, dynamic> json) => _$VehicleRelayEntryFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleRelayEntryToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

