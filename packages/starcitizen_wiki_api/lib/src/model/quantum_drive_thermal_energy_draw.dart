//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'quantum_drive_thermal_energy_draw.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class QuantumDriveThermalEnergyDraw {
  /// Returns a new [QuantumDriveThermalEnergyDraw] instance.
  QuantumDriveThermalEnergyDraw({

     this.preRampUp,

     this.rampUp,

     this.inFlight,

     this.rampDown,

     this.postRampDown,
  });

  @JsonKey(
    
    name: r'pre_ramp_up',
    required: false,
    includeIfNull: false,
  )


  final double? preRampUp;



  @JsonKey(
    
    name: r'ramp_up',
    required: false,
    includeIfNull: false,
  )


  final double? rampUp;



  @JsonKey(
    
    name: r'in_flight',
    required: false,
    includeIfNull: false,
  )


  final double? inFlight;



  @JsonKey(
    
    name: r'ramp_down',
    required: false,
    includeIfNull: false,
  )


  final double? rampDown;



  @JsonKey(
    
    name: r'post_ramp_down',
    required: false,
    includeIfNull: false,
  )


  final double? postRampDown;





    @override
    bool operator ==(Object other) => identical(this, other) || other is QuantumDriveThermalEnergyDraw &&
      other.preRampUp == preRampUp &&
      other.rampUp == rampUp &&
      other.inFlight == inFlight &&
      other.rampDown == rampDown &&
      other.postRampDown == postRampDown;

    @override
    int get hashCode =>
        (preRampUp == null ? 0 : preRampUp.hashCode) +
        (rampUp == null ? 0 : rampUp.hashCode) +
        (inFlight == null ? 0 : inFlight.hashCode) +
        (rampDown == null ? 0 : rampDown.hashCode) +
        (postRampDown == null ? 0 : postRampDown.hashCode);

  factory QuantumDriveThermalEnergyDraw.fromJson(Map<String, dynamic> json) => _$QuantumDriveThermalEnergyDrawFromJson(json);

  Map<String, dynamic> toJson() => _$QuantumDriveThermalEnergyDrawToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

