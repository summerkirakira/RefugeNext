// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_emission.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemEmission _$ItemEmissionFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ItemEmission',
      json,
      ($checkedConvert) {
        final val = ItemEmission(
          ir: $checkedConvert('ir', (v) => (v as num?)?.toDouble()),
          emMin: $checkedConvert('em_min', (v) => (v as num?)?.toDouble()),
          emMax: $checkedConvert('em_max', (v) => (v as num?)?.toDouble()),
          emDecay: $checkedConvert('em_decay', (v) => (v as num?)?.toDouble()),
          emPerSegment: $checkedConvert(
            'em_per_segment',
            (v) => (v as num?)?.toDouble(),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'emMin': 'em_min',
        'emMax': 'em_max',
        'emDecay': 'em_decay',
        'emPerSegment': 'em_per_segment',
      },
    );

Map<String, dynamic> _$ItemEmissionToJson(ItemEmission instance) =>
    <String, dynamic>{
      'ir': ?instance.ir,
      'em_min': ?instance.emMin,
      'em_max': ?instance.emMax,
      'em_decay': ?instance.emDecay,
      'em_per_segment': ?instance.emPerSegment,
    };
