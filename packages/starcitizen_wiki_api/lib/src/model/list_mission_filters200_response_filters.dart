//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/filter_value.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_mission_filters200_response_filters.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ListMissionFilters200ResponseFilters {
  /// Returns a new [ListMissionFilters200ResponseFilters] instance.
  ListMissionFilters200ResponseFilters({

     this.missionGiver,

     this.starSystem,

     this.faction,

     this.hasCombat,

     this.hasDefendObjective,

     this.rankIndex,

     this.illegal,

     this.shareable,

     this.hasPrerequisites,

     this.rewardScope,

     this.hasBlueprints,

     this.reputationScope,

     this.blueprintName,
  });

  @JsonKey(
    
    name: r'mission_giver',
    required: false,
    includeIfNull: false,
  )


  final List<FilterValue>? missionGiver;



  @JsonKey(
    
    name: r'star_system',
    required: false,
    includeIfNull: false,
  )


  final List<FilterValue>? starSystem;



  @JsonKey(
    
    name: r'faction',
    required: false,
    includeIfNull: false,
  )


  final List<FilterValue>? faction;



  @JsonKey(
    
    name: r'has_combat',
    required: false,
    includeIfNull: false,
  )


  final List<FilterValue>? hasCombat;



  @JsonKey(
    
    name: r'has_defend_objective',
    required: false,
    includeIfNull: false,
  )


  final List<FilterValue>? hasDefendObjective;



  @JsonKey(
    
    name: r'rank_index',
    required: false,
    includeIfNull: false,
  )


  final List<FilterValue>? rankIndex;



  @JsonKey(
    
    name: r'illegal',
    required: false,
    includeIfNull: false,
  )


  final List<FilterValue>? illegal;



  @JsonKey(
    
    name: r'shareable',
    required: false,
    includeIfNull: false,
  )


  final List<FilterValue>? shareable;



  @JsonKey(
    
    name: r'has_prerequisites',
    required: false,
    includeIfNull: false,
  )


  final List<FilterValue>? hasPrerequisites;



  @JsonKey(
    
    name: r'reward_scope',
    required: false,
    includeIfNull: false,
  )


  final List<FilterValue>? rewardScope;



  @JsonKey(
    
    name: r'has_blueprints',
    required: false,
    includeIfNull: false,
  )


  final List<FilterValue>? hasBlueprints;



  @JsonKey(
    
    name: r'reputation_scope',
    required: false,
    includeIfNull: false,
  )


  final List<FilterValue>? reputationScope;



  @JsonKey(
    
    name: r'blueprint_name',
    required: false,
    includeIfNull: false,
  )


  final List<FilterValue>? blueprintName;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ListMissionFilters200ResponseFilters &&
      other.missionGiver == missionGiver &&
      other.starSystem == starSystem &&
      other.faction == faction &&
      other.hasCombat == hasCombat &&
      other.hasDefendObjective == hasDefendObjective &&
      other.rankIndex == rankIndex &&
      other.illegal == illegal &&
      other.shareable == shareable &&
      other.hasPrerequisites == hasPrerequisites &&
      other.rewardScope == rewardScope &&
      other.hasBlueprints == hasBlueprints &&
      other.reputationScope == reputationScope &&
      other.blueprintName == blueprintName;

    @override
    int get hashCode =>
        missionGiver.hashCode +
        starSystem.hashCode +
        faction.hashCode +
        hasCombat.hashCode +
        hasDefendObjective.hashCode +
        rankIndex.hashCode +
        illegal.hashCode +
        shareable.hashCode +
        hasPrerequisites.hashCode +
        rewardScope.hashCode +
        hasBlueprints.hashCode +
        reputationScope.hashCode +
        blueprintName.hashCode;

  factory ListMissionFilters200ResponseFilters.fromJson(Map<String, dynamic> json) => _$ListMissionFilters200ResponseFiltersFromJson(json);

  Map<String, dynamic> toJson() => _$ListMissionFilters200ResponseFiltersToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

