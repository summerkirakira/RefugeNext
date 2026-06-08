// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_item_entity_tag_map_inner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameItemEntityTagMapInner _$GameItemEntityTagMapInnerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('GameItemEntityTagMapInner', json, ($checkedConvert) {
  final val = GameItemEntityTagMapInner(
    uuid: $checkedConvert('uuid', (v) => v as String?),
    name: $checkedConvert('name', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$GameItemEntityTagMapInnerToJson(
  GameItemEntityTagMapInner instance,
) => <String, dynamic>{'uuid': ?instance.uuid, 'name': ?instance.name};
