// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_missions200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListMissions200Response _$ListMissions200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ListMissions200Response', json, ($checkedConvert) {
  final val = ListMissions200Response(
    data: $checkedConvert(
      'data',
      (v) => (v as List<dynamic>?)
          ?.map((e) => MissionIndex.fromJson(e as Map<String, dynamic>))
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

Map<String, dynamic> _$ListMissions200ResponseToJson(
  ListMissions200Response instance,
) => <String, dynamic>{
  'data': ?instance.data?.map((e) => e.toJson()).toList(),
  'links': ?instance.links?.toJson(),
  'meta': ?instance.meta?.toJson(),
};
