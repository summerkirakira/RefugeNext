// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suit_armor_type_resistance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuitArmorTypeResistance _$SuitArmorTypeResistanceFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('SuitArmorTypeResistance', json, ($checkedConvert) {
  final val = SuitArmorTypeResistance(
    type: $checkedConvert('type', (v) => v as String?),
    multiplier: $checkedConvert('multiplier', (v) => (v as num?)?.toDouble()),
    threshold: $checkedConvert('threshold', (v) => (v as num?)?.toDouble()),
  );
  return val;
});

Map<String, dynamic> _$SuitArmorTypeResistanceToJson(
  SuitArmorTypeResistance instance,
) => <String, dynamic>{
  'type': ?instance.type,
  'multiplier': ?instance.multiplier,
  'threshold': ?instance.threshold,
};
