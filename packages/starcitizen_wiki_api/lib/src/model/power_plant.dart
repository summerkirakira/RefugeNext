//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'power_plant.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PowerPlant {
  /// Returns a new [PowerPlant] instance.
  PowerPlant({

     this.powerOutput,

     this.powerSegmentGeneration,
  });

      /// Power draw value. Deprecated in favor of power_segment_generation for actual output measurement.
  @JsonKey(
    
    name: r'power_output',
    required: false,
    includeIfNull: false,
  )


  final double? powerOutput;



      /// Power segment generation rate from the resource network. This is the primary power output metric.
  @JsonKey(
    
    name: r'power_segment_generation',
    required: false,
    includeIfNull: false,
  )


  final double? powerSegmentGeneration;





    @override
    bool operator ==(Object other) => identical(this, other) || other is PowerPlant &&
      other.powerOutput == powerOutput &&
      other.powerSegmentGeneration == powerSegmentGeneration;

    @override
    int get hashCode =>
        (powerOutput == null ? 0 : powerOutput.hashCode) +
        (powerSegmentGeneration == null ? 0 : powerSegmentGeneration.hashCode);

  factory PowerPlant.fromJson(Map<String, dynamic> json) => _$PowerPlantFromJson(json);

  Map<String, dynamic> toJson() => _$PowerPlantToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

