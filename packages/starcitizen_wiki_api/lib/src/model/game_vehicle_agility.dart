//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/game_vehicle_agility_acceleration.dart';
import 'package:json_annotation/json_annotation.dart';

part 'game_vehicle_agility.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GameVehicleAgility {
  /// Returns a new [GameVehicleAgility] instance.
  GameVehicleAgility({

     this.pitch,

     this.yaw,

     this.roll,

     this.pitchBoosted,

     this.yawBoosted,

     this.rollBoosted,

     this.acceleration,
  });

      /// Pitch angular rate in deg/s.
  @JsonKey(
    
    name: r'pitch',
    required: false,
    includeIfNull: false,
  )


  final num? pitch;



      /// Yaw angular rate in deg/s.
  @JsonKey(
    
    name: r'yaw',
    required: false,
    includeIfNull: false,
  )


  final num? yaw;



      /// Roll angular rate in deg/s.
  @JsonKey(
    
    name: r'roll',
    required: false,
    includeIfNull: false,
  )


  final num? roll;



      /// Pitch angular rate with boost in deg/s.
  @JsonKey(
    
    name: r'pitch_boosted',
    required: false,
    includeIfNull: false,
  )


  final num? pitchBoosted;



      /// Yaw angular rate with boost in deg/s.
  @JsonKey(
    
    name: r'yaw_boosted',
    required: false,
    includeIfNull: false,
  )


  final num? yawBoosted;



      /// Roll angular rate with boost in deg/s.
  @JsonKey(
    
    name: r'roll_boosted',
    required: false,
    includeIfNull: false,
  )


  final num? rollBoosted;



  @JsonKey(
    
    name: r'acceleration',
    required: false,
    includeIfNull: false,
  )


  final GameVehicleAgilityAcceleration? acceleration;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GameVehicleAgility &&
      other.pitch == pitch &&
      other.yaw == yaw &&
      other.roll == roll &&
      other.pitchBoosted == pitchBoosted &&
      other.yawBoosted == yawBoosted &&
      other.rollBoosted == rollBoosted &&
      other.acceleration == acceleration;

    @override
    int get hashCode =>
        (pitch == null ? 0 : pitch.hashCode) +
        (yaw == null ? 0 : yaw.hashCode) +
        (roll == null ? 0 : roll.hashCode) +
        (pitchBoosted == null ? 0 : pitchBoosted.hashCode) +
        (yawBoosted == null ? 0 : yawBoosted.hashCode) +
        (rollBoosted == null ? 0 : rollBoosted.hashCode) +
        acceleration.hashCode;

  factory GameVehicleAgility.fromJson(Map<String, dynamic> json) => _$GameVehicleAgilityFromJson(json);

  Map<String, dynamic> toJson() => _$GameVehicleAgilityToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

