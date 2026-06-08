// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commodity_index_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommodityIndexLocation _$CommodityIndexLocationFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'CommodityIndexLocation',
  json,
  ($checkedConvert) {
    final val = CommodityIndexLocation(
      name: $checkedConvert('name', (v) => v as String?),
      displayName: $checkedConvert('display_name', (v) => v as String?),
      system: $checkedConvert('system', (v) => v as String?),
      type: $checkedConvert('type', (v) => v as String?),
      parentName: $checkedConvert('parent_name', (v) => v as String?),
      parentType: $checkedConvert('parent_type', (v) => v as String?),
      uuid: $checkedConvert('uuid', (v) => v as String?),
      link: $checkedConvert('link', (v) => v as String?),
      entries: $checkedConvert(
        'entries',
        (v) => (v as List<dynamic>?)
            ?.map(
              (e) => CommodityIndexLocationEntry.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'displayName': 'display_name',
    'parentName': 'parent_name',
    'parentType': 'parent_type',
  },
);

Map<String, dynamic> _$CommodityIndexLocationToJson(
  CommodityIndexLocation instance,
) => <String, dynamic>{
  'name': ?instance.name,
  'display_name': ?instance.displayName,
  'system': ?instance.system,
  'type': ?instance.type,
  'parent_name': ?instance.parentName,
  'parent_type': ?instance.parentType,
  'uuid': ?instance.uuid,
  'link': ?instance.link,
  'entries': ?instance.entries?.map((e) => e.toJson()).toList(),
};
