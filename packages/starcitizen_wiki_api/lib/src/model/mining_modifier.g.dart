// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mining_modifier.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MiningModifier _$MiningModifierFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'MiningModifier',
      json,
      ($checkedConvert) {
        final val = MiningModifier(
          type: $checkedConvert('type', (v) => v as String?),
          itemType: $checkedConvert(
            'item_type',
            (v) => $enumDecodeNullable(_$MiningModifierItemTypeEnumEnumMap, v),
          ),
          charges: $checkedConvert('charges', (v) => (v as num?)?.toInt()),
          duration: $checkedConvert('duration', (v) => (v as num?)?.toDouble()),
          powerModifier: $checkedConvert(
            'power_modifier',
            (v) => v == null
                ? null
                : MiningModifierPowerModifier.fromJson(
                    v as Map<String, dynamic>,
                  ),
          ),
          modifierMap: $checkedConvert(
            'modifier_map',
            (v) => (v as Map<String, dynamic>?)?.map(
              (k, e) => MapEntry(
                k,
                MiningModifierValue.fromJson(e as Map<String, dynamic>),
              ),
            ),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'itemType': 'item_type',
        'powerModifier': 'power_modifier',
        'modifierMap': 'modifier_map',
      },
    );

Map<String, dynamic> _$MiningModifierToJson(
  MiningModifier instance,
) => <String, dynamic>{
  'type': ?instance.type,
  'item_type': ?_$MiningModifierItemTypeEnumEnumMap[instance.itemType],
  'charges': ?instance.charges,
  'duration': ?instance.duration,
  'power_modifier': ?instance.powerModifier?.toJson(),
  'modifier_map': ?instance.modifierMap?.map((k, e) => MapEntry(k, e.toJson())),
};

const _$MiningModifierItemTypeEnumEnumMap = {
  MiningModifierItemTypeEnum.gadget: 'Gadget',
  MiningModifierItemTypeEnum.module: 'Module',
};
