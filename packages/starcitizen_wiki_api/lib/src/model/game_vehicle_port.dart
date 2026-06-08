//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/game_vehicle_port_compatible_types_inner.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_port_sizes.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_port_equipped_item.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_port_attached_vehicle.dart';
import 'package:json_annotation/json_annotation.dart';

part 'game_vehicle_port.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GameVehiclePort {
  /// Returns a new [GameVehiclePort] instance.
  GameVehiclePort({

     this.name,

     this.position,

     this.sizes,

     this.className,

     this.health,

     this.editable,

     this.editableChildren,

     this.equippedItemUuid,

     this.type,

     this.subType,

     this.subtype,

     this.categoryLabel,

     this.compatibleTypes,

     this.equippedItem,

     this.ports,

     this.requiredTags,

     this.portTags,

     this.version,

     this.attachedVehicle,
  });

      /// Hardpoint name from scunpacked ship data.
  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



      /// Positional label (e.g. left, right, nose).
  @JsonKey(
    
    name: r'position',
    required: false,
    includeIfNull: false,
  )


  final String? position;



  @JsonKey(
    
    name: r'sizes',
    required: false,
    includeIfNull: false,
  )


  final GameVehiclePortSizes? sizes;



      /// SC class name of the port component.
  @JsonKey(
    
    name: r'class_name',
    required: false,
    includeIfNull: false,
  )


  final String? className;



      /// Port health points.
  @JsonKey(
    
    name: r'health',
    required: false,
    includeIfNull: false,
  )


  final num? health;



      /// Whether the port can be modified in-game.
  @JsonKey(
    
    name: r'editable',
    required: false,
    includeIfNull: false,
  )


  final bool? editable;



      /// Whether child ports can be modified in-game.
  @JsonKey(
    
    name: r'editable_children',
    required: false,
    includeIfNull: false,
  )


  final bool? editableChildren;



      /// UUID of the item currently equipped in this port.
  @JsonKey(
    
    name: r'equipped_item_uuid',
    required: false,
    includeIfNull: false,
  )


  final String? equippedItemUuid;



      /// Port type (e.g. WeaponGun, Shield, PowerPlant).
  @JsonKey(
    
    name: r'type',
    required: false,
    includeIfNull: false,
  )


  final String? type;



      /// Port sub-type identifier.
  @JsonKey(
    
    name: r'sub_type',
    required: false,
    includeIfNull: false,
  )


  final String? subType;



      /// Deprecated: Use sub_type.
  @Deprecated('subtype has been deprecated')
  @JsonKey(
    
    name: r'subtype',
    required: false,
    includeIfNull: false,
  )


  final String? subtype;



      /// Human-readable category label. Only present on parent ports (e.g. Weapons, Shields, Thrusters).
  @JsonKey(
    
    name: r'category_label',
    required: false,
    includeIfNull: false,
  )


  final String? categoryLabel;



      /// Port compatibility list from ship data.
  @JsonKey(
    
    name: r'compatible_types',
    required: false,
    includeIfNull: false,
  )


  final List<GameVehiclePortCompatibleTypesInner>? compatibleTypes;



  @JsonKey(
    
    name: r'equipped_item',
    required: false,
    includeIfNull: false,
  )


  final GameVehiclePortEquippedItem? equippedItem;



      /// Nested child ports (hardpoints).
  @JsonKey(
    
    name: r'ports',
    required: false,
    includeIfNull: false,
  )


  final List<GameVehiclePort>? ports;



      /// Tags that items must have to be equipped in this port. Pass individual values as filter[tags] to the items API.
  @JsonKey(
    
    name: r'required_tags',
    required: false,
    includeIfNull: false,
  )


  final List<String>? requiredTags;



      /// Identity tags this port provides. Used to filter items by RequiredTags compatibility - an item can attach if its RequiredTags is empty or fully contained in these tags. Pass as filter[port_tags] to the items API.
  @JsonKey(
    
    name: r'port_tags',
    required: false,
    includeIfNull: false,
  )


  final List<String>? portTags;



      /// Game version code for this data.
  @JsonKey(
    
    name: r'version',
    required: false,
    includeIfNull: false,
  )


  final String? version;



  @JsonKey(
    
    name: r'attached_vehicle',
    required: false,
    includeIfNull: false,
  )


  final GameVehiclePortAttachedVehicle? attachedVehicle;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GameVehiclePort &&
      other.name == name &&
      other.position == position &&
      other.sizes == sizes &&
      other.className == className &&
      other.health == health &&
      other.editable == editable &&
      other.editableChildren == editableChildren &&
      other.equippedItemUuid == equippedItemUuid &&
      other.type == type &&
      other.subType == subType &&
      other.subtype == subtype &&
      other.categoryLabel == categoryLabel &&
      other.compatibleTypes == compatibleTypes &&
      other.equippedItem == equippedItem &&
      other.ports == ports &&
      other.requiredTags == requiredTags &&
      other.portTags == portTags &&
      other.version == version &&
      other.attachedVehicle == attachedVehicle;

    @override
    int get hashCode =>
        name.hashCode +
        (position == null ? 0 : position.hashCode) +
        (sizes == null ? 0 : sizes.hashCode) +
        (className == null ? 0 : className.hashCode) +
        (health == null ? 0 : health.hashCode) +
        (editable == null ? 0 : editable.hashCode) +
        (editableChildren == null ? 0 : editableChildren.hashCode) +
        (equippedItemUuid == null ? 0 : equippedItemUuid.hashCode) +
        (type == null ? 0 : type.hashCode) +
        (subType == null ? 0 : subType.hashCode) +
        (subtype == null ? 0 : subtype.hashCode) +
        (categoryLabel == null ? 0 : categoryLabel.hashCode) +
        (compatibleTypes == null ? 0 : compatibleTypes.hashCode) +
        (equippedItem == null ? 0 : equippedItem.hashCode) +
        (ports == null ? 0 : ports.hashCode) +
        (requiredTags == null ? 0 : requiredTags.hashCode) +
        (portTags == null ? 0 : portTags.hashCode) +
        (version == null ? 0 : version.hashCode) +
        (attachedVehicle == null ? 0 : attachedVehicle.hashCode);

  factory GameVehiclePort.fromJson(Map<String, dynamic> json) => _$GameVehiclePortFromJson(json);

  Map<String, dynamic> toJson() => _$GameVehiclePortToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

