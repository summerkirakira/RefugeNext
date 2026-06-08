// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_vehicle_penetration_multiplier.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameVehiclePenetrationMultiplier _$GameVehiclePenetrationMultiplierFromJson(
  Map<String, dynamic> json,
) =>
    $checkedCreate('GameVehiclePenetrationMultiplier', json, ($checkedConvert) {
      final val = GameVehiclePenetrationMultiplier(
        fuse: $checkedConvert('fuse', (v) => v as num?),
        components: $checkedConvert('components', (v) => v as num?),
      );
      return val;
    });

Map<String, dynamic> _$GameVehiclePenetrationMultiplierToJson(
  GameVehiclePenetrationMultiplier instance,
) => <String, dynamic>{
  'fuse': ?instance.fuse,
  'components': ?instance.components,
};
