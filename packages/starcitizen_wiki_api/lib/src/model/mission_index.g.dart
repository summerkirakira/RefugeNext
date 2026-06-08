// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mission_index.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MissionIndex _$MissionIndexFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'MissionIndex',
  json,
  ($checkedConvert) {
    final val = MissionIndex(
      uuid: $checkedConvert('uuid', (v) => v as String?),
      title: $checkedConvert('title', (v) => v as String?),
      description: $checkedConvert('description', (v) => v as String?),
      missionGiver: $checkedConvert('mission_giver', (v) => v as String?),
      debugName: $checkedConvert('debug_name', (v) => v as String?),
      faction: $checkedConvert(
        'faction',
        (v) => v == null
            ? null
            : MissionIndexFaction.fromJson(v as Map<String, dynamic>),
      ),
      rankIndex: $checkedConvert('rank_index', (v) => (v as num?)?.toInt()),
      illegal: $checkedConvert('illegal', (v) => v as bool?),
      legalityLabel: $checkedConvert('legality_label', (v) => v as String?),
      shareable: $checkedConvert('shareable', (v) => v as bool?),
      onceOnly: $checkedConvert('once_only', (v) => v as bool?),
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
      variantCount: $checkedConvert(
        'variant_count',
        (v) => (v as num?)?.toInt(),
      ),
      variants: $checkedConvert(
        'variants',
        (v) => (v as List<dynamic>?)
            ?.map(
              (e) =>
                  MissionIndexVariantsInner.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
      hasBlueprints: $checkedConvert('has_blueprints', (v) => v as bool?),
      blueprints: $checkedConvert(
        'blueprints',
        (v) => (v as List<dynamic>?)
            ?.map(
              (e) => MissionIndexBlueprint.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
      hasChain: $checkedConvert('has_chain', (v) => v as bool?),
      hasPrerequisites: $checkedConvert('has_prerequisites', (v) => v as bool?),
      hasHauling: $checkedConvert('has_hauling', (v) => v as bool?),
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
      minStandingName: $checkedConvert(
        'min_standing_name',
        (v) => v as String?,
      ),
      maxStandingName: $checkedConvert(
        'max_standing_name',
        (v) => v as String?,
      ),
      cost: $checkedConvert('cost', (v) => (v as num?)?.toInt()),
      minCrimeStat: $checkedConvert(
        'min_crime_stat',
        (v) => (v as num?)?.toInt(),
      ),
      maxCrimeStat: $checkedConvert(
        'max_crime_stat',
        (v) => (v as num?)?.toInt(),
      ),
      availableInPrison: $checkedConvert(
        'available_in_prison',
        (v) => v as bool?,
      ),
      notForRelease: $checkedConvert('not_for_release', (v) => v as bool?),
      workInProgress: $checkedConvert('work_in_progress', (v) => v as bool?),
      reputationGained: $checkedConvert(
        'reputation_gained',
        (v) => (v as List<dynamic>?)
            ?.map(
              (e) => MissionIndexReputationGainedInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
      maxPlayersPerInstance: $checkedConvert(
        'max_players_per_instance',
        (v) => (v as num?)?.toInt(),
      ),
      maxInstancesPerPlayer: $checkedConvert(
        'max_instances_per_player',
        (v) => (v as num?)?.toInt(),
      ),
      cooldown: $checkedConvert(
        'cooldown',
        (v) => v == null
            ? null
            : MissionCooldown.fromJson(v as Map<String, dynamic>),
      ),
      cooldownSeconds: $checkedConvert(
        'cooldown_seconds',
        (v) => (v as num?)?.toInt(),
      ),
      cooldownLabel: $checkedConvert('cooldown_label', (v) => v as String?),
      reacceptAfterAbandoning: $checkedConvert(
        'reaccept_after_abandoning',
        (v) => v as bool?,
      ),
      reacceptAfterFailing: $checkedConvert(
        'reaccept_after_failing',
        (v) => v as bool?,
      ),
      failIfBecameCriminal: $checkedConvert(
        'fail_if_became_criminal',
        (v) => v as bool?,
      ),
      haulingSummary: $checkedConvert(
        'hauling_summary',
        (v) => (v as List<dynamic>?)
            ?.map(
              (e) => MissionIndexHaulingSummaryInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
      rewardScope: $checkedConvert('reward_scope', (v) => v as String?),
      reputationAmount: $checkedConvert(
        'reputation_amount',
        (v) => (v as num?)?.toInt(),
      ),
      gameVersion: $checkedConvert('game_version', (v) => v as String?),
      link: $checkedConvert('link', (v) => v as String?),
      webUrl: $checkedConvert('web_url', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'missionGiver': 'mission_giver',
    'debugName': 'debug_name',
    'rankIndex': 'rank_index',
    'legalityLabel': 'legality_label',
    'onceOnly': 'once_only',
    'hasCombat': 'has_combat',
    'hasDefendObjective': 'has_defend_objective',
    'enemyCountMin': 'enemy_count_min',
    'enemyCountMax': 'enemy_count_max',
    'rewardMin': 'reward_min',
    'rewardMax': 'reward_max',
    'rewardCurrency': 'reward_currency',
    'timeToCompleteMinutes': 'time_to_complete_minutes',
    'starSystems': 'star_systems',
    'variantCount': 'variant_count',
    'hasBlueprints': 'has_blueprints',
    'hasChain': 'has_chain',
    'hasPrerequisites': 'has_prerequisites',
    'hasHauling': 'has_hauling',
    'minStanding': 'min_standing',
    'maxStanding': 'max_standing',
    'minStandingName': 'min_standing_name',
    'maxStandingName': 'max_standing_name',
    'minCrimeStat': 'min_crime_stat',
    'maxCrimeStat': 'max_crime_stat',
    'availableInPrison': 'available_in_prison',
    'notForRelease': 'not_for_release',
    'workInProgress': 'work_in_progress',
    'reputationGained': 'reputation_gained',
    'maxPlayersPerInstance': 'max_players_per_instance',
    'maxInstancesPerPlayer': 'max_instances_per_player',
    'cooldownSeconds': 'cooldown_seconds',
    'cooldownLabel': 'cooldown_label',
    'reacceptAfterAbandoning': 'reaccept_after_abandoning',
    'reacceptAfterFailing': 'reaccept_after_failing',
    'failIfBecameCriminal': 'fail_if_became_criminal',
    'haulingSummary': 'hauling_summary',
    'rewardScope': 'reward_scope',
    'reputationAmount': 'reputation_amount',
    'gameVersion': 'game_version',
    'webUrl': 'web_url',
  },
);

Map<String, dynamic> _$MissionIndexToJson(
  MissionIndex instance,
) => <String, dynamic>{
  'uuid': ?instance.uuid,
  'title': ?instance.title,
  'description': ?instance.description,
  'mission_giver': ?instance.missionGiver,
  'debug_name': ?instance.debugName,
  'faction': ?instance.faction?.toJson(),
  'rank_index': ?instance.rankIndex,
  'illegal': ?instance.illegal,
  'legality_label': ?instance.legalityLabel,
  'shareable': ?instance.shareable,
  'once_only': ?instance.onceOnly,
  'has_combat': ?instance.hasCombat,
  'has_defend_objective': ?instance.hasDefendObjective,
  'enemy_count_min': ?instance.enemyCountMin,
  'enemy_count_max': ?instance.enemyCountMax,
  'reward_min': ?instance.rewardMin,
  'reward_max': ?instance.rewardMax,
  'reward_currency': ?instance.rewardCurrency,
  'time_to_complete_minutes': ?instance.timeToCompleteMinutes,
  'star_systems': ?instance.starSystems,
  'variant_count': ?instance.variantCount,
  'variants': ?instance.variants?.map((e) => e.toJson()).toList(),
  'has_blueprints': ?instance.hasBlueprints,
  'blueprints': ?instance.blueprints?.map((e) => e.toJson()).toList(),
  'has_chain': ?instance.hasChain,
  'has_prerequisites': ?instance.hasPrerequisites,
  'has_hauling': ?instance.hasHauling,
  'min_standing': ?instance.minStanding?.toJson(),
  'max_standing': ?instance.maxStanding?.toJson(),
  'min_standing_name': ?instance.minStandingName,
  'max_standing_name': ?instance.maxStandingName,
  'cost': ?instance.cost,
  'min_crime_stat': ?instance.minCrimeStat,
  'max_crime_stat': ?instance.maxCrimeStat,
  'available_in_prison': ?instance.availableInPrison,
  'not_for_release': ?instance.notForRelease,
  'work_in_progress': ?instance.workInProgress,
  'reputation_gained': ?instance.reputationGained
      ?.map((e) => e.toJson())
      .toList(),
  'max_players_per_instance': ?instance.maxPlayersPerInstance,
  'max_instances_per_player': ?instance.maxInstancesPerPlayer,
  'cooldown': ?instance.cooldown?.toJson(),
  'cooldown_seconds': ?instance.cooldownSeconds,
  'cooldown_label': ?instance.cooldownLabel,
  'reaccept_after_abandoning': ?instance.reacceptAfterAbandoning,
  'reaccept_after_failing': ?instance.reacceptAfterFailing,
  'fail_if_became_criminal': ?instance.failIfBecameCriminal,
  'hauling_summary': ?instance.haulingSummary?.map((e) => e.toJson()).toList(),
  'reward_scope': ?instance.rewardScope,
  'reputation_amount': ?instance.reputationAmount,
  'game_version': ?instance.gameVersion,
  'link': ?instance.link,
  'web_url': ?instance.webUrl,
};
