// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_dimension.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemDimension _$ItemDimensionFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'ItemDimension',
  json,
  ($checkedConvert) {
    final val = ItemDimension(
      width: $checkedConvert('width', (v) => (v as num?)?.toDouble()),
      height: $checkedConvert('height', (v) => (v as num?)?.toDouble()),
      length: $checkedConvert('length', (v) => (v as num?)?.toDouble()),
      volume: $checkedConvert('volume', (v) => (v as num?)?.toDouble()),
      volumeConverted: $checkedConvert('volume_converted', (v) => v as num?),
      volumeConvertedUnit: $checkedConvert(
        'volume_converted_unit',
        (v) => v as String?,
      ),
      trueDimension: $checkedConvert(
        'true_dimension',
        (v) => v == null
            ? null
            : ItemDimensionTrueDimension.fromJson(v as Map<String, dynamic>),
      ),
      dimensions: $checkedConvert(
        'dimensions',
        (v) => v == null
            ? null
            : ItemDimensionBlock.fromJson(v as Map<String, dynamic>),
      ),
      cargoDimension: $checkedConvert(
        'cargo_dimension',
        (v) => v == null
            ? null
            : ItemDimensionBlock.fromJson(v as Map<String, dynamic>),
      ),
      uiDimension: $checkedConvert(
        'ui_dimension',
        (v) => v == null
            ? null
            : ItemDimensionBlock.fromJson(v as Map<String, dynamic>),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'volumeConverted': 'volume_converted',
    'volumeConvertedUnit': 'volume_converted_unit',
    'trueDimension': 'true_dimension',
    'cargoDimension': 'cargo_dimension',
    'uiDimension': 'ui_dimension',
  },
);

Map<String, dynamic> _$ItemDimensionToJson(ItemDimension instance) =>
    <String, dynamic>{
      'width': ?instance.width,
      'height': ?instance.height,
      'length': ?instance.length,
      'volume': ?instance.volume,
      'volume_converted': ?instance.volumeConverted,
      'volume_converted_unit': ?instance.volumeConvertedUnit,
      'true_dimension': ?instance.trueDimension?.toJson(),
      'dimensions': ?instance.dimensions?.toJson(),
      'cargo_dimension': ?instance.cargoDimension?.toJson(),
      'ui_dimension': ?instance.uiDimension?.toJson(),
    };
