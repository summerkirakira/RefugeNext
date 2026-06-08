//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'flight_controller_thruster_decay.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class FlightControllerThrusterDecay {
  /// Returns a new [FlightControllerThrusterDecay] instance.
  FlightControllerThrusterDecay({

     this.linearAccel,

     this.angularAccel,
  });

      /// Decay rate applied to linear acceleration over time.
  @JsonKey(
    
    name: r'linear_accel',
    required: false,
    includeIfNull: false,
  )


  final double? linearAccel;



      /// Decay rate applied to angular acceleration; higher values slow rotational response.
  @JsonKey(
    
    name: r'angular_accel',
    required: false,
    includeIfNull: false,
  )


  final double? angularAccel;





    @override
    bool operator ==(Object other) => identical(this, other) || other is FlightControllerThrusterDecay &&
      other.linearAccel == linearAccel &&
      other.angularAccel == angularAccel;

    @override
    int get hashCode =>
        (linearAccel == null ? 0 : linearAccel.hashCode) +
        (angularAccel == null ? 0 : angularAccel.hashCode);

  factory FlightControllerThrusterDecay.fromJson(Map<String, dynamic> json) => _$FlightControllerThrusterDecayFromJson(json);

  Map<String, dynamic> toJson() => _$FlightControllerThrusterDecayToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

