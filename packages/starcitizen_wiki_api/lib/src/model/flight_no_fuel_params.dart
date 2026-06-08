//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'flight_no_fuel_params.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class FlightNoFuelParams {
  /// Returns a new [FlightNoFuelParams] instance.
  FlightNoFuelParams({

     this.linearAccelerationModifier,

     this.angularAccelerationModifier,

     this.angularVelocityModifier,

     this.legacyMaxSpeed,
  });

      /// Multiplier applied to linear acceleration when out of fuel.
  @JsonKey(
    
    name: r'linear_acceleration_modifier',
    required: false,
    includeIfNull: false,
  )


  final num? linearAccelerationModifier;



      /// Multiplier applied to angular acceleration when out of fuel.
  @JsonKey(
    
    name: r'angular_acceleration_modifier',
    required: false,
    includeIfNull: false,
  )


  final num? angularAccelerationModifier;



      /// Multiplier applied to angular velocity when out of fuel.
  @JsonKey(
    
    name: r'angular_velocity_modifier',
    required: false,
    includeIfNull: false,
  )


  final num? angularVelocityModifier;



      /// Maximum speed in m/s when out of fuel (legacy mode).
  @JsonKey(
    
    name: r'legacy_max_speed',
    required: false,
    includeIfNull: false,
  )


  final num? legacyMaxSpeed;





    @override
    bool operator ==(Object other) => identical(this, other) || other is FlightNoFuelParams &&
      other.linearAccelerationModifier == linearAccelerationModifier &&
      other.angularAccelerationModifier == angularAccelerationModifier &&
      other.angularVelocityModifier == angularVelocityModifier &&
      other.legacyMaxSpeed == legacyMaxSpeed;

    @override
    int get hashCode =>
        (linearAccelerationModifier == null ? 0 : linearAccelerationModifier.hashCode) +
        (angularAccelerationModifier == null ? 0 : angularAccelerationModifier.hashCode) +
        (angularVelocityModifier == null ? 0 : angularVelocityModifier.hashCode) +
        (legacyMaxSpeed == null ? 0 : legacyMaxSpeed.hashCode);

  factory FlightNoFuelParams.fromJson(Map<String, dynamic> json) => _$FlightNoFuelParamsFromJson(json);

  Map<String, dynamic> toJson() => _$FlightNoFuelParamsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

