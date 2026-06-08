// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_weapon200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetWeapon200Response _$GetWeapon200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('GetWeapon200Response', json, ($checkedConvert) {
  final val = GetWeapon200Response(
    data: $checkedConvert(
      'data',
      (v) => v == null ? null : GameItem.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$GetWeapon200ResponseToJson(
  GetWeapon200Response instance,
) => <String, dynamic>{'data': ?instance.data?.toJson()};
