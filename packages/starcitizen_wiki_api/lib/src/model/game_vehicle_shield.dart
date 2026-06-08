//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/game_vehicle_shield_resistance.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_shield_absorption.dart';
import 'package:json_annotation/json_annotation.dart';

part 'game_vehicle_shield.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GameVehicleShield {
  /// Returns a new [GameVehicleShield] instance.
  GameVehicleShield({

     this.hp,

     this.regeneration,

     this.regenerationTime,

     this.faceType,

     this.maxReallocation,

     this.reconfigurationCooldown,

     this.maxElectricalChargeDamageRate,

     this.resistance,

     this.absorption,
  });

      /// Total shield hit points.
  @JsonKey(
    
    name: r'hp',
    required: false,
    includeIfNull: false,
  )


  final num? hp;



      /// Shield regeneration rate per second.
  @JsonKey(
    
    name: r'regeneration',
    required: false,
    includeIfNull: false,
  )


  final num? regeneration;



      /// Shield regeneration time from empty. Assuming full power segments assigned to shields.
  @JsonKey(
    
    name: r'regeneration_time',
    required: false,
    includeIfNull: false,
  )


  final num? regenerationTime;



      /// Shield face configuration (e.g., Bubble, Quadrant).
  @JsonKey(
    
    name: r'face_type',
    required: false,
    includeIfNull: false,
  )


  final String? faceType;



      /// Maximum shield reallocation ratio (0-1).
  @JsonKey(
    
    name: r'max_reallocation',
    required: false,
    includeIfNull: false,
  )


  final num? maxReallocation;



      /// Cooldown time for shield reconfiguration in seconds.
  @JsonKey(
    
    name: r'reconfiguration_cooldown',
    required: false,
    includeIfNull: false,
  )


  final num? reconfigurationCooldown;



      /// Maximum electrical charge damage rate.
  @JsonKey(
    
    name: r'max_electrical_charge_damage_rate',
    required: false,
    includeIfNull: false,
  )


  final num? maxElectricalChargeDamageRate;



  @JsonKey(
    
    name: r'resistance',
    required: false,
    includeIfNull: false,
  )


  final GameVehicleShieldResistance? resistance;



  @JsonKey(
    
    name: r'absorption',
    required: false,
    includeIfNull: false,
  )


  final GameVehicleShieldAbsorption? absorption;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GameVehicleShield &&
      other.hp == hp &&
      other.regeneration == regeneration &&
      other.regenerationTime == regenerationTime &&
      other.faceType == faceType &&
      other.maxReallocation == maxReallocation &&
      other.reconfigurationCooldown == reconfigurationCooldown &&
      other.maxElectricalChargeDamageRate == maxElectricalChargeDamageRate &&
      other.resistance == resistance &&
      other.absorption == absorption;

    @override
    int get hashCode =>
        (hp == null ? 0 : hp.hashCode) +
        (regeneration == null ? 0 : regeneration.hashCode) +
        (regenerationTime == null ? 0 : regenerationTime.hashCode) +
        (faceType == null ? 0 : faceType.hashCode) +
        (maxReallocation == null ? 0 : maxReallocation.hashCode) +
        (reconfigurationCooldown == null ? 0 : reconfigurationCooldown.hashCode) +
        (maxElectricalChargeDamageRate == null ? 0 : maxElectricalChargeDamageRate.hashCode) +
        (resistance == null ? 0 : resistance.hashCode) +
        (absorption == null ? 0 : absorption.hashCode);

  factory GameVehicleShield.fromJson(Map<String, dynamic> json) => _$GameVehicleShieldFromJson(json);

  Map<String, dynamic> toJson() => _$GameVehicleShieldToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

