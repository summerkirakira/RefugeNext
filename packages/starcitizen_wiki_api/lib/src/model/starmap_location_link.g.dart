// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'starmap_location_link.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StarmapLocationLink _$StarmapLocationLinkFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'StarmapLocationLink',
      json,
      ($checkedConvert) {
        final val = StarmapLocationLink(
          uuid: $checkedConvert('uuid', (v) => v as String?),
          name: $checkedConvert('name', (v) => v as String?),
          slug: $checkedConvert('slug', (v) => v as String?),
          typeName: $checkedConvert('type_name', (v) => v as String?),
          parentName: $checkedConvert('parent_name', (v) => v as String?),
          starSystemName: $checkedConvert(
            'star_system_name',
            (v) => v as String?,
          ),
          link: $checkedConvert('link', (v) => v as String?),
          webUrl: $checkedConvert('web_url', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'typeName': 'type_name',
        'parentName': 'parent_name',
        'starSystemName': 'star_system_name',
        'webUrl': 'web_url',
      },
    );

Map<String, dynamic> _$StarmapLocationLinkToJson(
  StarmapLocationLink instance,
) => <String, dynamic>{
  'uuid': ?instance.uuid,
  'name': ?instance.name,
  'slug': ?instance.slug,
  'type_name': ?instance.typeName,
  'parent_name': ?instance.parentName,
  'star_system_name': ?instance.starSystemName,
  'link': ?instance.link,
  'web_url': ?instance.webUrl,
};
