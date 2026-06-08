// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commodity_show_all_of_blueprints.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommodityShowAllOfBlueprints _$CommodityShowAllOfBlueprintsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'CommodityShowAllOfBlueprints',
  json,
  ($checkedConvert) {
    final val = CommodityShowAllOfBlueprints(
      key: $checkedConvert('key', (v) => v as String?),
      outputName: $checkedConvert('output_name', (v) => v as String?),
      outputItemUuid: $checkedConvert('output_item_uuid', (v) => v as String?),
      craftTimeLabel: $checkedConvert('craft_time_label', (v) => v as String?),
      webUrl: $checkedConvert('web_url', (v) => v as String?),
      link: $checkedConvert('link', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'outputName': 'output_name',
    'outputItemUuid': 'output_item_uuid',
    'craftTimeLabel': 'craft_time_label',
    'webUrl': 'web_url',
  },
);

Map<String, dynamic> _$CommodityShowAllOfBlueprintsToJson(
  CommodityShowAllOfBlueprints instance,
) => <String, dynamic>{
  'key': ?instance.key,
  'output_name': ?instance.outputName,
  'output_item_uuid': ?instance.outputItemUuid,
  'craft_time_label': ?instance.craftTimeLabel,
  'web_url': ?instance.webUrl,
  'link': ?instance.link,
};
