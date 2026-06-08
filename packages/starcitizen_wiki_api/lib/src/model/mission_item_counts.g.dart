// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mission_item_counts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MissionItemCounts _$MissionItemCountsFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'MissionItemCounts',
      json,
      ($checkedConvert) {
        final val = MissionItemCounts(
          maxItems: $checkedConvert('max_items', (v) => (v as num?)?.toInt()),
          minItems: $checkedConvert('min_items', (v) => (v as num?)?.toInt()),
        );
        return val;
      },
      fieldKeyMap: const {'maxItems': 'max_items', 'minItems': 'min_items'},
    );

Map<String, dynamic> _$MissionItemCountsToJson(MissionItemCounts instance) =>
    <String, dynamic>{
      'max_items': ?instance.maxItems,
      'min_items': ?instance.minItems,
    };
