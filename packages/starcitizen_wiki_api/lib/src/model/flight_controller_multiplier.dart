//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'flight_controller_multiplier.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class FlightControllerMultiplier {
  /// Returns a new [FlightControllerMultiplier] instance.
  FlightControllerMultiplier({

     this.torqueImbalance,

     this.lift,

     this.drag,

     this.scmMaxDrag,

     this.precisionLanding,
  });

      /// Multiplier applied when torque imbalance is detected to stabilize rotation.
  @JsonKey(
    
    name: r'torque_imbalance',
    required: false,
    includeIfNull: false,
  )


  final double? torqueImbalance;



      /// Vertical thrust multiplier affecting VTOL and hover authority. Higher values increase upward thrust strength.
  @JsonKey(
    
    name: r'lift',
    required: false,
    includeIfNull: false,
  )


  final double? lift;



      /// Drag multiplier scaling atmospheric drag calculations.
  @JsonKey(
    
    name: r'drag',
    required: false,
    includeIfNull: false,
  )


  final double? drag;



      /// Drag multiplier applied specifically while in SCM flight.
  @JsonKey(
    
    name: r'scm_max_drag',
    required: false,
    includeIfNull: false,
  )


  final double? scmMaxDrag;



      /// Multiplier applied to maneuvering inputs during precision landing to soften responses.
  @JsonKey(
    
    name: r'precision_landing',
    required: false,
    includeIfNull: false,
  )


  final double? precisionLanding;





    @override
    bool operator ==(Object other) => identical(this, other) || other is FlightControllerMultiplier &&
      other.torqueImbalance == torqueImbalance &&
      other.lift == lift &&
      other.drag == drag &&
      other.scmMaxDrag == scmMaxDrag &&
      other.precisionLanding == precisionLanding;

    @override
    int get hashCode =>
        (torqueImbalance == null ? 0 : torqueImbalance.hashCode) +
        (lift == null ? 0 : lift.hashCode) +
        (drag == null ? 0 : drag.hashCode) +
        (scmMaxDrag == null ? 0 : scmMaxDrag.hashCode) +
        (precisionLanding == null ? 0 : precisionLanding.hashCode);

  factory FlightControllerMultiplier.fromJson(Map<String, dynamic> json) => _$FlightControllerMultiplierFromJson(json);

  Map<String, dynamic> toJson() => _$FlightControllerMultiplierToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

