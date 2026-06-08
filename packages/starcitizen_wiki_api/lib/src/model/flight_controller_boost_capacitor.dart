//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'flight_controller_boost_capacitor.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class FlightControllerBoostCapacitor {
  /// Returns a new [FlightControllerBoostCapacitor] instance.
  FlightControllerBoostCapacitor({

     this.capacity,

     this.thresholdRatio,

     this.idleCost,

     this.linearCost,

     this.angularCost,

     this.regenPerSec,

     this.regenDelay,

     this.regenTime,
  });

      /// Total afterburner fuel pool. Combined with cost rates, determines total boost time available before depletion.
  @JsonKey(
    
    name: r'capacity',
    required: false,
    includeIfNull: false,
  )


  final double? capacity;



      /// Minimum capacitor fraction required to engage afterburner (0-1).
  @JsonKey(
    
    name: r'threshold_ratio',
    required: false,
    includeIfNull: false,
  )


  final double? thresholdRatio;



      /// Capacitor drain per second while afterburner is armed but not thrusting.
  @JsonKey(
    
    name: r'idle_cost',
    required: false,
    includeIfNull: false,
  )


  final double? idleCost;



      /// Capacitor drain per second for linear afterburner thrust.
  @JsonKey(
    
    name: r'linear_cost',
    required: false,
    includeIfNull: false,
  )


  final double? linearCost;



      /// Capacitor drain per second for angular afterburner thrust.
  @JsonKey(
    
    name: r'angular_cost',
    required: false,
    includeIfNull: false,
  )


  final double? angularCost;



      /// Capacitor regeneration rate per second.
  @JsonKey(
    
    name: r'regen_per_sec',
    required: false,
    includeIfNull: false,
  )


  final double? regenPerSec;



      /// Seconds of delay after disengaging before capacitor regen resumes.
  @JsonKey(
    
    name: r'regen_delay',
    required: false,
    includeIfNull: false,
  )


  final double? regenDelay;



      /// Seconds required to fully regenerate the capacitor from empty (if provided by data).
  @JsonKey(
    
    name: r'regen_time',
    required: false,
    includeIfNull: false,
  )


  final double? regenTime;





    @override
    bool operator ==(Object other) => identical(this, other) || other is FlightControllerBoostCapacitor &&
      other.capacity == capacity &&
      other.thresholdRatio == thresholdRatio &&
      other.idleCost == idleCost &&
      other.linearCost == linearCost &&
      other.angularCost == angularCost &&
      other.regenPerSec == regenPerSec &&
      other.regenDelay == regenDelay &&
      other.regenTime == regenTime;

    @override
    int get hashCode =>
        (capacity == null ? 0 : capacity.hashCode) +
        (thresholdRatio == null ? 0 : thresholdRatio.hashCode) +
        (idleCost == null ? 0 : idleCost.hashCode) +
        (linearCost == null ? 0 : linearCost.hashCode) +
        (angularCost == null ? 0 : angularCost.hashCode) +
        (regenPerSec == null ? 0 : regenPerSec.hashCode) +
        (regenDelay == null ? 0 : regenDelay.hashCode) +
        (regenTime == null ? 0 : regenTime.hashCode);

  factory FlightControllerBoostCapacitor.fromJson(Map<String, dynamic> json) => _$FlightControllerBoostCapacitorFromJson(json);

  Map<String, dynamic> toJson() => _$FlightControllerBoostCapacitorToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

