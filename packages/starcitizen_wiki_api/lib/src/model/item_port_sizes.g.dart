// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_port_sizes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemPortSizes _$ItemPortSizesFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ItemPortSizes', json, ($checkedConvert) {
      final val = ItemPortSizes(
        min: $checkedConvert('min', (v) => (v as num?)?.toInt()),
        max: $checkedConvert('max', (v) => (v as num?)?.toInt()),
      );
      return val;
    });

Map<String, dynamic> _$ItemPortSizesToJson(ItemPortSizes instance) =>
    <String, dynamic>{'min': ?instance.min, 'max': ?instance.max};
