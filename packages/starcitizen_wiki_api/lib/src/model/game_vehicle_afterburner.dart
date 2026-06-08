//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'game_vehicle_afterburner.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GameVehicleAfterburner {
  /// Returns a new [GameVehicleAfterburner] instance.
  GameVehicleAfterburner({

     this.pitchBoostMultiplier,

     this.rollBoostMultiplier,

     this.yawBoostMultiplier,

     this.capacitor,

     this.idleCost,

     this.linearCost,

     this.angularCost,

     this.regenPerSecond,

     this.regenDelayAfterUse,

     this.preDelayTime,

     this.rampUpTime,

     this.rampDownTime,

     this.regenTime,

     this.regenDelay,
  });

      /// Pitch angular acceleration multiplier when boosting.
  @JsonKey(
    
    name: r'pitch_boost_multiplier',
    required: false,
    includeIfNull: false,
  )


  final num? pitchBoostMultiplier;



      /// Roll angular acceleration multiplier when boosting.
  @JsonKey(
    
    name: r'roll_boost_multiplier',
    required: false,
    includeIfNull: false,
  )


  final num? rollBoostMultiplier;



      /// Yaw angular acceleration multiplier when boosting.
  @JsonKey(
    
    name: r'yaw_boost_multiplier',
    required: false,
    includeIfNull: false,
  )


  final num? yawBoostMultiplier;



      /// Maximum afterburner capacitor capacity.
  @JsonKey(
    
    name: r'capacitor',
    required: false,
    includeIfNull: false,
  )


  final num? capacitor;



      /// Afterburner capacitor idle drain per second.
  @JsonKey(
    
    name: r'idle_cost',
    required: false,
    includeIfNull: false,
  )


  final num? idleCost;



      /// Afterburner capacitor cost for linear thrust.
  @JsonKey(
    
    name: r'linear_cost',
    required: false,
    includeIfNull: false,
  )


  final num? linearCost;



      /// Afterburner capacitor cost for angular thrust.
  @JsonKey(
    
    name: r'angular_cost',
    required: false,
    includeIfNull: false,
  )


  final num? angularCost;



      /// Capacitor regeneration per second.
  @JsonKey(
    
    name: r'regen_per_second',
    required: false,
    includeIfNull: false,
  )


  final num? regenPerSecond;



      /// Delay before regeneration starts after use in seconds.
  @JsonKey(
    
    name: r'regen_delay_after_use',
    required: false,
    includeIfNull: false,
  )


  final num? regenDelayAfterUse;



      /// Pre-delay time before afterburner engages in seconds.
  @JsonKey(
    
    name: r'pre_delay_time',
    required: false,
    includeIfNull: false,
  )


  final num? preDelayTime;



      /// Ramp-up time to full afterburner in seconds.
  @JsonKey(
    
    name: r'ramp_up_time',
    required: false,
    includeIfNull: false,
  )


  final num? rampUpTime;



      /// Ramp-down time from afterburner in seconds.
  @JsonKey(
    
    name: r'ramp_down_time',
    required: false,
    includeIfNull: false,
  )


  final num? rampDownTime;



      /// Total time to fully regenerate capacitor in seconds.
  @JsonKey(
    
    name: r'regen_time',
    required: false,
    includeIfNull: false,
  )


  final num? regenTime;



      /// Delay before capacitor regeneration in seconds.
  @JsonKey(
    
    name: r'regen_delay',
    required: false,
    includeIfNull: false,
  )


  final num? regenDelay;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GameVehicleAfterburner &&
      other.pitchBoostMultiplier == pitchBoostMultiplier &&
      other.rollBoostMultiplier == rollBoostMultiplier &&
      other.yawBoostMultiplier == yawBoostMultiplier &&
      other.capacitor == capacitor &&
      other.idleCost == idleCost &&
      other.linearCost == linearCost &&
      other.angularCost == angularCost &&
      other.regenPerSecond == regenPerSecond &&
      other.regenDelayAfterUse == regenDelayAfterUse &&
      other.preDelayTime == preDelayTime &&
      other.rampUpTime == rampUpTime &&
      other.rampDownTime == rampDownTime &&
      other.regenTime == regenTime &&
      other.regenDelay == regenDelay;

    @override
    int get hashCode =>
        (pitchBoostMultiplier == null ? 0 : pitchBoostMultiplier.hashCode) +
        (rollBoostMultiplier == null ? 0 : rollBoostMultiplier.hashCode) +
        (yawBoostMultiplier == null ? 0 : yawBoostMultiplier.hashCode) +
        (capacitor == null ? 0 : capacitor.hashCode) +
        (idleCost == null ? 0 : idleCost.hashCode) +
        (linearCost == null ? 0 : linearCost.hashCode) +
        (angularCost == null ? 0 : angularCost.hashCode) +
        (regenPerSecond == null ? 0 : regenPerSecond.hashCode) +
        (regenDelayAfterUse == null ? 0 : regenDelayAfterUse.hashCode) +
        (preDelayTime == null ? 0 : preDelayTime.hashCode) +
        (rampUpTime == null ? 0 : rampUpTime.hashCode) +
        (rampDownTime == null ? 0 : rampDownTime.hashCode) +
        (regenTime == null ? 0 : regenTime.hashCode) +
        (regenDelay == null ? 0 : regenDelay.hashCode);

  factory GameVehicleAfterburner.fromJson(Map<String, dynamic> json) => _$GameVehicleAfterburnerFromJson(json);

  Map<String, dynamic> toJson() => _$GameVehicleAfterburnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

