// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_vehicle_agility.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameVehicleAgility _$GameVehicleAgilityFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'GameVehicleAgility',
      json,
      ($checkedConvert) {
        final val = GameVehicleAgility(
          pitch: $checkedConvert('pitch', (v) => v as num?),
          yaw: $checkedConvert('yaw', (v) => v as num?),
          roll: $checkedConvert('roll', (v) => v as num?),
          pitchBoosted: $checkedConvert('pitch_boosted', (v) => v as num?),
          yawBoosted: $checkedConvert('yaw_boosted', (v) => v as num?),
          rollBoosted: $checkedConvert('roll_boosted', (v) => v as num?),
          acceleration: $checkedConvert(
            'acceleration',
            (v) => v == null
                ? null
                : GameVehicleAgilityAcceleration.fromJson(
                    v as Map<String, dynamic>,
                  ),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'pitchBoosted': 'pitch_boosted',
        'yawBoosted': 'yaw_boosted',
        'rollBoosted': 'roll_boosted',
      },
    );

Map<String, dynamic> _$GameVehicleAgilityToJson(GameVehicleAgility instance) =>
    <String, dynamic>{
      'pitch': ?instance.pitch,
      'yaw': ?instance.yaw,
      'roll': ?instance.roll,
      'pitch_boosted': ?instance.pitchBoosted,
      'yaw_boosted': ?instance.yawBoosted,
      'roll_boosted': ?instance.rollBoosted,
      'acceleration': ?instance.acceleration?.toJson(),
    };
