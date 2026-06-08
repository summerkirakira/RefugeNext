// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_ship_matrix_vehicle200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetShipMatrixVehicle200Response _$GetShipMatrixVehicle200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('GetShipMatrixVehicle200Response', json, ($checkedConvert) {
  final val = GetShipMatrixVehicle200Response(
    data: $checkedConvert(
      'data',
      (v) => v == null
          ? null
          : ShipMatrixVehicle.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$GetShipMatrixVehicle200ResponseToJson(
  GetShipMatrixVehicle200Response instance,
) => <String, dynamic>{'data': ?instance.data?.toJson()};
