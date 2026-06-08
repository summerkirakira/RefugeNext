//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'flight_controller_boost_activation.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class FlightControllerBoostActivation {
  /// Returns a new [FlightControllerBoostActivation] instance.
  FlightControllerBoostActivation({

     this.preDelayTime,

     this.rampUpTime,

     this.rampDownTime,
  });

      /// Seconds of delay before afterburner thrust begins once activated.
  @JsonKey(
    
    name: r'pre_delay_time',
    required: false,
    includeIfNull: false,
  )


  final double? preDelayTime;



      /// Seconds to reach full afterburner output.
  @JsonKey(
    
    name: r'ramp_up_time',
    required: false,
    includeIfNull: false,
  )


  final double? rampUpTime;



      /// Seconds to decay from afterburner to normal thrust.
  @JsonKey(
    
    name: r'ramp_down_time',
    required: false,
    includeIfNull: false,
  )


  final double? rampDownTime;





    @override
    bool operator ==(Object other) => identical(this, other) || other is FlightControllerBoostActivation &&
      other.preDelayTime == preDelayTime &&
      other.rampUpTime == rampUpTime &&
      other.rampDownTime == rampDownTime;

    @override
    int get hashCode =>
        (preDelayTime == null ? 0 : preDelayTime.hashCode) +
        (rampUpTime == null ? 0 : rampUpTime.hashCode) +
        (rampDownTime == null ? 0 : rampDownTime.hashCode);

  factory FlightControllerBoostActivation.fromJson(Map<String, dynamic> json) => _$FlightControllerBoostActivationFromJson(json);

  Map<String, dynamic> toJson() => _$FlightControllerBoostActivationToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

