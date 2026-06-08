// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suit_armor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuitArmor _$SuitArmorFromJson(Map<String, dynamic> json) => $checkedCreate(
  'SuitArmor',
  json,
  ($checkedConvert) {
    final val = SuitArmor(
      slot: $checkedConvert('slot', (v) => v as String?),
      armorType: $checkedConvert('armor_type', (v) => v as String?),
      damageResistance: $checkedConvert(
        'damage_resistance',
        (v) => v == null
            ? null
            : SuitArmorDamageResistance.fromJson(v as Map<String, dynamic>),
      ),
      damageResistanceMap: $checkedConvert(
        'damage_resistance_map',
        (v) => v == null
            ? null
            : SuitArmorDamageResistanceMap.fromJson(v as Map<String, dynamic>),
      ),
      protectedBodyParts: $checkedConvert(
        'protected_body_parts',
        (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
      ),
      signature: $checkedConvert(
        'signature',
        (v) =>
            (v as Map<String, dynamic>?)?.map((k, e) => MapEntry(k, e as num)),
      ),
      tempResistanceMin: $checkedConvert(
        'temp_resistance_min',
        (v) => (v as num?)?.toDouble(),
      ),
      tempResistanceMax: $checkedConvert(
        'temp_resistance_max',
        (v) => (v as num?)?.toDouble(),
      ),
      radiationResistance: $checkedConvert(
        'radiation_resistance',
        (v) => v == null
            ? null
            : RadiationResistance.fromJson(v as Map<String, dynamic>),
      ),
      gforceResistance: $checkedConvert(
        'gforce_resistance',
        (v) => (v as num?)?.toDouble(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'armorType': 'armor_type',
    'damageResistance': 'damage_resistance',
    'damageResistanceMap': 'damage_resistance_map',
    'protectedBodyParts': 'protected_body_parts',
    'tempResistanceMin': 'temp_resistance_min',
    'tempResistanceMax': 'temp_resistance_max',
    'radiationResistance': 'radiation_resistance',
    'gforceResistance': 'gforce_resistance',
  },
);

Map<String, dynamic> _$SuitArmorToJson(SuitArmor instance) => <String, dynamic>{
  'slot': ?instance.slot,
  'armor_type': ?instance.armorType,
  'damage_resistance': ?instance.damageResistance?.toJson(),
  'damage_resistance_map': ?instance.damageResistanceMap?.toJson(),
  'protected_body_parts': ?instance.protectedBodyParts,
  'signature': ?instance.signature,
  'temp_resistance_min': ?instance.tempResistanceMin,
  'temp_resistance_max': ?instance.tempResistanceMax,
  'radiation_resistance': ?instance.radiationResistance?.toJson(),
  'gforce_resistance': ?instance.gforceResistance,
};
