// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rate_limit_error_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RateLimitErrorResponse _$RateLimitErrorResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('RateLimitErrorResponse', json, ($checkedConvert) {
  final val = RateLimitErrorResponse(
    message: $checkedConvert('message', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$RateLimitErrorResponseToJson(
  RateLimitErrorResponse instance,
) => <String, dynamic>{'message': ?instance.message};
