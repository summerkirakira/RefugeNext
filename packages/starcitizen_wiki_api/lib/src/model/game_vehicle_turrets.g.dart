// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_vehicle_turrets.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameVehicleTurrets _$GameVehicleTurretsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('GameVehicleTurrets', json, ($checkedConvert) {
  final val = GameVehicleTurrets(
    manned: $checkedConvert(
      'manned',
      (v) => (v as List<dynamic>?)
          ?.map((e) => GameVehicleTurret.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
    remote: $checkedConvert(
      'remote',
      (v) => (v as List<dynamic>?)
          ?.map((e) => GameVehicleTurret.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
    pdc: $checkedConvert(
      'pdc',
      (v) => (v as List<dynamic>?)
          ?.map((e) => GameVehicleTurret.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
  );
  return val;
});

Map<String, dynamic> _$GameVehicleTurretsToJson(GameVehicleTurrets instance) =>
    <String, dynamic>{
      'manned': ?instance.manned?.map((e) => e.toJson()).toList(),
      'remote': ?instance.remote?.map((e) => e.toJson()).toList(),
      'pdc': ?instance.pdc?.map((e) => e.toJson()).toList(),
    };
