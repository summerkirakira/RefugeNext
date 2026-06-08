// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_starsystem200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetStarsystem200Response _$GetStarsystem200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('GetStarsystem200Response', json, ($checkedConvert) {
  final val = GetStarsystem200Response(
    data: $checkedConvert(
      'data',
      (v) => v == null ? null : Starsystem.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$GetStarsystem200ResponseToJson(
  GetStarsystem200Response instance,
) => <String, dynamic>{'data': ?instance.data?.toJson()};
