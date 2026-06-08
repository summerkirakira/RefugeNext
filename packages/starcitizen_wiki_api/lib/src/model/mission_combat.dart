//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/mission_combat_aggregated_spawns_inner.dart';
import 'package:starcitizen_wiki_api/src/model/mission_combat_summary.dart';
import 'package:starcitizen_wiki_api/src/model/mission_combat_spawns_inner.dart';
import 'package:json_annotation/json_annotation.dart';

part 'mission_combat.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MissionCombat {
  /// Returns a new [MissionCombat] instance.
  MissionCombat({

     this.summary,

     this.spawns,

     this.aggregatedSpawns,
  });

  @JsonKey(
    
    name: r'summary',
    required: false,
    includeIfNull: false,
  )


  final MissionCombatSummary? summary;



  @JsonKey(
    
    name: r'spawns',
    required: false,
    includeIfNull: false,
  )


  final List<MissionCombatSpawnsInner>? spawns;



      /// Spawns grouped by role, group_name, and spawn_kind with aggregated concurrent ranges
  @JsonKey(
    
    name: r'aggregated_spawns',
    required: false,
    includeIfNull: false,
  )


  final List<MissionCombatAggregatedSpawnsInner>? aggregatedSpawns;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MissionCombat &&
      other.summary == summary &&
      other.spawns == spawns &&
      other.aggregatedSpawns == aggregatedSpawns;

    @override
    int get hashCode =>
        summary.hashCode +
        spawns.hashCode +
        aggregatedSpawns.hashCode;

  factory MissionCombat.fromJson(Map<String, dynamic> json) => _$MissionCombatFromJson(json);

  Map<String, dynamic> toJson() => _$MissionCombatToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

