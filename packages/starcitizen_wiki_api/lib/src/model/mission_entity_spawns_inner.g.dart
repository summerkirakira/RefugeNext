// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mission_entity_spawns_inner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MissionEntitySpawnsInner _$MissionEntitySpawnsInnerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'MissionEntitySpawnsInner',
  json,
  ($checkedConvert) {
    final val = MissionEntitySpawnsInner(
      tags: $checkedConvert(
        'tags',
        (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
      ),
      amount: $checkedConvert('amount', (v) => (v as num?)?.toInt()),
      weight: $checkedConvert('weight', (v) => (v as num?)?.toInt()),
      groupName: $checkedConvert('group_name', (v) => v as String?),
      markupTags: $checkedConvert(
        'markup_tags',
        (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
      ),
      negativeTags: $checkedConvert(
        'negative_tags',
        (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
      ),
      mergedTags: $checkedConvert(
        'merged_tags',
        (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'groupName': 'group_name',
    'markupTags': 'markup_tags',
    'negativeTags': 'negative_tags',
    'mergedTags': 'merged_tags',
  },
);

Map<String, dynamic> _$MissionEntitySpawnsInnerToJson(
  MissionEntitySpawnsInner instance,
) => <String, dynamic>{
  'tags': ?instance.tags,
  'amount': ?instance.amount,
  'weight': ?instance.weight,
  'group_name': ?instance.groupName,
  'markup_tags': ?instance.markupTags,
  'negative_tags': ?instance.negativeTags,
  'merged_tags': ?instance.mergedTags,
};
