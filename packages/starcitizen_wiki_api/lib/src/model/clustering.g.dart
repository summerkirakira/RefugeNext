// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clustering.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Clustering _$ClusteringFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Clustering',
  json,
  ($checkedConvert) {
    final val = Clustering(
      key: $checkedConvert('key', (v) => v as String?),
      minSize: $checkedConvert('min_size', (v) => v as num?),
      maxSize: $checkedConvert('max_size', (v) => v as num?),
      minProximity: $checkedConvert('min_proximity', (v) => v as num?),
      maxProximity: $checkedConvert('max_proximity', (v) => v as num?),
      probability: $checkedConvert('probability', (v) => v as num?),
      probabilityPercent: $checkedConvert(
        'probability_percent',
        (v) => v as num?,
      ),
      params: $checkedConvert(
        'params',
        (v) => (v as List<dynamic>?)
            ?.map((e) => ClusteringParam.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'minSize': 'min_size',
    'maxSize': 'max_size',
    'minProximity': 'min_proximity',
    'maxProximity': 'max_proximity',
    'probabilityPercent': 'probability_percent',
  },
);

Map<String, dynamic> _$ClusteringToJson(Clustering instance) =>
    <String, dynamic>{
      'key': ?instance.key,
      'min_size': ?instance.minSize,
      'max_size': ?instance.maxSize,
      'min_proximity': ?instance.minProximity,
      'max_proximity': ?instance.maxProximity,
      'probability': ?instance.probability,
      'probability_percent': ?instance.probabilityPercent,
      'params': ?instance.params?.map((e) => e.toJson()).toList(),
    };
