// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_ship_matrix_vehicles200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListShipMatrixVehicles200Response _$ListShipMatrixVehicles200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ListShipMatrixVehicles200Response', json, (
  $checkedConvert,
) {
  final val = ListShipMatrixVehicles200Response(
    data: $checkedConvert(
      'data',
      (v) => (v as List<dynamic>?)
          ?.map((e) => ShipMatrixVehicle.fromJson(e as Map<String, dynamic>))
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

Map<String, dynamic> _$ListShipMatrixVehicles200ResponseToJson(
  ListShipMatrixVehicles200Response instance,
) => <String, dynamic>{
  'data': ?instance.data?.map((e) => e.toJson()).toList(),
  'links': ?instance.links?.toJson(),
  'meta': ?instance.meta?.toJson(),
};
