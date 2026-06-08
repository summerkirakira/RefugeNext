// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'validation_error_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ValidationErrorResponse _$ValidationErrorResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ValidationErrorResponse', json, ($checkedConvert) {
  final val = ValidationErrorResponse(
    message: $checkedConvert('message', (v) => v as String?),
    errors: $checkedConvert(
      'errors',
      (v) => (v as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
      ),
    ),
  );
  return val;
});

Map<String, dynamic> _$ValidationErrorResponseToJson(
  ValidationErrorResponse instance,
) => <String, dynamic>{
  'message': ?instance.message,
  'errors': ?instance.errors,
};
