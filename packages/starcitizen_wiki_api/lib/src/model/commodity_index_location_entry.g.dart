// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commodity_index_location_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommodityIndexLocationEntry _$CommodityIndexLocationEntryFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'CommodityIndexLocationEntry',
  json,
  ($checkedConvert) {
    final val = CommodityIndexLocationEntry(
      groupName: $checkedConvert('group_name', (v) => v as String?),
      resourceKind: $checkedConvert('resource_kind', (v) => v as String?),
      qualityMin: $checkedConvert('quality_min', (v) => (v as num?)?.toInt()),
      qualityMax: $checkedConvert('quality_max', (v) => (v as num?)?.toInt()),
      entryCount: $checkedConvert('entry_count', (v) => (v as num?)?.toInt()),
    );
    return val;
  },
  fieldKeyMap: const {
    'groupName': 'group_name',
    'resourceKind': 'resource_kind',
    'qualityMin': 'quality_min',
    'qualityMax': 'quality_max',
    'entryCount': 'entry_count',
  },
);

Map<String, dynamic> _$CommodityIndexLocationEntryToJson(
  CommodityIndexLocationEntry instance,
) => <String, dynamic>{
  'group_name': ?instance.groupName,
  'resource_kind': ?instance.resourceKind,
  'quality_min': ?instance.qualityMin,
  'quality_max': ?instance.qualityMax,
  'entry_count': ?instance.entryCount,
};
