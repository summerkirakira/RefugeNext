// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hacking_chip.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HackingChip _$HackingChipFromJson(Map<String, dynamic> json) => $checkedCreate(
  'HackingChip',
  json,
  ($checkedConvert) {
    final val = HackingChip(
      maxCharges: $checkedConvert('max_charges', (v) => (v as num?)?.toInt()),
      durationMultiplier: $checkedConvert(
        'duration_multiplier',
        (v) => (v as num?)?.toDouble(),
      ),
      errorChance: $checkedConvert(
        'error_chance',
        (v) => (v as num?)?.toDouble(),
      ),
      accessTag: $checkedConvert('access_tag', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'maxCharges': 'max_charges',
    'durationMultiplier': 'duration_multiplier',
    'errorChance': 'error_chance',
    'accessTag': 'access_tag',
  },
);

Map<String, dynamic> _$HackingChipToJson(HackingChip instance) =>
    <String, dynamic>{
      'max_charges': ?instance.maxCharges,
      'duration_multiplier': ?instance.durationMultiplier,
      'error_chance': ?instance.errorChance,
      'access_tag': ?instance.accessTag,
    };
