// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mining_laser.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MiningLaser _$MiningLaserFromJson(Map<String, dynamic> json) => $checkedCreate(
  'MiningLaser',
  json,
  ($checkedConvert) {
    final val = MiningLaser(
      laserPower: $checkedConvert(
        'laser_power',
        (v) => v == null
            ? null
            : MiningLaserPowerBand.fromJson(v as Map<String, dynamic>),
      ),
      modifiers: $checkedConvert(
        'modifiers',
        (v) => (v as List<dynamic>?)
            ?.map(
              (e) => MiningLaserModifier.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
      moduleSlots: $checkedConvert('module_slots', (v) => (v as num?)?.toInt()),
      throttleLerpSpeed: $checkedConvert(
        'throttle_lerp_speed',
        (v) => (v as num?)?.toDouble(),
      ),
      throttleMinimum: $checkedConvert(
        'throttle_minimum',
        (v) => (v as num?)?.toDouble(),
      ),
      powerTransfer: $checkedConvert(
        'power_transfer',
        (v) => (v as num?)?.toDouble(),
      ),
      miningLaserPower: $checkedConvert(
        'mining_laser_power',
        (v) => v as String?,
      ),
      modifierMap: $checkedConvert(
        'modifier_map',
        (v) =>
            (v as Map<String, dynamic>?)?.map((k, e) => MapEntry(k, e as num)),
      ),
      extractionLaserPower: $checkedConvert(
        'extraction_laser_power',
        (v) => v as String?,
      ),
      optimalRange: $checkedConvert(
        'optimal_range',
        (v) => (v as num?)?.toDouble(),
      ),
      maximumRange: $checkedConvert(
        'maximum_range',
        (v) => (v as num?)?.toDouble(),
      ),
      extractionThroughput: $checkedConvert(
        'extraction_throughput',
        (v) => (v as num?)?.toDouble(),
      ),
      collectionPointRadius: $checkedConvert(
        'collection_point_radius',
        (v) => (v as num?)?.toDouble(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'laserPower': 'laser_power',
    'moduleSlots': 'module_slots',
    'throttleLerpSpeed': 'throttle_lerp_speed',
    'throttleMinimum': 'throttle_minimum',
    'powerTransfer': 'power_transfer',
    'miningLaserPower': 'mining_laser_power',
    'modifierMap': 'modifier_map',
    'extractionLaserPower': 'extraction_laser_power',
    'optimalRange': 'optimal_range',
    'maximumRange': 'maximum_range',
    'extractionThroughput': 'extraction_throughput',
    'collectionPointRadius': 'collection_point_radius',
  },
);

Map<String, dynamic> _$MiningLaserToJson(MiningLaser instance) =>
    <String, dynamic>{
      'laser_power': ?instance.laserPower?.toJson(),
      'modifiers': ?instance.modifiers?.map((e) => e.toJson()).toList(),
      'module_slots': ?instance.moduleSlots,
      'throttle_lerp_speed': ?instance.throttleLerpSpeed,
      'throttle_minimum': ?instance.throttleMinimum,
      'power_transfer': ?instance.powerTransfer,
      'mining_laser_power': ?instance.miningLaserPower,
      'modifier_map': ?instance.modifierMap,
      'extraction_laser_power': ?instance.extractionLaserPower,
      'optimal_range': ?instance.optimalRange,
      'maximum_range': ?instance.maximumRange,
      'extraction_throughput': ?instance.extractionThroughput,
      'collection_point_radius': ?instance.collectionPointRadius,
    };
