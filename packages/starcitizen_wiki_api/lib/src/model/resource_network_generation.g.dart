// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource_network_generation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResourceNetworkGeneration _$ResourceNetworkGenerationFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ResourceNetworkGeneration', json, ($checkedConvert) {
  final val = ResourceNetworkGeneration(
    coolant: $checkedConvert('coolant', (v) => (v as num?)?.toDouble()),
    power: $checkedConvert('power', (v) => (v as num?)?.toDouble()),
  );
  return val;
});

Map<String, dynamic> _$ResourceNetworkGenerationToJson(
  ResourceNetworkGeneration instance,
) => <String, dynamic>{'coolant': ?instance.coolant, 'power': ?instance.power};
