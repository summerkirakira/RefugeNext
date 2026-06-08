// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mission_combat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MissionCombat _$MissionCombatFromJson(Map<String, dynamic> json) =>
    $checkedCreate('MissionCombat', json, ($checkedConvert) {
      final val = MissionCombat(
        summary: $checkedConvert(
          'summary',
          (v) => v == null
              ? null
              : MissionCombatSummary.fromJson(v as Map<String, dynamic>),
        ),
        spawns: $checkedConvert(
          'spawns',
          (v) => (v as List<dynamic>?)
              ?.map(
                (e) => MissionCombatSpawnsInner.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList(),
        ),
        aggregatedSpawns: $checkedConvert(
          'aggregated_spawns',
          (v) => (v as List<dynamic>?)
              ?.map(
                (e) => MissionCombatAggregatedSpawnsInner.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList(),
        ),
      );
      return val;
    }, fieldKeyMap: const {'aggregatedSpawns': 'aggregated_spawns'});

Map<String, dynamic> _$MissionCombatToJson(MissionCombat instance) =>
    <String, dynamic>{
      'summary': ?instance.summary?.toJson(),
      'spawns': ?instance.spawns?.map((e) => e.toJson()).toList(),
      'aggregated_spawns': ?instance.aggregatedSpawns
          ?.map((e) => e.toJson())
          .toList(),
    };
