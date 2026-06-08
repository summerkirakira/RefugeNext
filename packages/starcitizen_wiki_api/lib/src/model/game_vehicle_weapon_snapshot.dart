//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'game_vehicle_weapon_snapshot.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GameVehicleWeaponSnapshot {
  /// Returns a new [GameVehicleWeaponSnapshot] instance.
  GameVehicleWeaponSnapshot({

     this.pilotGunsCount,

     this.turretsMannedCount,

     this.turretsRemoteCount,

     this.turretWeaponGunsCount,

     this.missileRackCount,

     this.missileCount,

     this.countermeasuresCount,
  });

  @JsonKey(
    
    name: r'pilot_guns_count',
    required: false,
    includeIfNull: false,
  )


  final int? pilotGunsCount;



  @JsonKey(
    
    name: r'turrets_manned_count',
    required: false,
    includeIfNull: false,
  )


  final int? turretsMannedCount;



  @JsonKey(
    
    name: r'turrets_remote_count',
    required: false,
    includeIfNull: false,
  )


  final int? turretsRemoteCount;



  @JsonKey(
    
    name: r'turret_weapon_guns_count',
    required: false,
    includeIfNull: false,
  )


  final int? turretWeaponGunsCount;



  @JsonKey(
    
    name: r'missile_rack_count',
    required: false,
    includeIfNull: false,
  )


  final int? missileRackCount;



  @JsonKey(
    
    name: r'missile_count',
    required: false,
    includeIfNull: false,
  )


  final int? missileCount;



  @JsonKey(
    
    name: r'countermeasures_count',
    required: false,
    includeIfNull: false,
  )


  final int? countermeasuresCount;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GameVehicleWeaponSnapshot &&
      other.pilotGunsCount == pilotGunsCount &&
      other.turretsMannedCount == turretsMannedCount &&
      other.turretsRemoteCount == turretsRemoteCount &&
      other.turretWeaponGunsCount == turretWeaponGunsCount &&
      other.missileRackCount == missileRackCount &&
      other.missileCount == missileCount &&
      other.countermeasuresCount == countermeasuresCount;

    @override
    int get hashCode =>
        pilotGunsCount.hashCode +
        turretsMannedCount.hashCode +
        turretsRemoteCount.hashCode +
        turretWeaponGunsCount.hashCode +
        missileRackCount.hashCode +
        missileCount.hashCode +
        countermeasuresCount.hashCode;

  factory GameVehicleWeaponSnapshot.fromJson(Map<String, dynamic> json) => _$GameVehicleWeaponSnapshotFromJson(json);

  Map<String, dynamic> toJson() => _$GameVehicleWeaponSnapshotToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

