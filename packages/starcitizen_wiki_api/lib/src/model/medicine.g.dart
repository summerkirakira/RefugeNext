// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicine.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Medicine _$MedicineFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Medicine',
  json,
  ($checkedConvert) {
    final val = Medicine(
      nutrition: $checkedConvert(
        'nutrition',
        (v) =>
            (v as Map<String, dynamic>?)?.map((k, e) => MapEntry(k, e as num)),
      ),
      buffs: $checkedConvert(
        'buffs',
        (v) =>
            (v as Map<String, dynamic>?)?.map((k, e) => MapEntry(k, e as num)),
      ),
      debuffs: $checkedConvert(
        'debuffs',
        (v) =>
            (v as Map<String, dynamic>?)?.map((k, e) => MapEntry(k, e as num)),
      ),
      container: $checkedConvert(
        'container',
        (v) => v == null
            ? null
            : MedicineAllOfContainer.fromJson(v as Map<String, dynamic>),
      ),
      consumption: $checkedConvert(
        'consumption',
        (v) => v == null
            ? null
            : MedicineAllOfConsumption.fromJson(v as Map<String, dynamic>),
      ),
      nutritionalDensityRating: $checkedConvert(
        'nutritional_density_rating',
        (v) => v as String?,
      ),
      hydrationEfficacyIndex: $checkedConvert(
        'hydration_efficacy_index',
        (v) => v as String?,
      ),
      containerType: $checkedConvert('container_type', (v) => v as String?),
      oneShotConsume: $checkedConvert('one_shot_consume', (v) => v as bool?),
      canBeReclosed: $checkedConvert('can_be_reclosed', (v) => v as bool?),
      discardWhenConsumed: $checkedConvert(
        'discard_when_consumed',
        (v) => v as bool?,
      ),
      effects: $checkedConvert(
        'effects',
        (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
      ),
      combatBuffs: $checkedConvert(
        'combat_buffs',
        (v) =>
            (v as Map<String, dynamic>?)?.map((k, e) => MapEntry(k, e as bool)),
      ),
      impactResistances: $checkedConvert(
        'impact_resistances',
        (v) =>
            (v as Map<String, dynamic>?)?.map((k, e) => MapEntry(k, e as bool)),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'nutritionalDensityRating': 'nutritional_density_rating',
    'hydrationEfficacyIndex': 'hydration_efficacy_index',
    'containerType': 'container_type',
    'oneShotConsume': 'one_shot_consume',
    'canBeReclosed': 'can_be_reclosed',
    'discardWhenConsumed': 'discard_when_consumed',
    'combatBuffs': 'combat_buffs',
    'impactResistances': 'impact_resistances',
  },
);

Map<String, dynamic> _$MedicineToJson(Medicine instance) => <String, dynamic>{
  'nutrition': ?instance.nutrition,
  'buffs': ?instance.buffs,
  'debuffs': ?instance.debuffs,
  'container': ?instance.container?.toJson(),
  'consumption': ?instance.consumption?.toJson(),
  'nutritional_density_rating': ?instance.nutritionalDensityRating,
  'hydration_efficacy_index': ?instance.hydrationEfficacyIndex,
  'container_type': ?instance.containerType,
  'one_shot_consume': ?instance.oneShotConsume,
  'can_be_reclosed': ?instance.canBeReclosed,
  'discard_when_consumed': ?instance.discardWhenConsumed,
  'effects': ?instance.effects,
  'combat_buffs': ?instance.combatBuffs,
  'impact_resistances': ?instance.impactResistances,
};
