//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/thruster_handling.dart';
import 'package:starcitizen_wiki_api/src/model/thruster_fuel.dart';
import 'package:starcitizen_wiki_api/src/model/thruster_backwash.dart';
import 'package:starcitizen_wiki_api/src/model/thruster_performance.dart';
import 'package:json_annotation/json_annotation.dart';

part 'thruster.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Thruster {
  /// Returns a new [Thruster] instance.
  Thruster({

     this.performance,

     this.fuel,

     this.role,

     this.vtolOnly,

     this.backwash,

     this.handling,

     this.thrustCapacity,

     this.minHealthThrustMultiplier,

     this.fuelBurnPer10kNewton,

     this.type,
  });

  @JsonKey(
    
    name: r'performance',
    required: false,
    includeIfNull: false,
  )


  final ThrusterPerformance? performance;



  @JsonKey(
    
    name: r'fuel',
    required: false,
    includeIfNull: false,
  )


  final ThrusterFuel? fuel;



      /// Thruster role within the ship: Main, Maneuver, or Retro.
  @JsonKey(
    
    name: r'role',
    required: false,
    includeIfNull: false,
  )


  final String? role;



      /// True if the thruster only activates in VTOL mode.
  @JsonKey(
    
    name: r'vtol_only',
    required: false,
    includeIfNull: false,
  )


  final bool? vtolOnly;



  @JsonKey(
    
    name: r'backwash',
    required: false,
    includeIfNull: false,
  )


  final ThrusterBackwash? backwash;



  @JsonKey(
    
    name: r'handling',
    required: false,
    includeIfNull: false,
  )


  final ThrusterHandling? handling;



      /// Deprecated. Use performance.thrust_capacity.
  @Deprecated('thrustCapacity has been deprecated')
  @JsonKey(
    
    name: r'thrust_capacity',
    required: false,
    includeIfNull: false,
  )


  final double? thrustCapacity;



      /// Deprecated. Use performance.min_health_thrust_multiplier.
  @Deprecated('minHealthThrustMultiplier has been deprecated')
  @JsonKey(
    
    name: r'min_health_thrust_multiplier',
    required: false,
    includeIfNull: false,
  )


  final double? minHealthThrustMultiplier;



      /// Deprecated. Use fuel.burn_rate_per_10k_newton.
  @Deprecated('fuelBurnPer10kNewton has been deprecated')
  @JsonKey(
    
    name: r'fuel_burn_per_10k_newton',
    required: false,
    includeIfNull: false,
  )


  final double? fuelBurnPer10kNewton;



      /// Deprecated. Use role.
  @Deprecated('type has been deprecated')
  @JsonKey(
    
    name: r'type',
    required: false,
    includeIfNull: false,
  )


  final String? type;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Thruster &&
      other.performance == performance &&
      other.fuel == fuel &&
      other.role == role &&
      other.vtolOnly == vtolOnly &&
      other.backwash == backwash &&
      other.handling == handling &&
      other.thrustCapacity == thrustCapacity &&
      other.minHealthThrustMultiplier == minHealthThrustMultiplier &&
      other.fuelBurnPer10kNewton == fuelBurnPer10kNewton &&
      other.type == type;

    @override
    int get hashCode =>
        (performance == null ? 0 : performance.hashCode) +
        (fuel == null ? 0 : fuel.hashCode) +
        (role == null ? 0 : role.hashCode) +
        (vtolOnly == null ? 0 : vtolOnly.hashCode) +
        (backwash == null ? 0 : backwash.hashCode) +
        (handling == null ? 0 : handling.hashCode) +
        (thrustCapacity == null ? 0 : thrustCapacity.hashCode) +
        (minHealthThrustMultiplier == null ? 0 : minHealthThrustMultiplier.hashCode) +
        (fuelBurnPer10kNewton == null ? 0 : fuelBurnPer10kNewton.hashCode) +
        (type == null ? 0 : type.hashCode);

  factory Thruster.fromJson(Map<String, dynamic> json) => _$ThrusterFromJson(json);

  Map<String, dynamic> toJson() => _$ThrusterToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

