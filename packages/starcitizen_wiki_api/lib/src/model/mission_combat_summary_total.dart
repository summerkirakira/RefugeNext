//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'mission_combat_summary_total.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MissionCombatSummaryTotal {
  /// Returns a new [MissionCombatSummaryTotal] instance.
  MissionCombatSummaryTotal({

     this.min,

     this.max,
  });

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
    bool operator ==(Object other) => identical(this, other) || other is MissionCombatSummaryTotal &&
      other.min == min &&
      other.max == max;

    @override
    int get hashCode =>
        min.hashCode +
        max.hashCode;

  factory MissionCombatSummaryTotal.fromJson(Map<String, dynamic> json) => _$MissionCombatSummaryTotalFromJson(json);

  Map<String, dynamic> toJson() => _$MissionCombatSummaryTotalToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

