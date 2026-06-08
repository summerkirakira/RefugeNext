// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clothing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Clothing _$ClothingFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Clothing',
  json,
  ($checkedConvert) {
    final val = Clothing(
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
    );
    return val;
  },
  fieldKeyMap: const {
    'clothingType': 'clothing_type',
    'tempResistanceMin': 'temp_resistance_min',
    'tempResistanceMax': 'temp_resistance_max',
    'radiationResistance': 'radiation_resistance',
    'gforceResistance': 'gforce_resistance',
  },
);

Map<String, dynamic> _$ClothingToJson(Clothing instance) => <String, dynamic>{
  'clothing_type': ?instance.clothingType,
  'slot': ?instance.slot,
  'type': ?instance.type,
  'resistances': ?instance.resistances?.map((e) => e.toJson()).toList(),
  'temp_resistance_min': ?instance.tempResistanceMin,
  'temp_resistance_max': ?instance.tempResistanceMax,
  'radiation_resistance': ?instance.radiationResistance?.toJson(),
  'gforce_resistance': ?instance.gforceResistance,
};
