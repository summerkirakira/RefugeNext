// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_vehicle_power_pools_value.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameVehiclePowerPoolsValue _$GameVehiclePowerPoolsValueFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('GameVehiclePowerPoolsValue', json, ($checkedConvert) {
  final val = GameVehiclePowerPoolsValue(
    type: $checkedConvert('type', (v) => v as String?),
    itemType: $checkedConvert('item_type', (v) => v as String?),
    size: $checkedConvert('size', (v) => (v as num?)?.toInt()),
  );
  return val;
}, fieldKeyMap: const {'itemType': 'item_type'});

Map<String, dynamic> _$GameVehiclePowerPoolsValueToJson(
  GameVehiclePowerPoolsValue instance,
) => <String, dynamic>{
  'type': ?instance.type,
  'item_type': ?instance.itemType,
  'size': ?instance.size,
};
