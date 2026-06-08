// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource_network_delta_composition_inner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResourceNetworkDeltaCompositionInner
_$ResourceNetworkDeltaCompositionInnerFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ResourceNetworkDeltaCompositionInner',
      json,
      ($checkedConvert) {
        final val = ResourceNetworkDeltaCompositionInner(
          containerResource: $checkedConvert(
            'container_resource',
            (v) => v as String?,
          ),
          ratio: $checkedConvert('ratio', (v) => (v as num?)?.toDouble()),
        );
        return val;
      },
      fieldKeyMap: const {'containerResource': 'container_resource'},
    );

Map<String, dynamic> _$ResourceNetworkDeltaCompositionInnerToJson(
  ResourceNetworkDeltaCompositionInner instance,
) => <String, dynamic>{
  'container_resource': ?instance.containerResource,
  'ratio': ?instance.ratio,
};
