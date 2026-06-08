// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mining_laser_power_band.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MiningLaserPowerBand _$MiningLaserPowerBandFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('MiningLaserPowerBand', json, ($checkedConvert) {
  final val = MiningLaserPowerBand(
    min: $checkedConvert('min', (v) => (v as num?)?.toDouble()),
    max: $checkedConvert('max', (v) => (v as num?)?.toDouble()),
    minimum: $checkedConvert('minimum', (v) => (v as num?)?.toDouble()),
    maximum: $checkedConvert('maximum', (v) => (v as num?)?.toDouble()),
  );
  return val;
});

Map<String, dynamic> _$MiningLaserPowerBandToJson(
  MiningLaserPowerBand instance,
) => <String, dynamic>{
  'min': ?instance.min,
  'max': ?instance.max,
  'minimum': ?instance.minimum,
  'maximum': ?instance.maximum,
};
