// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_version_changelog_changes200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListVersionChangelogChanges200Response
_$ListVersionChangelogChanges200ResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ListVersionChangelogChanges200Response', json, (
      $checkedConvert,
    ) {
      final val = ListVersionChangelogChanges200Response(
        data: $checkedConvert(
          'data',
          (v) => (v as List<dynamic>?)
              ?.map((e) => VersionDiffEntry.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        links: $checkedConvert(
          'links',
          (v) => v == null
              ? null
              : PaginationLinks.fromJson(v as Map<String, dynamic>),
        ),
        meta: $checkedConvert(
          'meta',
          (v) => v == null
              ? null
              : PaginationMeta.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$ListVersionChangelogChanges200ResponseToJson(
  ListVersionChangelogChanges200Response instance,
) => <String, dynamic>{
  'data': ?instance.data?.map((e) => e.toJson()).toList(),
  'links': ?instance.links?.toJson(),
  'meta': ?instance.meta?.toJson(),
};
