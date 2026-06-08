// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_commodities200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListCommodities200Response _$ListCommodities200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ListCommodities200Response', json, ($checkedConvert) {
  final val = ListCommodities200Response(
    data: $checkedConvert(
      'data',
      (v) => (v as List<dynamic>?)
          ?.map((e) => CommodityLink.fromJson(e as Map<String, dynamic>))
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

Map<String, dynamic> _$ListCommodities200ResponseToJson(
  ListCommodities200Response instance,
) => <String, dynamic>{
  'data': ?instance.data?.map((e) => e.toJson()).toList(),
  'links': ?instance.links?.toJson(),
  'meta': ?instance.meta?.toJson(),
};
