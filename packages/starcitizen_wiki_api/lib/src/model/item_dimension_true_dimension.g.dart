// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_dimension_true_dimension.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemDimensionTrueDimension _$ItemDimensionTrueDimensionFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ItemDimensionTrueDimension', json, ($checkedConvert) {
  final val = ItemDimensionTrueDimension(
    width: $checkedConvert('width', (v) => (v as num?)?.toDouble()),
    height: $checkedConvert('height', (v) => (v as num?)?.toDouble()),
    length: $checkedConvert('length', (v) => (v as num?)?.toDouble()),
  );
  return val;
});

Map<String, dynamic> _$ItemDimensionTrueDimensionToJson(
  ItemDimensionTrueDimension instance,
) => <String, dynamic>{
  'width': ?instance.width,
  'height': ?instance.height,
  'length': ?instance.length,
};
