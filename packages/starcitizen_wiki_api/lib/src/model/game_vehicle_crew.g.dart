// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_vehicle_crew.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameVehicleCrew _$GameVehicleCrewFromJson(Map<String, dynamic> json) =>
    $checkedCreate('GameVehicleCrew', json, ($checkedConvert) {
      final val = GameVehicleCrew(
        min: $checkedConvert('min', (v) => (v as num?)?.toInt()),
        max: $checkedConvert('max', (v) => (v as num?)?.toInt()),
        weapon: $checkedConvert('weapon', (v) => (v as num?)?.toInt()),
        operation: $checkedConvert('operation', (v) => (v as num?)?.toInt()),
      );
      return val;
    });

Map<String, dynamic> _$GameVehicleCrewToJson(GameVehicleCrew instance) =>
    <String, dynamic>{
      'min': ?instance.min,
      'max': ?instance.max,
      'weapon': ?instance.weapon,
      'operation': ?instance.operation,
    };
