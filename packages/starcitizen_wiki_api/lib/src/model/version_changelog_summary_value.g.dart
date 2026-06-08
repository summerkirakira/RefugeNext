// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'version_changelog_summary_value.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VersionChangelogSummaryValue _$VersionChangelogSummaryValueFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('VersionChangelogSummaryValue', json, ($checkedConvert) {
  final val = VersionChangelogSummaryValue(
    added: $checkedConvert('added', (v) => (v as num?)?.toInt()),
    removed: $checkedConvert('removed', (v) => (v as num?)?.toInt()),
    modified: $checkedConvert('modified', (v) => (v as num?)?.toInt()),
  );
  return val;
});

Map<String, dynamic> _$VersionChangelogSummaryValueToJson(
  VersionChangelogSummaryValue instance,
) => <String, dynamic>{
  'added': ?instance.added,
  'removed': ?instance.removed,
  'modified': ?instance.modified,
};
