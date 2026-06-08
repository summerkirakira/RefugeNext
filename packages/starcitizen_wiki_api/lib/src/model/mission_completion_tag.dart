//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/mission_completion_tag_mission.dart';
import 'package:json_annotation/json_annotation.dart';

part 'mission_completion_tag.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MissionCompletionTag {
  /// Returns a new [MissionCompletionTag] instance.
  MissionCompletionTag({

     this.name,

     this.unlocksMissions,
  });

  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



  @JsonKey(
    
    name: r'unlocks_missions',
    required: false,
    includeIfNull: false,
  )


  final List<MissionCompletionTagMission>? unlocksMissions;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MissionCompletionTag &&
      other.name == name &&
      other.unlocksMissions == unlocksMissions;

    @override
    int get hashCode =>
        (name == null ? 0 : name.hashCode) +
        unlocksMissions.hashCode;

  factory MissionCompletionTag.fromJson(Map<String, dynamic> json) => _$MissionCompletionTagFromJson(json);

  Map<String, dynamic> toJson() => _$MissionCompletionTagToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

