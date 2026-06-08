// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_location200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetLocation200Response _$GetLocation200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('GetLocation200Response', json, ($checkedConvert) {
  final val = GetLocation200Response(
    data: $checkedConvert(
      'data',
      (v) => v == null
          ? null
          : GameStarmapLocation.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$GetLocation200ResponseToJson(
  GetLocation200Response instance,
) => <String, dynamic>{'data': ?instance.data?.toJson()};
