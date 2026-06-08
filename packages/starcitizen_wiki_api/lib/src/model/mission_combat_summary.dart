//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/mission_combat_summary_by_group_inner.dart';
import 'package:starcitizen_wiki_api/src/model/mission_combat_summary_total.dart';
import 'package:json_annotation/json_annotation.dart';

part 'mission_combat_summary.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MissionCombatSummary {
  /// Returns a new [MissionCombatSummary] instance.
  MissionCombatSummary({

     this.total,

     this.byGroup,
  });

  @JsonKey(
    
    name: r'total',
    required: false,
    includeIfNull: false,
  )


  final MissionCombatSummaryTotal? total;



  @JsonKey(
    
    name: r'by_group',
    required: false,
    includeIfNull: false,
  )


  final List<MissionCombatSummaryByGroupInner>? byGroup;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MissionCombatSummary &&
      other.total == total &&
      other.byGroup == byGroup;

    @override
    int get hashCode =>
        total.hashCode +
        byGroup.hashCode;

  factory MissionCombatSummary.fromJson(Map<String, dynamic> json) => _$MissionCombatSummaryFromJson(json);

  Map<String, dynamic> toJson() => _$MissionCombatSummaryToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

