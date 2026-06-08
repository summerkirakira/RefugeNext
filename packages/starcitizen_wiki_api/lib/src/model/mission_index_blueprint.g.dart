// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mission_index_blueprint.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MissionIndexBlueprint _$MissionIndexBlueprintFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('MissionIndexBlueprint', json, ($checkedConvert) {
  final val = MissionIndexBlueprint(
    name: $checkedConvert('name', (v) => v as String?),
    uuid: $checkedConvert('uuid', (v) => v as String?),
    link: $checkedConvert('link', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$MissionIndexBlueprintToJson(
  MissionIndexBlueprint instance,
) => <String, dynamic>{
  'name': ?instance.name,
  'uuid': ?instance.uuid,
  'link': ?instance.link,
};
