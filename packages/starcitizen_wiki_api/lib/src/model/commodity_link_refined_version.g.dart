// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commodity_link_refined_version.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommodityLinkRefinedVersion _$CommodityLinkRefinedVersionFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('CommodityLinkRefinedVersion', json, ($checkedConvert) {
  final val = CommodityLinkRefinedVersion(
    name: $checkedConvert('name', (v) => v as String?),
    uuid: $checkedConvert('uuid', (v) => v as String?),
    webUrl: $checkedConvert('web_url', (v) => v as String?),
    link: $checkedConvert('link', (v) => v as String?),
  );
  return val;
}, fieldKeyMap: const {'webUrl': 'web_url'});

Map<String, dynamic> _$CommodityLinkRefinedVersionToJson(
  CommodityLinkRefinedVersion instance,
) => <String, dynamic>{
  'name': ?instance.name,
  'uuid': ?instance.uuid,
  'web_url': ?instance.webUrl,
  'link': ?instance.link,
};
