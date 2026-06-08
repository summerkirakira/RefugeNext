//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/item_inventory.dart';
import 'package:starcitizen_wiki_api/src/model/item_related_link_ext.dart';
import 'package:starcitizen_wiki_api/src/model/item_related_link.dart';
import 'package:starcitizen_wiki_api/src/model/item_port.dart';
import 'package:starcitizen_wiki_api/src/model/manufacturer_link.dart';
import 'package:json_annotation/json_annotation.dart';

part 'game_vehicle_hardpoint_item.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GameVehicleHardpointItem {
  /// Returns a new [GameVehicleHardpointItem] instance.
  GameVehicleHardpointItem({

     this.setName,

     this.baseItem,

     this.variantItems,

     this.setItems,

     this.uuid,

     this.name,

     this.className,

     this.link,

     this.size,

     this.mass,

     this.grade,

     this.class_,

     this.manufacturer,

     this.type,

     this.typeLabel,

     this.subType,

     this.subTypeLabel,

     this.inventory,

     this.ports,

     this.updatedAt,

     this.version,
  });

  @JsonKey(
    
    name: r'set_name',
    required: false,
    includeIfNull: false,
  )


  final String? setName;



  @JsonKey(
    
    name: r'base_item',
    required: false,
    includeIfNull: false,
  )


  final ItemRelatedLink? baseItem;



  @JsonKey(
    
    name: r'variant_items',
    required: false,
    includeIfNull: false,
  )


  final List<ItemRelatedLink>? variantItems;



  @JsonKey(
    
    name: r'set_items',
    required: false,
    includeIfNull: false,
  )


  final List<ItemRelatedLinkExt>? setItems;



      /// Unique item identifier.
  @JsonKey(
    
    name: r'uuid',
    required: false,
    includeIfNull: false,
  )


  final String? uuid;



      /// Display name of the equipped item.
  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



      /// SC item class name (e.g. BEHR_LaserCannon_S4).
  @JsonKey(
    
    name: r'class_name',
    required: false,
    includeIfNull: false,
  )


  final String? className;



      /// API URL for the full item detail.
  @JsonKey(
    
    name: r'link',
    required: false,
    includeIfNull: false,
  )


  final String? link;



      /// Item size as integer.
  @JsonKey(
    
    name: r'size',
    required: false,
    includeIfNull: false,
  )


  final int? size;



      /// Item mass in kg.
  @JsonKey(
    
    name: r'mass',
    required: false,
    includeIfNull: false,
  )


  final double? mass;



      /// Item grade letter (A-D).
  @JsonKey(
    
    name: r'grade',
    required: false,
    includeIfNull: false,
  )


  final String? grade;



      /// Item class name from game data.
  @JsonKey(
    
    name: r'class',
    required: false,
    includeIfNull: false,
  )


  final String? class_;



  @JsonKey(
    
    name: r'manufacturer',
    required: false,
    includeIfNull: false,
  )


  final ManufacturerLink? manufacturer;



      /// Item type with NOITEM_ prefix stripped.
  @JsonKey(
    
    name: r'type',
    required: false,
    includeIfNull: false,
  )


  final String? type;



      /// Human-readable label for the item type.
  @JsonKey(
    
    name: r'type_label',
    required: false,
    includeIfNull: false,
  )


  final String? typeLabel;



      /// Item sub-type identifier.
  @JsonKey(
    
    name: r'sub_type',
    required: false,
    includeIfNull: false,
  )


  final String? subType;



      /// Human-readable label for the item sub-type.
  @JsonKey(
    
    name: r'sub_type_label',
    required: false,
    includeIfNull: false,
  )


  final String? subTypeLabel;



      /// Inventory container data, if the item has one.
  @JsonKey(
    
    name: r'inventory',
    required: false,
    includeIfNull: false,
  )


  final ItemInventory? inventory;



      /// Sub-ports available on this item.
  @JsonKey(
    
    name: r'ports',
    required: false,
    includeIfNull: false,
  )


  final List<ItemPort>? ports;



      /// Timestamp of the last update.
  @JsonKey(
    
    name: r'updated_at',
    required: false,
    includeIfNull: false,
  )


  final DateTime? updatedAt;



      /// Game version code this item belongs to.
  @JsonKey(
    
    name: r'version',
    required: false,
    includeIfNull: false,
  )


  final String? version;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GameVehicleHardpointItem &&
      other.setName == setName &&
      other.baseItem == baseItem &&
      other.variantItems == variantItems &&
      other.setItems == setItems &&
      other.uuid == uuid &&
      other.name == name &&
      other.className == className &&
      other.link == link &&
      other.size == size &&
      other.mass == mass &&
      other.grade == grade &&
      other.class_ == class_ &&
      other.manufacturer == manufacturer &&
      other.type == type &&
      other.typeLabel == typeLabel &&
      other.subType == subType &&
      other.subTypeLabel == subTypeLabel &&
      other.inventory == inventory &&
      other.ports == ports &&
      other.updatedAt == updatedAt &&
      other.version == version;

    @override
    int get hashCode =>
        (setName == null ? 0 : setName.hashCode) +
        (baseItem == null ? 0 : baseItem.hashCode) +
        (variantItems == null ? 0 : variantItems.hashCode) +
        (setItems == null ? 0 : setItems.hashCode) +
        uuid.hashCode +
        name.hashCode +
        className.hashCode +
        link.hashCode +
        (size == null ? 0 : size.hashCode) +
        (mass == null ? 0 : mass.hashCode) +
        (grade == null ? 0 : grade.hashCode) +
        (class_ == null ? 0 : class_.hashCode) +
        manufacturer.hashCode +
        (type == null ? 0 : type.hashCode) +
        (typeLabel == null ? 0 : typeLabel.hashCode) +
        (subType == null ? 0 : subType.hashCode) +
        (subTypeLabel == null ? 0 : subTypeLabel.hashCode) +
        (inventory == null ? 0 : inventory.hashCode) +
        (ports == null ? 0 : ports.hashCode) +
        (updatedAt == null ? 0 : updatedAt.hashCode) +
        (version == null ? 0 : version.hashCode);

  factory GameVehicleHardpointItem.fromJson(Map<String, dynamic> json) => _$GameVehicleHardpointItemFromJson(json);

  Map<String, dynamic> toJson() => _$GameVehicleHardpointItemToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

