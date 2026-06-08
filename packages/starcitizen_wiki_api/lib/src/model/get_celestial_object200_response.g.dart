// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_celestial_object200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCelestialObject200Response _$GetCelestialObject200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('GetCelestialObject200Response', json, ($checkedConvert) {
  final val = GetCelestialObject200Response(
    data: $checkedConvert(
      'data',
      (v) => v == null
          ? null
          : CelestialObject.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$GetCelestialObject200ResponseToJson(
  GetCelestialObject200Response instance,
) => <String, dynamic>{'data': ?instance.data?.toJson()};
