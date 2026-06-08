//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'blueprint_unlocking_mission.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class BlueprintUnlockingMission {
  /// Returns a new [BlueprintUnlockingMission] instance.
  BlueprintUnlockingMission({

     this.title,

     this.debugName,

     this.rewardScope,

     this.chance,

     this.webUrl,
  });

      /// Formatted mission title
  @JsonKey(
    
    name: r'title',
    required: false,
    includeIfNull: false,
  )


  final String? title;



      /// Internal debug name of the mission
  @JsonKey(
    
    name: r'debug_name',
    required: false,
    includeIfNull: false,
  )


  final String? debugName;



      /// Scope of the blueprint reward
  @JsonKey(
    
    name: r'reward_scope',
    required: false,
    includeIfNull: false,
  )


  final String? rewardScope;



      /// Drop chance as a decimal (e.g. 0.5 for 50%)
  @JsonKey(
    
    name: r'chance',
    required: false,
    includeIfNull: false,
  )


  final double? chance;



      /// Web URL for the mission detail page
  @JsonKey(
    
    name: r'web_url',
    required: false,
    includeIfNull: false,
  )


  final String? webUrl;





    @override
    bool operator ==(Object other) => identical(this, other) || other is BlueprintUnlockingMission &&
      other.title == title &&
      other.debugName == debugName &&
      other.rewardScope == rewardScope &&
      other.chance == chance &&
      other.webUrl == webUrl;

    @override
    int get hashCode =>
        (title == null ? 0 : title.hashCode) +
        (debugName == null ? 0 : debugName.hashCode) +
        (rewardScope == null ? 0 : rewardScope.hashCode) +
        (chance == null ? 0 : chance.hashCode) +
        (webUrl == null ? 0 : webUrl.hashCode);

  factory BlueprintUnlockingMission.fromJson(Map<String, dynamic> json) => _$BlueprintUnlockingMissionFromJson(json);

  Map<String, dynamic> toJson() => _$BlueprintUnlockingMissionToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

