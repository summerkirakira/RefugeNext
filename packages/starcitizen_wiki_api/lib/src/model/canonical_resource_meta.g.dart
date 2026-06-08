// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'canonical_resource_meta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CanonicalResourceMeta _$CanonicalResourceMetaFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'CanonicalResourceMeta',
  json,
  ($checkedConvert) {
    final val = CanonicalResourceMeta(
      type: $checkedConvert(
        'type',
        (v) => $enumDecodeNullable(_$CanonicalResourceMetaTypeEnumEnumMap, v),
      ),
      uuid: $checkedConvert('uuid', (v) => v as String?),
      slug: $checkedConvert('slug', (v) => v as String?),
      apiUrl: $checkedConvert('api_url', (v) => v as String?),
      webUrl: $checkedConvert('web_url', (v) => v as String?),
      version: $checkedConvert('version', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {'apiUrl': 'api_url', 'webUrl': 'web_url'},
);

Map<String, dynamic> _$CanonicalResourceMetaToJson(
  CanonicalResourceMeta instance,
) => <String, dynamic>{
  'type': ?_$CanonicalResourceMetaTypeEnumEnumMap[instance.type],
  'uuid': ?instance.uuid,
  'slug': ?instance.slug,
  'api_url': ?instance.apiUrl,
  'web_url': ?instance.webUrl,
  'version': ?instance.version,
};

const _$CanonicalResourceMetaTypeEnumEnumMap = {
  CanonicalResourceMetaTypeEnum.blueprint: 'blueprint',
  CanonicalResourceMetaTypeEnum.commodity: 'commodity',
  CanonicalResourceMetaTypeEnum.item: 'item',
  CanonicalResourceMetaTypeEnum.location: 'location',
  CanonicalResourceMetaTypeEnum.mission: 'mission',
  CanonicalResourceMetaTypeEnum.vehicle: 'vehicle',
};
