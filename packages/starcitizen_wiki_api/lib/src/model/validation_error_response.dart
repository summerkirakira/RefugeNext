//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'validation_error_response.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ValidationErrorResponse {
  /// Returns a new [ValidationErrorResponse] instance.
  ValidationErrorResponse({

     this.message,

     this.errors,
  });

      /// Human-readable error message.
  @JsonKey(
    
    name: r'message',
    required: false,
    includeIfNull: false,
  )


  final String? message;



      /// Field-level validation errors.
  @JsonKey(
    
    name: r'errors',
    required: false,
    includeIfNull: false,
  )


  final Map<String, List<String>>? errors;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ValidationErrorResponse &&
      other.message == message &&
      other.errors == errors;

    @override
    int get hashCode =>
        message.hashCode +
        errors.hashCode;

  factory ValidationErrorResponse.fromJson(Map<String, dynamic> json) => _$ValidationErrorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ValidationErrorResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

