//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/quantum_interdiction_generator_jamming.dart';
import 'package:starcitizen_wiki_api/src/model/quantum_interdiction_generator_power_fractions.dart';
import 'package:starcitizen_wiki_api/src/model/quantum_interdiction_generator_pulse.dart';
import 'package:json_annotation/json_annotation.dart';

part 'quantum_interdiction_generator.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class QuantumInterdictionGenerator {
  /// Returns a new [QuantumInterdictionGenerator] instance.
  QuantumInterdictionGenerator({

     this.powerFractions,

     this.jamming,

     this.pulse,

     this.interdictionRange,

     this.jammerRange,

     this.chargeDuration,

     this.activationDuration,

     this.dischargeDuration,

     this.cooldownDuration,

     this.disperseChargeDuration,
  });

      /// Fractions of the generator total power budget reserved for base/idle, pulse, and jammer phases.
  @JsonKey(
    
    name: r'power_fractions',
    required: false,
    includeIfNull: false,
  )


  final QuantumInterdictionGeneratorPowerFractions? powerFractions;



      /// Continuous interdiction field used to yank ships out of quantum travel.
  @JsonKey(
    
    name: r'jamming',
    required: false,
    includeIfNull: false,
  )


  final QuantumInterdictionGeneratorJamming? jamming;



      /// Quantum interdiction pulse (QIP) burst stats.
  @JsonKey(
    
    name: r'pulse',
    required: false,
    includeIfNull: false,
  )


  final QuantumInterdictionGeneratorPulse? pulse;



      /// Deprecated. Use `pulse.radius`.
  @Deprecated('interdictionRange has been deprecated')
  @JsonKey(
    
    name: r'interdiction_range',
    required: false,
    includeIfNull: false,
  )


  final double? interdictionRange;



      /// Deprecated. Use `jamming.range`.
  @Deprecated('jammerRange has been deprecated')
  @JsonKey(
    
    name: r'jammer_range',
    required: false,
    includeIfNull: false,
  )


  final double? jammerRange;



      /// Deprecated. Use `pulse.charge_time`.
  @Deprecated('chargeDuration has been deprecated')
  @JsonKey(
    
    name: r'charge_duration',
    required: false,
    includeIfNull: false,
  )


  final double? chargeDuration;



      /// Deprecated. Use `pulse.activation_phase_duration`.
  @Deprecated('activationDuration has been deprecated')
  @JsonKey(
    
    name: r'activation_duration',
    required: false,
    includeIfNull: false,
  )


  final double? activationDuration;



      /// Deprecated. Use `pulse.discharge_time`.
  @Deprecated('dischargeDuration has been deprecated')
  @JsonKey(
    
    name: r'discharge_duration',
    required: false,
    includeIfNull: false,
  )


  final double? dischargeDuration;



      /// Deprecated. Use `pulse.cooldown_time`.
  @Deprecated('cooldownDuration has been deprecated')
  @JsonKey(
    
    name: r'cooldown_duration',
    required: false,
    includeIfNull: false,
  )


  final double? cooldownDuration;



      /// Deprecated. Use `pulse.disperse_charge_time`.
  @Deprecated('disperseChargeDuration has been deprecated')
  @JsonKey(
    
    name: r'disperse_charge_duration',
    required: false,
    includeIfNull: false,
  )


  final double? disperseChargeDuration;





    @override
    bool operator ==(Object other) => identical(this, other) || other is QuantumInterdictionGenerator &&
      other.powerFractions == powerFractions &&
      other.jamming == jamming &&
      other.pulse == pulse &&
      other.interdictionRange == interdictionRange &&
      other.jammerRange == jammerRange &&
      other.chargeDuration == chargeDuration &&
      other.activationDuration == activationDuration &&
      other.dischargeDuration == dischargeDuration &&
      other.cooldownDuration == cooldownDuration &&
      other.disperseChargeDuration == disperseChargeDuration;

    @override
    int get hashCode =>
        (powerFractions == null ? 0 : powerFractions.hashCode) +
        (jamming == null ? 0 : jamming.hashCode) +
        (pulse == null ? 0 : pulse.hashCode) +
        (interdictionRange == null ? 0 : interdictionRange.hashCode) +
        (jammerRange == null ? 0 : jammerRange.hashCode) +
        (chargeDuration == null ? 0 : chargeDuration.hashCode) +
        (activationDuration == null ? 0 : activationDuration.hashCode) +
        (dischargeDuration == null ? 0 : dischargeDuration.hashCode) +
        (cooldownDuration == null ? 0 : cooldownDuration.hashCode) +
        (disperseChargeDuration == null ? 0 : disperseChargeDuration.hashCode);

  factory QuantumInterdictionGenerator.fromJson(Map<String, dynamic> json) => _$QuantumInterdictionGeneratorFromJson(json);

  Map<String, dynamic> toJson() => _$QuantumInterdictionGeneratorToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

