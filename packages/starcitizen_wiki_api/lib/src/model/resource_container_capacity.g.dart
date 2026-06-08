// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource_container_capacity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResourceContainerCapacity _$ResourceContainerCapacityFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ResourceContainerCapacity', json, ($checkedConvert) {
  final val = ResourceContainerCapacity(
    value: $checkedConvert('value', (v) => (v as num?)?.toDouble()),
    unit: $checkedConvert('unit', (v) => v as String?),
    unitName: $checkedConvert('unit_name', (v) => v as String?),
    scu: $checkedConvert('scu', (v) => (v as num?)?.toDouble()),
  );
  return val;
}, fieldKeyMap: const {'unitName': 'unit_name'});

Map<String, dynamic> _$ResourceContainerCapacityToJson(
  ResourceContainerCapacity instance,
) => <String, dynamic>{
  'value': ?instance.value,
  'unit': ?instance.unit,
  'unit_name': ?instance.unitName,
  'scu': ?instance.scu,
};
