// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jump_drive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JumpDrive _$JumpDriveFromJson(Map<String, dynamic> json) => $checkedCreate(
  'JumpDrive',
  json,
  ($checkedConvert) {
    final val = JumpDrive(
      alignmentRate: $checkedConvert(
        'alignment_rate',
        (v) => (v as num?)?.toDouble(),
      ),
      alignmentDecayRate: $checkedConvert(
        'alignment_decay_rate',
        (v) => (v as num?)?.toDouble(),
      ),
      tuningRate: $checkedConvert(
        'tuning_rate',
        (v) => (v as num?)?.toDouble(),
      ),
      tuningDecayRate: $checkedConvert(
        'tuning_decay_rate',
        (v) => (v as num?)?.toDouble(),
      ),
      fuelUsageEfficiencyMultiplier: $checkedConvert(
        'fuel_usage_efficiency_multiplier',
        (v) => (v as num?)?.toDouble(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'alignmentRate': 'alignment_rate',
    'alignmentDecayRate': 'alignment_decay_rate',
    'tuningRate': 'tuning_rate',
    'tuningDecayRate': 'tuning_decay_rate',
    'fuelUsageEfficiencyMultiplier': 'fuel_usage_efficiency_multiplier',
  },
);

Map<String, dynamic> _$JumpDriveToJson(JumpDrive instance) => <String, dynamic>{
  'alignment_rate': ?instance.alignmentRate,
  'alignment_decay_rate': ?instance.alignmentDecayRate,
  'tuning_rate': ?instance.tuningRate,
  'tuning_decay_rate': ?instance.tuningDecayRate,
  'fuel_usage_efficiency_multiplier': ?instance.fuelUsageEfficiencyMultiplier,
};
