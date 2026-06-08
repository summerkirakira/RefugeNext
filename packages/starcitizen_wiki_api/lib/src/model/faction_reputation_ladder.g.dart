// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faction_reputation_ladder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FactionReputationLadder _$FactionReputationLadderFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'FactionReputationLadder',
  json,
  ($checkedConvert) {
    final val = FactionReputationLadder(
      uuid: $checkedConvert('uuid', (v) => v as String?),
      name: $checkedConvert('name', (v) => v as String?),
      factionType: $checkedConvert('faction_type', (v) => v as String?),
      lawful: $checkedConvert('lawful', (v) => v as bool?),
      isNpc: $checkedConvert('is_npc', (v) => v as bool?),
      hasReputation: $checkedConvert('has_reputation', (v) => v as bool?),
      link: $checkedConvert('link', (v) => v as String?),
      scopeName: $checkedConvert('scope_name', (v) => v as String?),
      displayName: $checkedConvert('display_name', (v) => v as String?),
      reputationCeiling: $checkedConvert(
        'reputation_ceiling',
        (v) => (v as num?)?.toInt(),
      ),
      initialReputation: $checkedConvert(
        'initial_reputation',
        (v) => (v as num?)?.toInt(),
      ),
      standings: $checkedConvert(
        'standings',
        (v) => (v as List<dynamic>?)
            ?.map((e) => FactionStanding.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'factionType': 'faction_type',
    'isNpc': 'is_npc',
    'hasReputation': 'has_reputation',
    'scopeName': 'scope_name',
    'displayName': 'display_name',
    'reputationCeiling': 'reputation_ceiling',
    'initialReputation': 'initial_reputation',
  },
);

Map<String, dynamic> _$FactionReputationLadderToJson(
  FactionReputationLadder instance,
) => <String, dynamic>{
  'uuid': ?instance.uuid,
  'name': ?instance.name,
  'faction_type': ?instance.factionType,
  'lawful': ?instance.lawful,
  'is_npc': ?instance.isNpc,
  'has_reputation': ?instance.hasReputation,
  'link': ?instance.link,
  'scope_name': ?instance.scopeName,
  'display_name': ?instance.displayName,
  'reputation_ceiling': ?instance.reputationCeiling,
  'initial_reputation': ?instance.initialReputation,
  'standings': ?instance.standings?.map((e) => e.toJson()).toList(),
};
