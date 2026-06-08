//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'quantum_interdiction_generator_jamming.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class QuantumInterdictionGeneratorJamming {
  /// Returns a new [QuantumInterdictionGeneratorJamming] instance.
  QuantumInterdictionGeneratorJamming({

     this.range,

     this.maxPowerDraw,

     this.greenZoneCheckRange,
  });

      /// Effective jamming radius in meters.
  @JsonKey(
    
    name: r'range',
    required: false,
    includeIfNull: false,
  )


  final double? range;



      /// Peak power draw while the jammer is active.
  @JsonKey(
    
    name: r'max_power_draw',
    required: false,
    includeIfNull: false,
  )


  final double? maxPowerDraw;



      /// Safety buffer around restricted areas.
  @JsonKey(
    
    name: r'green_zone_check_range',
    required: false,
    includeIfNull: false,
  )


  final double? greenZoneCheckRange;





    @override
    bool operator ==(Object other) => identical(this, other) || other is QuantumInterdictionGeneratorJamming &&
      other.range == range &&
      other.maxPowerDraw == maxPowerDraw &&
      other.greenZoneCheckRange == greenZoneCheckRange;

    @override
    int get hashCode =>
        (range == null ? 0 : range.hashCode) +
        (maxPowerDraw == null ? 0 : maxPowerDraw.hashCode) +
        (greenZoneCheckRange == null ? 0 : greenZoneCheckRange.hashCode);

  factory QuantumInterdictionGeneratorJamming.fromJson(Map<String, dynamic> json) => _$QuantumInterdictionGeneratorJammingFromJson(json);

  Map<String, dynamic> toJson() => _$QuantumInterdictionGeneratorJammingToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

