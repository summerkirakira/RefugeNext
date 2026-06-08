//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'not_found_error_response.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class NotFoundErrorResponse {
  /// Returns a new [NotFoundErrorResponse] instance.
  NotFoundErrorResponse({

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
    bool operator ==(Object other) => identical(this, other) || other is NotFoundErrorResponse &&
      other.message == message;

    @override
    int get hashCode =>
        message.hashCode;

  factory NotFoundErrorResponse.fromJson(Map<String, dynamic> json) => _$NotFoundErrorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NotFoundErrorResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

