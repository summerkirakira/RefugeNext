// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_starmap_location_linked_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameStarmapLocationLinkedSummary _$GameStarmapLocationLinkedSummaryFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'GameStarmapLocationLinkedSummary',
  json,
  ($checkedConvert) {
    final val = GameStarmapLocationLinkedSummary(
      uuid: $checkedConvert('uuid', (v) => v as String?),
      name: $checkedConvert('name', (v) => v as String?),
      typeName: $checkedConvert('type_name', (v) => v as String?),
      slug: $checkedConvert('slug', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {'typeName': 'type_name'},
);

Map<String, dynamic> _$GameStarmapLocationLinkedSummaryToJson(
  GameStarmapLocationLinkedSummary instance,
) => <String, dynamic>{
  'uuid': ?instance.uuid,
  'name': ?instance.name,
  'type_name': ?instance.typeName,
  'slug': ?instance.slug,
};
