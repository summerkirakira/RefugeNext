//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'mission_combat_summary_by_group_inner.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MissionCombatSummaryByGroupInner {
  /// Returns a new [MissionCombatSummaryByGroupInner] instance.
  MissionCombatSummaryByGroupInner({

     this.groupName,

     this.min,

     this.max,
  });

  @JsonKey(
    
    name: r'group_name',
    required: false,
    includeIfNull: false,
  )


  final String? groupName;



  @JsonKey(
    
    name: r'min',
    required: false,
    includeIfNull: false,
  )


  final int? min;



  @JsonKey(
    
    name: r'max',
    required: false,
    includeIfNull: false,
  )


  final int? max;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MissionCombatSummaryByGroupInner &&
      other.groupName == groupName &&
      other.min == min &&
      other.max == max;

    @override
    int get hashCode =>
        groupName.hashCode +
        min.hashCode +
        max.hashCode;

  factory MissionCombatSummaryByGroupInner.fromJson(Map<String, dynamic> json) => _$MissionCombatSummaryByGroupInnerFromJson(json);

  Map<String, dynamic> toJson() => _$MissionCombatSummaryByGroupInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

