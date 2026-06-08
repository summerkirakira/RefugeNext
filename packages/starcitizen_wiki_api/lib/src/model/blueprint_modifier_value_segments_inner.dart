//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'blueprint_modifier_value_segments_inner.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class BlueprintModifierValueSegmentsInner {
  /// Returns a new [BlueprintModifierValueSegmentsInner] instance.
  BlueprintModifierValueSegmentsInner({

     this.qualityMin,

     this.qualityMax,

     this.modifierAtStart,

     this.modifierAtEnd,
  });

      /// Start quality for this segment
  @JsonKey(
    
    name: r'quality_min',
    required: false,
    includeIfNull: false,
  )


  final int? qualityMin;



      /// End quality for this segment
  @JsonKey(
    
    name: r'quality_max',
    required: false,
    includeIfNull: false,
  )


  final int? qualityMax;



      /// Modifier value at quality_min
  @JsonKey(
    
    name: r'modifier_at_start',
    required: false,
    includeIfNull: false,
  )


  final double? modifierAtStart;



      /// Modifier value at quality_max
  @JsonKey(
    
    name: r'modifier_at_end',
    required: false,
    includeIfNull: false,
  )


  final double? modifierAtEnd;





    @override
    bool operator ==(Object other) => identical(this, other) || other is BlueprintModifierValueSegmentsInner &&
      other.qualityMin == qualityMin &&
      other.qualityMax == qualityMax &&
      other.modifierAtStart == modifierAtStart &&
      other.modifierAtEnd == modifierAtEnd;

    @override
    int get hashCode =>
        qualityMin.hashCode +
        qualityMax.hashCode +
        modifierAtStart.hashCode +
        modifierAtEnd.hashCode;

  factory BlueprintModifierValueSegmentsInner.fromJson(Map<String, dynamic> json) => _$BlueprintModifierValueSegmentsInnerFromJson(json);

  Map<String, dynamic> toJson() => _$BlueprintModifierValueSegmentsInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

