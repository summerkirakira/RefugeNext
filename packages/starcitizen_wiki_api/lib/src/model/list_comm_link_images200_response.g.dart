// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_comm_link_images200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListCommLinkImages200Response _$ListCommLinkImages200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ListCommLinkImages200Response', json, ($checkedConvert) {
  final val = ListCommLinkImages200Response(
    data: $checkedConvert(
      'data',
      (v) => (v as List<dynamic>?)
          ?.map((e) => CommLinkImage.fromJson(e as Map<String, dynamic>))
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

Map<String, dynamic> _$ListCommLinkImages200ResponseToJson(
  ListCommLinkImages200Response instance,
) => <String, dynamic>{
  'data': ?instance.data?.map((e) => e.toJson()).toList(),
  'links': ?instance.links?.toJson(),
  'meta': ?instance.meta?.toJson(),
};
