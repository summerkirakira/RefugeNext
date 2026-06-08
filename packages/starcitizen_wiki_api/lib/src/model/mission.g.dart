// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mission.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mission _$MissionFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Mission',
  json,
  ($checkedConvert) {
    final val = Mission(
      uuid: $checkedConvert('uuid', (v) => v as String?),
      title: $checkedConvert('title', (v) => v as String?),
      description: $checkedConvert('description', (v) => v as String?),
      descriptionHtml: $checkedConvert('description_html', (v) => v as String?),
      descriptionVariants: $checkedConvert(
        'description_variants',
        (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
      ),
      missionType: $checkedConvert('mission_type', (v) => v as String?),
      missionGiver: $checkedConvert('mission_giver', (v) => v as String?),
      faction: $checkedConvert(
        'faction',
        (v) => v == null
            ? null
            : MissionFaction.fromJson(v as Map<String, dynamic>),
      ),
      rankIndex: $checkedConvert('rank_index', (v) => (v as num?)?.toInt()),
      illegal: $checkedConvert('illegal', (v) => v as bool?),
      legalityLabel: $checkedConvert('legality_label', (v) => v as String?),
      shareable: $checkedConvert('shareable', (v) => v as bool?),
      onceOnly: $checkedConvert('once_only', (v) => v as bool?),
      availableInPrison: $checkedConvert(
        'available_in_prison',
        (v) => v as bool?,
      ),
      notForRelease: $checkedConvert('not_for_release', (v) => v as bool?),
      workInProgress: $checkedConvert('work_in_progress', (v) => v as bool?),
      hasCombat: $checkedConvert('has_combat', (v) => v as bool?),
      hasDefendObjective: $checkedConvert(
        'has_defend_objective',
        (v) => v as bool?,
      ),
      enemyCountMin: $checkedConvert(
        'enemy_count_min',
        (v) => (v as num?)?.toInt(),
      ),
      enemyCountMax: $checkedConvert(
        'enemy_count_max',
        (v) => (v as num?)?.toInt(),
      ),
      minCrimeStat: $checkedConvert(
        'min_crime_stat',
        (v) => (v as num?)?.toInt(),
      ),
      maxCrimeStat: $checkedConvert(
        'max_crime_stat',
        (v) => (v as num?)?.toInt(),
      ),
      rewardMin: $checkedConvert('reward_min', (v) => (v as num?)?.toInt()),
      rewardMax: $checkedConvert('reward_max', (v) => (v as num?)?.toInt()),
      rewardCurrency: $checkedConvert('reward_currency', (v) => v as String?),
      timeToCompleteMinutes: $checkedConvert(
        'time_to_complete_minutes',
        (v) => (v as num?)?.toDouble(),
      ),
      starSystems: $checkedConvert(
        'star_systems',
        (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
      ),
      cooldown: $checkedConvert(
        'cooldown',
        (v) => v == null
            ? null
            : MissionCooldown.fromJson(v as Map<String, dynamic>),
      ),
      lifetime: $checkedConvert(
        'lifetime',
        (v) => v == null
            ? null
            : MissionLifetime.fromJson(v as Map<String, dynamic>),
      ),
      reacceptAfterFailing: $checkedConvert(
        'reaccept_after_failing',
        (v) => v as bool?,
      ),
      reacceptAfterAbandoning: $checkedConvert(
        'reaccept_after_abandoning',
        (v) => v as bool?,
      ),
      blueprints: $checkedConvert(
        'blueprints',
        (v) => (v as List<dynamic>?)
            ?.map(
              (e) => MissionBlueprintPool.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
      rewardItems: $checkedConvert(
        'reward_items',
        (v) => (v as List<dynamic>?)
            ?.map((e) => MissionRewardItem.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      combat: $checkedConvert(
        'combat',
        (v) => v == null
            ? null
            : MissionCombat.fromJson(v as Map<String, dynamic>),
      ),
      completionTags: $checkedConvert(
        'completion_tags',
        (v) => (v as List<dynamic>?)
            ?.map(
              (e) => MissionCompletionTag.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
      reputationGained: $checkedConvert(
        'reputation_gained',
        (v) => (v as List<dynamic>?)
            ?.map((e) => MissionReputation.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      reputationLost: $checkedConvert(
        'reputation_lost',
        (v) => (v as List<dynamic>?)
            ?.map((e) => MissionReputation.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      haulingOrders: $checkedConvert(
        'hauling_orders',
        (v) => (v as List<dynamic>?)
            ?.map(
              (e) => MissionHaulingOrder.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
      cost: $checkedConvert('cost', (v) => (v as num?)?.toInt()),
      maxPlayersPerInstance: $checkedConvert(
        'max_players_per_instance',
        (v) => (v as num?)?.toInt(),
      ),
      failIfBecameCriminal: $checkedConvert(
        'fail_if_became_criminal',
        (v) => v as bool?,
      ),
      minStanding: $checkedConvert(
        'min_standing',
        (v) => v == null
            ? null
            : MissionIndexMinStanding.fromJson(v as Map<String, dynamic>),
      ),
      maxStanding: $checkedConvert(
        'max_standing',
        (v) => v == null
            ? null
            : MissionIndexMinStanding.fromJson(v as Map<String, dynamic>),
      ),
      missionTokens: $checkedConvert(
        'mission_tokens',
        (v) => (v as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(
            k,
            (e as List<dynamic>).map((e) => e as String).toList(),
          ),
        ),
      ),
      deadline: $checkedConvert(
        'deadline',
        (v) => v == null
            ? null
            : MissionDeadline.fromJson(v as Map<String, dynamic>),
      ),
      brokerReputationPrerequisites: $checkedConvert(
        'broker_reputation_prerequisites',
        (v) => v == null
            ? null
            : MissionBrokerReputationPrerequisites.fromJson(
                v as Map<String, dynamic>,
              ),
      ),
      itemCounts: $checkedConvert(
        'item_counts',
        (v) => v == null
            ? null
            : MissionItemCounts.fromJson(v as Map<String, dynamic>),
      ),
      entitySpawns: $checkedConvert(
        'entity_spawns',
        (v) => (v as List<dynamic>?)
            ?.map(
              (e) =>
                  MissionEntitySpawnsInner.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
      hiddenInMobiglas: $checkedConvert(
        'hidden_in_mobiglas',
        (v) => v as bool?,
      ),
      notifyOnAvailable: $checkedConvert(
        'notify_on_available',
        (v) => v as bool?,
      ),
      rewardScope: $checkedConvert('reward_scope', (v) => v as String?),
      reputationAmount: $checkedConvert(
        'reputation_amount',
        (v) => (v as num?)?.toInt(),
      ),
      gameVersion: $checkedConvert('game_version', (v) => v as String?),
      starmapLocations: $checkedConvert(
        'starmap_locations',
        (v) => (v as List<dynamic>?)
            ?.map(
              (e) => MissionStarmapLocationGroup.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
      prerequisiteGroups: $checkedConvert(
        'prerequisite_groups',
        (v) => (v as List<dynamic>?)
            ?.map(
              (e) =>
                  MissionPrerequisiteGroup.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
      unlockGroups: $checkedConvert(
        'unlock_groups',
        (v) => (v as List<dynamic>?)
            ?.map((e) => MissionUnlockGroup.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      mergedLocations: $checkedConvert('merged_locations', (v) => v),
      hasRewards: $checkedConvert('has_rewards', (v) => v as bool?),
      hasCombatSection: $checkedConvert(
        'has_combat_section',
        (v) => v as bool?,
      ),
      hasLocations: $checkedConvert('has_locations', (v) => v as bool?),
      hasChain: $checkedConvert('has_chain', (v) => v as bool?),
      hasBlueprints: $checkedConvert('has_blueprints', (v) => v as bool?),
      released: $checkedConvert('released', (v) => v as bool?),
      link: $checkedConvert('link', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'descriptionHtml': 'description_html',
    'descriptionVariants': 'description_variants',
    'missionType': 'mission_type',
    'missionGiver': 'mission_giver',
    'rankIndex': 'rank_index',
    'legalityLabel': 'legality_label',
    'onceOnly': 'once_only',
    'availableInPrison': 'available_in_prison',
    'notForRelease': 'not_for_release',
    'workInProgress': 'work_in_progress',
    'hasCombat': 'has_combat',
    'hasDefendObjective': 'has_defend_objective',
    'enemyCountMin': 'enemy_count_min',
    'enemyCountMax': 'enemy_count_max',
    'minCrimeStat': 'min_crime_stat',
    'maxCrimeStat': 'max_crime_stat',
    'rewardMin': 'reward_min',
    'rewardMax': 'reward_max',
    'rewardCurrency': 'reward_currency',
    'timeToCompleteMinutes': 'time_to_complete_minutes',
    'starSystems': 'star_systems',
    'reacceptAfterFailing': 'reaccept_after_failing',
    'reacceptAfterAbandoning': 'reaccept_after_abandoning',
    'rewardItems': 'reward_items',
    'completionTags': 'completion_tags',
    'reputationGained': 'reputation_gained',
    'reputationLost': 'reputation_lost',
    'haulingOrders': 'hauling_orders',
    'maxPlayersPerInstance': 'max_players_per_instance',
    'failIfBecameCriminal': 'fail_if_became_criminal',
    'minStanding': 'min_standing',
    'maxStanding': 'max_standing',
    'missionTokens': 'mission_tokens',
    'brokerReputationPrerequisites': 'broker_reputation_prerequisites',
    'itemCounts': 'item_counts',
    'entitySpawns': 'entity_spawns',
    'hiddenInMobiglas': 'hidden_in_mobiglas',
    'notifyOnAvailable': 'notify_on_available',
    'rewardScope': 'reward_scope',
    'reputationAmount': 'reputation_amount',
    'gameVersion': 'game_version',
    'starmapLocations': 'starmap_locations',
    'prerequisiteGroups': 'prerequisite_groups',
    'unlockGroups': 'unlock_groups',
    'mergedLocations': 'merged_locations',
    'hasRewards': 'has_rewards',
    'hasCombatSection': 'has_combat_section',
    'hasLocations': 'has_locations',
    'hasChain': 'has_chain',
    'hasBlueprints': 'has_blueprints',
  },
);

Map<String, dynamic> _$MissionToJson(Mission instance) => <String, dynamic>{
  'uuid': ?instance.uuid,
  'title': ?instance.title,
  'description': ?instance.description,
  'description_html': ?instance.descriptionHtml,
  'description_variants': ?instance.descriptionVariants,
  'mission_type': ?instance.missionType,
  'mission_giver': ?instance.missionGiver,
  'faction': ?instance.faction?.toJson(),
  'rank_index': ?instance.rankIndex,
  'illegal': ?instance.illegal,
  'legality_label': ?instance.legalityLabel,
  'shareable': ?instance.shareable,
  'once_only': ?instance.onceOnly,
  'available_in_prison': ?instance.availableInPrison,
  'not_for_release': ?instance.notForRelease,
  'work_in_progress': ?instance.workInProgress,
  'has_combat': ?instance.hasCombat,
  'has_defend_objective': ?instance.hasDefendObjective,
  'enemy_count_min': ?instance.enemyCountMin,
  'enemy_count_max': ?instance.enemyCountMax,
  'min_crime_stat': ?instance.minCrimeStat,
  'max_crime_stat': ?instance.maxCrimeStat,
  'reward_min': ?instance.rewardMin,
  'reward_max': ?instance.rewardMax,
  'reward_currency': ?instance.rewardCurrency,
  'time_to_complete_minutes': ?instance.timeToCompleteMinutes,
  'star_systems': ?instance.starSystems,
  'cooldown': ?instance.cooldown?.toJson(),
  'lifetime': ?instance.lifetime?.toJson(),
  'reaccept_after_failing': ?instance.reacceptAfterFailing,
  'reaccept_after_abandoning': ?instance.reacceptAfterAbandoning,
  'blueprints': ?instance.blueprints?.map((e) => e.toJson()).toList(),
  'reward_items': ?instance.rewardItems?.map((e) => e.toJson()).toList(),
  'combat': ?instance.combat?.toJson(),
  'completion_tags': ?instance.completionTags?.map((e) => e.toJson()).toList(),
  'reputation_gained': ?instance.reputationGained
      ?.map((e) => e.toJson())
      .toList(),
  'reputation_lost': ?instance.reputationLost?.map((e) => e.toJson()).toList(),
  'hauling_orders': ?instance.haulingOrders?.map((e) => e.toJson()).toList(),
  'cost': ?instance.cost,
  'max_players_per_instance': ?instance.maxPlayersPerInstance,
  'fail_if_became_criminal': ?instance.failIfBecameCriminal,
  'min_standing': ?instance.minStanding?.toJson(),
  'max_standing': ?instance.maxStanding?.toJson(),
  'mission_tokens': ?instance.missionTokens,
  'deadline': ?instance.deadline?.toJson(),
  'broker_reputation_prerequisites': ?instance.brokerReputationPrerequisites
      ?.toJson(),
  'item_counts': ?instance.itemCounts?.toJson(),
  'entity_spawns': ?instance.entitySpawns?.map((e) => e.toJson()).toList(),
  'hidden_in_mobiglas': ?instance.hiddenInMobiglas,
  'notify_on_available': ?instance.notifyOnAvailable,
  'reward_scope': ?instance.rewardScope,
  'reputation_amount': ?instance.reputationAmount,
  'game_version': ?instance.gameVersion,
  'starmap_locations': ?instance.starmapLocations
      ?.map((e) => e.toJson())
      .toList(),
  'prerequisite_groups': ?instance.prerequisiteGroups
      ?.map((e) => e.toJson())
      .toList(),
  'unlock_groups': ?instance.unlockGroups?.map((e) => e.toJson()).toList(),
  'merged_locations': ?instance.mergedLocations,
  'has_rewards': ?instance.hasRewards,
  'has_combat_section': ?instance.hasCombatSection,
  'has_locations': ?instance.hasLocations,
  'has_chain': ?instance.hasChain,
  'has_blueprints': ?instance.hasBlueprints,
  'released': ?instance.released,
  'link': ?instance.link,
};
