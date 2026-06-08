// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_mission200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMission200Response _$GetMission200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('GetMission200Response', json, ($checkedConvert) {
  final val = GetMission200Response(
    data: $checkedConvert(
      'data',
      (v) => v == null ? null : Mission.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$GetMission200ResponseToJson(
  GetMission200Response instance,
) => <String, dynamic>{'data': ?instance.data?.toJson()};
