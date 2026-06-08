//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'game_vehicle_turret_weapons_inner.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GameVehicleTurretWeaponsInner {
  /// Returns a new [GameVehicleTurretWeaponsInner] instance.
  GameVehicleTurretWeaponsInner({

     this.uuid,

     this.className,

     this.name,

     this.link,

     this.webUrl,

     this.dps,

     this.sustainedDps,

     this.alpha,

     this.isPilotSlaveable,
  });

      /// Weapon UUID.
  @JsonKey(
    
    name: r'uuid',
    required: false,
    includeIfNull: false,
  )


  final String? uuid;



      /// SC class name of the weapon.
  @JsonKey(
    
    name: r'class_name',
    required: false,
    includeIfNull: false,
  )


  final String? className;



      /// Human-readable weapon name.
  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



      /// API URL for the full item detail.
  @JsonKey(
    
    name: r'link',
    required: false,
    includeIfNull: false,
  )


  final String? link;



      /// API Web URL for the full item detail.
  @JsonKey(
    
    name: r'web_url',
    required: false,
    includeIfNull: false,
  )


  final String? webUrl;



      /// Weapon DPS.
  @JsonKey(
    
    name: r'dps',
    required: false,
    includeIfNull: false,
  )


  final num? dps;



      /// Weapon sustained DPS.
  @JsonKey(
    
    name: r'sustained_dps',
    required: false,
    includeIfNull: false,
  )


  final num? sustainedDps;



      /// Weapon alpha damage.
  @JsonKey(
    
    name: r'alpha',
    required: false,
    includeIfNull: false,
  )


  final num? alpha;



      /// Whether this weapon can be slaved to pilot control.
  @JsonKey(
    
    name: r'is_pilot_slaveable',
    required: false,
    includeIfNull: false,
  )


  final bool? isPilotSlaveable;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GameVehicleTurretWeaponsInner &&
      other.uuid == uuid &&
      other.className == className &&
      other.name == name &&
      other.link == link &&
      other.webUrl == webUrl &&
      other.dps == dps &&
      other.sustainedDps == sustainedDps &&
      other.alpha == alpha &&
      other.isPilotSlaveable == isPilotSlaveable;

    @override
    int get hashCode =>
        (uuid == null ? 0 : uuid.hashCode) +
        (className == null ? 0 : className.hashCode) +
        (name == null ? 0 : name.hashCode) +
        (link == null ? 0 : link.hashCode) +
        (webUrl == null ? 0 : webUrl.hashCode) +
        (dps == null ? 0 : dps.hashCode) +
        (sustainedDps == null ? 0 : sustainedDps.hashCode) +
        (alpha == null ? 0 : alpha.hashCode) +
        (isPilotSlaveable == null ? 0 : isPilotSlaveable.hashCode);

  factory GameVehicleTurretWeaponsInner.fromJson(Map<String, dynamic> json) => _$GameVehicleTurretWeaponsInnerFromJson(json);

  Map<String, dynamic> toJson() => _$GameVehicleTurretWeaponsInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

