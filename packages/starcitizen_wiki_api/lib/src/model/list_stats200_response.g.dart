// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_stats200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListStats200Response _$ListStats200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ListStats200Response', json, ($checkedConvert) {
  final val = ListStats200Response(
    data: $checkedConvert(
      'data',
      (v) => (v as List<dynamic>?)
          ?.map((e) => Stat.fromJson(e as Map<String, dynamic>))
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

Map<String, dynamic> _$ListStats200ResponseToJson(
  ListStats200Response instance,
) => <String, dynamic>{
  'data': ?instance.data?.map((e) => e.toJson()).toList(),
  'links': ?instance.links?.toJson(),
  'meta': ?instance.meta?.toJson(),
};
