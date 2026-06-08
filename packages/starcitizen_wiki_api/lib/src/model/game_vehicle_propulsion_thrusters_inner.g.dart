// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_vehicle_propulsion_thrusters_inner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameVehiclePropulsionThrustersInner
_$GameVehiclePropulsionThrustersInnerFromJson(Map<String, dynamic> json) =>
    $checkedCreate('GameVehiclePropulsionThrustersInner', json, (
      $checkedConvert,
    ) {
      final val = GameVehiclePropulsionThrustersInner(
        type: $checkedConvert('type', (v) => v as String?),
        count: $checkedConvert('count', (v) => (v as num?)?.toInt()),
        capacity: $checkedConvert('capacity', (v) => v as num?),
        g: $checkedConvert('g', (v) => v as num?),
      );
      return val;
    });

Map<String, dynamic> _$GameVehiclePropulsionThrustersInnerToJson(
  GameVehiclePropulsionThrustersInner instance,
) => <String, dynamic>{
  'type': ?instance.type,
  'count': ?instance.count,
  'capacity': ?instance.capacity,
  'g': ?instance.g,
};
