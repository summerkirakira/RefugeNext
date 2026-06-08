// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'version_diff_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VersionDiffEntry _$VersionDiffEntryFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'VersionDiffEntry',
      json,
      ($checkedConvert) {
        final val = VersionDiffEntry(
          entityType: $checkedConvert('entity_type', (v) => v as String?),
          entityId: $checkedConvert('entity_id', (v) => (v as num?)?.toInt()),
          changeType: $checkedConvert('change_type', (v) => v as String?),
          columnChanges: $checkedConvert('column_changes', (v) => v),
          dataChanges: $checkedConvert('data_changes', (v) => v),
        );
        return val;
      },
      fieldKeyMap: const {
        'entityType': 'entity_type',
        'entityId': 'entity_id',
        'changeType': 'change_type',
        'columnChanges': 'column_changes',
        'dataChanges': 'data_changes',
      },
    );

Map<String, dynamic> _$VersionDiffEntryToJson(VersionDiffEntry instance) =>
    <String, dynamic>{
      'entity_type': ?instance.entityType,
      'entity_id': ?instance.entityId,
      'change_type': ?instance.changeType,
      'column_changes': ?instance.columnChanges,
      'data_changes': ?instance.dataChanges,
    };
