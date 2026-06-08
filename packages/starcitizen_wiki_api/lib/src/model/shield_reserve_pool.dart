//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'shield_reserve_pool.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ShieldReservePool {
  /// Returns a new [ShieldReservePool] instance.
  ShieldReservePool({

     this.regenRate,

     this.regenTime,

     this.initialHealthRatio,

     this.maxHealthRatio,

     this.regenRateRatio,

     this.drainRateRatio,
  });

      /// Reserve pool maximum regeneration rate.
  @JsonKey(
    
    name: r'regen_rate',
    required: false,
    includeIfNull: false,
  )


  final double? regenRate;



      /// Reserve pool regeneration time in seconds.
  @JsonKey(
    
    name: r'regen_time',
    required: false,
    includeIfNull: false,
  )


  final double? regenTime;



      /// Reserve pool initial health ratio.
  @JsonKey(
    
    name: r'initial_health_ratio',
    required: false,
    includeIfNull: false,
  )


  final double? initialHealthRatio;



      /// Reserve pool maximum health ratio.
  @JsonKey(
    
    name: r'max_health_ratio',
    required: false,
    includeIfNull: false,
  )


  final double? maxHealthRatio;



      /// Reserve pool regeneration rate ratio.
  @JsonKey(
    
    name: r'regen_rate_ratio',
    required: false,
    includeIfNull: false,
  )


  final double? regenRateRatio;



      /// Reserve pool drain rate ratio.
  @JsonKey(
    
    name: r'drain_rate_ratio',
    required: false,
    includeIfNull: false,
  )


  final double? drainRateRatio;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ShieldReservePool &&
      other.regenRate == regenRate &&
      other.regenTime == regenTime &&
      other.initialHealthRatio == initialHealthRatio &&
      other.maxHealthRatio == maxHealthRatio &&
      other.regenRateRatio == regenRateRatio &&
      other.drainRateRatio == drainRateRatio;

    @override
    int get hashCode =>
        (regenRate == null ? 0 : regenRate.hashCode) +
        (regenTime == null ? 0 : regenTime.hashCode) +
        (initialHealthRatio == null ? 0 : initialHealthRatio.hashCode) +
        (maxHealthRatio == null ? 0 : maxHealthRatio.hashCode) +
        (regenRateRatio == null ? 0 : regenRateRatio.hashCode) +
        (drainRateRatio == null ? 0 : drainRateRatio.hashCode);

  factory ShieldReservePool.fromJson(Map<String, dynamic> json) => _$ShieldReservePoolFromJson(json);

  Map<String, dynamic> toJson() => _$ShieldReservePoolToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

