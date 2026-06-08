//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'mission_completion_tag_mission.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MissionCompletionTagMission {
  /// Returns a new [MissionCompletionTagMission] instance.
  MissionCompletionTagMission({

     this.uuid,

     this.title,

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
    bool operator ==(Object other) => identical(this, other) || other is MissionCompletionTagMission &&
      other.uuid == uuid &&
      other.title == title &&
      other.link == link &&
      other.webUrl == webUrl;

    @override
    int get hashCode =>
        uuid.hashCode +
        (title == null ? 0 : title.hashCode) +
        (link == null ? 0 : link.hashCode) +
        (webUrl == null ? 0 : webUrl.hashCode);

  factory MissionCompletionTagMission.fromJson(Map<String, dynamic> json) => _$MissionCompletionTagMissionFromJson(json);

  Map<String, dynamic> toJson() => _$MissionCompletionTagMissionToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

