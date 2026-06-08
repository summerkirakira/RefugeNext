// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_ground_vehicles200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListGroundVehicles200Response _$ListGroundVehicles200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ListGroundVehicles200Response', json, ($checkedConvert) {
  final val = ListGroundVehicles200Response(
    data: $checkedConvert(
      'data',
      (v) => (v as List<dynamic>?)
          ?.map((e) => GameVehicle.fromJson(e as Map<String, dynamic>))
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

Map<String, dynamic> _$ListGroundVehicles200ResponseToJson(
  ListGroundVehicles200Response instance,
) => <String, dynamic>{
  'data': ?instance.data?.map((e) => e.toJson()).toList(),
  'links': ?instance.links?.toJson(),
  'meta': ?instance.meta?.toJson(),
};
