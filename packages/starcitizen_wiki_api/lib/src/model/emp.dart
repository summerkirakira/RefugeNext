//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'emp.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Emp {
  /// Returns a new [Emp] instance.
  Emp({

     this.distortionDamage,

     this.empRadius,

     this.minEmpRadius,

     this.chargeDuration,

     this.unleashDuration,

     this.cooldownDuration,
  });

      /// Peak distortion damage applied at the center of the blast. Observed values: 1000 (S1), 1800-2475 (S2-S3), 2750-3300 (S4 variants).
  @JsonKey(
    
    name: r'distortion_damage',
    required: false,
    includeIfNull: false,
  )


  final double? distortionDamage;



      /// Maximum effective distortion radius in meters. Current items range from 400m (S1) up to 1100m (large ship EMPs).
  @JsonKey(
    
    name: r'emp_radius',
    required: false,
    includeIfNull: false,
  )


  final double? empRadius;



      /// Inner radius (m) guaranteed to receive full EMP effect before falloff begins. Presently 150m-250m.
  @JsonKey(
    
    name: r'min_emp_radius',
    required: false,
    includeIfNull: false,
  )


  final double? minEmpRadius;



      /// Seconds required to fully charge before firing. Current game data ranges 12-26 seconds across EMP sizes.
  @JsonKey(
    
    name: r'charge_duration',
    required: false,
    includeIfNull: false,
  )


  final double? chargeDuration;



      /// Duration in seconds the pulse is actively released after charging completes. Values are either 0.75s (small) or 1.5s (large).
  @JsonKey(
    
    name: r'unleash_duration',
    required: false,
    includeIfNull: false,
  )


  final double? unleashDuration;



      /// Cooldown in seconds before charging can restart. Current data spans 6-40 seconds depending on size and variant.
  @JsonKey(
    
    name: r'cooldown_duration',
    required: false,
    includeIfNull: false,
  )


  final double? cooldownDuration;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Emp &&
      other.distortionDamage == distortionDamage &&
      other.empRadius == empRadius &&
      other.minEmpRadius == minEmpRadius &&
      other.chargeDuration == chargeDuration &&
      other.unleashDuration == unleashDuration &&
      other.cooldownDuration == cooldownDuration;

    @override
    int get hashCode =>
        (distortionDamage == null ? 0 : distortionDamage.hashCode) +
        (empRadius == null ? 0 : empRadius.hashCode) +
        (minEmpRadius == null ? 0 : minEmpRadius.hashCode) +
        (chargeDuration == null ? 0 : chargeDuration.hashCode) +
        (unleashDuration == null ? 0 : unleashDuration.hashCode) +
        (cooldownDuration == null ? 0 : cooldownDuration.hashCode);

  factory Emp.fromJson(Map<String, dynamic> json) => _$EmpFromJson(json);

  Map<String, dynamic> toJson() => _$EmpToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

