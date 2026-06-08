// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_blueprint200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetBlueprint200Response _$GetBlueprint200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('GetBlueprint200Response', json, ($checkedConvert) {
  final val = GetBlueprint200Response(
    data: $checkedConvert(
      'data',
      (v) => v == null ? null : Blueprint.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$GetBlueprint200ResponseToJson(
  GetBlueprint200Response instance,
) => <String, dynamic>{'data': ?instance.data?.toJson()};
