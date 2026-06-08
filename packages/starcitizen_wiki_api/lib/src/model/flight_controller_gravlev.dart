//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'flight_controller_gravlev.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class FlightControllerGravlev {
  /// Returns a new [FlightControllerGravlev] instance.
  FlightControllerGravlev({

     this.maxSpeed,

     this.turnFriction,

     this.airControllerMultiplier,

     this.antiFallMultiplier,

     this.lateralStrafeMultiplier,
  });

      /// Maximum gravlev hover speed.
  @JsonKey(
    
    name: r'max_speed',
    required: false,
    includeIfNull: false,
  )


  final double? maxSpeed;



      /// Turning friction factor for gravlev.
  @JsonKey(
    
    name: r'turn_friction',
    required: false,
    includeIfNull: false,
  )


  final double? turnFriction;



      /// Multiplier for air control when using gravlev.
  @JsonKey(
    
    name: r'air_controller_multiplier',
    required: false,
    includeIfNull: false,
  )


  final double? airControllerMultiplier;



      /// Multiplier used to counteract falling behaviour.
  @JsonKey(
    
    name: r'anti_fall_multiplier',
    required: false,
    includeIfNull: false,
  )


  final double? antiFallMultiplier;



      /// Multiplier for lateral strafing while in gravlev mode.
  @JsonKey(
    
    name: r'lateral_strafe_multiplier',
    required: false,
    includeIfNull: false,
  )


  final double? lateralStrafeMultiplier;





    @override
    bool operator ==(Object other) => identical(this, other) || other is FlightControllerGravlev &&
      other.maxSpeed == maxSpeed &&
      other.turnFriction == turnFriction &&
      other.airControllerMultiplier == airControllerMultiplier &&
      other.antiFallMultiplier == antiFallMultiplier &&
      other.lateralStrafeMultiplier == lateralStrafeMultiplier;

    @override
    int get hashCode =>
        (maxSpeed == null ? 0 : maxSpeed.hashCode) +
        (turnFriction == null ? 0 : turnFriction.hashCode) +
        (airControllerMultiplier == null ? 0 : airControllerMultiplier.hashCode) +
        (antiFallMultiplier == null ? 0 : antiFallMultiplier.hashCode) +
        (lateralStrafeMultiplier == null ? 0 : lateralStrafeMultiplier.hashCode);

  factory FlightControllerGravlev.fromJson(Map<String, dynamic> json) => _$FlightControllerGravlevFromJson(json);

  Map<String, dynamic> toJson() => _$FlightControllerGravlevToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

