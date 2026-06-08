// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_vehicle_port_sizes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameVehiclePortSizes _$GameVehiclePortSizesFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('GameVehiclePortSizes', json, ($checkedConvert) {
  final val = GameVehiclePortSizes(
    min: $checkedConvert('min', (v) => (v as num?)?.toInt()),
    max: $checkedConvert('max', (v) => (v as num?)?.toInt()),
  );
  return val;
});

Map<String, dynamic> _$GameVehiclePortSizesToJson(
  GameVehiclePortSizes instance,
) => <String, dynamic>{'min': ?instance.min, 'max': ?instance.max};
