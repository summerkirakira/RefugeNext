// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commodity_link_images_inner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommodityLinkImagesInner _$CommodityLinkImagesInnerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'CommodityLinkImagesInner',
  json,
  ($checkedConvert) {
    final val = CommodityLinkImagesInner(
      source_: $checkedConvert('source', (v) => v as String?),
      thumbnailUrl: $checkedConvert('thumbnail_url', (v) => v as String?),
      thumbnailWidth: $checkedConvert(
        'thumbnail_width',
        (v) => (v as num?)?.toInt(),
      ),
      thumbnailHeight: $checkedConvert(
        'thumbnail_height',
        (v) => (v as num?)?.toInt(),
      ),
      originalUrl: $checkedConvert('original_url', (v) => v as String?),
      originalWidth: $checkedConvert(
        'original_width',
        (v) => (v as num?)?.toInt(),
      ),
      originalHeight: $checkedConvert(
        'original_height',
        (v) => (v as num?)?.toInt(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'source_': 'source',
    'thumbnailUrl': 'thumbnail_url',
    'thumbnailWidth': 'thumbnail_width',
    'thumbnailHeight': 'thumbnail_height',
    'originalUrl': 'original_url',
    'originalWidth': 'original_width',
    'originalHeight': 'original_height',
  },
);

Map<String, dynamic> _$CommodityLinkImagesInnerToJson(
  CommodityLinkImagesInner instance,
) => <String, dynamic>{
  'source': ?instance.source_,
  'thumbnail_url': ?instance.thumbnailUrl,
  'thumbnail_width': ?instance.thumbnailWidth,
  'thumbnail_height': ?instance.thumbnailHeight,
  'original_url': ?instance.originalUrl,
  'original_width': ?instance.originalWidth,
  'original_height': ?instance.originalHeight,
};
