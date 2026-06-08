//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'rate_limit_error_response.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class RateLimitErrorResponse {
  /// Returns a new [RateLimitErrorResponse] instance.
  RateLimitErrorResponse({

     this.message,
  });

      /// Human-readable error message.
  @JsonKey(
    
    name: r'message',
    required: false,
    includeIfNull: false,
  )


  final String? message;





    @override
    bool operator ==(Object other) => identical(this, other) || other is RateLimitErrorResponse &&
      other.message == message;

    @override
    int get hashCode =>
        message.hashCode;

  factory RateLimitErrorResponse.fromJson(Map<String, dynamic> json) => _$RateLimitErrorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RateLimitErrorResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

