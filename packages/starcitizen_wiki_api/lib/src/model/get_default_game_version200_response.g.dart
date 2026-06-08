// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_default_game_version200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDefaultGameVersion200Response _$GetDefaultGameVersion200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('GetDefaultGameVersion200Response', json, (
  $checkedConvert,
) {
  final val = GetDefaultGameVersion200Response(
    data: $checkedConvert(
      'data',
      (v) => v == null ? null : GameVersion.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$GetDefaultGameVersion200ResponseToJson(
  GetDefaultGameVersion200Response instance,
) => <String, dynamic>{'data': ?instance.data?.toJson()};
