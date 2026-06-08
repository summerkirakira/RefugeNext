// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mission_chain_variant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MissionChainVariant _$MissionChainVariantFromJson(Map<String, dynamic> json) =>
    $checkedCreate('MissionChainVariant', json, ($checkedConvert) {
      final val = MissionChainVariant(
        uuid: $checkedConvert('uuid', (v) => v as String?),
        link: $checkedConvert('link', (v) => v as String?),
        webUrl: $checkedConvert('web_url', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {'webUrl': 'web_url'});

Map<String, dynamic> _$MissionChainVariantToJson(
  MissionChainVariant instance,
) => <String, dynamic>{
  'uuid': ?instance.uuid,
  'link': ?instance.link,
  'web_url': ?instance.webUrl,
};
