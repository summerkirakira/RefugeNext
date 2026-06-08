// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mission_hauling_order_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MissionHaulingOrderItem _$MissionHaulingOrderItemFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('MissionHaulingOrderItem', json, ($checkedConvert) {
  final val = MissionHaulingOrderItem(
    name: $checkedConvert('name', (v) => v as String?),
    uuid: $checkedConvert('uuid', (v) => v as String?),
    link: $checkedConvert('link', (v) => v as String?),
    webUrl: $checkedConvert('web_url', (v) => v as String?),
  );
  return val;
}, fieldKeyMap: const {'webUrl': 'web_url'});

Map<String, dynamic> _$MissionHaulingOrderItemToJson(
  MissionHaulingOrderItem instance,
) => <String, dynamic>{
  'name': ?instance.name,
  'uuid': ?instance.uuid,
  'link': ?instance.link,
  'web_url': ?instance.webUrl,
};
