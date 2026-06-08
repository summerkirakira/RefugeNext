//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/mission_combat.dart';
import 'package:starcitizen_wiki_api/src/model/mission_reputation.dart';
import 'package:starcitizen_wiki_api/src/model/mission_blueprint_pool.dart';
import 'package:starcitizen_wiki_api/src/model/mission_index_min_standing.dart';
import 'package:starcitizen_wiki_api/src/model/mission_lifetime.dart';
import 'package:starcitizen_wiki_api/src/model/mission_cooldown.dart';
import 'package:starcitizen_wiki_api/src/model/mission_unlock_group.dart';
import 'package:starcitizen_wiki_api/src/model/mission_faction.dart';
import 'package:starcitizen_wiki_api/src/model/mission_broker_reputation_prerequisites.dart';
import 'package:starcitizen_wiki_api/src/model/mission_starmap_location_group.dart';
import 'package:starcitizen_wiki_api/src/model/mission_completion_tag.dart';
import 'package:starcitizen_wiki_api/src/model/mission_deadline.dart';
import 'package:starcitizen_wiki_api/src/model/mission_reward_item.dart';
import 'package:starcitizen_wiki_api/src/model/mission_hauling_order.dart';
import 'package:starcitizen_wiki_api/src/model/mission_prerequisite_group.dart';
import 'package:starcitizen_wiki_api/src/model/mission_item_counts.dart';
import 'package:starcitizen_wiki_api/src/model/mission_entity_spawns_inner.dart';
import 'package:json_annotation/json_annotation.dart';

part 'mission.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Mission {
  /// Returns a new [Mission] instance.
  Mission({

     this.uuid,

     this.title,

     this.description,

     this.descriptionHtml,

     this.descriptionVariants,

     this.missionType,

     this.missionGiver,

     this.faction,

     this.rankIndex,

     this.illegal,

     this.legalityLabel,

     this.shareable,

     this.onceOnly,

     this.availableInPrison,

     this.notForRelease,

     this.workInProgress,

     this.hasCombat,

     this.hasDefendObjective,

     this.enemyCountMin,

     this.enemyCountMax,

     this.minCrimeStat,

     this.maxCrimeStat,

     this.rewardMin,

     this.rewardMax,

     this.rewardCurrency,

     this.timeToCompleteMinutes,

     this.starSystems,

     this.cooldown,

     this.lifetime,

     this.reacceptAfterFailing,

     this.reacceptAfterAbandoning,

     this.blueprints,

     this.rewardItems,

     this.combat,

     this.completionTags,

     this.reputationGained,

     this.reputationLost,

     this.haulingOrders,

     this.cost,

     this.maxPlayersPerInstance,

     this.failIfBecameCriminal,

     this.minStanding,

     this.maxStanding,

     this.missionTokens,

     this.deadline,

     this.brokerReputationPrerequisites,

     this.itemCounts,

     this.entitySpawns,

     this.hiddenInMobiglas,

     this.notifyOnAvailable,

     this.rewardScope,

     this.reputationAmount,

     this.gameVersion,

     this.starmapLocations,

     this.prerequisiteGroups,

     this.unlockGroups,

     this.mergedLocations,

     this.hasRewards,

     this.hasCombatSection,

     this.hasLocations,

     this.hasChain,

     this.hasBlueprints,

     this.released,

     this.link,
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



      /// HTML-rendered mission description. Escapes raw text, preserves EM4 styling, and renders exact mission token placeholders as tooltip spans.
  @JsonKey(
    
    name: r'description_html',
    required: false,
    includeIfNull: false,
  )


  final String? descriptionHtml;



      /// Rendered HTML variants when the raw description is a single mission token with multiple possible values.
  @JsonKey(
    
    name: r'description_variants',
    required: false,
    includeIfNull: false,
  )


  final List<String>? descriptionVariants;



  @JsonKey(
    
    name: r'mission_type',
    required: false,
    includeIfNull: false,
  )


  final String? missionType;



  @JsonKey(
    
    name: r'mission_giver',
    required: false,
    includeIfNull: false,
  )


  final String? missionGiver;



  @JsonKey(
    
    name: r'faction',
    required: false,
    includeIfNull: false,
  )


  final MissionFaction? faction;



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
    
    name: r'cooldown',
    required: false,
    includeIfNull: false,
  )


  final MissionCooldown? cooldown;



  @JsonKey(
    
    name: r'lifetime',
    required: false,
    includeIfNull: false,
  )


  final MissionLifetime? lifetime;



  @JsonKey(
    
    name: r'reaccept_after_failing',
    required: false,
    includeIfNull: false,
  )


  final bool? reacceptAfterFailing;



  @JsonKey(
    
    name: r'reaccept_after_abandoning',
    required: false,
    includeIfNull: false,
  )


  final bool? reacceptAfterAbandoning;



      /// Array of blueprint pools
  @JsonKey(
    
    name: r'blueprints',
    required: false,
    includeIfNull: false,
  )


  final List<MissionBlueprintPool>? blueprints;



  @JsonKey(
    
    name: r'reward_items',
    required: false,
    includeIfNull: false,
  )


  final List<MissionRewardItem>? rewardItems;



  @JsonKey(
    
    name: r'combat',
    required: false,
    includeIfNull: false,
  )


  final MissionCombat? combat;



  @JsonKey(
    
    name: r'completion_tags',
    required: false,
    includeIfNull: false,
  )


  final List<MissionCompletionTag>? completionTags;



  @JsonKey(
    
    name: r'reputation_gained',
    required: false,
    includeIfNull: false,
  )


  final List<MissionReputation>? reputationGained;



  @JsonKey(
    
    name: r'reputation_lost',
    required: false,
    includeIfNull: false,
  )


  final List<MissionReputation>? reputationLost;



  @JsonKey(
    
    name: r'hauling_orders',
    required: false,
    includeIfNull: false,
  )


  final List<MissionHaulingOrder>? haulingOrders;



  @JsonKey(
    
    name: r'cost',
    required: false,
    includeIfNull: false,
  )


  final int? cost;



  @JsonKey(
    
    name: r'max_players_per_instance',
    required: false,
    includeIfNull: false,
  )


  final int? maxPlayersPerInstance;



  @JsonKey(
    
    name: r'fail_if_became_criminal',
    required: false,
    includeIfNull: false,
  )


  final bool? failIfBecameCriminal;



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



      /// Resolved mission token values. Keys are token identifiers (e.g. \"Location|Address\", \"Danger\", \"Contractor\"). Values are arrays of possible resolved strings. Keys preserve original case and pipe syntax exactly.
  @JsonKey(
    
    name: r'mission_tokens',
    required: false,
    includeIfNull: false,
  )


  final Map<String, List<String>>? missionTokens;



  @JsonKey(
    
    name: r'deadline',
    required: false,
    includeIfNull: false,
  )


  final MissionDeadline? deadline;



  @JsonKey(
    
    name: r'broker_reputation_prerequisites',
    required: false,
    includeIfNull: false,
  )


  final MissionBrokerReputationPrerequisites? brokerReputationPrerequisites;



  @JsonKey(
    
    name: r'item_counts',
    required: false,
    includeIfNull: false,
  )


  final MissionItemCounts? itemCounts;



  @JsonKey(
    
    name: r'entity_spawns',
    required: false,
    includeIfNull: false,
  )


  final List<MissionEntitySpawnsInner>? entitySpawns;



  @JsonKey(
    
    name: r'hidden_in_mobiglas',
    required: false,
    includeIfNull: false,
  )


  final bool? hiddenInMobiglas;



  @JsonKey(
    
    name: r'notify_on_available',
    required: false,
    includeIfNull: false,
  )


  final bool? notifyOnAvailable;



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
    
    name: r'starmap_locations',
    required: false,
    includeIfNull: false,
  )


  final List<MissionStarmapLocationGroup>? starmapLocations;



  @JsonKey(
    
    name: r'prerequisite_groups',
    required: false,
    includeIfNull: false,
  )


  final List<MissionPrerequisiteGroup>? prerequisiteGroups;



      /// Completion tag groups that become available after completing this mission
  @JsonKey(
    
    name: r'unlock_groups',
    required: false,
    includeIfNull: false,
  )


  final List<MissionUnlockGroup>? unlockGroups;



      /// Starmap locations grouped by logical purpose categories (Destinations, Locations, Availability)
  @JsonKey(
    
    name: r'merged_locations',
    required: false,
    includeIfNull: false,
  )


  final Object? mergedLocations;



  @JsonKey(
    
    name: r'has_rewards',
    required: false,
    includeIfNull: false,
  )


  final bool? hasRewards;



  @JsonKey(
    
    name: r'has_combat_section',
    required: false,
    includeIfNull: false,
  )


  final bool? hasCombatSection;



  @JsonKey(
    
    name: r'has_locations',
    required: false,
    includeIfNull: false,
  )


  final bool? hasLocations;



  @JsonKey(
    
    name: r'has_chain',
    required: false,
    includeIfNull: false,
  )


  final bool? hasChain;



  @JsonKey(
    
    name: r'has_blueprints',
    required: false,
    includeIfNull: false,
  )


  final bool? hasBlueprints;



      /// Whether this mission is released (not marked as not_for_release or work_in_progress).
  @JsonKey(
    
    name: r'released',
    required: false,
    includeIfNull: false,
  )


  final bool? released;



  @JsonKey(
    
    name: r'link',
    required: false,
    includeIfNull: false,
  )


  final String? link;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Mission &&
      other.uuid == uuid &&
      other.title == title &&
      other.description == description &&
      other.descriptionHtml == descriptionHtml &&
      other.descriptionVariants == descriptionVariants &&
      other.missionType == missionType &&
      other.missionGiver == missionGiver &&
      other.faction == faction &&
      other.rankIndex == rankIndex &&
      other.illegal == illegal &&
      other.legalityLabel == legalityLabel &&
      other.shareable == shareable &&
      other.onceOnly == onceOnly &&
      other.availableInPrison == availableInPrison &&
      other.notForRelease == notForRelease &&
      other.workInProgress == workInProgress &&
      other.hasCombat == hasCombat &&
      other.hasDefendObjective == hasDefendObjective &&
      other.enemyCountMin == enemyCountMin &&
      other.enemyCountMax == enemyCountMax &&
      other.minCrimeStat == minCrimeStat &&
      other.maxCrimeStat == maxCrimeStat &&
      other.rewardMin == rewardMin &&
      other.rewardMax == rewardMax &&
      other.rewardCurrency == rewardCurrency &&
      other.timeToCompleteMinutes == timeToCompleteMinutes &&
      other.starSystems == starSystems &&
      other.cooldown == cooldown &&
      other.lifetime == lifetime &&
      other.reacceptAfterFailing == reacceptAfterFailing &&
      other.reacceptAfterAbandoning == reacceptAfterAbandoning &&
      other.blueprints == blueprints &&
      other.rewardItems == rewardItems &&
      other.combat == combat &&
      other.completionTags == completionTags &&
      other.reputationGained == reputationGained &&
      other.reputationLost == reputationLost &&
      other.haulingOrders == haulingOrders &&
      other.cost == cost &&
      other.maxPlayersPerInstance == maxPlayersPerInstance &&
      other.failIfBecameCriminal == failIfBecameCriminal &&
      other.minStanding == minStanding &&
      other.maxStanding == maxStanding &&
      other.missionTokens == missionTokens &&
      other.deadline == deadline &&
      other.brokerReputationPrerequisites == brokerReputationPrerequisites &&
      other.itemCounts == itemCounts &&
      other.entitySpawns == entitySpawns &&
      other.hiddenInMobiglas == hiddenInMobiglas &&
      other.notifyOnAvailable == notifyOnAvailable &&
      other.rewardScope == rewardScope &&
      other.reputationAmount == reputationAmount &&
      other.gameVersion == gameVersion &&
      other.starmapLocations == starmapLocations &&
      other.prerequisiteGroups == prerequisiteGroups &&
      other.unlockGroups == unlockGroups &&
      other.mergedLocations == mergedLocations &&
      other.hasRewards == hasRewards &&
      other.hasCombatSection == hasCombatSection &&
      other.hasLocations == hasLocations &&
      other.hasChain == hasChain &&
      other.hasBlueprints == hasBlueprints &&
      other.released == released &&
      other.link == link;

    @override
    int get hashCode =>
        uuid.hashCode +
        (title == null ? 0 : title.hashCode) +
        (description == null ? 0 : description.hashCode) +
        (descriptionHtml == null ? 0 : descriptionHtml.hashCode) +
        (descriptionVariants == null ? 0 : descriptionVariants.hashCode) +
        (missionType == null ? 0 : missionType.hashCode) +
        (missionGiver == null ? 0 : missionGiver.hashCode) +
        (faction == null ? 0 : faction.hashCode) +
        (rankIndex == null ? 0 : rankIndex.hashCode) +
        illegal.hashCode +
        legalityLabel.hashCode +
        shareable.hashCode +
        onceOnly.hashCode +
        availableInPrison.hashCode +
        notForRelease.hashCode +
        workInProgress.hashCode +
        (hasCombat == null ? 0 : hasCombat.hashCode) +
        (hasDefendObjective == null ? 0 : hasDefendObjective.hashCode) +
        (enemyCountMin == null ? 0 : enemyCountMin.hashCode) +
        (enemyCountMax == null ? 0 : enemyCountMax.hashCode) +
        (minCrimeStat == null ? 0 : minCrimeStat.hashCode) +
        (maxCrimeStat == null ? 0 : maxCrimeStat.hashCode) +
        (rewardMin == null ? 0 : rewardMin.hashCode) +
        (rewardMax == null ? 0 : rewardMax.hashCode) +
        (rewardCurrency == null ? 0 : rewardCurrency.hashCode) +
        (timeToCompleteMinutes == null ? 0 : timeToCompleteMinutes.hashCode) +
        (starSystems == null ? 0 : starSystems.hashCode) +
        (cooldown == null ? 0 : cooldown.hashCode) +
        (lifetime == null ? 0 : lifetime.hashCode) +
        (reacceptAfterFailing == null ? 0 : reacceptAfterFailing.hashCode) +
        (reacceptAfterAbandoning == null ? 0 : reacceptAfterAbandoning.hashCode) +
        (blueprints == null ? 0 : blueprints.hashCode) +
        (rewardItems == null ? 0 : rewardItems.hashCode) +
        (combat == null ? 0 : combat.hashCode) +
        (completionTags == null ? 0 : completionTags.hashCode) +
        (reputationGained == null ? 0 : reputationGained.hashCode) +
        (reputationLost == null ? 0 : reputationLost.hashCode) +
        (haulingOrders == null ? 0 : haulingOrders.hashCode) +
        (cost == null ? 0 : cost.hashCode) +
        (maxPlayersPerInstance == null ? 0 : maxPlayersPerInstance.hashCode) +
        (failIfBecameCriminal == null ? 0 : failIfBecameCriminal.hashCode) +
        (minStanding == null ? 0 : minStanding.hashCode) +
        (maxStanding == null ? 0 : maxStanding.hashCode) +
        (missionTokens == null ? 0 : missionTokens.hashCode) +
        (deadline == null ? 0 : deadline.hashCode) +
        (brokerReputationPrerequisites == null ? 0 : brokerReputationPrerequisites.hashCode) +
        (itemCounts == null ? 0 : itemCounts.hashCode) +
        (entitySpawns == null ? 0 : entitySpawns.hashCode) +
        (hiddenInMobiglas == null ? 0 : hiddenInMobiglas.hashCode) +
        (notifyOnAvailable == null ? 0 : notifyOnAvailable.hashCode) +
        (rewardScope == null ? 0 : rewardScope.hashCode) +
        (reputationAmount == null ? 0 : reputationAmount.hashCode) +
        (gameVersion == null ? 0 : gameVersion.hashCode) +
        (starmapLocations == null ? 0 : starmapLocations.hashCode) +
        (prerequisiteGroups == null ? 0 : prerequisiteGroups.hashCode) +
        (unlockGroups == null ? 0 : unlockGroups.hashCode) +
        (mergedLocations == null ? 0 : mergedLocations.hashCode) +
        hasRewards.hashCode +
        hasCombatSection.hashCode +
        hasLocations.hashCode +
        hasChain.hashCode +
        hasBlueprints.hashCode +
        released.hashCode +
        link.hashCode;

  factory Mission.fromJson(Map<String, dynamic> json) => _$MissionFromJson(json);

  Map<String, dynamic> toJson() => _$MissionToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

