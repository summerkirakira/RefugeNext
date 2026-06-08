//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'thruster_performance.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ThrusterPerformance {
  /// Returns a new [ThrusterPerformance] instance.
  ThrusterPerformance({

     this.thrustCapacity,

     this.maxSupportedAtmosphericEfficiency,

     this.minHealthThrustMultiplier,
  });

      /// Maximum thrust output in newtons.
  @JsonKey(
    
    name: r'thrust_capacity',
    required: false,
    includeIfNull: false,
  )


  final double? thrustCapacity;



      /// Cap for atmospheric efficiency scaling.
  @JsonKey(
    
    name: r'max_supported_atmospheric_efficiency',
    required: false,
    includeIfNull: false,
  )


  final double? maxSupportedAtmosphericEfficiency;



      /// Minimum thrust fraction when the thruster is at critical health (e.g., 0.25 = 25% thrust when badly damaged).
  @JsonKey(
    
    name: r'min_health_thrust_multiplier',
    required: false,
    includeIfNull: false,
  )


  final double? minHealthThrustMultiplier;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ThrusterPerformance &&
      other.thrustCapacity == thrustCapacity &&
      other.maxSupportedAtmosphericEfficiency == maxSupportedAtmosphericEfficiency &&
      other.minHealthThrustMultiplier == minHealthThrustMultiplier;

    @override
    int get hashCode =>
        (thrustCapacity == null ? 0 : thrustCapacity.hashCode) +
        (maxSupportedAtmosphericEfficiency == null ? 0 : maxSupportedAtmosphericEfficiency.hashCode) +
        (minHealthThrustMultiplier == null ? 0 : minHealthThrustMultiplier.hashCode);

  factory ThrusterPerformance.fromJson(Map<String, dynamic> json) => _$ThrusterPerformanceFromJson(json);

  Map<String, dynamic> toJson() => _$ThrusterPerformanceToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

