// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource_network_delta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResourceNetworkDelta _$ResourceNetworkDeltaFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'ResourceNetworkDelta',
  json,
  ($checkedConvert) {
    final val = ResourceNetworkDelta(
      type: $checkedConvert('type', (v) => v as String?),
      resource: $checkedConvert('resource', (v) => v as String?),
      rate: $checkedConvert('rate', (v) => (v as num?)?.toDouble()),
      minimumFraction: $checkedConvert(
        'minimum_fraction',
        (v) => (v as num?)?.toDouble(),
      ),
      generatedResource: $checkedConvert(
        'generated_resource',
        (v) => v as String?,
      ),
      generatedRate: $checkedConvert(
        'generated_rate',
        (v) => (v as num?)?.toDouble(),
      ),
      discharge: $checkedConvert('discharge', (v) => (v as num?)?.toDouble()),
      noOverGeneration: $checkedConvert(
        'no_over_generation',
        (v) => (v as num?)?.toDouble(),
      ),
      binaryEvaluation: $checkedConvert(
        'binary_evaluation',
        (v) => (v as num?)?.toDouble(),
      ),
      composition: $checkedConvert(
        'composition',
        (v) => (v as List<dynamic>?)
            ?.map(
              (e) => ResourceNetworkDeltaCompositionInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'minimumFraction': 'minimum_fraction',
    'generatedResource': 'generated_resource',
    'generatedRate': 'generated_rate',
    'noOverGeneration': 'no_over_generation',
    'binaryEvaluation': 'binary_evaluation',
  },
);

Map<String, dynamic> _$ResourceNetworkDeltaToJson(
  ResourceNetworkDelta instance,
) => <String, dynamic>{
  'type': ?instance.type,
  'resource': ?instance.resource,
  'rate': ?instance.rate,
  'minimum_fraction': ?instance.minimumFraction,
  'generated_resource': ?instance.generatedResource,
  'generated_rate': ?instance.generatedRate,
  'discharge': ?instance.discharge,
  'no_over_generation': ?instance.noOverGeneration,
  'binary_evaluation': ?instance.binaryEvaluation,
  'composition': ?instance.composition?.map((e) => e.toJson()).toList(),
};
