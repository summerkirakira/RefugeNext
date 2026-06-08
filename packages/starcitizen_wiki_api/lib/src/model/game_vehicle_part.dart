//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'game_vehicle_part.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GameVehiclePart {
  /// Returns a new [GameVehiclePart] instance.
  GameVehiclePart({

     this.name,

     this.displayName,

     this.damageMax,

     this.destructionDamage,

     this.detachDamage,

     this.children,

     this.version,
  });

      /// Raw part name from scunpacked data (e.g. LEFT_WING).
  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



      /// Human-readable name with positional suffix (e.g. \"Wing (left)\").
  @JsonKey(
    
    name: r'display_name',
    required: false,
    includeIfNull: false,
  )


  final String? displayName;



      /// Maximum damage this structural part can absorb.
  @JsonKey(
    
    name: r'damage_max',
    required: false,
    includeIfNull: false,
  )


  final num? damageMax;



      /// Total damage needed to destroy this part (only set when part appears in DamageBeforeDestruction).
  @JsonKey(
    
    name: r'destruction_damage',
    required: false,
    includeIfNull: false,
  )


  final num? destructionDamage;



      /// Total damage needed to detach this part (only set when part appears in DamageBeforeDetach).
  @JsonKey(
    
    name: r'detach_damage',
    required: false,
    includeIfNull: false,
  )


  final num? detachDamage;



      /// Nested child structural parts.
  @JsonKey(
    
    name: r'children',
    required: false,
    includeIfNull: false,
  )


  final List<GameVehiclePart>? children;



      /// Game version code for this data.
  @JsonKey(
    
    name: r'version',
    required: false,
    includeIfNull: false,
  )


  final String? version;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GameVehiclePart &&
      other.name == name &&
      other.displayName == displayName &&
      other.damageMax == damageMax &&
      other.destructionDamage == destructionDamage &&
      other.detachDamage == detachDamage &&
      other.children == children &&
      other.version == version;

    @override
    int get hashCode =>
        name.hashCode +
        displayName.hashCode +
        (damageMax == null ? 0 : damageMax.hashCode) +
        (destructionDamage == null ? 0 : destructionDamage.hashCode) +
        (detachDamage == null ? 0 : detachDamage.hashCode) +
        (children == null ? 0 : children.hashCode) +
        (version == null ? 0 : version.hashCode);

  factory GameVehiclePart.fromJson(Map<String, dynamic> json) => _$GameVehiclePartFromJson(json);

  Map<String, dynamic> toJson() => _$GameVehiclePartToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

