// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mission_deadline.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MissionDeadline _$MissionDeadlineFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'MissionDeadline',
      json,
      ($checkedConvert) {
        final val = MissionDeadline(
          autoEnd: $checkedConvert('auto_end', (v) => v as bool?),
          endReason: $checkedConvert('end_reason', (v) => v as String?),
          completionTimeMinutes: $checkedConvert(
            'completion_time_minutes',
            (v) => (v as num?)?.toInt(),
          ),
          resultAfterTimer: $checkedConvert(
            'result_after_timer',
            (v) => v as String?,
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'autoEnd': 'auto_end',
        'endReason': 'end_reason',
        'completionTimeMinutes': 'completion_time_minutes',
        'resultAfterTimer': 'result_after_timer',
      },
    );

Map<String, dynamic> _$MissionDeadlineToJson(MissionDeadline instance) =>
    <String, dynamic>{
      'auto_end': ?instance.autoEnd,
      'end_reason': ?instance.endReason,
      'completion_time_minutes': ?instance.completionTimeMinutes,
      'result_after_timer': ?instance.resultAfterTimer,
    };
