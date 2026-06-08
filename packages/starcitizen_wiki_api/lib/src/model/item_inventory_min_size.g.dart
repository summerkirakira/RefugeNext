// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_inventory_min_size.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemInventoryMinSize _$ItemInventoryMinSizeFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ItemInventoryMinSize', json, ($checkedConvert) {
  final val = ItemInventoryMinSize(
    x: $checkedConvert('x', (v) => v as num?),
    y: $checkedConvert('y', (v) => v as num?),
    z: $checkedConvert('z', (v) => v as num?),
  );
  return val;
});

Map<String, dynamic> _$ItemInventoryMinSizeToJson(
  ItemInventoryMinSize instance,
) => <String, dynamic>{'x': ?instance.x, 'y': ?instance.y, 'z': ?instance.z};
