//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'item_power_connection.g.dart';


@Deprecated('ItemPowerConnection has been deprecated')
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ItemPowerConnection {
  /// Returns a new [ItemPowerConnection] instance.
  ItemPowerConnection({

     this.powerBase,

     this.powerDraw,

     this.throttleable,

     this.overclockable,

     this.overclockThresholdMin,

     this.overclockThresholdMax,

     this.overclockPerformance,

     this.overpowerPerformance,

     this.powerToEm,

     this.decayRateEm,

     this.emMin,

     this.emMax,
  });

  @JsonKey(
    
    name: r'power_base',
    required: false,
    includeIfNull: false,
  )


  final double? powerBase;



  @JsonKey(
    
    name: r'power_draw',
    required: false,
    includeIfNull: false,
  )


  final double? powerDraw;



      /// IsThrottleable
  @JsonKey(
    
    name: r'throttleable',
    required: false,
    includeIfNull: false,
  )


  final bool? throttleable;



      /// IsOverclockable
  @JsonKey(
    
    name: r'overclockable',
    required: false,
    includeIfNull: false,
  )


  final bool? overclockable;



  @JsonKey(
    
    name: r'overclock_threshold_min',
    required: false,
    includeIfNull: false,
  )


  final double? overclockThresholdMin;



  @JsonKey(
    
    name: r'overclock_threshold_max',
    required: false,
    includeIfNull: false,
  )


  final double? overclockThresholdMax;



  @JsonKey(
    
    name: r'overclock_performance',
    required: false,
    includeIfNull: false,
  )


  final double? overclockPerformance;



  @JsonKey(
    
    name: r'overpower_performance',
    required: false,
    includeIfNull: false,
  )


  final double? overpowerPerformance;



  @JsonKey(
    
    name: r'power_to_em',
    required: false,
    includeIfNull: false,
  )


  final double? powerToEm;



  @JsonKey(
    
    name: r'decay_rate_em',
    required: false,
    includeIfNull: false,
  )


  final double? decayRateEm;



      /// PowerBase * PowerToEm. Use ResourceNetwork data instead.
  @JsonKey(
    
    name: r'em_min',
    required: false,
    includeIfNull: false,
  )


  final double? emMin;



      /// PowerDraw * PowerToEm. Use ResourceNetwork data instead.
  @JsonKey(
    
    name: r'em_max',
    required: false,
    includeIfNull: false,
  )


  final double? emMax;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ItemPowerConnection &&
      other.powerBase == powerBase &&
      other.powerDraw == powerDraw &&
      other.throttleable == throttleable &&
      other.overclockable == overclockable &&
      other.overclockThresholdMin == overclockThresholdMin &&
      other.overclockThresholdMax == overclockThresholdMax &&
      other.overclockPerformance == overclockPerformance &&
      other.overpowerPerformance == overpowerPerformance &&
      other.powerToEm == powerToEm &&
      other.decayRateEm == decayRateEm &&
      other.emMin == emMin &&
      other.emMax == emMax;

    @override
    int get hashCode =>
        (powerBase == null ? 0 : powerBase.hashCode) +
        (powerDraw == null ? 0 : powerDraw.hashCode) +
        (throttleable == null ? 0 : throttleable.hashCode) +
        (overclockable == null ? 0 : overclockable.hashCode) +
        (overclockThresholdMin == null ? 0 : overclockThresholdMin.hashCode) +
        (overclockThresholdMax == null ? 0 : overclockThresholdMax.hashCode) +
        (overclockPerformance == null ? 0 : overclockPerformance.hashCode) +
        (overpowerPerformance == null ? 0 : overpowerPerformance.hashCode) +
        (powerToEm == null ? 0 : powerToEm.hashCode) +
        (decayRateEm == null ? 0 : decayRateEm.hashCode) +
        (emMin == null ? 0 : emMin.hashCode) +
        (emMax == null ? 0 : emMax.hashCode);

  factory ItemPowerConnection.fromJson(Map<String, dynamic> json) => _$ItemPowerConnectionFromJson(json);

  Map<String, dynamic> toJson() => _$ItemPowerConnectionToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

