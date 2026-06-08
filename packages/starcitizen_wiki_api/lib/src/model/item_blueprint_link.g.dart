// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_blueprint_link.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemBlueprintLink _$ItemBlueprintLinkFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ItemBlueprintLink', json, ($checkedConvert) {
      final val = ItemBlueprintLink(
        uuid: $checkedConvert('uuid', (v) => v as String?),
        name: $checkedConvert('name', (v) => v as String?),
        link: $checkedConvert('link', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$ItemBlueprintLinkToJson(ItemBlueprintLink instance) =>
    <String, dynamic>{
      'uuid': ?instance.uuid,
      'name': ?instance.name,
      'link': ?instance.link,
    };
