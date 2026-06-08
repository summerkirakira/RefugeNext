// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_vehicle_fuel_usage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameVehicleFuelUsage _$GameVehicleFuelUsageFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('GameVehicleFuelUsage', json, ($checkedConvert) {
  final val = GameVehicleFuelUsage(
    main: $checkedConvert('main', (v) => v as num?),
    retro: $checkedConvert('retro', (v) => v as num?),
    vtol: $checkedConvert('vtol', (v) => v as num?),
    maneuvering: $checkedConvert('maneuvering', (v) => v as num?),
  );
  return val;
});

Map<String, dynamic> _$GameVehicleFuelUsageToJson(
  GameVehicleFuelUsage instance,
) => <String, dynamic>{
  'main': ?instance.main,
  'retro': ?instance.retro,
  'vtol': ?instance.vtol,
  'maneuvering': ?instance.maneuvering,
};
