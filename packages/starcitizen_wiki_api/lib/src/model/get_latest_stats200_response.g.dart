// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_latest_stats200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetLatestStats200Response _$GetLatestStats200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('GetLatestStats200Response', json, ($checkedConvert) {
  final val = GetLatestStats200Response(
    data: $checkedConvert(
      'data',
      (v) => v == null ? null : Stat.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$GetLatestStats200ResponseToJson(
  GetLatestStats200Response instance,
) => <String, dynamic>{'data': ?instance.data?.toJson()};
