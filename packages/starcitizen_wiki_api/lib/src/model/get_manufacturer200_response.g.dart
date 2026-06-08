// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_manufacturer200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetManufacturer200Response _$GetManufacturer200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('GetManufacturer200Response', json, ($checkedConvert) {
  final val = GetManufacturer200Response(
    data: $checkedConvert(
      'data',
      (v) =>
          v == null ? null : Manufacturer.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$GetManufacturer200ResponseToJson(
  GetManufacturer200Response instance,
) => <String, dynamic>{'data': ?instance.data?.toJson()};
