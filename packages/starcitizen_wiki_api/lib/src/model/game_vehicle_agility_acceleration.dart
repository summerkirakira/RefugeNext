//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'game_vehicle_agility_acceleration.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GameVehicleAgilityAcceleration {
  /// Returns a new [GameVehicleAgilityAcceleration] instance.
  GameVehicleAgilityAcceleration({

     this.main,

     this.retro,

     this.vtol,

     this.maneuvering,

     this.mainG,

     this.retroG,

     this.vtolG,

     this.maneuveringG,
  });

      /// Forward acceleration in m/s².
  @JsonKey(
    
    name: r'main',
    required: false,
    includeIfNull: false,
  )


  final num? main;



      /// Retro (backward) acceleration in m/s².
  @JsonKey(
    
    name: r'retro',
    required: false,
    includeIfNull: false,
  )


  final num? retro;



      /// VTOL acceleration in m/s².
  @JsonKey(
    
    name: r'vtol',
    required: false,
    includeIfNull: false,
  )


  final num? vtol;



      /// Maneuvering thruster acceleration in m/s².
  @JsonKey(
    
    name: r'maneuvering',
    required: false,
    includeIfNull: false,
  )


  final num? maneuvering;



      /// Forward acceleration in G.
  @JsonKey(
    
    name: r'main_g',
    required: false,
    includeIfNull: false,
  )


  final num? mainG;



      /// Retro acceleration in G.
  @JsonKey(
    
    name: r'retro_g',
    required: false,
    includeIfNull: false,
  )


  final num? retroG;



      /// VTOL acceleration in G.
  @JsonKey(
    
    name: r'vtol_g',
    required: false,
    includeIfNull: false,
  )


  final num? vtolG;



      /// Maneuvering acceleration in G.
  @JsonKey(
    
    name: r'maneuvering_g',
    required: false,
    includeIfNull: false,
  )


  final num? maneuveringG;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GameVehicleAgilityAcceleration &&
      other.main == main &&
      other.retro == retro &&
      other.vtol == vtol &&
      other.maneuvering == maneuvering &&
      other.mainG == mainG &&
      other.retroG == retroG &&
      other.vtolG == vtolG &&
      other.maneuveringG == maneuveringG;

    @override
    int get hashCode =>
        (main == null ? 0 : main.hashCode) +
        (retro == null ? 0 : retro.hashCode) +
        (vtol == null ? 0 : vtol.hashCode) +
        (maneuvering == null ? 0 : maneuvering.hashCode) +
        (mainG == null ? 0 : mainG.hashCode) +
        (retroG == null ? 0 : retroG.hashCode) +
        (vtolG == null ? 0 : vtolG.hashCode) +
        (maneuveringG == null ? 0 : maneuveringG.hashCode);

  factory GameVehicleAgilityAcceleration.fromJson(Map<String, dynamic> json) => _$GameVehicleAgilityAccelerationFromJson(json);

  Map<String, dynamic> toJson() => _$GameVehicleAgilityAccelerationToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

