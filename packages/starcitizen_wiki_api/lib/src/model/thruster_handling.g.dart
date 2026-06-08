// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thruster_handling.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ThrusterHandling _$ThrusterHandlingFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ThrusterHandling',
      json,
      ($checkedConvert) {
        final val = ThrusterHandling(
          strengthSmoothing: $checkedConvert(
            'strength_smoothing',
            (v) => (v as num?)?.toDouble(),
          ),
        );
        return val;
      },
      fieldKeyMap: const {'strengthSmoothing': 'strength_smoothing'},
    );

Map<String, dynamic> _$ThrusterHandlingToJson(ThrusterHandling instance) =>
    <String, dynamic>{'strength_smoothing': ?instance.strengthSmoothing};
