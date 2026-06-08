// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_comm_links200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListCommLinks200Response _$ListCommLinks200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ListCommLinks200Response', json, ($checkedConvert) {
  final val = ListCommLinks200Response(
    data: $checkedConvert(
      'data',
      (v) => (v as List<dynamic>?)
          ?.map((e) => CommLink.fromJson(e as Map<String, dynamic>))
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

Map<String, dynamic> _$ListCommLinks200ResponseToJson(
  ListCommLinks200Response instance,
) => <String, dynamic>{
  'data': ?instance.data?.map((e) => e.toJson()).toList(),
  'links': ?instance.links?.toJson(),
  'meta': ?instance.meta?.toJson(),
};
