//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/blueprint_modifier_value_segments_inner.dart';
import 'package:starcitizen_wiki_api/src/model/blueprint_modifier_quality_range.dart';
import 'package:starcitizen_wiki_api/src/model/blueprint_modifier_range.dart';
import 'package:json_annotation/json_annotation.dart';

part 'blueprint_modifier.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class BlueprintModifier {
  /// Returns a new [BlueprintModifier] instance.
  BlueprintModifier({

     this.propertyKey,

     this.propertyUuid,

     this.label,

     this.betterWhen,

     this.qualityRange,

     this.modifierRange,

     this.valueRangeType,

     this.valueSegments,
  });

      /// Internal key identifying the modifier property
  @JsonKey(
    
    name: r'property_key',
    required: false,
    includeIfNull: false,
  )


  final String? propertyKey;



      /// UUID of the property definition, if available
  @JsonKey(
    
    name: r'property_uuid',
    required: false,
    includeIfNull: false,
  )


  final String? propertyUuid;



      /// Human-readable label for the modifier
  @JsonKey(
    
    name: r'label',
    required: false,
    includeIfNull: false,
  )


  final String? label;



      /// Indicates whether a higher or lower value is desirable
  @JsonKey(
    
    name: r'better_when',
    required: false,
    includeIfNull: false,
  )


  final BlueprintModifierBetterWhenEnum? betterWhen;



  @JsonKey(
    
    name: r'quality_range',
    required: false,
    includeIfNull: false,
  )


  final BlueprintModifierQualityRange? qualityRange;



  @JsonKey(
    
    name: r'modifier_range',
    required: false,
    includeIfNull: false,
  )


  final BlueprintModifierRange? modifierRange;



      /// Interpolation type for the modifier value range. When present, value_segments should be used for interpolation instead of the simple quality_range/modifier_range pair.
  @JsonKey(
    
    name: r'value_range_type',
    required: false,
    includeIfNull: false,
  )


  final BlueprintModifierValueRangeTypeEnum? valueRangeType;



      /// Multi-step interpolation segments. Each segment defines its own quality range and modifier start/end values. When present, use these for interpolation instead of quality_range/modifier_range.
  @JsonKey(
    
    name: r'value_segments',
    required: false,
    includeIfNull: false,
  )


  final List<BlueprintModifierValueSegmentsInner>? valueSegments;





    @override
    bool operator ==(Object other) => identical(this, other) || other is BlueprintModifier &&
      other.propertyKey == propertyKey &&
      other.propertyUuid == propertyUuid &&
      other.label == label &&
      other.betterWhen == betterWhen &&
      other.qualityRange == qualityRange &&
      other.modifierRange == modifierRange &&
      other.valueRangeType == valueRangeType &&
      other.valueSegments == valueSegments;

    @override
    int get hashCode =>
        propertyKey.hashCode +
        (propertyUuid == null ? 0 : propertyUuid.hashCode) +
        label.hashCode +
        (betterWhen == null ? 0 : betterWhen.hashCode) +
        qualityRange.hashCode +
        modifierRange.hashCode +
        (valueRangeType == null ? 0 : valueRangeType.hashCode) +
        (valueSegments == null ? 0 : valueSegments.hashCode);

  factory BlueprintModifier.fromJson(Map<String, dynamic> json) => _$BlueprintModifierFromJson(json);

  Map<String, dynamic> toJson() => _$BlueprintModifierToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// Indicates whether a higher or lower value is desirable
enum BlueprintModifierBetterWhenEnum {
    /// Indicates whether a higher or lower value is desirable
@JsonValue(r'higher')
higher(r'higher'),
    /// Indicates whether a higher or lower value is desirable
@JsonValue(r'lower')
lower(r'lower'),
    /// Indicates whether a higher or lower value is desirable
@JsonValue(r'neutral')
neutral(r'neutral');

const BlueprintModifierBetterWhenEnum(this.value);

final String value;

@override
String toString() => value;
}


/// Interpolation type for the modifier value range. When present, value_segments should be used for interpolation instead of the simple quality_range/modifier_range pair.
enum BlueprintModifierValueRangeTypeEnum {
    /// Interpolation type for the modifier value range. When present, value_segments should be used for interpolation instead of the simple quality_range/modifier_range pair.
@JsonValue(r'linear')
linear(r'linear');

const BlueprintModifierValueRangeTypeEnum(this.value);

final String value;

@override
String toString() => value;
}


