// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource_network.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResourceNetwork _$ResourceNetworkFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ResourceNetwork',
      json,
      ($checkedConvert) {
        final val = ResourceNetwork(
          isNetworked: $checkedConvert('is_networked', (v) => v as bool?),
          isRelay: $checkedConvert('is_relay', (v) => v as bool?),
          defaultPriority: $checkedConvert(
            'default_priority',
            (v) => (v as num?)?.toInt(),
          ),
          states: $checkedConvert(
            'states',
            (v) => (v as List<dynamic>?)
                ?.map(
                  (e) =>
                      ResourceNetworkState.fromJson(e as Map<String, dynamic>),
                )
                .toList(),
          ),
          repair: $checkedConvert(
            'repair',
            (v) => v == null
                ? null
                : ResourceNetworkRepair.fromJson(v as Map<String, dynamic>),
          ),
          usage: $checkedConvert(
            'usage',
            (v) => v == null
                ? null
                : ResourceNetworkUsage.fromJson(v as Map<String, dynamic>),
          ),
          generation: $checkedConvert(
            'generation',
            (v) => v == null
                ? null
                : ResourceNetworkGeneration.fromJson(v as Map<String, dynamic>),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'isNetworked': 'is_networked',
        'isRelay': 'is_relay',
        'defaultPriority': 'default_priority',
      },
    );

Map<String, dynamic> _$ResourceNetworkToJson(ResourceNetwork instance) =>
    <String, dynamic>{
      'is_networked': ?instance.isNetworked,
      'is_relay': ?instance.isRelay,
      'default_priority': ?instance.defaultPriority,
      'states': ?instance.states?.map((e) => e.toJson()).toList(),
      'repair': ?instance.repair?.toJson(),
      'usage': ?instance.usage?.toJson(),
      'generation': ?instance.generation?.toJson(),
    };
