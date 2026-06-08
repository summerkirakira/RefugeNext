// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faction_standing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FactionStanding _$FactionStandingFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'FactionStanding',
      json,
      ($checkedConvert) {
        final val = FactionStanding(
          uuid: $checkedConvert('uuid', (v) => v as String?),
          name: $checkedConvert('name', (v) => v as String?),
          factionType: $checkedConvert('faction_type', (v) => v as String?),
          lawful: $checkedConvert('lawful', (v) => v as bool?),
          isNpc: $checkedConvert('is_npc', (v) => v as bool?),
          hasReputation: $checkedConvert('has_reputation', (v) => v as bool?),
          link: $checkedConvert('link', (v) => v as String?),
          displayName: $checkedConvert('display_name', (v) => v as String?),
          minReputation: $checkedConvert(
            'min_reputation',
            (v) => (v as num?)?.toInt(),
          ),
          driftReputation: $checkedConvert(
            'drift_reputation',
            (v) => (v as num?)?.toInt(),
          ),
          driftTimeHours: $checkedConvert(
            'drift_time_hours',
            (v) => (v as num?)?.toInt(),
          ),
          gated: $checkedConvert('gated', (v) => v as bool?),
        );
        return val;
      },
      fieldKeyMap: const {
        'factionType': 'faction_type',
        'isNpc': 'is_npc',
        'hasReputation': 'has_reputation',
        'displayName': 'display_name',
        'minReputation': 'min_reputation',
        'driftReputation': 'drift_reputation',
        'driftTimeHours': 'drift_time_hours',
      },
    );

Map<String, dynamic> _$FactionStandingToJson(FactionStanding instance) =>
    <String, dynamic>{
      'uuid': ?instance.uuid,
      'name': ?instance.name,
      'faction_type': ?instance.factionType,
      'lawful': ?instance.lawful,
      'is_npc': ?instance.isNpc,
      'has_reputation': ?instance.hasReputation,
      'link': ?instance.link,
      'display_name': ?instance.displayName,
      'min_reputation': ?instance.minReputation,
      'drift_reputation': ?instance.driftReputation,
      'drift_time_hours': ?instance.driftTimeHours,
      'gated': ?instance.gated,
    };
