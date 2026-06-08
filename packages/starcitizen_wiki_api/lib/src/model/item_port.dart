//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/item_port_type.dart';
import 'package:starcitizen_wiki_api/src/model/item_port_sizes.dart';
import 'package:starcitizen_wiki_api/src/model/game_port_item.dart';
import 'package:json_annotation/json_annotation.dart';

part 'item_port.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ItemPort {
  /// Returns a new [ItemPort] instance.
  ItemPort({

     this.name,

     this.displayName,

     this.position,

     this.size,

     this.sizes,

     this.compatibleTypes,

     this.types,

     this.tags,

     this.requiredTags,

     this.flags,

     this.editable,

     this.uneditable,

     this.equippedItemUuid,

     this.type,

     this.subType,

     this.portTags,

     this.ports,

     this.equippedItem,
  });

      /// Internal port identifier (e.g. hardpoint_weapon_wing_right).
  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



      /// Human-readable port name, resolved from localization key.
  @JsonKey(
    
    name: r'display_name',
    required: false,
    includeIfNull: false,
  )


  final String? displayName;



      /// Derived position label (e.g. magazine_well, optics, underbarrel, barrel).
  @JsonKey(
    
    name: r'position',
    required: false,
    includeIfNull: false,
  )


  final String? position;



      /// Maximum item size this port accepts (same as sizes.max).
  @JsonKey(
    
    name: r'size',
    required: false,
    includeIfNull: false,
  )


  final int? size;



  @JsonKey(
    
    name: r'sizes',
    required: false,
    includeIfNull: false,
  )


  final ItemPortSizes? sizes;



  @JsonKey(
    
    name: r'compatible_types',
    required: false,
    includeIfNull: false,
  )


  final List<ItemPortType>? compatibleTypes;



      /// Structured compatible type entries with type and sub-types.
  @JsonKey(
    
    name: r'types',
    required: false,
    includeIfNull: false,
  )


  final List<String>? types;



      /// Tags provided by this port to attached items (from PortTags attribute).
  @JsonKey(
    
    name: r'tags',
    required: false,
    includeIfNull: false,
  )


  final List<String>? tags;



      /// Tags an item must have to attach to this port (from RequiredPortTags, $ prefix stripped).
  @JsonKey(
    
    name: r'required_tags',
    required: false,
    includeIfNull: false,
  )


  final List<String>? requiredTags;



      /// Port flags controlling behavior (e.g. editable, uneditable, invisible, select).
  @JsonKey(
    
    name: r'flags',
    required: false,
    includeIfNull: false,
  )


  final List<String>? flags;



      /// Whether the port can be modified in-game.
  @JsonKey(
    
    name: r'editable',
    required: false,
    includeIfNull: false,
  )


  final bool? editable;



      /// Deprecated: Use editable (inverted value).
  @Deprecated('uneditable has been deprecated')
  @JsonKey(
    
    name: r'uneditable',
    required: false,
    includeIfNull: false,
  )


  final bool? uneditable;



      /// UUID of the equipped item
  @JsonKey(
    
    name: r'equipped_item_uuid',
    required: false,
    includeIfNull: false,
  )


  final String? equippedItemUuid;



      /// Port type derived from CompatibleTypes (e.g. WeaponGun, MissileLauncher).
  @JsonKey(
    
    name: r'type',
    required: false,
    includeIfNull: false,
  )


  final String? type;



      /// Port sub-type derived from CompatibleTypes.
  @JsonKey(
    
    name: r'sub_type',
    required: false,
    includeIfNull: false,
  )


  final String? subType;



      /// Tags provided by this port. Same as tags field, for vehicle port_tags compat.
  @JsonKey(
    
    name: r'port_tags',
    required: false,
    includeIfNull: false,
  )


  final List<String>? portTags;



      /// Sub-ports from the equipped item.
  @JsonKey(
    
    name: r'ports',
    required: false,
    includeIfNull: false,
  )


  final List<ItemPort>? ports;



  @JsonKey(
    
    name: r'equipped_item',
    required: false,
    includeIfNull: false,
  )


  final GamePortItem? equippedItem;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ItemPort &&
      other.name == name &&
      other.displayName == displayName &&
      other.position == position &&
      other.size == size &&
      other.sizes == sizes &&
      other.compatibleTypes == compatibleTypes &&
      other.types == types &&
      other.tags == tags &&
      other.requiredTags == requiredTags &&
      other.flags == flags &&
      other.editable == editable &&
      other.uneditable == uneditable &&
      other.equippedItemUuid == equippedItemUuid &&
      other.type == type &&
      other.subType == subType &&
      other.portTags == portTags &&
      other.ports == ports &&
      other.equippedItem == equippedItem;

    @override
    int get hashCode =>
        name.hashCode +
        (displayName == null ? 0 : displayName.hashCode) +
        (position == null ? 0 : position.hashCode) +
        (size == null ? 0 : size.hashCode) +
        sizes.hashCode +
        (compatibleTypes == null ? 0 : compatibleTypes.hashCode) +
        (types == null ? 0 : types.hashCode) +
        (tags == null ? 0 : tags.hashCode) +
        (requiredTags == null ? 0 : requiredTags.hashCode) +
        (flags == null ? 0 : flags.hashCode) +
        (editable == null ? 0 : editable.hashCode) +
        (uneditable == null ? 0 : uneditable.hashCode) +
        (equippedItemUuid == null ? 0 : equippedItemUuid.hashCode) +
        (type == null ? 0 : type.hashCode) +
        (subType == null ? 0 : subType.hashCode) +
        (portTags == null ? 0 : portTags.hashCode) +
        (ports == null ? 0 : ports.hashCode) +
        (equippedItem == null ? 0 : equippedItem.hashCode);

  factory ItemPort.fromJson(Map<String, dynamic> json) => _$ItemPortFromJson(json);

  Map<String, dynamic> toJson() => _$ItemPortToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

