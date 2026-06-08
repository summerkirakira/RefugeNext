// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_item_clothing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameItemClothing _$GameItemClothingFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'GameItemClothing',
  json,
  ($checkedConvert) {
    final val = GameItemClothing(
      clothingType: $checkedConvert('clothing_type', (v) => v as String?),
      slot: $checkedConvert('slot', (v) => v as String?),
      type: $checkedConvert('type', (v) => v as String?),
      resistances: $checkedConvert(
        'resistances',
        (v) => (v as List<dynamic>?)
            ?.map(
              (e) =>
                  ClothingResistancesInner.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
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
    );
    return val;
  },
  fieldKeyMap: const {
    'clothingType': 'clothing_type',
    'tempResistanceMin': 'temp_resistance_min',
    'tempResistanceMax': 'temp_resistance_max',
    'radiationResistance': 'radiation_resistance',
    'gforceResistance': 'gforce_resistance',
    'armorType': 'armor_type',
    'damageResistance': 'damage_resistance',
    'damageResistanceMap': 'damage_resistance_map',
    'protectedBodyParts': 'protected_body_parts',
  },
);

Map<String, dynamic> _$GameItemClothingToJson(GameItemClothing instance) =>
    <String, dynamic>{
      'clothing_type': ?instance.clothingType,
      'slot': ?instance.slot,
      'type': ?instance.type,
      'resistances': ?instance.resistances?.map((e) => e.toJson()).toList(),
      'temp_resistance_min': ?instance.tempResistanceMin,
      'temp_resistance_max': ?instance.tempResistanceMax,
      'radiation_resistance': ?instance.radiationResistance?.toJson(),
      'gforce_resistance': ?instance.gforceResistance,
      'armor_type': ?instance.armorType,
      'damage_resistance': ?instance.damageResistance?.toJson(),
      'damage_resistance_map': ?instance.damageResistanceMap?.toJson(),
      'protected_body_parts': ?instance.protectedBodyParts,
      'signature': ?instance.signature,
    };
