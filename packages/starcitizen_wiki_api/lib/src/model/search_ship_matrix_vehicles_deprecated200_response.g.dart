// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_ship_matrix_vehicles_deprecated200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchShipMatrixVehiclesDeprecated200Response
_$SearchShipMatrixVehiclesDeprecated200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('SearchShipMatrixVehiclesDeprecated200Response', json, (
  $checkedConvert,
) {
  final val = SearchShipMatrixVehiclesDeprecated200Response(
    data: $checkedConvert(
      'data',
      (v) => (v as List<dynamic>?)
          ?.map((e) => ShipMatrixVehicle.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
  );
  return val;
});

Map<String, dynamic> _$SearchShipMatrixVehiclesDeprecated200ResponseToJson(
  SearchShipMatrixVehiclesDeprecated200Response instance,
) => <String, dynamic>{'data': ?instance.data?.map((e) => e.toJson()).toList()};
