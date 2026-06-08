// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'version_changelog.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VersionChangelog _$VersionChangelogFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'VersionChangelog',
  json,
  ($checkedConvert) {
    final val = VersionChangelog(
      fromVersion: $checkedConvert(
        'from_version',
        (v) =>
            v == null ? null : GameVersion.fromJson(v as Map<String, dynamic>),
      ),
      toVersion: $checkedConvert(
        'to_version',
        (v) =>
            v == null ? null : GameVersion.fromJson(v as Map<String, dynamic>),
      ),
      summary: $checkedConvert(
        'summary',
        (v) => (v as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(
            k,
            VersionChangelogSummaryValue.fromJson(e as Map<String, dynamic>),
          ),
        ),
      ),
    );
    return val;
  },
  fieldKeyMap: const {'fromVersion': 'from_version', 'toVersion': 'to_version'},
);

Map<String, dynamic> _$VersionChangelogToJson(VersionChangelog instance) =>
    <String, dynamic>{
      'from_version': ?instance.fromVersion?.toJson(),
      'to_version': ?instance.toVersion?.toJson(),
      'summary': ?instance.summary?.map((k, e) => MapEntry(k, e.toJson())),
    };
