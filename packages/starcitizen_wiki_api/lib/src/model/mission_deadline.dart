//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'mission_deadline.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MissionDeadline {
  /// Returns a new [MissionDeadline] instance.
  MissionDeadline({

     this.autoEnd,

     this.endReason,

     this.completionTimeMinutes,

     this.resultAfterTimer,
  });

  @JsonKey(
    
    name: r'auto_end',
    required: false,
    includeIfNull: false,
  )


  final bool? autoEnd;



  @JsonKey(
    
    name: r'end_reason',
    required: false,
    includeIfNull: false,
  )


  final String? endReason;



  @JsonKey(
    
    name: r'completion_time_minutes',
    required: false,
    includeIfNull: false,
  )


  final int? completionTimeMinutes;



  @JsonKey(
    
    name: r'result_after_timer',
    required: false,
    includeIfNull: false,
  )


  final String? resultAfterTimer;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MissionDeadline &&
      other.autoEnd == autoEnd &&
      other.endReason == endReason &&
      other.completionTimeMinutes == completionTimeMinutes &&
      other.resultAfterTimer == resultAfterTimer;

    @override
    int get hashCode =>
        (autoEnd == null ? 0 : autoEnd.hashCode) +
        (endReason == null ? 0 : endReason.hashCode) +
        (completionTimeMinutes == null ? 0 : completionTimeMinutes.hashCode) +
        (resultAfterTimer == null ? 0 : resultAfterTimer.hashCode);

  factory MissionDeadline.fromJson(Map<String, dynamic> json) => _$MissionDeadlineFromJson(json);

  Map<String, dynamic> toJson() => _$MissionDeadlineToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

