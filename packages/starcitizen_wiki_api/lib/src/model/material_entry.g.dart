// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MaterialEntry _$MaterialEntryFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'MaterialEntry',
  json,
  ($checkedConvert) {
    final val = MaterialEntry(
      key: $checkedConvert('key', (v) => v as String?),
      name: $checkedConvert('name', (v) => v as String?),
      uuid: $checkedConvert('uuid', (v) => v as String?),
      isCurrent: $checkedConvert('is_current', (v) => v as bool?),
      qualityMin: $checkedConvert('quality_min', (v) => (v as num?)?.toInt()),
      qualityMax: $checkedConvert('quality_max', (v) => (v as num?)?.toInt()),
      qualityMean: $checkedConvert('quality_mean', (v) => (v as num?)?.toInt()),
      qualityStddev: $checkedConvert(
        'quality_stddev',
        (v) => (v as num?)?.toInt(),
      ),
      minPercentage: $checkedConvert('min_percentage', (v) => v as num?),
      maxPercentage: $checkedConvert('max_percentage', (v) => v as num?),
      instability: $checkedConvert('instability', (v) => v as num?),
      resistance: $checkedConvert('resistance', (v) => v as num?),
      groupProbability: $checkedConvert('group_probability', (v) => v as num?),
      groupProbabilityPercent: $checkedConvert(
        'group_probability_percent',
        (v) => v as num?,
      ),
      relativeProbability: $checkedConvert(
        'relative_probability',
        (v) => v as num?,
      ),
      relativeProbabilityPercent: $checkedConvert(
        'relative_probability_percent',
        (v) => v as num?,
      ),
      qualityQuantizedValues: $checkedConvert(
        'quality_quantized_values',
        (v) => (v as List<dynamic>?)?.map((e) => (e as num).toInt()).toList(),
      ),
      qualityQuantization: $checkedConvert(
        'quality_quantization',
        (v) => (v as List<dynamic>?)?.map((e) => (e as num).toInt()).toList(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'isCurrent': 'is_current',
    'qualityMin': 'quality_min',
    'qualityMax': 'quality_max',
    'qualityMean': 'quality_mean',
    'qualityStddev': 'quality_stddev',
    'minPercentage': 'min_percentage',
    'maxPercentage': 'max_percentage',
    'groupProbability': 'group_probability',
    'groupProbabilityPercent': 'group_probability_percent',
    'relativeProbability': 'relative_probability',
    'relativeProbabilityPercent': 'relative_probability_percent',
    'qualityQuantizedValues': 'quality_quantized_values',
    'qualityQuantization': 'quality_quantization',
  },
);

Map<String, dynamic> _$MaterialEntryToJson(MaterialEntry instance) =>
    <String, dynamic>{
      'key': ?instance.key,
      'name': ?instance.name,
      'uuid': ?instance.uuid,
      'is_current': ?instance.isCurrent,
      'quality_min': ?instance.qualityMin,
      'quality_max': ?instance.qualityMax,
      'quality_mean': ?instance.qualityMean,
      'quality_stddev': ?instance.qualityStddev,
      'min_percentage': ?instance.minPercentage,
      'max_percentage': ?instance.maxPercentage,
      'instability': ?instance.instability,
      'resistance': ?instance.resistance,
      'group_probability': ?instance.groupProbability,
      'group_probability_percent': ?instance.groupProbabilityPercent,
      'relative_probability': ?instance.relativeProbability,
      'relative_probability_percent': ?instance.relativeProbabilityPercent,
      'quality_quantized_values': ?instance.qualityQuantizedValues,
      'quality_quantization': ?instance.qualityQuantization,
    };
