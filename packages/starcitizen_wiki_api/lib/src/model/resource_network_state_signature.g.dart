// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource_network_state_signature.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResourceNetworkStateSignature _$ResourceNetworkStateSignatureFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ResourceNetworkStateSignature', json, ($checkedConvert) {
  final val = ResourceNetworkStateSignature(
    em: $checkedConvert('em', (v) => (v as num?)?.toDouble()),
    ir: $checkedConvert('ir', (v) => (v as num?)?.toDouble()),
  );
  return val;
});

Map<String, dynamic> _$ResourceNetworkStateSignatureToJson(
  ResourceNetworkStateSignature instance,
) => <String, dynamic>{'em': ?instance.em, 'ir': ?instance.ir};
