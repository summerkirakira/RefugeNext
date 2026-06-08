//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'tractor_beam_range.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TractorBeamRange {
  /// Returns a new [TractorBeamRange] instance.
  TractorBeamRange({

     this.min,

     this.max,

     this.fullStrengthDistance,

     this.maxAngle,

     this.hitRadius,
  });

      /// Minimum effective distance.
  @JsonKey(
    
    name: r'min',
    required: false,
    includeIfNull: false,
  )


  final double? min;



      /// Maximum effective distance.
  @JsonKey(
    
    name: r'max',
    required: false,
    includeIfNull: false,
  )


  final double? max;



      /// Distance at which full beam strength is maintained, in meters.
  @JsonKey(
    
    name: r'full_strength_distance',
    required: false,
    includeIfNull: false,
  )


  final double? fullStrengthDistance;



      /// Maximum beam cone angle in degrees.
  @JsonKey(
    
    name: r'max_angle',
    required: false,
    includeIfNull: false,
  )


  final double? maxAngle;



      /// Beam hit detection radius.
  @JsonKey(
    
    name: r'hit_radius',
    required: false,
    includeIfNull: false,
  )


  final double? hitRadius;





    @override
    bool operator ==(Object other) => identical(this, other) || other is TractorBeamRange &&
      other.min == min &&
      other.max == max &&
      other.fullStrengthDistance == fullStrengthDistance &&
      other.maxAngle == maxAngle &&
      other.hitRadius == hitRadius;

    @override
    int get hashCode =>
        (min == null ? 0 : min.hashCode) +
        (max == null ? 0 : max.hashCode) +
        (fullStrengthDistance == null ? 0 : fullStrengthDistance.hashCode) +
        (maxAngle == null ? 0 : maxAngle.hashCode) +
        (hitRadius == null ? 0 : hitRadius.hashCode);

  factory TractorBeamRange.fromJson(Map<String, dynamic> json) => _$TractorBeamRangeFromJson(json);

  Map<String, dynamic> toJson() => _$TractorBeamRangeToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

