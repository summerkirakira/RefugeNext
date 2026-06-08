//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'unauthenticated_error_response.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class UnauthenticatedErrorResponse {
  /// Returns a new [UnauthenticatedErrorResponse] instance.
  UnauthenticatedErrorResponse({

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
    bool operator ==(Object other) => identical(this, other) || other is UnauthenticatedErrorResponse &&
      other.message == message;

    @override
    int get hashCode =>
        message.hashCode;

  factory UnauthenticatedErrorResponse.fromJson(Map<String, dynamic> json) => _$UnauthenticatedErrorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UnauthenticatedErrorResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

