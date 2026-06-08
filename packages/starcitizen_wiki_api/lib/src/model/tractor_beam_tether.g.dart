// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tractor_beam_tether.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TractorBeamTether _$TractorBeamTetherFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TractorBeamTether',
      json,
      ($checkedConvert) {
        final val = TractorBeamTether(
          tetherBreakTime: $checkedConvert(
            'tether_break_time',
            (v) => (v as num?)?.toDouble(),
          ),
          safeRangeValueFactor: $checkedConvert(
            'safe_range_value_factor',
            (v) => (v as num?)?.toDouble(),
          ),
          allowScrollingIntoBreakingRange: $checkedConvert(
            'allow_scrolling_into_breaking_range',
            (v) => v as bool?,
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'tetherBreakTime': 'tether_break_time',
        'safeRangeValueFactor': 'safe_range_value_factor',
        'allowScrollingIntoBreakingRange':
            'allow_scrolling_into_breaking_range',
      },
    );

Map<String, dynamic> _$TractorBeamTetherToJson(TractorBeamTether instance) =>
    <String, dynamic>{
      'tether_break_time': ?instance.tetherBreakTime,
      'safe_range_value_factor': ?instance.safeRangeValueFactor,
      'allow_scrolling_into_breaking_range':
          ?instance.allowScrollingIntoBreakingRange,
    };
