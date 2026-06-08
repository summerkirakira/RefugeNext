//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/mission_chain_link.dart';
import 'package:starcitizen_wiki_api/src/model/mission_prerequisite_group_required_tags_inner.dart';
import 'package:json_annotation/json_annotation.dart';

part 'mission_prerequisite_group.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MissionPrerequisiteGroup {
  /// Returns a new [MissionPrerequisiteGroup] instance.
  MissionPrerequisiteGroup({

     this.requiredCount,

     this.requiredTags,

     this.excludedTags,

     this.missions,
  });

  @JsonKey(
    
    name: r'required_count',
    required: false,
    includeIfNull: false,
  )


  final int? requiredCount;



  @JsonKey(
    
    name: r'required_tags',
    required: false,
    includeIfNull: false,
  )


  final List<MissionPrerequisiteGroupRequiredTagsInner>? requiredTags;



  @JsonKey(
    
    name: r'excluded_tags',
    required: false,
    includeIfNull: false,
  )


  final List<MissionPrerequisiteGroupRequiredTagsInner>? excludedTags;



  @JsonKey(
    
    name: r'missions',
    required: false,
    includeIfNull: false,
  )


  final List<MissionChainLink>? missions;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MissionPrerequisiteGroup &&
      other.requiredCount == requiredCount &&
      other.requiredTags == requiredTags &&
      other.excludedTags == excludedTags &&
      other.missions == missions;

    @override
    int get hashCode =>
        (requiredCount == null ? 0 : requiredCount.hashCode) +
        requiredTags.hashCode +
        excludedTags.hashCode +
        missions.hashCode;

  factory MissionPrerequisiteGroup.fromJson(Map<String, dynamic> json) => _$MissionPrerequisiteGroupFromJson(json);

  Map<String, dynamic> toJson() => _$MissionPrerequisiteGroupToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

