//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'missile_flight.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MissileFlight {
  /// Returns a new [MissileFlight] instance.
  MissileFlight({

     this.enableLifetime,

     this.maxLifetime,

     this.range,

     this.speed,

     this.boostSpeed,

     this.interceptSpeed,

     this.terminalSpeed,

     this.boostPhaseDuration,

     this.terminalPhaseEngagementTime,

     this.terminalPhaseEngagementAngle,

     this.fuelTankSize,
  });

      /// Whether the maximum lifetime limit is enforced.
  @JsonKey(
    
    name: r'enable_lifetime',
    required: false,
    includeIfNull: false,
  )


  final bool? enableLifetime;



      /// Maximum flight time in seconds before missile self-destructs.
  @JsonKey(
    
    name: r'max_lifetime',
    required: false,
    includeIfNull: false,
  )


  final double? maxLifetime;



      /// Maximum travel distance/range as provided by the source data.
  @JsonKey(
    
    name: r'range',
    required: false,
    includeIfNull: false,
  )


  final double? range;



      /// Linear cruise velocity in meters per second.
  @JsonKey(
    
    name: r'speed',
    required: false,
    includeIfNull: false,
  )


  final double? speed;



      /// Initial boost phase velocity in meters per second.
  @JsonKey(
    
    name: r'boost_speed',
    required: false,
    includeIfNull: false,
  )


  final double? boostSpeed;



      /// Intercept phase speed in meters per second.
  @JsonKey(
    
    name: r'intercept_speed',
    required: false,
    includeIfNull: false,
  )


  final double? interceptSpeed;



      /// Terminal phase speed in meters per second.
  @JsonKey(
    
    name: r'terminal_speed',
    required: false,
    includeIfNull: false,
  )


  final double? terminalSpeed;



      /// Duration of the boost phase in seconds.
  @JsonKey(
    
    name: r'boost_phase_duration',
    required: false,
    includeIfNull: false,
  )


  final double? boostPhaseDuration;



      /// Seconds before impact when terminal phase activates.
  @JsonKey(
    
    name: r'terminal_phase_engagement_time',
    required: false,
    includeIfNull: false,
  )


  final double? terminalPhaseEngagementTime;



      /// Maximum engagement angle in degrees for terminal phase.
  @JsonKey(
    
    name: r'terminal_phase_engagement_angle',
    required: false,
    includeIfNull: false,
  )


  final double? terminalPhaseEngagementAngle;



      /// Fuel capacity in arbitrary units.
  @JsonKey(
    
    name: r'fuel_tank_size',
    required: false,
    includeIfNull: false,
  )


  final double? fuelTankSize;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MissileFlight &&
      other.enableLifetime == enableLifetime &&
      other.maxLifetime == maxLifetime &&
      other.range == range &&
      other.speed == speed &&
      other.boostSpeed == boostSpeed &&
      other.interceptSpeed == interceptSpeed &&
      other.terminalSpeed == terminalSpeed &&
      other.boostPhaseDuration == boostPhaseDuration &&
      other.terminalPhaseEngagementTime == terminalPhaseEngagementTime &&
      other.terminalPhaseEngagementAngle == terminalPhaseEngagementAngle &&
      other.fuelTankSize == fuelTankSize;

    @override
    int get hashCode =>
        (enableLifetime == null ? 0 : enableLifetime.hashCode) +
        (maxLifetime == null ? 0 : maxLifetime.hashCode) +
        (range == null ? 0 : range.hashCode) +
        (speed == null ? 0 : speed.hashCode) +
        (boostSpeed == null ? 0 : boostSpeed.hashCode) +
        (interceptSpeed == null ? 0 : interceptSpeed.hashCode) +
        (terminalSpeed == null ? 0 : terminalSpeed.hashCode) +
        (boostPhaseDuration == null ? 0 : boostPhaseDuration.hashCode) +
        (terminalPhaseEngagementTime == null ? 0 : terminalPhaseEngagementTime.hashCode) +
        (terminalPhaseEngagementAngle == null ? 0 : terminalPhaseEngagementAngle.hashCode) +
        (fuelTankSize == null ? 0 : fuelTankSize.hashCode);

  factory MissileFlight.fromJson(Map<String, dynamic> json) => _$MissileFlightFromJson(json);

  Map<String, dynamic> toJson() => _$MissileFlightToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

