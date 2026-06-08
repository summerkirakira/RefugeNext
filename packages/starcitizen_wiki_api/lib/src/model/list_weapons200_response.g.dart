// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_weapons200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListWeapons200Response _$ListWeapons200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ListWeapons200Response', json, ($checkedConvert) {
  final val = ListWeapons200Response(
    data: $checkedConvert(
      'data',
      (v) => (v as List<dynamic>?)
          ?.map((e) => GameItem.fromJson(e as Map<String, dynamic>))
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

Map<String, dynamic> _$ListWeapons200ResponseToJson(
  ListWeapons200Response instance,
) => <String, dynamic>{
  'data': ?instance.data?.map((e) => e.toJson()).toList(),
  'links': ?instance.links?.toJson(),
  'meta': ?instance.meta?.toJson(),
};
