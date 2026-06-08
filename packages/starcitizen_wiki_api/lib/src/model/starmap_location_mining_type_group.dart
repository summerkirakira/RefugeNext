//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/starmap_location_resource.dart';
import 'package:json_annotation/json_annotation.dart';

part 'starmap_location_mining_type_group.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class StarmapLocationMiningTypeGroup {
  /// Returns a new [StarmapLocationMiningTypeGroup] instance.
  StarmapLocationMiningTypeGroup({

     this.groupName,

     this.miningType,

     this.miningTypeSortOrder,

     this.resourceKind,

     this.groupProbabilityMin,

     this.groupProbabilityMax,

     this.groupProbabilityMinPercent,

     this.groupProbabilityMaxPercent,

     this.resources,
  });

      /// Original group name from game data identifying the deposit group.
  @JsonKey(
    
    name: r'group_name',
    required: false,
    includeIfNull: false,
  )


  final String? groupName;



      /// Extraction method label (e.g. Mining, Hand Mining, Salvage).
  @JsonKey(
    
    name: r'mining_type',
    required: false,
    includeIfNull: false,
  )


  final String? miningType;



      /// Sort order for mining type display ordering.
  @JsonKey(
    
    name: r'mining_type_sort_order',
    required: false,
    includeIfNull: false,
  )


  final int? miningTypeSortOrder;



      /// Kind of resource (Mineable or Harvestable).
  @JsonKey(
    
    name: r'resource_kind',
    required: false,
    includeIfNull: false,
  )


  final String? resourceKind;



      /// Lowest raw probability among deposits in this group (0-1).
  @JsonKey(
    
    name: r'group_probability_min',
    required: false,
    includeIfNull: false,
  )


  final num? groupProbabilityMin;



      /// Highest raw probability among deposits in this group (0-1).
  @JsonKey(
    
    name: r'group_probability_max',
    required: false,
    includeIfNull: false,
  )


  final num? groupProbabilityMax;



      /// Lowest probability in this group as a percentage (0-100).
  @JsonKey(
    
    name: r'group_probability_min_percent',
    required: false,
    includeIfNull: false,
  )


  final num? groupProbabilityMinPercent;



      /// Highest probability in this group as a percentage (0-100).
  @JsonKey(
    
    name: r'group_probability_max_percent',
    required: false,
    includeIfNull: false,
  )


  final num? groupProbabilityMaxPercent;



      /// Individual resource deposits within this group.
  @JsonKey(
    
    name: r'resources',
    required: false,
    includeIfNull: false,
  )


  final List<StarmapLocationResource>? resources;





    @override
    bool operator ==(Object other) => identical(this, other) || other is StarmapLocationMiningTypeGroup &&
      other.groupName == groupName &&
      other.miningType == miningType &&
      other.miningTypeSortOrder == miningTypeSortOrder &&
      other.resourceKind == resourceKind &&
      other.groupProbabilityMin == groupProbabilityMin &&
      other.groupProbabilityMax == groupProbabilityMax &&
      other.groupProbabilityMinPercent == groupProbabilityMinPercent &&
      other.groupProbabilityMaxPercent == groupProbabilityMaxPercent &&
      other.resources == resources;

    @override
    int get hashCode =>
        groupName.hashCode +
        miningType.hashCode +
        miningTypeSortOrder.hashCode +
        (resourceKind == null ? 0 : resourceKind.hashCode) +
        (groupProbabilityMin == null ? 0 : groupProbabilityMin.hashCode) +
        (groupProbabilityMax == null ? 0 : groupProbabilityMax.hashCode) +
        (groupProbabilityMinPercent == null ? 0 : groupProbabilityMinPercent.hashCode) +
        (groupProbabilityMaxPercent == null ? 0 : groupProbabilityMaxPercent.hashCode) +
        resources.hashCode;

  factory StarmapLocationMiningTypeGroup.fromJson(Map<String, dynamic> json) => _$StarmapLocationMiningTypeGroupFromJson(json);

  Map<String, dynamic> toJson() => _$StarmapLocationMiningTypeGroupToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

