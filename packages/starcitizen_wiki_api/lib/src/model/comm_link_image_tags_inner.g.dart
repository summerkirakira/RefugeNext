// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comm_link_image_tags_inner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommLinkImageTagsInner _$CommLinkImageTagsInnerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'CommLinkImageTagsInner',
  json,
  ($checkedConvert) {
    final val = CommLinkImageTagsInner(
      name: $checkedConvert('name', (v) => v as String?),
      translatedName: $checkedConvert('translated_name', (v) => v as String?),
      imagesCount: $checkedConvert('images_count', (v) => (v as num?)?.toInt()),
    );
    return val;
  },
  fieldKeyMap: const {
    'translatedName': 'translated_name',
    'imagesCount': 'images_count',
  },
);

Map<String, dynamic> _$CommLinkImageTagsInnerToJson(
  CommLinkImageTagsInner instance,
) => <String, dynamic>{
  'name': ?instance.name,
  'translated_name': ?instance.translatedName,
  'images_count': ?instance.imagesCount,
};
