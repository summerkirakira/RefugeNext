//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/game_vehicle_turret_weapons_inner.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_turret_mounts_inner.dart';
import 'package:json_annotation/json_annotation.dart';

part 'game_vehicle_turret.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GameVehicleTurret {
  /// Returns a new [GameVehicleTurret] instance.
  GameVehicleTurret({

     this.category,

     this.displayName,

     this.hardpointName,

     this.partName,

     this.turretType,

     this.className,

     this.size,

     this.turret,

     this.gimballed,

     this.fixed,

     this.mountCount,

     this.weaponSizes,

     this.payloadSizes,

     this.payloadTypes,

     this.payloadClassNames,

     this.mounts,

     this.dpsTotal,

     this.sustainedDpsTotal,

     this.alphaTotal,

     this.isPilotSlaveable,

     this.weapons,

     this.version,
  });

      /// Turret category (manned, remote, pdc).
  @JsonKey(
    
    name: r'category',
    required: false,
    includeIfNull: false,
  )


  final String? category;



      /// Human-readable turret name.
  @JsonKey(
    
    name: r'display_name',
    required: false,
    includeIfNull: false,
  )


  final String? displayName;



      /// Hardpoint name from ship data.
  @JsonKey(
    
    name: r'hardpoint_name',
    required: false,
    includeIfNull: false,
  )


  final String? hardpointName;



      /// Vehicle part this turret belongs to.
  @JsonKey(
    
    name: r'part_name',
    required: false,
    includeIfNull: false,
  )


  final String? partName;



      /// Full turret type string (e.g. TurretBase.MannedTurret).
  @JsonKey(
    
    name: r'turret_type',
    required: false,
    includeIfNull: false,
  )


  final String? turretType;



      /// SC class name of the turret component.
  @JsonKey(
    
    name: r'class_name',
    required: false,
    includeIfNull: false,
  )


  final String? className;



      /// Turret hardpoint size.
  @JsonKey(
    
    name: r'size',
    required: false,
    includeIfNull: false,
  )


  final int? size;



      /// Whether this entry is a turret.
  @JsonKey(
    
    name: r'turret',
    required: false,
    includeIfNull: false,
  )


  final bool? turret;



      /// Whether the turret uses gimbal mounting.
  @JsonKey(
    
    name: r'gimballed',
    required: false,
    includeIfNull: false,
  )


  final bool? gimballed;



      /// Whether the turret is fixed.
  @JsonKey(
    
    name: r'fixed',
    required: false,
    includeIfNull: false,
  )


  final bool? fixed;



      /// Number of weapon mounts on the turret.
  @JsonKey(
    
    name: r'mount_count',
    required: false,
    includeIfNull: false,
  )


  final int? mountCount;



      /// Aggregated weapon sizes across all mounts.
  @JsonKey(
    
    name: r'weapon_sizes',
    required: false,
    includeIfNull: false,
  )


  final List<int>? weaponSizes;



      /// Aggregated payload sizes across all mounts.
  @JsonKey(
    
    name: r'payload_sizes',
    required: false,
    includeIfNull: false,
  )


  final List<int>? payloadSizes;



      /// Aggregated payload types across all mounts.
  @JsonKey(
    
    name: r'payload_types',
    required: false,
    includeIfNull: false,
  )


  final List<String>? payloadTypes;



      /// Aggregated payload class names across all mounts.
  @JsonKey(
    
    name: r'payload_class_names',
    required: false,
    includeIfNull: false,
  )


  final List<String>? payloadClassNames;



      /// Individual mount details for the turret.
  @JsonKey(
    
    name: r'mounts',
    required: false,
    includeIfNull: false,
  )


  final List<GameVehicleTurretMountsInner>? mounts;



      /// Aggregate DPS for the turret.
  @JsonKey(
    
    name: r'dps_total',
    required: false,
    includeIfNull: false,
  )


  final num? dpsTotal;



      /// Sustained DPS for the turret.
  @JsonKey(
    
    name: r'sustained_dps_total',
    required: false,
    includeIfNull: false,
  )


  final num? sustainedDpsTotal;



      /// Alpha (per-shot) damage for the turret.
  @JsonKey(
    
    name: r'alpha_total',
    required: false,
    includeIfNull: false,
  )


  final num? alphaTotal;



      /// Whether the turret can be slaved to pilot control.
  @JsonKey(
    
    name: r'is_pilot_slaveable',
    required: false,
    includeIfNull: false,
  )


  final bool? isPilotSlaveable;



      /// Per-weapon breakdown with DPS and alpha data.
  @JsonKey(
    
    name: r'weapons',
    required: false,
    includeIfNull: false,
  )


  final List<GameVehicleTurretWeaponsInner>? weapons;



      /// Game version code for this data.
  @JsonKey(
    
    name: r'version',
    required: false,
    includeIfNull: false,
  )


  final String? version;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GameVehicleTurret &&
      other.category == category &&
      other.displayName == displayName &&
      other.hardpointName == hardpointName &&
      other.partName == partName &&
      other.turretType == turretType &&
      other.className == className &&
      other.size == size &&
      other.turret == turret &&
      other.gimballed == gimballed &&
      other.fixed == fixed &&
      other.mountCount == mountCount &&
      other.weaponSizes == weaponSizes &&
      other.payloadSizes == payloadSizes &&
      other.payloadTypes == payloadTypes &&
      other.payloadClassNames == payloadClassNames &&
      other.mounts == mounts &&
      other.dpsTotal == dpsTotal &&
      other.sustainedDpsTotal == sustainedDpsTotal &&
      other.alphaTotal == alphaTotal &&
      other.isPilotSlaveable == isPilotSlaveable &&
      other.weapons == weapons &&
      other.version == version;

    @override
    int get hashCode =>
        (category == null ? 0 : category.hashCode) +
        (displayName == null ? 0 : displayName.hashCode) +
        (hardpointName == null ? 0 : hardpointName.hashCode) +
        (partName == null ? 0 : partName.hashCode) +
        (turretType == null ? 0 : turretType.hashCode) +
        (className == null ? 0 : className.hashCode) +
        (size == null ? 0 : size.hashCode) +
        (turret == null ? 0 : turret.hashCode) +
        (gimballed == null ? 0 : gimballed.hashCode) +
        (fixed == null ? 0 : fixed.hashCode) +
        (mountCount == null ? 0 : mountCount.hashCode) +
        (weaponSizes == null ? 0 : weaponSizes.hashCode) +
        (payloadSizes == null ? 0 : payloadSizes.hashCode) +
        (payloadTypes == null ? 0 : payloadTypes.hashCode) +
        (payloadClassNames == null ? 0 : payloadClassNames.hashCode) +
        (mounts == null ? 0 : mounts.hashCode) +
        (dpsTotal == null ? 0 : dpsTotal.hashCode) +
        (sustainedDpsTotal == null ? 0 : sustainedDpsTotal.hashCode) +
        (alphaTotal == null ? 0 : alphaTotal.hashCode) +
        (isPilotSlaveable == null ? 0 : isPilotSlaveable.hashCode) +
        (weapons == null ? 0 : weapons.hashCode) +
        (version == null ? 0 : version.hashCode);

  factory GameVehicleTurret.fromJson(Map<String, dynamic> json) => _$GameVehicleTurretFromJson(json);

  Map<String, dynamic> toJson() => _$GameVehicleTurretToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

