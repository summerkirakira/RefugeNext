//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/mission_index_variants_inner.dart';
import 'package:starcitizen_wiki_api/src/model/mission_index_hauling_summary_inner.dart';
import 'package:starcitizen_wiki_api/src/model/mission_index_reputation_gained_inner.dart';
import 'package:starcitizen_wiki_api/src/model/mission_index_blueprint.dart';
import 'package:starcitizen_wiki_api/src/model/mission_index_min_standing.dart';
import 'package:starcitizen_wiki_api/src/model/mission_cooldown.dart';
import 'package:starcitizen_wiki_api/src/model/mission_index_faction.dart';
import 'package:json_annotation/json_annotation.dart';

part 'mission_index.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MissionIndex {
  /// Returns a new [MissionIndex] instance.
  MissionIndex({

     this.uuid,

     this.title,

     this.description,

     this.missionGiver,

     this.debugName,

     this.faction,

     this.rankIndex,

     this.illegal,

     this.legalityLabel,

     this.shareable,

     this.onceOnly,

     this.hasCombat,

     this.hasDefendObjective,

     this.enemyCountMin,

     this.enemyCountMax,

     this.rewardMin,

     this.rewardMax,

     this.rewardCurrency,

     this.timeToCompleteMinutes,

     this.starSystems,

     this.variantCount,

     this.variants,

     this.hasBlueprints,

     this.blueprints,

     this.hasChain,

     this.hasPrerequisites,

     this.hasHauling,

     this.minStanding,

     this.maxStanding,

     this.minStandingName,

     this.maxStandingName,

     this.cost,

     this.minCrimeStat,

     this.maxCrimeStat,

     this.availableInPrison,

     this.notForRelease,

     this.workInProgress,

     this.reputationGained,

     this.maxPlayersPerInstance,

     this.maxInstancesPerPlayer,

     this.cooldown,

     this.cooldownSeconds,

     this.cooldownLabel,

     this.reacceptAfterAbandoning,

     this.reacceptAfterFailing,

     this.failIfBecameCriminal,

     this.haulingSummary,

     this.rewardScope,

     this.reputationAmount,

     this.gameVersion,

     this.link,

     this.webUrl,
  });

  @JsonKey(
    
    name: r'uuid',
    required: false,
    includeIfNull: false,
  )


  final String? uuid;



  @JsonKey(
    
    name: r'title',
    required: false,
    includeIfNull: false,
  )


  final String? title;



  @JsonKey(
    
    name: r'description',
    required: false,
    includeIfNull: false,
  )


  final String? description;



  @JsonKey(
    
    name: r'mission_giver',
    required: false,
    includeIfNull: false,
  )


  final String? missionGiver;



  @JsonKey(
    
    name: r'debug_name',
    required: false,
    includeIfNull: false,
  )


  final String? debugName;



  @JsonKey(
    
    name: r'faction',
    required: false,
    includeIfNull: false,
  )


  final MissionIndexFaction? faction;



  @JsonKey(
    
    name: r'rank_index',
    required: false,
    includeIfNull: false,
  )


  final int? rankIndex;



  @JsonKey(
    
    name: r'illegal',
    required: false,
    includeIfNull: false,
  )


  final bool? illegal;



  @JsonKey(
    
    name: r'legality_label',
    required: false,
    includeIfNull: false,
  )


  final String? legalityLabel;



  @JsonKey(
    
    name: r'shareable',
    required: false,
    includeIfNull: false,
  )


  final bool? shareable;



  @JsonKey(
    
    name: r'once_only',
    required: false,
    includeIfNull: false,
  )


  final bool? onceOnly;



  @JsonKey(
    
    name: r'has_combat',
    required: false,
    includeIfNull: false,
  )


  final bool? hasCombat;



  @JsonKey(
    
    name: r'has_defend_objective',
    required: false,
    includeIfNull: false,
  )


  final bool? hasDefendObjective;



  @JsonKey(
    
    name: r'enemy_count_min',
    required: false,
    includeIfNull: false,
  )


  final int? enemyCountMin;



  @JsonKey(
    
    name: r'enemy_count_max',
    required: false,
    includeIfNull: false,
  )


  final int? enemyCountMax;



  @JsonKey(
    
    name: r'reward_min',
    required: false,
    includeIfNull: false,
  )


  final int? rewardMin;



  @JsonKey(
    
    name: r'reward_max',
    required: false,
    includeIfNull: false,
  )


  final int? rewardMax;



  @JsonKey(
    
    name: r'reward_currency',
    required: false,
    includeIfNull: false,
  )


  final String? rewardCurrency;



  @JsonKey(
    
    name: r'time_to_complete_minutes',
    required: false,
    includeIfNull: false,
  )


  final double? timeToCompleteMinutes;



  @JsonKey(
    
    name: r'star_systems',
    required: false,
    includeIfNull: false,
  )


  final List<String>? starSystems;



  @JsonKey(
    
    name: r'variant_count',
    required: false,
    includeIfNull: false,
  )


  final int? variantCount;



  @JsonKey(
    
    name: r'variants',
    required: false,
    includeIfNull: false,
  )


  final List<MissionIndexVariantsInner>? variants;



  @JsonKey(
    
    name: r'has_blueprints',
    required: false,
    includeIfNull: false,
  )


  final bool? hasBlueprints;



  @JsonKey(
    
    name: r'blueprints',
    required: false,
    includeIfNull: false,
  )


  final List<MissionIndexBlueprint>? blueprints;



  @JsonKey(
    
    name: r'has_chain',
    required: false,
    includeIfNull: false,
  )


  final bool? hasChain;



      /// Deprecated: Use has_chain.
  @Deprecated('hasPrerequisites has been deprecated')
  @JsonKey(
    
    name: r'has_prerequisites',
    required: false,
    includeIfNull: false,
  )


  final bool? hasPrerequisites;



  @JsonKey(
    
    name: r'has_hauling',
    required: false,
    includeIfNull: false,
  )


  final bool? hasHauling;



  @JsonKey(
    
    name: r'min_standing',
    required: false,
    includeIfNull: false,
  )


  final MissionIndexMinStanding? minStanding;



  @JsonKey(
    
    name: r'max_standing',
    required: false,
    includeIfNull: false,
  )


  final MissionIndexMinStanding? maxStanding;



      /// Deprecated: Use min_standing.name.
  @Deprecated('minStandingName has been deprecated')
  @JsonKey(
    
    name: r'min_standing_name',
    required: false,
    includeIfNull: false,
  )


  final String? minStandingName;



      /// Deprecated: Use max_standing.name.
  @Deprecated('maxStandingName has been deprecated')
  @JsonKey(
    
    name: r'max_standing_name',
    required: false,
    includeIfNull: false,
  )


  final String? maxStandingName;



  @JsonKey(
    
    name: r'cost',
    required: false,
    includeIfNull: false,
  )


  final int? cost;



  @JsonKey(
    
    name: r'min_crime_stat',
    required: false,
    includeIfNull: false,
  )


  final int? minCrimeStat;



  @JsonKey(
    
    name: r'max_crime_stat',
    required: false,
    includeIfNull: false,
  )


  final int? maxCrimeStat;



  @JsonKey(
    
    name: r'available_in_prison',
    required: false,
    includeIfNull: false,
  )


  final bool? availableInPrison;



  @JsonKey(
    
    name: r'not_for_release',
    required: false,
    includeIfNull: false,
  )


  final bool? notForRelease;



  @JsonKey(
    
    name: r'work_in_progress',
    required: false,
    includeIfNull: false,
  )


  final bool? workInProgress;



  @JsonKey(
    
    name: r'reputation_gained',
    required: false,
    includeIfNull: false,
  )


  final List<MissionIndexReputationGainedInner>? reputationGained;



  @JsonKey(
    
    name: r'max_players_per_instance',
    required: false,
    includeIfNull: false,
  )


  final int? maxPlayersPerInstance;



  @JsonKey(
    
    name: r'max_instances_per_player',
    required: false,
    includeIfNull: false,
  )


  final int? maxInstancesPerPlayer;



  @JsonKey(
    
    name: r'cooldown',
    required: false,
    includeIfNull: false,
  )


  final MissionCooldown? cooldown;



      /// Deprecated: Use cooldown.personal_seconds.
  @Deprecated('cooldownSeconds has been deprecated')
  @JsonKey(
    
    name: r'cooldown_seconds',
    required: false,
    includeIfNull: false,
  )


  final int? cooldownSeconds;



      /// Deprecated: Use cooldown.label.
  @Deprecated('cooldownLabel has been deprecated')
  @JsonKey(
    
    name: r'cooldown_label',
    required: false,
    includeIfNull: false,
  )


  final String? cooldownLabel;



  @JsonKey(
    
    name: r'reaccept_after_abandoning',
    required: false,
    includeIfNull: false,
  )


  final bool? reacceptAfterAbandoning;



  @JsonKey(
    
    name: r'reaccept_after_failing',
    required: false,
    includeIfNull: false,
  )


  final bool? reacceptAfterFailing;



  @JsonKey(
    
    name: r'fail_if_became_criminal',
    required: false,
    includeIfNull: false,
  )


  final bool? failIfBecameCriminal;



  @JsonKey(
    
    name: r'hauling_summary',
    required: false,
    includeIfNull: false,
  )


  final List<MissionIndexHaulingSummaryInner>? haulingSummary;



  @JsonKey(
    
    name: r'reward_scope',
    required: false,
    includeIfNull: false,
  )


  final String? rewardScope;



  @JsonKey(
    
    name: r'reputation_amount',
    required: false,
    includeIfNull: false,
  )


  final int? reputationAmount;



  @JsonKey(
    
    name: r'game_version',
    required: false,
    includeIfNull: false,
  )


  final String? gameVersion;



  @JsonKey(
    
    name: r'link',
    required: false,
    includeIfNull: false,
  )


  final String? link;



  @JsonKey(
    
    name: r'web_url',
    required: false,
    includeIfNull: false,
  )


  final String? webUrl;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MissionIndex &&
      other.uuid == uuid &&
      other.title == title &&
      other.description == description &&
      other.missionGiver == missionGiver &&
      other.debugName == debugName &&
      other.faction == faction &&
      other.rankIndex == rankIndex &&
      other.illegal == illegal &&
      other.legalityLabel == legalityLabel &&
      other.shareable == shareable &&
      other.onceOnly == onceOnly &&
      other.hasCombat == hasCombat &&
      other.hasDefendObjective == hasDefendObjective &&
      other.enemyCountMin == enemyCountMin &&
      other.enemyCountMax == enemyCountMax &&
      other.rewardMin == rewardMin &&
      other.rewardMax == rewardMax &&
      other.rewardCurrency == rewardCurrency &&
      other.timeToCompleteMinutes == timeToCompleteMinutes &&
      other.starSystems == starSystems &&
      other.variantCount == variantCount &&
      other.variants == variants &&
      other.hasBlueprints == hasBlueprints &&
      other.blueprints == blueprints &&
      other.hasChain == hasChain &&
      other.hasPrerequisites == hasPrerequisites &&
      other.hasHauling == hasHauling &&
      other.minStanding == minStanding &&
      other.maxStanding == maxStanding &&
      other.minStandingName == minStandingName &&
      other.maxStandingName == maxStandingName &&
      other.cost == cost &&
      other.minCrimeStat == minCrimeStat &&
      other.maxCrimeStat == maxCrimeStat &&
      other.availableInPrison == availableInPrison &&
      other.notForRelease == notForRelease &&
      other.workInProgress == workInProgress &&
      other.reputationGained == reputationGained &&
      other.maxPlayersPerInstance == maxPlayersPerInstance &&
      other.maxInstancesPerPlayer == maxInstancesPerPlayer &&
      other.cooldown == cooldown &&
      other.cooldownSeconds == cooldownSeconds &&
      other.cooldownLabel == cooldownLabel &&
      other.reacceptAfterAbandoning == reacceptAfterAbandoning &&
      other.reacceptAfterFailing == reacceptAfterFailing &&
      other.failIfBecameCriminal == failIfBecameCriminal &&
      other.haulingSummary == haulingSummary &&
      other.rewardScope == rewardScope &&
      other.reputationAmount == reputationAmount &&
      other.gameVersion == gameVersion &&
      other.link == link &&
      other.webUrl == webUrl;

    @override
    int get hashCode =>
        uuid.hashCode +
        (title == null ? 0 : title.hashCode) +
        (description == null ? 0 : description.hashCode) +
        (missionGiver == null ? 0 : missionGiver.hashCode) +
        (debugName == null ? 0 : debugName.hashCode) +
        (faction == null ? 0 : faction.hashCode) +
        (rankIndex == null ? 0 : rankIndex.hashCode) +
        illegal.hashCode +
        legalityLabel.hashCode +
        shareable.hashCode +
        onceOnly.hashCode +
        (hasCombat == null ? 0 : hasCombat.hashCode) +
        (hasDefendObjective == null ? 0 : hasDefendObjective.hashCode) +
        (enemyCountMin == null ? 0 : enemyCountMin.hashCode) +
        (enemyCountMax == null ? 0 : enemyCountMax.hashCode) +
        (rewardMin == null ? 0 : rewardMin.hashCode) +
        (rewardMax == null ? 0 : rewardMax.hashCode) +
        (rewardCurrency == null ? 0 : rewardCurrency.hashCode) +
        (timeToCompleteMinutes == null ? 0 : timeToCompleteMinutes.hashCode) +
        (starSystems == null ? 0 : starSystems.hashCode) +
        (variantCount == null ? 0 : variantCount.hashCode) +
        (variants == null ? 0 : variants.hashCode) +
        hasBlueprints.hashCode +
        (blueprints == null ? 0 : blueprints.hashCode) +
        hasChain.hashCode +
        hasPrerequisites.hashCode +
        hasHauling.hashCode +
        (minStanding == null ? 0 : minStanding.hashCode) +
        (maxStanding == null ? 0 : maxStanding.hashCode) +
        (minStandingName == null ? 0 : minStandingName.hashCode) +
        (maxStandingName == null ? 0 : maxStandingName.hashCode) +
        (cost == null ? 0 : cost.hashCode) +
        (minCrimeStat == null ? 0 : minCrimeStat.hashCode) +
        (maxCrimeStat == null ? 0 : maxCrimeStat.hashCode) +
        availableInPrison.hashCode +
        notForRelease.hashCode +
        workInProgress.hashCode +
        (reputationGained == null ? 0 : reputationGained.hashCode) +
        (maxPlayersPerInstance == null ? 0 : maxPlayersPerInstance.hashCode) +
        (maxInstancesPerPlayer == null ? 0 : maxInstancesPerPlayer.hashCode) +
        (cooldown == null ? 0 : cooldown.hashCode) +
        (cooldownSeconds == null ? 0 : cooldownSeconds.hashCode) +
        (cooldownLabel == null ? 0 : cooldownLabel.hashCode) +
        reacceptAfterAbandoning.hashCode +
        reacceptAfterFailing.hashCode +
        failIfBecameCriminal.hashCode +
        (haulingSummary == null ? 0 : haulingSummary.hashCode) +
        (rewardScope == null ? 0 : rewardScope.hashCode) +
        (reputationAmount == null ? 0 : reputationAmount.hashCode) +
        (gameVersion == null ? 0 : gameVersion.hashCode) +
        link.hashCode +
        webUrl.hashCode;

  factory MissionIndex.fromJson(Map<String, dynamic> json) => _$MissionIndexFromJson(json);

  Map<String, dynamic> toJson() => _$MissionIndexToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

