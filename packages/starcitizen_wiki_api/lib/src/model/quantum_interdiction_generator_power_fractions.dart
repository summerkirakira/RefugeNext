//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'quantum_interdiction_generator_power_fractions.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class QuantumInterdictionGeneratorPowerFractions {
  /// Returns a new [QuantumInterdictionGeneratorPowerFractions] instance.
  QuantumInterdictionGeneratorPowerFractions({

     this.base_,

     this.pulse,

     this.jammer,
  });

      /// Power fraction allocated to base idle operation.
  @JsonKey(
    
    name: r'base',
    required: false,
    includeIfNull: false,
  )


  final double? base_;



      /// Power fraction allocated to pulse operations.
  @JsonKey(
    
    name: r'pulse',
    required: false,
    includeIfNull: false,
  )


  final double? pulse;



      /// Power fraction allocated to jammer operations.
  @JsonKey(
    
    name: r'jammer',
    required: false,
    includeIfNull: false,
  )


  final double? jammer;





    @override
    bool operator ==(Object other) => identical(this, other) || other is QuantumInterdictionGeneratorPowerFractions &&
      other.base_ == base_ &&
      other.pulse == pulse &&
      other.jammer == jammer;

    @override
    int get hashCode =>
        (base_ == null ? 0 : base_.hashCode) +
        (pulse == null ? 0 : pulse.hashCode) +
        (jammer == null ? 0 : jammer.hashCode);

  factory QuantumInterdictionGeneratorPowerFractions.fromJson(Map<String, dynamic> json) => _$QuantumInterdictionGeneratorPowerFractionsFromJson(json);

  Map<String, dynamic> toJson() => _$QuantumInterdictionGeneratorPowerFractionsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

