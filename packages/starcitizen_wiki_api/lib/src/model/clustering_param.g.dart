// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clustering_param.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClusteringParam _$ClusteringParamFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ClusteringParam',
      json,
      ($checkedConvert) {
        final val = ClusteringParam(
          minSize: $checkedConvert('min_size', (v) => v as num?),
          maxSize: $checkedConvert('max_size', (v) => v as num?),
          minProximity: $checkedConvert('min_proximity', (v) => v as num?),
          maxProximity: $checkedConvert('max_proximity', (v) => v as num?),
          relativeProbability: $checkedConvert(
            'relative_probability',
            (v) => v as num?,
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'minSize': 'min_size',
        'maxSize': 'max_size',
        'minProximity': 'min_proximity',
        'maxProximity': 'max_proximity',
        'relativeProbability': 'relative_probability',
      },
    );

Map<String, dynamic> _$ClusteringParamToJson(ClusteringParam instance) =>
    <String, dynamic>{
      'min_size': ?instance.minSize,
      'max_size': ?instance.maxSize,
      'min_proximity': ?instance.minProximity,
      'max_proximity': ?instance.maxProximity,
      'relative_probability': ?instance.relativeProbability,
    };
