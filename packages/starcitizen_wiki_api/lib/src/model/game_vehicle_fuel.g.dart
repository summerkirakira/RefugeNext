// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_vehicle_fuel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameVehicleFuel _$GameVehicleFuelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('GameVehicleFuel', json, ($checkedConvert) {
      final val = GameVehicleFuel(
        capacity: $checkedConvert('capacity', (v) => v as num?),
        intakeRate: $checkedConvert('intake_rate', (v) => v as num?),
        usage: $checkedConvert(
          'usage',
          (v) => v == null
              ? null
              : GameVehicleFuelUsage.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    }, fieldKeyMap: const {'intakeRate': 'intake_rate'});

Map<String, dynamic> _$GameVehicleFuelToJson(GameVehicleFuel instance) =>
    <String, dynamic>{
      'capacity': ?instance.capacity,
      'intake_rate': ?instance.intakeRate,
      'usage': ?instance.usage?.toJson(),
    };
