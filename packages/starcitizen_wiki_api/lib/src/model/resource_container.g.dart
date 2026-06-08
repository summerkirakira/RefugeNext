// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource_container.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResourceContainer _$ResourceContainerFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ResourceContainer',
      json,
      ($checkedConvert) {
        final val = ResourceContainer(
          mass: $checkedConvert('mass', (v) => (v as num?)?.toDouble()),
          immutable: $checkedConvert('immutable', (v) => v as bool?),
          defaultFillFraction: $checkedConvert(
            'default_fill_fraction',
            (v) => (v as num?)?.toDouble(),
          ),
          capacity: $checkedConvert(
            'capacity',
            (v) => v == null
                ? null
                : ResourceContainerCapacity.fromJson(v as Map<String, dynamic>),
          ),
          inclusiveResources: $checkedConvert(
            'inclusive_resources',
            (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
          ),
          defaultComposition: $checkedConvert(
            'default_composition',
            (v) => (v as List<dynamic>?)
                ?.map(
                  (e) => ResourceContainerCompositionEntry.fromJson(
                    e as Map<String, dynamic>,
                  ),
                )
                .toList(),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'defaultFillFraction': 'default_fill_fraction',
        'inclusiveResources': 'inclusive_resources',
        'defaultComposition': 'default_composition',
      },
    );

Map<String, dynamic> _$ResourceContainerToJson(ResourceContainer instance) =>
    <String, dynamic>{
      'mass': ?instance.mass,
      'immutable': ?instance.immutable,
      'default_fill_fraction': ?instance.defaultFillFraction,
      'capacity': ?instance.capacity?.toJson(),
      'inclusive_resources': ?instance.inclusiveResources,
      'default_composition': ?instance.defaultComposition
          ?.map((e) => e.toJson())
          .toList(),
    };
