//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'item_distortion.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ItemDistortion {
  /// Returns a new [ItemDistortion] instance.
  ItemDistortion({

     this.decayRate,

     this.decayDelay,

     this.max,

     this.maximum,

     this.overloadRatio,

     this.warningRatio,

     this.recoveryRatio,

     this.recoveryTime,

     this.powerRatioAtMaxDistortion,

     this.powerChangeOnlyAtMaxDistortion,

     this.shutdownTime,
  });

      /// Rate at which distortion damage recovers per second. Higher values mean faster recovery.
  @JsonKey(
    
    name: r'decay_rate',
    required: false,
    includeIfNull: false,
  )


  final double? decayRate;



      /// Delay in seconds before distortion recovery begins after taking damage.
  @JsonKey(
    
    name: r'decay_delay',
    required: false,
    includeIfNull: false,
  )


  final double? decayDelay;



      /// Maximum distortion pool capacity, total distortion damage the item can absorb before shutting down.
  @JsonKey(
    
    name: r'max',
    required: false,
    includeIfNull: false,
  )


  final double? max;



      /// Deprecated: Use max.
  @Deprecated('maximum has been deprecated')
  @JsonKey(
    
    name: r'maximum',
    required: false,
    includeIfNull: false,
  )


  final double? maximum;



      /// Deprecated: Does not exist in game data.
  @Deprecated('overloadRatio has been deprecated')
  @JsonKey(
    
    name: r'overload_ratio',
    required: false,
    includeIfNull: false,
  )


  final double? overloadRatio;



      /// Ratio of max at which a distortion warning indicator triggers (e.g. 0.75 = warning at 75%).
  @JsonKey(
    
    name: r'warning_ratio',
    required: false,
    includeIfNull: false,
  )


  final double? warningRatio;



      /// Threshold below which distortion must fall before the item reactivates after overload. 0 = immediate recovery.
  @JsonKey(
    
    name: r'recovery_ratio',
    required: false,
    includeIfNull: false,
  )


  final double? recoveryRatio;



      /// Deprecated: Does not exist in game data.
  @Deprecated('recoveryTime has been deprecated')
  @JsonKey(
    
    name: r'recovery_time',
    required: false,
    includeIfNull: false,
  )


  final double? recoveryTime;



      /// Power output ratio at maximum distortion. Currently always 0 (reserved for future use).
  @JsonKey(
    
    name: r'power_ratio_at_max_distortion',
    required: false,
    includeIfNull: false,
  )


  final double? powerRatioAtMaxDistortion;



      /// Whether power output only changes when distortion reaches maximum (1 = yes, 0 = gradual).
  @JsonKey(
    
    name: r'power_change_only_at_max_distortion',
    required: false,
    includeIfNull: false,
  )


  final int? powerChangeOnlyAtMaxDistortion;



      /// Computed duration in seconds the item remains shut down (Maximum / DecayRate + DecayDelay).
  @JsonKey(
    
    name: r'shutdown_time',
    required: false,
    includeIfNull: false,
  )


  final double? shutdownTime;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ItemDistortion &&
      other.decayRate == decayRate &&
      other.decayDelay == decayDelay &&
      other.max == max &&
      other.maximum == maximum &&
      other.overloadRatio == overloadRatio &&
      other.warningRatio == warningRatio &&
      other.recoveryRatio == recoveryRatio &&
      other.recoveryTime == recoveryTime &&
      other.powerRatioAtMaxDistortion == powerRatioAtMaxDistortion &&
      other.powerChangeOnlyAtMaxDistortion == powerChangeOnlyAtMaxDistortion &&
      other.shutdownTime == shutdownTime;

    @override
    int get hashCode =>
        (decayRate == null ? 0 : decayRate.hashCode) +
        (decayDelay == null ? 0 : decayDelay.hashCode) +
        (max == null ? 0 : max.hashCode) +
        (maximum == null ? 0 : maximum.hashCode) +
        (overloadRatio == null ? 0 : overloadRatio.hashCode) +
        (warningRatio == null ? 0 : warningRatio.hashCode) +
        (recoveryRatio == null ? 0 : recoveryRatio.hashCode) +
        (recoveryTime == null ? 0 : recoveryTime.hashCode) +
        (powerRatioAtMaxDistortion == null ? 0 : powerRatioAtMaxDistortion.hashCode) +
        (powerChangeOnlyAtMaxDistortion == null ? 0 : powerChangeOnlyAtMaxDistortion.hashCode) +
        (shutdownTime == null ? 0 : shutdownTime.hashCode);

  factory ItemDistortion.fromJson(Map<String, dynamic> json) => _$ItemDistortionFromJson(json);

  Map<String, dynamic> toJson() => _$ItemDistortionToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

