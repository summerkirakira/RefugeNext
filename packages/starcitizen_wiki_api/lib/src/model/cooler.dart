//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'cooler.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Cooler {
  /// Returns a new [Cooler] instance.
  Cooler({

     this.coolingRate,

     this.suppressionIrFactor,

     this.suppressionHeatFactor,

     this.coolantSegmentGeneration,
  });

      /// Maximum heat removal capacity (heat units per second). Higher numbers indicate stronger cooling performance. Size 1 military coolers like the Aegis Glacier are around 290,000 while heavy industrial units reach into the tens of millions.
  @JsonKey(
    
    name: r'cooling_rate',
    required: false,
    includeIfNull: false,
  )


  final double? coolingRate;



      /// Infrared signature multiplier applied while the cooler is operating. Values below 1.0 lower IR output; most production coolers use 0.1 (90% reduction).
  @JsonKey(
    
    name: r'suppression_ir_factor',
    required: false,
    includeIfNull: false,
  )


  final double? suppressionIrFactor;



      /// Overall heat signature multiplier contributed by the cooler. Commonly 0.1, indicating a significant reduction in emitted heat.
  @JsonKey(
    
    name: r'suppression_heat_factor',
    required: false,
    includeIfNull: false,
  )


  final double? suppressionHeatFactor;



      /// Coolant segment generation rate from resource network. Use this for actual cooling segment generation.
  @JsonKey(
    
    name: r'coolant_segment_generation',
    required: false,
    includeIfNull: false,
  )


  final double? coolantSegmentGeneration;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Cooler &&
      other.coolingRate == coolingRate &&
      other.suppressionIrFactor == suppressionIrFactor &&
      other.suppressionHeatFactor == suppressionHeatFactor &&
      other.coolantSegmentGeneration == coolantSegmentGeneration;

    @override
    int get hashCode =>
        (coolingRate == null ? 0 : coolingRate.hashCode) +
        (suppressionIrFactor == null ? 0 : suppressionIrFactor.hashCode) +
        (suppressionHeatFactor == null ? 0 : suppressionHeatFactor.hashCode) +
        (coolantSegmentGeneration == null ? 0 : coolantSegmentGeneration.hashCode);

  factory Cooler.fromJson(Map<String, dynamic> json) => _$CoolerFromJson(json);

  Map<String, dynamic> toJson() => _$CoolerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

