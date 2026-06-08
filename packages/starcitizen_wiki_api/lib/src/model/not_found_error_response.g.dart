// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'not_found_error_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotFoundErrorResponse _$NotFoundErrorResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('NotFoundErrorResponse', json, ($checkedConvert) {
  final val = NotFoundErrorResponse(
    message: $checkedConvert('message', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$NotFoundErrorResponseToJson(
  NotFoundErrorResponse instance,
) => <String, dynamic>{'message': ?instance.message};
