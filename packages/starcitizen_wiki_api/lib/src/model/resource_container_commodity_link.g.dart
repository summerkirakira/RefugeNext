// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource_container_commodity_link.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResourceContainerCommodityLink _$ResourceContainerCommodityLinkFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ResourceContainerCommodityLink', json, ($checkedConvert) {
  final val = ResourceContainerCommodityLink(
    uuid: $checkedConvert('uuid', (v) => v as String?),
    name: $checkedConvert('name', (v) => v as String?),
    slug: $checkedConvert('slug', (v) => v as String?),
    link: $checkedConvert('link', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$ResourceContainerCommodityLinkToJson(
  ResourceContainerCommodityLink instance,
) => <String, dynamic>{
  'uuid': ?instance.uuid,
  'name': ?instance.name,
  'slug': ?instance.slug,
  'link': ?instance.link,
};
