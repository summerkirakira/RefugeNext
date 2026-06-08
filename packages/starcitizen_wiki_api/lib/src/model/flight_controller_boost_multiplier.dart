//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/flight_controller_signed_axis_multiplier.dart';
import 'package:json_annotation/json_annotation.dart';

part 'flight_controller_boost_multiplier.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class FlightControllerBoostMultiplier {
  /// Returns a new [FlightControllerBoostMultiplier] instance.
  FlightControllerBoostMultiplier({

     this.accelX,

     this.accelY,

     this.accelZ,

     this.pitch,

     this.yaw,

     this.roll,

     this.pitchAccel,

     this.yawAccel,

     this.rollAccel,
  });

  @JsonKey(
    
    name: r'accel_x',
    required: false,
    includeIfNull: false,
  )


  final FlightControllerSignedAxisMultiplier? accelX;



  @JsonKey(
    
    name: r'accel_y',
    required: false,
    includeIfNull: false,
  )


  final FlightControllerSignedAxisMultiplier? accelY;



  @JsonKey(
    
    name: r'accel_z',
    required: false,
    includeIfNull: false,
  )


  final FlightControllerSignedAxisMultiplier? accelZ;



      /// Angular rate multiplier for pitch.
  @JsonKey(
    
    name: r'pitch',
    required: false,
    includeIfNull: false,
  )


  final double? pitch;



      /// Angular rate multiplier for yaw.
  @JsonKey(
    
    name: r'yaw',
    required: false,
    includeIfNull: false,
  )


  final double? yaw;



      /// Angular rate multiplier for roll.
  @JsonKey(
    
    name: r'roll',
    required: false,
    includeIfNull: false,
  )


  final double? roll;



      /// Angular acceleration multiplier for pitch.
  @JsonKey(
    
    name: r'pitch_accel',
    required: false,
    includeIfNull: false,
  )


  final double? pitchAccel;



      /// Angular acceleration multiplier for yaw.
  @JsonKey(
    
    name: r'yaw_accel',
    required: false,
    includeIfNull: false,
  )


  final double? yawAccel;



      /// Angular acceleration multiplier for roll.
  @JsonKey(
    
    name: r'roll_accel',
    required: false,
    includeIfNull: false,
  )


  final double? rollAccel;





    @override
    bool operator ==(Object other) => identical(this, other) || other is FlightControllerBoostMultiplier &&
      other.accelX == accelX &&
      other.accelY == accelY &&
      other.accelZ == accelZ &&
      other.pitch == pitch &&
      other.yaw == yaw &&
      other.roll == roll &&
      other.pitchAccel == pitchAccel &&
      other.yawAccel == yawAccel &&
      other.rollAccel == rollAccel;

    @override
    int get hashCode =>
        accelX.hashCode +
        accelY.hashCode +
        accelZ.hashCode +
        (pitch == null ? 0 : pitch.hashCode) +
        (yaw == null ? 0 : yaw.hashCode) +
        (roll == null ? 0 : roll.hashCode) +
        (pitchAccel == null ? 0 : pitchAccel.hashCode) +
        (yawAccel == null ? 0 : yawAccel.hashCode) +
        (rollAccel == null ? 0 : rollAccel.hashCode);

  factory FlightControllerBoostMultiplier.fromJson(Map<String, dynamic> json) => _$FlightControllerBoostMultiplierFromJson(json);

  Map<String, dynamic> toJson() => _$FlightControllerBoostMultiplierToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

