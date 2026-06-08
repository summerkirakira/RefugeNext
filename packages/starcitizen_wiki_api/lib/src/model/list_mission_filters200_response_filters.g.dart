// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_mission_filters200_response_filters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListMissionFilters200ResponseFilters
_$ListMissionFilters200ResponseFiltersFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ListMissionFilters200ResponseFilters',
      json,
      ($checkedConvert) {
        final val = ListMissionFilters200ResponseFilters(
          missionGiver: $checkedConvert(
            'mission_giver',
            (v) => (v as List<dynamic>?)
                ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                .toList(),
          ),
          starSystem: $checkedConvert(
            'star_system',
            (v) => (v as List<dynamic>?)
                ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                .toList(),
          ),
          faction: $checkedConvert(
            'faction',
            (v) => (v as List<dynamic>?)
                ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                .toList(),
          ),
          hasCombat: $checkedConvert(
            'has_combat',
            (v) => (v as List<dynamic>?)
                ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                .toList(),
          ),
          hasDefendObjective: $checkedConvert(
            'has_defend_objective',
            (v) => (v as List<dynamic>?)
                ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                .toList(),
          ),
          rankIndex: $checkedConvert(
            'rank_index',
            (v) => (v as List<dynamic>?)
                ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                .toList(),
          ),
          illegal: $checkedConvert(
            'illegal',
            (v) => (v as List<dynamic>?)
                ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                .toList(),
          ),
          shareable: $checkedConvert(
            'shareable',
            (v) => (v as List<dynamic>?)
                ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                .toList(),
          ),
          hasPrerequisites: $checkedConvert(
            'has_prerequisites',
            (v) => (v as List<dynamic>?)
                ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                .toList(),
          ),
          rewardScope: $checkedConvert(
            'reward_scope',
            (v) => (v as List<dynamic>?)
                ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                .toList(),
          ),
          hasBlueprints: $checkedConvert(
            'has_blueprints',
            (v) => (v as List<dynamic>?)
                ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                .toList(),
          ),
          reputationScope: $checkedConvert(
            'reputation_scope',
            (v) => (v as List<dynamic>?)
                ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                .toList(),
          ),
          blueprintName: $checkedConvert(
            'blueprint_name',
            (v) => (v as List<dynamic>?)
                ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                .toList(),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'missionGiver': 'mission_giver',
        'starSystem': 'star_system',
        'hasCombat': 'has_combat',
        'hasDefendObjective': 'has_defend_objective',
        'rankIndex': 'rank_index',
        'hasPrerequisites': 'has_prerequisites',
        'rewardScope': 'reward_scope',
        'hasBlueprints': 'has_blueprints',
        'reputationScope': 'reputation_scope',
        'blueprintName': 'blueprint_name',
      },
    );

Map<String, dynamic> _$ListMissionFilters200ResponseFiltersToJson(
  ListMissionFilters200ResponseFilters instance,
) => <String, dynamic>{
  'mission_giver': ?instance.missionGiver?.map((e) => e.toJson()).toList(),
  'star_system': ?instance.starSystem?.map((e) => e.toJson()).toList(),
  'faction': ?instance.faction?.map((e) => e.toJson()).toList(),
  'has_combat': ?instance.hasCombat?.map((e) => e.toJson()).toList(),
  'has_defend_objective': ?instance.hasDefendObjective
      ?.map((e) => e.toJson())
      .toList(),
  'rank_index': ?instance.rankIndex?.map((e) => e.toJson()).toList(),
  'illegal': ?instance.illegal?.map((e) => e.toJson()).toList(),
  'shareable': ?instance.shareable?.map((e) => e.toJson()).toList(),
  'has_prerequisites': ?instance.hasPrerequisites
      ?.map((e) => e.toJson())
      .toList(),
  'reward_scope': ?instance.rewardScope?.map((e) => e.toJson()).toList(),
  'has_blueprints': ?instance.hasBlueprints?.map((e) => e.toJson()).toList(),
  'reputation_scope': ?instance.reputationScope
      ?.map((e) => e.toJson())
      .toList(),
  'blueprint_name': ?instance.blueprintName?.map((e) => e.toJson()).toList(),
};
