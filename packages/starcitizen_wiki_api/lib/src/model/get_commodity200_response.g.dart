// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_commodity200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCommodity200Response _$GetCommodity200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('GetCommodity200Response', json, ($checkedConvert) {
  final val = GetCommodity200Response(
    data: $checkedConvert(
      'data',
      (v) =>
          v == null ? null : CommodityShow.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$GetCommodity200ResponseToJson(
  GetCommodity200Response instance,
) => <String, dynamic>{'data': ?instance.data?.toJson()};
