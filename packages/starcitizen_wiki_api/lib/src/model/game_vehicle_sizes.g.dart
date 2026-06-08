// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_vehicle_sizes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameVehicleSizes _$GameVehicleSizesFromJson(Map<String, dynamic> json) =>
    $checkedCreate('GameVehicleSizes', json, ($checkedConvert) {
      final val = GameVehicleSizes(
        length: $checkedConvert('length', (v) => v as num?),
        beam: $checkedConvert('beam', (v) => v as num?),
        height: $checkedConvert('height', (v) => v as num?),
      );
      return val;
    });

Map<String, dynamic> _$GameVehicleSizesToJson(GameVehicleSizes instance) =>
    <String, dynamic>{
      'length': ?instance.length,
      'beam': ?instance.beam,
      'height': ?instance.height,
    };
