//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/item_inventory_max_size.dart';
import 'package:starcitizen_wiki_api/src/model/item_inventory_min_size.dart';
import 'package:json_annotation/json_annotation.dart';

part 'item_inventory.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ItemInventory {
  /// Returns a new [ItemInventory] instance.
  ItemInventory({

     this.uuid,

     this.width,

     this.height,

     this.length,

     this.volume,

     this.scu,

     this.scuConverted,

     this.unit,

     this.microScu,

     this.open,

     this.external_,

     this.closed,

     this.minSize,

     this.maxSize,

     this.minScuBox,

     this.maxScuBox,
  });

      /// Unique identifier of the referenced InventoryContainer.
  @JsonKey(
    
    name: r'uuid',
    required: false,
    includeIfNull: false,
  )


  final String? uuid;



      /// Interior width in meters (interiorDimensions.x).
  @JsonKey(
    
    name: r'width',
    required: false,
    includeIfNull: false,
  )


  final double? width;



      /// Interior height in meters (interiorDimensions.z).
  @JsonKey(
    
    name: r'height',
    required: false,
    includeIfNull: false,
  )


  final double? height;



      /// Interior depth in meters (interiorDimensions.y).
  @JsonKey(
    
    name: r'length',
    required: false,
    includeIfNull: false,
  )


  final double? length;



      /// Interior volume in cubic meters (width * height * length).
  @JsonKey(
    
    name: r'volume',
    required: false,
    includeIfNull: false,
  )


  final double? volume;



      /// Raw SCU capacity as set in game data.
  @JsonKey(
    
    name: r'scu',
    required: false,
    includeIfNull: false,
  )


  final double? scu;



      /// SCU capacity converted to the unit specified in the unit field (e.g. µSCU, cSCU, or SCU).
  @JsonKey(
    
    name: r'scu_converted',
    required: false,
    includeIfNull: false,
  )


  final double? scuConverted;



      /// Unit label displayed in the UI, e.g. \"µSCU\" or \"SCU\".
  @JsonKey(
    
    name: r'unit',
    required: false,
    includeIfNull: false,
  )


  final String? unit;



      /// Capacity in µSCU. Only present when unit exponent is 0 (standard SCU).
  @JsonKey(
    
    name: r'micro_scu',
    required: false,
    includeIfNull: false,
  )


  final double? microScu;



      /// Whether this is an open container (e.g. a cargo grid).
  @JsonKey(
    
    name: r'open',
    required: false,
    includeIfNull: false,
  )


  final bool? open;



      /// Whether this container is externally accessible (e.g. a cargo pod).
  @JsonKey(
    
    name: r'external',
    required: false,
    includeIfNull: false,
  )


  final bool? external_;



      /// Whether this is a closed container (e.g. a locker or personal storage).
  @JsonKey(
    
    name: r'closed',
    required: false,
    includeIfNull: false,
  )


  final bool? closed;



  @JsonKey(
    
    name: r'min_size',
    required: false,
    includeIfNull: false,
  )


  final ItemInventoryMinSize? minSize;



  @JsonKey(
    
    name: r'max_size',
    required: false,
    includeIfNull: false,
  )


  final ItemInventoryMaxSize? maxSize;



      /// Smallest standard SCU box whose dimensions satisfy the min item size. Powers of two: 0.125, 1, 2, 4, 8, 16, 32.
  @JsonKey(
    
    name: r'min_scu_box',
    required: false,
    includeIfNull: false,
  )


  final num? minScuBox;



      /// Largest standard SCU box that fits within the max item size and interior dimensions. Powers of two: 0.125, 1, 2, 4, 8, 16, 32.
  @JsonKey(
    
    name: r'max_scu_box',
    required: false,
    includeIfNull: false,
  )


  final num? maxScuBox;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ItemInventory &&
      other.uuid == uuid &&
      other.width == width &&
      other.height == height &&
      other.length == length &&
      other.volume == volume &&
      other.scu == scu &&
      other.scuConverted == scuConverted &&
      other.unit == unit &&
      other.microScu == microScu &&
      other.open == open &&
      other.external_ == external_ &&
      other.closed == closed &&
      other.minSize == minSize &&
      other.maxSize == maxSize &&
      other.minScuBox == minScuBox &&
      other.maxScuBox == maxScuBox;

    @override
    int get hashCode =>
        (uuid == null ? 0 : uuid.hashCode) +
        (width == null ? 0 : width.hashCode) +
        (height == null ? 0 : height.hashCode) +
        (length == null ? 0 : length.hashCode) +
        (volume == null ? 0 : volume.hashCode) +
        (scu == null ? 0 : scu.hashCode) +
        (scuConverted == null ? 0 : scuConverted.hashCode) +
        (unit == null ? 0 : unit.hashCode) +
        (microScu == null ? 0 : microScu.hashCode) +
        (open == null ? 0 : open.hashCode) +
        (external_ == null ? 0 : external_.hashCode) +
        (closed == null ? 0 : closed.hashCode) +
        (minSize == null ? 0 : minSize.hashCode) +
        (maxSize == null ? 0 : maxSize.hashCode) +
        (minScuBox == null ? 0 : minScuBox.hashCode) +
        (maxScuBox == null ? 0 : maxScuBox.hashCode);

  factory ItemInventory.fromJson(Map<String, dynamic> json) => _$ItemInventoryFromJson(json);

  Map<String, dynamic> toJson() => _$ItemInventoryToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

