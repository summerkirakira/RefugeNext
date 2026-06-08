//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'seat_ejection.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SeatEjection {
  /// Returns a new [SeatEjection] instance.
  SeatEjection({

     this.maxLinearVelocity,

     this.maxLinearAcceleration,

     this.maxAngularVelocity,

     this.maxAngularAcceleration,

     this.ejectionLoopTime,
  });

      /// Maximum linear ejection velocity in meters per second.
  @JsonKey(
    
    name: r'max_linear_velocity',
    required: false,
    includeIfNull: false,
  )


  final double? maxLinearVelocity;



      /// Maximum linear ejection acceleration in meters per second squared.
  @JsonKey(
    
    name: r'max_linear_acceleration',
    required: false,
    includeIfNull: false,
  )


  final double? maxLinearAcceleration;



      /// Maximum angular ejection velocity.
  @JsonKey(
    
    name: r'max_angular_velocity',
    required: false,
    includeIfNull: false,
  )


  final double? maxAngularVelocity;



      /// Maximum angular ejection acceleration.
  @JsonKey(
    
    name: r'max_angular_acceleration',
    required: false,
    includeIfNull: false,
  )


  final double? maxAngularAcceleration;



      /// Ejection sequence duration in seconds.
  @JsonKey(
    
    name: r'ejection_loop_time',
    required: false,
    includeIfNull: false,
  )


  final double? ejectionLoopTime;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SeatEjection &&
      other.maxLinearVelocity == maxLinearVelocity &&
      other.maxLinearAcceleration == maxLinearAcceleration &&
      other.maxAngularVelocity == maxAngularVelocity &&
      other.maxAngularAcceleration == maxAngularAcceleration &&
      other.ejectionLoopTime == ejectionLoopTime;

    @override
    int get hashCode =>
        (maxLinearVelocity == null ? 0 : maxLinearVelocity.hashCode) +
        (maxLinearAcceleration == null ? 0 : maxLinearAcceleration.hashCode) +
        (maxAngularVelocity == null ? 0 : maxAngularVelocity.hashCode) +
        (maxAngularAcceleration == null ? 0 : maxAngularAcceleration.hashCode) +
        (ejectionLoopTime == null ? 0 : ejectionLoopTime.hashCode);

  factory SeatEjection.fromJson(Map<String, dynamic> json) => _$SeatEjectionFromJson(json);

  Map<String, dynamic> toJson() => _$SeatEjectionToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

