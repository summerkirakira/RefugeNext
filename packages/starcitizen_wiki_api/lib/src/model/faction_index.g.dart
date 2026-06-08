// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faction_index.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FactionIndex _$FactionIndexFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'FactionIndex',
      json,
      ($checkedConvert) {
        final val = FactionIndex(
          uuid: $checkedConvert('uuid', (v) => v as String?),
          name: $checkedConvert('name', (v) => v as String?),
          factionType: $checkedConvert('faction_type', (v) => v as String?),
          lawful: $checkedConvert('lawful', (v) => v as bool?),
          isNpc: $checkedConvert('is_npc', (v) => v as bool?),
          hasReputation: $checkedConvert('has_reputation', (v) => v as bool?),
          link: $checkedConvert('link', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'factionType': 'faction_type',
        'isNpc': 'is_npc',
        'hasReputation': 'has_reputation',
      },
    );

Map<String, dynamic> _$FactionIndexToJson(FactionIndex instance) =>
    <String, dynamic>{
      'uuid': ?instance.uuid,
      'name': ?instance.name,
      'faction_type': ?instance.factionType,
      'lawful': ?instance.lawful,
      'is_npc': ?instance.isNpc,
      'has_reputation': ?instance.hasReputation,
      'link': ?instance.link,
    };
