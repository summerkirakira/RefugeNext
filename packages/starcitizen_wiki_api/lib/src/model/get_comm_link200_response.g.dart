// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_comm_link200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCommLink200Response _$GetCommLink200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('GetCommLink200Response', json, ($checkedConvert) {
  final val = GetCommLink200Response(
    data: $checkedConvert(
      'data',
      (v) => v == null ? null : CommLink.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$GetCommLink200ResponseToJson(
  GetCommLink200Response instance,
) => <String, dynamic>{'data': ?instance.data?.toJson()};
