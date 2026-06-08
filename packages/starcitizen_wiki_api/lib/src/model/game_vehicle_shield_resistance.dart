//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/game_vehicle_shield_resistance_biochemical.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_shield_resistance_energy.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_shield_resistance_stun.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_shield_resistance_thermal.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_shield_resistance_physical.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_shield_resistance_distortion.dart';
import 'package:json_annotation/json_annotation.dart';

part 'game_vehicle_shield_resistance.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GameVehicleShieldResistance {
  /// Returns a new [GameVehicleShieldResistance] instance.
  GameVehicleShieldResistance({

     this.physical,

     this.energy,

     this.distortion,

     this.thermal,

     this.biochemical,

     this.stun,
  });

  @JsonKey(
    
    name: r'physical',
    required: false,
    includeIfNull: false,
  )


  final GameVehicleShieldResistancePhysical? physical;



  @JsonKey(
    
    name: r'energy',
    required: false,
    includeIfNull: false,
  )


  final GameVehicleShieldResistanceEnergy? energy;



  @JsonKey(
    
    name: r'distortion',
    required: false,
    includeIfNull: false,
  )


  final GameVehicleShieldResistanceDistortion? distortion;



  @JsonKey(
    
    name: r'thermal',
    required: false,
    includeIfNull: false,
  )


  final GameVehicleShieldResistanceThermal? thermal;



  @JsonKey(
    
    name: r'biochemical',
    required: false,
    includeIfNull: false,
  )


  final GameVehicleShieldResistanceBiochemical? biochemical;



  @JsonKey(
    
    name: r'stun',
    required: false,
    includeIfNull: false,
  )


  final GameVehicleShieldResistanceStun? stun;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GameVehicleShieldResistance &&
      other.physical == physical &&
      other.energy == energy &&
      other.distortion == distortion &&
      other.thermal == thermal &&
      other.biochemical == biochemical &&
      other.stun == stun;

    @override
    int get hashCode =>
        (physical == null ? 0 : physical.hashCode) +
        (energy == null ? 0 : energy.hashCode) +
        (distortion == null ? 0 : distortion.hashCode) +
        (thermal == null ? 0 : thermal.hashCode) +
        (biochemical == null ? 0 : biochemical.hashCode) +
        (stun == null ? 0 : stun.hashCode);

  factory GameVehicleShieldResistance.fromJson(Map<String, dynamic> json) => _$GameVehicleShieldResistanceFromJson(json);

  Map<String, dynamic> toJson() => _$GameVehicleShieldResistanceToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

