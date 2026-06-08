// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'radar_sensitivity_block.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RadarSensitivityBlock _$RadarSensitivityBlockFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('RadarSensitivityBlock', json, ($checkedConvert) {
  final val = RadarSensitivityBlock(
    infrared: $checkedConvert('infrared', (v) => (v as num?)?.toDouble()),
    crossSection: $checkedConvert(
      'cross_section',
      (v) => (v as num?)?.toDouble(),
    ),
    electromagnetic: $checkedConvert(
      'electromagnetic',
      (v) => (v as num?)?.toDouble(),
    ),
    resource: $checkedConvert('resource', (v) => (v as num?)?.toDouble()),
    db: $checkedConvert('db', (v) => (v as num?)?.toDouble()),
  );
  return val;
}, fieldKeyMap: const {'crossSection': 'cross_section'});

Map<String, dynamic> _$RadarSensitivityBlockToJson(
  RadarSensitivityBlock instance,
) => <String, dynamic>{
  'infrared': ?instance.infrared,
  'cross_section': ?instance.crossSection,
  'electromagnetic': ?instance.electromagnetic,
  'resource': ?instance.resource,
  'db': ?instance.db,
};
