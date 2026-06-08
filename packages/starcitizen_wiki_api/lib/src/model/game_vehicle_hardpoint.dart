//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/game_vehicle_hardpoint_item.dart';
import 'package:json_annotation/json_annotation.dart';

part 'game_vehicle_hardpoint.g.dart';


@Deprecated('GameVehicleHardpoint has been deprecated')
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GameVehicleHardpoint {
  /// Returns a new [GameVehicleHardpoint] instance.
  GameVehicleHardpoint({

     this.name,

     this.position,

     this.minSize,

     this.maxSize,

     this.className,

     this.health,

     this.type,

     this.subType,

     this.pilotSlaveable,

     this.item,

     this.children,

     this.version,
  });

      /// Hardpoint name from scunpacked data.
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



      /// Minimum item size the port accepts.
  @JsonKey(
    
    name: r'min_size',
    required: false,
    includeIfNull: false,
  )


  final int? minSize;



      /// Maximum item size the port accepts.
  @JsonKey(
    
    name: r'max_size',
    required: false,
    includeIfNull: false,
  )


  final int? maxSize;



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



      /// Whether the port can be slaved to a pilot.
  @JsonKey(
    
    name: r'pilot_slaveable',
    required: false,
    includeIfNull: false,
  )


  final bool? pilotSlaveable;



      /// Equipped item details, resolved from the game database.
  @JsonKey(
    
    name: r'item',
    required: false,
    includeIfNull: false,
  )


  final GameVehicleHardpointItem? item;



      /// Nested child hardpoints.
  @JsonKey(
    
    name: r'children',
    required: false,
    includeIfNull: false,
  )


  final List<GameVehicleHardpoint>? children;



      /// Game version code for this data.
  @JsonKey(
    
    name: r'version',
    required: false,
    includeIfNull: false,
  )


  final String? version;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GameVehicleHardpoint &&
      other.name == name &&
      other.position == position &&
      other.minSize == minSize &&
      other.maxSize == maxSize &&
      other.className == className &&
      other.health == health &&
      other.type == type &&
      other.subType == subType &&
      other.pilotSlaveable == pilotSlaveable &&
      other.item == item &&
      other.children == children &&
      other.version == version;

    @override
    int get hashCode =>
        name.hashCode +
        (position == null ? 0 : position.hashCode) +
        (minSize == null ? 0 : minSize.hashCode) +
        (maxSize == null ? 0 : maxSize.hashCode) +
        (className == null ? 0 : className.hashCode) +
        (health == null ? 0 : health.hashCode) +
        (type == null ? 0 : type.hashCode) +
        (subType == null ? 0 : subType.hashCode) +
        (pilotSlaveable == null ? 0 : pilotSlaveable.hashCode) +
        (item == null ? 0 : item.hashCode) +
        (children == null ? 0 : children.hashCode) +
        (version == null ? 0 : version.hashCode);

  factory GameVehicleHardpoint.fromJson(Map<String, dynamic> json) => _$GameVehicleHardpointFromJson(json);

  Map<String, dynamic> toJson() => _$GameVehicleHardpointToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

