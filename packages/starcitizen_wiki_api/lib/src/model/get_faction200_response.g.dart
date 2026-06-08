// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_faction200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetFaction200Response _$GetFaction200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('GetFaction200Response', json, ($checkedConvert) {
  final val = GetFaction200Response(
    data: $checkedConvert(
      'data',
      (v) => v == null ? null : Faction.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$GetFaction200ResponseToJson(
  GetFaction200Response instance,
) => <String, dynamic>{'data': ?instance.data?.toJson()};
