// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clothing_resistances_inner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClothingResistancesInner _$ClothingResistancesInnerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ClothingResistancesInner', json, ($checkedConvert) {
  final val = ClothingResistancesInner(
    type: $checkedConvert('type', (v) => v as String?),
    multiplier: $checkedConvert('multiplier', (v) => (v as num?)?.toDouble()),
    threshold: $checkedConvert('threshold', (v) => (v as num?)?.toDouble()),
  );
  return val;
});

Map<String, dynamic> _$ClothingResistancesInnerToJson(
  ClothingResistancesInner instance,
) => <String, dynamic>{
  'type': ?instance.type,
  'multiplier': ?instance.multiplier,
  'threshold': ?instance.threshold,
};
