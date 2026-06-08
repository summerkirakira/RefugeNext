//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/game_vehicle_shield_absorption_stun.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_shield_absorption_energy.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_shield_absorption_physical.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_shield_absorption_distortion.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_shield_absorption_biochemical.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_shield_absorption_thermal.dart';
import 'package:json_annotation/json_annotation.dart';

part 'game_vehicle_shield_absorption.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GameVehicleShieldAbsorption {
  /// Returns a new [GameVehicleShieldAbsorption] instance.
  GameVehicleShieldAbsorption({

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


  final GameVehicleShieldAbsorptionPhysical? physical;



  @JsonKey(
    
    name: r'energy',
    required: false,
    includeIfNull: false,
  )


  final GameVehicleShieldAbsorptionEnergy? energy;



  @JsonKey(
    
    name: r'distortion',
    required: false,
    includeIfNull: false,
  )


  final GameVehicleShieldAbsorptionDistortion? distortion;



  @JsonKey(
    
    name: r'thermal',
    required: false,
    includeIfNull: false,
  )


  final GameVehicleShieldAbsorptionThermal? thermal;



  @JsonKey(
    
    name: r'biochemical',
    required: false,
    includeIfNull: false,
  )


  final GameVehicleShieldAbsorptionBiochemical? biochemical;



  @JsonKey(
    
    name: r'stun',
    required: false,
    includeIfNull: false,
  )


  final GameVehicleShieldAbsorptionStun? stun;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GameVehicleShieldAbsorption &&
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

  factory GameVehicleShieldAbsorption.fromJson(Map<String, dynamic> json) => _$GameVehicleShieldAbsorptionFromJson(json);

  Map<String, dynamic> toJson() => _$GameVehicleShieldAbsorptionToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

