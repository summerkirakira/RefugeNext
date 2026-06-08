// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_blueprints200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListBlueprints200Response _$ListBlueprints200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ListBlueprints200Response', json, ($checkedConvert) {
  final val = ListBlueprints200Response(
    data: $checkedConvert(
      'data',
      (v) => (v as List<dynamic>?)
          ?.map((e) => Blueprint.fromJson(e as Map<String, dynamic>))
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
      (v) =>
          v == null ? null : PaginationMeta.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$ListBlueprints200ResponseToJson(
  ListBlueprints200Response instance,
) => <String, dynamic>{
  'data': ?instance.data?.map((e) => e.toJson()).toList(),
  'links': ?instance.links?.toJson(),
  'meta': ?instance.meta?.toJson(),
};
