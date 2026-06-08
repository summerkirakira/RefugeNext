// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mission_faction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MissionFaction _$MissionFactionFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'MissionFaction',
      json,
      ($checkedConvert) {
        final val = MissionFaction(
          name: $checkedConvert('name', (v) => v as String?),
          uuid: $checkedConvert('uuid', (v) => v as String?),
          factionType: $checkedConvert('faction_type', (v) => v as String?),
          lawful: $checkedConvert('lawful', (v) => v as bool?),
          isNpc: $checkedConvert('is_npc', (v) => v as bool?),
          hasReputation: $checkedConvert('has_reputation', (v) => v as bool?),
          headquarters: $checkedConvert('headquarters', (v) => v as String?),
          area: $checkedConvert('area', (v) => v as String?),
          focus: $checkedConvert('focus', (v) => v as String?),
          founded: $checkedConvert('founded', (v) => v as String?),
          leadership: $checkedConvert('leadership', (v) => v as String?),
          link: $checkedConvert('link', (v) => v as String?),
          reputationLadder: $checkedConvert(
            'reputation_ladder',
            (v) => v == null
                ? null
                : MissionFactionReputationScope.fromJson(
                    v as Map<String, dynamic>,
                  ),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'factionType': 'faction_type',
        'isNpc': 'is_npc',
        'hasReputation': 'has_reputation',
        'reputationLadder': 'reputation_ladder',
      },
    );

Map<String, dynamic> _$MissionFactionToJson(MissionFaction instance) =>
    <String, dynamic>{
      'name': ?instance.name,
      'uuid': ?instance.uuid,
      'faction_type': ?instance.factionType,
      'lawful': ?instance.lawful,
      'is_npc': ?instance.isNpc,
      'has_reputation': ?instance.hasReputation,
      'headquarters': ?instance.headquarters,
      'area': ?instance.area,
      'focus': ?instance.focus,
      'founded': ?instance.founded,
      'leadership': ?instance.leadership,
      'link': ?instance.link,
      'reputation_ladder': ?instance.reputationLadder?.toJson(),
    };
