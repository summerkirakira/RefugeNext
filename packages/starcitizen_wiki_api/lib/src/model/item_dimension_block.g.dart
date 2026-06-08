// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_dimension_block.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemDimensionBlock _$ItemDimensionBlockFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ItemDimensionBlock', json, ($checkedConvert) {
      final val = ItemDimensionBlock(
        width: $checkedConvert('width', (v) => (v as num?)?.toDouble()),
        height: $checkedConvert('height', (v) => (v as num?)?.toDouble()),
        length: $checkedConvert('length', (v) => (v as num?)?.toDouble()),
      );
      return val;
    });

Map<String, dynamic> _$ItemDimensionBlockToJson(ItemDimensionBlock instance) =>
    <String, dynamic>{
      'width': ?instance.width,
      'height': ?instance.height,
      'length': ?instance.length,
    };
