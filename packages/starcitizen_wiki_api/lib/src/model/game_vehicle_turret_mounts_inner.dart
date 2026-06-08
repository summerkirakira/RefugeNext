//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'game_vehicle_turret_mounts_inner.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GameVehicleTurretMountsInner {
  /// Returns a new [GameVehicleTurretMountsInner] instance.
  GameVehicleTurretMountsInner({

     this.displayName,

     this.hardpointName,

     this.mountType,

     this.className,

     this.size,

     this.weaponSizes,

     this.payloadSizes,

     this.payloadTypes,

     this.payloadClassNames,
  });

      /// Human-readable mount name.
  @JsonKey(
    
    name: r'display_name',
    required: false,
    includeIfNull: false,
  )


  final String? displayName;



      /// Hardpoint name of the mount.
  @JsonKey(
    
    name: r'hardpoint_name',
    required: false,
    includeIfNull: false,
  )


  final String? hardpointName;



      /// Mount type string (e.g. Turret.GunTurret).
  @JsonKey(
    
    name: r'mount_type',
    required: false,
    includeIfNull: false,
  )


  final String? mountType;



      /// SC class name of the mount component.
  @JsonKey(
    
    name: r'class_name',
    required: false,
    includeIfNull: false,
  )


  final String? className;



      /// Mount hardpoint size.
  @JsonKey(
    
    name: r'size',
    required: false,
    includeIfNull: false,
  )


  final int? size;



      /// Weapon sizes accepted by this mount.
  @JsonKey(
    
    name: r'weapon_sizes',
    required: false,
    includeIfNull: false,
  )


  final List<int>? weaponSizes;



      /// Payload sizes for this mount.
  @JsonKey(
    
    name: r'payload_sizes',
    required: false,
    includeIfNull: false,
  )


  final List<int>? payloadSizes;



      /// Payload types for this mount.
  @JsonKey(
    
    name: r'payload_types',
    required: false,
    includeIfNull: false,
  )


  final List<String>? payloadTypes;



      /// Payload class names equipped on this mount.
  @JsonKey(
    
    name: r'payload_class_names',
    required: false,
    includeIfNull: false,
  )


  final List<String>? payloadClassNames;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GameVehicleTurretMountsInner &&
      other.displayName == displayName &&
      other.hardpointName == hardpointName &&
      other.mountType == mountType &&
      other.className == className &&
      other.size == size &&
      other.weaponSizes == weaponSizes &&
      other.payloadSizes == payloadSizes &&
      other.payloadTypes == payloadTypes &&
      other.payloadClassNames == payloadClassNames;

    @override
    int get hashCode =>
        (displayName == null ? 0 : displayName.hashCode) +
        (hardpointName == null ? 0 : hardpointName.hashCode) +
        (mountType == null ? 0 : mountType.hashCode) +
        (className == null ? 0 : className.hashCode) +
        (size == null ? 0 : size.hashCode) +
        (weaponSizes == null ? 0 : weaponSizes.hashCode) +
        (payloadSizes == null ? 0 : payloadSizes.hashCode) +
        (payloadTypes == null ? 0 : payloadTypes.hashCode) +
        (payloadClassNames == null ? 0 : payloadClassNames.hashCode);

  factory GameVehicleTurretMountsInner.fromJson(Map<String, dynamic> json) => _$GameVehicleTurretMountsInnerFromJson(json);

  Map<String, dynamic> toJson() => _$GameVehicleTurretMountsInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

