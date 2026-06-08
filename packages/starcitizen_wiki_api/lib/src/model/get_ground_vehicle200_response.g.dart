// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_ground_vehicle200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetGroundVehicle200Response _$GetGroundVehicle200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('GetGroundVehicle200Response', json, ($checkedConvert) {
  final val = GetGroundVehicle200Response(
    data: $checkedConvert(
      'data',
      (v) => v == null
          ? null
          : GetGroundVehicle200ResponseData.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$GetGroundVehicle200ResponseToJson(
  GetGroundVehicle200Response instance,
) => <String, dynamic>{'data': ?instance.data?.toJson()};
