// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unauthenticated_error_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnauthenticatedErrorResponse _$UnauthenticatedErrorResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('UnauthenticatedErrorResponse', json, ($checkedConvert) {
  final val = UnauthenticatedErrorResponse(
    message: $checkedConvert('message', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$UnauthenticatedErrorResponseToJson(
  UnauthenticatedErrorResponse instance,
) => <String, dynamic>{'message': ?instance.message};
