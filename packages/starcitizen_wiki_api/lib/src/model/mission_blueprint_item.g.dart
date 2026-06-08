// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mission_blueprint_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MissionBlueprintItem _$MissionBlueprintItemFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'MissionBlueprintItem',
  json,
  ($checkedConvert) {
    final val = MissionBlueprintItem(
      name: $checkedConvert('name', (v) => v as String?),
      uuid: $checkedConvert('uuid', (v) => v as String?),
      itemLink: $checkedConvert('item_link', (v) => v as String?),
      blueprintLink: $checkedConvert('blueprint_link', (v) => v as String?),
      webItemLink: $checkedConvert('web_item_link', (v) => v as String?),
      webBlueprintLink: $checkedConvert(
        'web_blueprint_link',
        (v) => v as String?,
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'itemLink': 'item_link',
    'blueprintLink': 'blueprint_link',
    'webItemLink': 'web_item_link',
    'webBlueprintLink': 'web_blueprint_link',
  },
);

Map<String, dynamic> _$MissionBlueprintItemToJson(
  MissionBlueprintItem instance,
) => <String, dynamic>{
  'name': ?instance.name,
  'uuid': ?instance.uuid,
  'item_link': ?instance.itemLink,
  'blueprint_link': ?instance.blueprintLink,
  'web_item_link': ?instance.webItemLink,
  'web_blueprint_link': ?instance.webBlueprintLink,
};
