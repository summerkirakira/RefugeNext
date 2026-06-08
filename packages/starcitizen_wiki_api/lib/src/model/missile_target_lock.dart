//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'missile_target_lock.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MissileTargetLock {
  /// Returns a new [MissileTargetLock] instance.
  MissileTargetLock({

     this.signalResilienceMin,

     this.signalResilienceMax,

     this.rangeMax,

     this.rangeMin,

     this.angle,

     this.signalAmplifier,

     this.increaseRate,

     this.allowDumbFiring,
  });

      /// Minimum countermeasure resistance factor.
  @JsonKey(
    
    name: r'signal_resilience_min',
    required: false,
    includeIfNull: false,
  )


  final double? signalResilienceMin;



      /// Maximum countermeasure resistance factor.
  @JsonKey(
    
    name: r'signal_resilience_max',
    required: false,
    includeIfNull: false,
  )


  final double? signalResilienceMax;



      /// Maximum lock acquisition range in meters.
  @JsonKey(
    
    name: r'range_max',
    required: false,
    includeIfNull: false,
  )


  final double? rangeMax;



      /// Minimum lock acquisition range in meters.
  @JsonKey(
    
    name: r'range_min',
    required: false,
    includeIfNull: false,
  )


  final double? rangeMin;



      /// Maximum lock acquisition angle in degrees (cone of acquisition).
  @JsonKey(
    
    name: r'angle',
    required: false,
    includeIfNull: false,
  )


  final double? angle;



      /// Signal amplification factor applied during lock acquisition.
  @JsonKey(
    
    name: r'signal_amplifier',
    required: false,
    includeIfNull: false,
  )


  final double? signalAmplifier;



      /// Rate at which lock strength increases per second.
  @JsonKey(
    
    name: r'increase_rate',
    required: false,
    includeIfNull: false,
  )


  final double? increaseRate;



      /// Whether the missile can be manually fired without a target lock.
  @JsonKey(
    
    name: r'allow_dumb_firing',
    required: false,
    includeIfNull: false,
  )


  final bool? allowDumbFiring;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MissileTargetLock &&
      other.signalResilienceMin == signalResilienceMin &&
      other.signalResilienceMax == signalResilienceMax &&
      other.rangeMax == rangeMax &&
      other.rangeMin == rangeMin &&
      other.angle == angle &&
      other.signalAmplifier == signalAmplifier &&
      other.increaseRate == increaseRate &&
      other.allowDumbFiring == allowDumbFiring;

    @override
    int get hashCode =>
        (signalResilienceMin == null ? 0 : signalResilienceMin.hashCode) +
        (signalResilienceMax == null ? 0 : signalResilienceMax.hashCode) +
        (rangeMax == null ? 0 : rangeMax.hashCode) +
        (rangeMin == null ? 0 : rangeMin.hashCode) +
        (angle == null ? 0 : angle.hashCode) +
        (signalAmplifier == null ? 0 : signalAmplifier.hashCode) +
        (increaseRate == null ? 0 : increaseRate.hashCode) +
        (allowDumbFiring == null ? 0 : allowDumbFiring.hashCode);

  factory MissileTargetLock.fromJson(Map<String, dynamic> json) => _$MissileTargetLockFromJson(json);

  Map<String, dynamic> toJson() => _$MissileTargetLockToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

