//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/flight_controller_boost_activation.dart';
import 'package:starcitizen_wiki_api/src/model/flight_controller_recall_params.dart';
import 'package:starcitizen_wiki_api/src/model/flight_controller_multiplier.dart';
import 'package:starcitizen_wiki_api/src/model/flight_controller_precision_mode.dart';
import 'package:starcitizen_wiki_api/src/model/flight_controller_collision_detection.dart';
import 'package:starcitizen_wiki_api/src/model/flight_controller_boost_multiplier.dart';
import 'package:starcitizen_wiki_api/src/model/flight_no_fuel_params.dart';
import 'package:starcitizen_wiki_api/src/model/flight_controller_gravlev.dart';
import 'package:starcitizen_wiki_api/src/model/flight_controller_boost_capacitor.dart';
import 'package:starcitizen_wiki_api/src/model/flight_controller_thruster_decay.dart';
import 'package:json_annotation/json_annotation.dart';

part 'flight_controller.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class FlightController {
  /// Returns a new [FlightController] instance.
  FlightController({

     this.scmSpeed,

     this.boostSpeedForward,

     this.boostSpeedBackward,

     this.maxSpeed,

     this.pitch,

     this.yaw,

     this.roll,

     this.pitchBoosted,

     this.yawBoosted,

     this.rollBoosted,

     this.boostCapacitor,

     this.boostActivation,

     this.thrusterDecay,

     this.multiplier,

     this.boostMultiplier,

     this.precisionMode,

     this.recallParams,

     this.collisionDetection,

     this.gravlev,

     this.noFuelParams,
  });

      /// Space Combat Maneuvering (cruise) speed in meters per second.
  @JsonKey(
    
    name: r'scm_speed',
    required: false,
    includeIfNull: false,
  )


  final double? scmSpeed;



      /// Forward boost speed cap in m/s.
  @JsonKey(
    
    name: r'boost_speed_forward',
    required: false,
    includeIfNull: false,
  )


  final double? boostSpeedForward;



      /// Reverse boost speed cap in m/s.
  @JsonKey(
    
    name: r'boost_speed_backward',
    required: false,
    includeIfNull: false,
  )


  final double? boostSpeedBackward;



      /// Absolute flight envelope speed cap in m/s.
  @JsonKey(
    
    name: r'max_speed',
    required: false,
    includeIfNull: false,
  )


  final double? maxSpeed;



      /// Maximum pitch rate in degrees per second.
  @JsonKey(
    
    name: r'pitch',
    required: false,
    includeIfNull: false,
  )


  final double? pitch;



      /// Maximum yaw rate in degrees per second.
  @JsonKey(
    
    name: r'yaw',
    required: false,
    includeIfNull: false,
  )


  final double? yaw;



      /// Maximum roll rate in degrees per second.
  @JsonKey(
    
    name: r'roll',
    required: false,
    includeIfNull: false,
  )


  final double? roll;



      /// Derived boosted pitch rate (rounded): pitch * boost_multiplier.pitch (defaults to 1 if missing).
  @JsonKey(
    
    name: r'pitch_boosted',
    required: false,
    includeIfNull: false,
  )


  final int? pitchBoosted;



      /// Derived boosted yaw rate (rounded): yaw * boost_multiplier.yaw (defaults to 1 if missing).
  @JsonKey(
    
    name: r'yaw_boosted',
    required: false,
    includeIfNull: false,
  )


  final int? yawBoosted;



      /// Derived boosted roll rate (rounded): roll * boost_multiplier.roll (defaults to 1 if missing).
  @JsonKey(
    
    name: r'roll_boosted',
    required: false,
    includeIfNull: false,
  )


  final int? rollBoosted;



  @JsonKey(
    
    name: r'boost_capacitor',
    required: false,
    includeIfNull: false,
  )


  final FlightControllerBoostCapacitor? boostCapacitor;



  @JsonKey(
    
    name: r'boost_activation',
    required: false,
    includeIfNull: false,
  )


  final FlightControllerBoostActivation? boostActivation;



  @JsonKey(
    
    name: r'thruster_decay',
    required: false,
    includeIfNull: false,
  )


  final FlightControllerThrusterDecay? thrusterDecay;



  @JsonKey(
    
    name: r'multiplier',
    required: false,
    includeIfNull: false,
  )


  final FlightControllerMultiplier? multiplier;



  @JsonKey(
    
    name: r'boost_multiplier',
    required: false,
    includeIfNull: false,
  )


  final FlightControllerBoostMultiplier? boostMultiplier;



  @JsonKey(
    
    name: r'precision_mode',
    required: false,
    includeIfNull: false,
  )


  final FlightControllerPrecisionMode? precisionMode;



      /// Ship recall approach parameters.
  @JsonKey(
    
    name: r'recall_params',
    required: false,
    includeIfNull: false,
  )


  final FlightControllerRecallParams? recallParams;



      /// Collision warning thresholds.
  @JsonKey(
    
    name: r'collision_detection',
    required: false,
    includeIfNull: false,
  )


  final FlightControllerCollisionDetection? collisionDetection;



  @JsonKey(
    
    name: r'gravlev',
    required: false,
    includeIfNull: false,
  )


  final FlightControllerGravlev? gravlev;



      /// Flight parameters when the ship has no fuel.
  @JsonKey(
    
    name: r'no_fuel_params',
    required: false,
    includeIfNull: false,
  )


  final FlightNoFuelParams? noFuelParams;





    @override
    bool operator ==(Object other) => identical(this, other) || other is FlightController &&
      other.scmSpeed == scmSpeed &&
      other.boostSpeedForward == boostSpeedForward &&
      other.boostSpeedBackward == boostSpeedBackward &&
      other.maxSpeed == maxSpeed &&
      other.pitch == pitch &&
      other.yaw == yaw &&
      other.roll == roll &&
      other.pitchBoosted == pitchBoosted &&
      other.yawBoosted == yawBoosted &&
      other.rollBoosted == rollBoosted &&
      other.boostCapacitor == boostCapacitor &&
      other.boostActivation == boostActivation &&
      other.thrusterDecay == thrusterDecay &&
      other.multiplier == multiplier &&
      other.boostMultiplier == boostMultiplier &&
      other.precisionMode == precisionMode &&
      other.recallParams == recallParams &&
      other.collisionDetection == collisionDetection &&
      other.gravlev == gravlev &&
      other.noFuelParams == noFuelParams;

    @override
    int get hashCode =>
        (scmSpeed == null ? 0 : scmSpeed.hashCode) +
        (boostSpeedForward == null ? 0 : boostSpeedForward.hashCode) +
        (boostSpeedBackward == null ? 0 : boostSpeedBackward.hashCode) +
        (maxSpeed == null ? 0 : maxSpeed.hashCode) +
        (pitch == null ? 0 : pitch.hashCode) +
        (yaw == null ? 0 : yaw.hashCode) +
        (roll == null ? 0 : roll.hashCode) +
        pitchBoosted.hashCode +
        yawBoosted.hashCode +
        rollBoosted.hashCode +
        boostCapacitor.hashCode +
        boostActivation.hashCode +
        thrusterDecay.hashCode +
        multiplier.hashCode +
        boostMultiplier.hashCode +
        precisionMode.hashCode +
        (recallParams == null ? 0 : recallParams.hashCode) +
        (collisionDetection == null ? 0 : collisionDetection.hashCode) +
        gravlev.hashCode +
        (noFuelParams == null ? 0 : noFuelParams.hashCode);

  factory FlightController.fromJson(Map<String, dynamic> json) => _$FlightControllerFromJson(json);

  Map<String, dynamic> toJson() => _$FlightControllerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

