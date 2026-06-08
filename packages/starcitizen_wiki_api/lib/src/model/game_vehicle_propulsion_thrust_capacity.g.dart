// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_vehicle_propulsion_thrust_capacity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameVehiclePropulsionThrustCapacity
_$GameVehiclePropulsionThrustCapacityFromJson(Map<String, dynamic> json) =>
    $checkedCreate('GameVehiclePropulsionThrustCapacity', json, (
      $checkedConvert,
    ) {
      final val = GameVehiclePropulsionThrustCapacity(
        main: $checkedConvert('main', (v) => v as num?),
        retro: $checkedConvert('retro', (v) => v as num?),
        vtol: $checkedConvert('vtol', (v) => v as num?),
        maneuvering: $checkedConvert('maneuvering', (v) => v as num?),
      );
      return val;
    });

Map<String, dynamic> _$GameVehiclePropulsionThrustCapacityToJson(
  GameVehiclePropulsionThrustCapacity instance,
) => <String, dynamic>{
  'main': ?instance.main,
  'retro': ?instance.retro,
  'vtol': ?instance.vtol,
  'maneuvering': ?instance.maneuvering,
};
