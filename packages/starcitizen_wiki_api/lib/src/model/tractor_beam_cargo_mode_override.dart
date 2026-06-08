//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'tractor_beam_cargo_mode_override.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TractorBeamCargoModeOverride {
  /// Returns a new [TractorBeamCargoModeOverride] instance.
  TractorBeamCargoModeOverride({

     this.minForce,

     this.maxForce,

     this.minAcceleration,

     this.maxAcceleration,

     this.minSpeed,

     this.maxSpeed,

     this.accelerationFactor,

     this.degreesPerAction,

     this.maxAngularAcceleration,

     this.maxAngularVelocity,

     this.degreesPerActionScrollWheel,

     this.forceFractionRotation,

     this.minDistance,

     this.maxDistance,

     this.fullStrengthDistance,
  });

      /// Cargo mode override for minimum force.
  @JsonKey(
    
    name: r'min_force',
    required: false,
    includeIfNull: false,
  )


  final double? minForce;



      /// Cargo mode override for maximum force.
  @JsonKey(
    
    name: r'max_force',
    required: false,
    includeIfNull: false,
  )


  final double? maxForce;



      /// Cargo mode override for minimum acceleration.
  @JsonKey(
    
    name: r'min_acceleration',
    required: false,
    includeIfNull: false,
  )


  final double? minAcceleration;



      /// Cargo mode override for maximum acceleration.
  @JsonKey(
    
    name: r'max_acceleration',
    required: false,
    includeIfNull: false,
  )


  final double? maxAcceleration;



      /// Cargo mode override for minimum speed.
  @JsonKey(
    
    name: r'min_speed',
    required: false,
    includeIfNull: false,
  )


  final double? minSpeed;



      /// Cargo mode override for maximum speed.
  @JsonKey(
    
    name: r'max_speed',
    required: false,
    includeIfNull: false,
  )


  final double? maxSpeed;



      /// Cargo mode override for acceleration factor.
  @JsonKey(
    
    name: r'acceleration_factor',
    required: false,
    includeIfNull: false,
  )


  final double? accelerationFactor;



      /// Cargo mode override for rotation degrees per action.
  @JsonKey(
    
    name: r'degrees_per_action',
    required: false,
    includeIfNull: false,
  )


  final double? degreesPerAction;



      /// Cargo mode override for maximum angular acceleration.
  @JsonKey(
    
    name: r'max_angular_acceleration',
    required: false,
    includeIfNull: false,
  )


  final double? maxAngularAcceleration;



      /// Cargo mode override for maximum angular velocity.
  @JsonKey(
    
    name: r'max_angular_velocity',
    required: false,
    includeIfNull: false,
  )


  final double? maxAngularVelocity;



      /// Cargo mode override for scroll wheel degrees per action.
  @JsonKey(
    
    name: r'degrees_per_action_scroll_wheel',
    required: false,
    includeIfNull: false,
  )


  final double? degreesPerActionScrollWheel;



      /// Cargo mode override for rotation force fraction.
  @JsonKey(
    
    name: r'force_fraction_rotation',
    required: false,
    includeIfNull: false,
  )


  final double? forceFractionRotation;



      /// Cargo mode override for minimum distance.
  @JsonKey(
    
    name: r'min_distance',
    required: false,
    includeIfNull: false,
  )


  final double? minDistance;



      /// Cargo mode override for maximum distance.
  @JsonKey(
    
    name: r'max_distance',
    required: false,
    includeIfNull: false,
  )


  final double? maxDistance;



      /// Cargo mode override for full strength distance.
  @JsonKey(
    
    name: r'full_strength_distance',
    required: false,
    includeIfNull: false,
  )


  final double? fullStrengthDistance;





    @override
    bool operator ==(Object other) => identical(this, other) || other is TractorBeamCargoModeOverride &&
      other.minForce == minForce &&
      other.maxForce == maxForce &&
      other.minAcceleration == minAcceleration &&
      other.maxAcceleration == maxAcceleration &&
      other.minSpeed == minSpeed &&
      other.maxSpeed == maxSpeed &&
      other.accelerationFactor == accelerationFactor &&
      other.degreesPerAction == degreesPerAction &&
      other.maxAngularAcceleration == maxAngularAcceleration &&
      other.maxAngularVelocity == maxAngularVelocity &&
      other.degreesPerActionScrollWheel == degreesPerActionScrollWheel &&
      other.forceFractionRotation == forceFractionRotation &&
      other.minDistance == minDistance &&
      other.maxDistance == maxDistance &&
      other.fullStrengthDistance == fullStrengthDistance;

    @override
    int get hashCode =>
        (minForce == null ? 0 : minForce.hashCode) +
        (maxForce == null ? 0 : maxForce.hashCode) +
        (minAcceleration == null ? 0 : minAcceleration.hashCode) +
        (maxAcceleration == null ? 0 : maxAcceleration.hashCode) +
        (minSpeed == null ? 0 : minSpeed.hashCode) +
        (maxSpeed == null ? 0 : maxSpeed.hashCode) +
        (accelerationFactor == null ? 0 : accelerationFactor.hashCode) +
        (degreesPerAction == null ? 0 : degreesPerAction.hashCode) +
        (maxAngularAcceleration == null ? 0 : maxAngularAcceleration.hashCode) +
        (maxAngularVelocity == null ? 0 : maxAngularVelocity.hashCode) +
        (degreesPerActionScrollWheel == null ? 0 : degreesPerActionScrollWheel.hashCode) +
        (forceFractionRotation == null ? 0 : forceFractionRotation.hashCode) +
        (minDistance == null ? 0 : minDistance.hashCode) +
        (maxDistance == null ? 0 : maxDistance.hashCode) +
        (fullStrengthDistance == null ? 0 : fullStrengthDistance.hashCode);

  factory TractorBeamCargoModeOverride.fromJson(Map<String, dynamic> json) => _$TractorBeamCargoModeOverrideFromJson(json);

  Map<String, dynamic> toJson() => _$TractorBeamCargoModeOverrideToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

