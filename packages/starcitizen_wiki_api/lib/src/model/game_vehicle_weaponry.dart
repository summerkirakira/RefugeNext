//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/game_vehicle_weaponry_missiles.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_weaponry_fixed_weapons.dart';
import 'package:json_annotation/json_annotation.dart';

part 'game_vehicle_weaponry.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GameVehicleWeaponry {
  /// Returns a new [GameVehicleWeaponry] instance.
  GameVehicleWeaponry({

     this.pilotDps,

     this.pilotAlpha,

     this.pilotSustainedDps,

     this.turretDps,

     this.turretAlpha,

     this.turretSustainedDps,

     this.fixedWeapons,

     this.missiles,

     this.totalMissileDamage,
  });

      /// Total pilot weapon DPS.
  @JsonKey(
    
    name: r'pilot_dps',
    required: false,
    includeIfNull: false,
  )


  final num? pilotDps;



      /// Total pilot weapon alpha damage.
  @JsonKey(
    
    name: r'pilot_alpha',
    required: false,
    includeIfNull: false,
  )


  final num? pilotAlpha;



      /// Total pilot weapon sustained DPS.
  @JsonKey(
    
    name: r'pilot_sustained_dps',
    required: false,
    includeIfNull: false,
  )


  final num? pilotSustainedDps;



      /// Total turret weapon DPS.
  @JsonKey(
    
    name: r'turret_dps',
    required: false,
    includeIfNull: false,
  )


  final num? turretDps;



      /// Total turret weapon alpha damage.
  @JsonKey(
    
    name: r'turret_alpha',
    required: false,
    includeIfNull: false,
  )


  final num? turretAlpha;



      /// Total turret weapon sustained DPS.
  @JsonKey(
    
    name: r'turret_sustained_dps',
    required: false,
    includeIfNull: false,
  )


  final num? turretSustainedDps;



  @JsonKey(
    
    name: r'fixed_weapons',
    required: false,
    includeIfNull: false,
  )


  final GameVehicleWeaponryFixedWeapons? fixedWeapons;



  @JsonKey(
    
    name: r'missiles',
    required: false,
    includeIfNull: false,
  )


  final GameVehicleWeaponryMissiles? missiles;



      /// Total missile damage.
  @JsonKey(
    
    name: r'total_missile_damage',
    required: false,
    includeIfNull: false,
  )


  final int? totalMissileDamage;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GameVehicleWeaponry &&
      other.pilotDps == pilotDps &&
      other.pilotAlpha == pilotAlpha &&
      other.pilotSustainedDps == pilotSustainedDps &&
      other.turretDps == turretDps &&
      other.turretAlpha == turretAlpha &&
      other.turretSustainedDps == turretSustainedDps &&
      other.fixedWeapons == fixedWeapons &&
      other.missiles == missiles &&
      other.totalMissileDamage == totalMissileDamage;

    @override
    int get hashCode =>
        (pilotDps == null ? 0 : pilotDps.hashCode) +
        (pilotAlpha == null ? 0 : pilotAlpha.hashCode) +
        (pilotSustainedDps == null ? 0 : pilotSustainedDps.hashCode) +
        (turretDps == null ? 0 : turretDps.hashCode) +
        (turretAlpha == null ? 0 : turretAlpha.hashCode) +
        (turretSustainedDps == null ? 0 : turretSustainedDps.hashCode) +
        (fixedWeapons == null ? 0 : fixedWeapons.hashCode) +
        (missiles == null ? 0 : missiles.hashCode) +
        (totalMissileDamage == null ? 0 : totalMissileDamage.hashCode);

  factory GameVehicleWeaponry.fromJson(Map<String, dynamic> json) => _$GameVehicleWeaponryFromJson(json);

  Map<String, dynamic> toJson() => _$GameVehicleWeaponryToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

