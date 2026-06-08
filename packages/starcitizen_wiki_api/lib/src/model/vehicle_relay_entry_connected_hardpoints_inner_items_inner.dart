//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'vehicle_relay_entry_connected_hardpoints_inner_items_inner.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class VehicleRelayEntryConnectedHardpointsInnerItemsInner {
  /// Returns a new [VehicleRelayEntryConnectedHardpointsInnerItemsInner] instance.
  VehicleRelayEntryConnectedHardpointsInnerItemsInner({

     this.hardpoint,

     this.itemName,

     this.className,

     this.type,

     this.uuid,
  });

      /// Hardpoint name.
  @JsonKey(
    
    name: r'hardpoint',
    required: false,
    includeIfNull: false,
  )


  final String? hardpoint;



      /// Display name of the installed item.
  @JsonKey(
    
    name: r'item_name',
    required: false,
    includeIfNull: false,
  )


  final String? itemName;



      /// SC class name of the installed item.
  @JsonKey(
    
    name: r'class_name',
    required: false,
    includeIfNull: false,
  )


  final String? className;



      /// Primary equipment type.
  @JsonKey(
    
    name: r'type',
    required: false,
    includeIfNull: false,
  )


  final String? type;



      /// Item UUID.
  @JsonKey(
    
    name: r'uuid',
    required: false,
    includeIfNull: false,
  )


  final String? uuid;





    @override
    bool operator ==(Object other) => identical(this, other) || other is VehicleRelayEntryConnectedHardpointsInnerItemsInner &&
      other.hardpoint == hardpoint &&
      other.itemName == itemName &&
      other.className == className &&
      other.type == type &&
      other.uuid == uuid;

    @override
    int get hashCode =>
        hardpoint.hashCode +
        (itemName == null ? 0 : itemName.hashCode) +
        (className == null ? 0 : className.hashCode) +
        (type == null ? 0 : type.hashCode) +
        (uuid == null ? 0 : uuid.hashCode);

  factory VehicleRelayEntryConnectedHardpointsInnerItemsInner.fromJson(Map<String, dynamic> json) => _$VehicleRelayEntryConnectedHardpointsInnerItemsInnerFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleRelayEntryConnectedHardpointsInnerItemsInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

