// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_comm_link_image200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCommLinkImage200Response _$GetCommLinkImage200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('GetCommLinkImage200Response', json, ($checkedConvert) {
  final val = GetCommLinkImage200Response(
    data: $checkedConvert(
      'data',
      (v) =>
          v == null ? null : CommLinkImage.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$GetCommLinkImage200ResponseToJson(
  GetCommLinkImage200Response instance,
) => <String, dynamic>{'data': ?instance.data?.toJson()};
