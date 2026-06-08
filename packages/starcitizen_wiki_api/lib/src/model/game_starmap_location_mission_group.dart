//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/mission_summary.dart';
import 'package:json_annotation/json_annotation.dart';

part 'game_starmap_location_mission_group.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GameStarmapLocationMissionGroup {
  /// Returns a new [GameStarmapLocationMissionGroup] instance.
  GameStarmapLocationMissionGroup({

     this.purpose,

     this.missions,
  });

      /// Mission purpose category (e.g. Mission, Patrol, Investigation).
  @JsonKey(
    
    name: r'purpose',
    required: false,
    includeIfNull: false,
  )


  final String? purpose;



      /// List of mission summaries in this group.
  @JsonKey(
    
    name: r'missions',
    required: false,
    includeIfNull: false,
  )


  final List<MissionSummary>? missions;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GameStarmapLocationMissionGroup &&
      other.purpose == purpose &&
      other.missions == missions;

    @override
    int get hashCode =>
        (purpose == null ? 0 : purpose.hashCode) +
        missions.hashCode;

  factory GameStarmapLocationMissionGroup.fromJson(Map<String, dynamic> json) => _$GameStarmapLocationMissionGroupFromJson(json);

  Map<String, dynamic> toJson() => _$GameStarmapLocationMissionGroupToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

