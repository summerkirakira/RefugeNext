//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/vehicle_relay_entry_connected_hardpoints_inner_items_inner.dart';
import 'package:json_annotation/json_annotation.dart';

part 'vehicle_relay_entry_connected_hardpoints_inner.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class VehicleRelayEntryConnectedHardpointsInner {
  /// Returns a new [VehicleRelayEntryConnectedHardpointsInner] instance.
  VehicleRelayEntryConnectedHardpointsInner({

     this.category,

     this.count,

     this.items,
  });

      /// Equipment category label.
  @JsonKey(
    
    name: r'category',
    required: false,
    includeIfNull: false,
  )


  final String? category;



      /// Number of hardpoints in this group.
  @JsonKey(
    
    name: r'count',
    required: false,
    includeIfNull: false,
  )


  final int? count;



      /// Individual hardpoints in this group.
  @JsonKey(
    
    name: r'items',
    required: false,
    includeIfNull: false,
  )


  final List<VehicleRelayEntryConnectedHardpointsInnerItemsInner>? items;





    @override
    bool operator ==(Object other) => identical(this, other) || other is VehicleRelayEntryConnectedHardpointsInner &&
      other.category == category &&
      other.count == count &&
      other.items == items;

    @override
    int get hashCode =>
        category.hashCode +
        count.hashCode +
        items.hashCode;

  factory VehicleRelayEntryConnectedHardpointsInner.fromJson(Map<String, dynamic> json) => _$VehicleRelayEntryConnectedHardpointsInnerFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleRelayEntryConnectedHardpointsInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

