//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'blueprint_modifier_quality_range.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class BlueprintModifierQualityRange {
  /// Returns a new [BlueprintModifierQualityRange] instance.
  BlueprintModifierQualityRange({

     this.min,

     this.max,
  });

      /// Minimum quality value
  @JsonKey(
    
    name: r'min',
    required: false,
    includeIfNull: false,
  )


  final double? min;



      /// Maximum quality value
  @JsonKey(
    
    name: r'max',
    required: false,
    includeIfNull: false,
  )


  final double? max;





    @override
    bool operator ==(Object other) => identical(this, other) || other is BlueprintModifierQualityRange &&
      other.min == min &&
      other.max == max;

    @override
    int get hashCode =>
        (min == null ? 0 : min.hashCode) +
        (max == null ? 0 : max.hashCode);

  factory BlueprintModifierQualityRange.fromJson(Map<String, dynamic> json) => _$BlueprintModifierQualityRangeFromJson(json);

  Map<String, dynamic> toJson() => _$BlueprintModifierQualityRangeToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

