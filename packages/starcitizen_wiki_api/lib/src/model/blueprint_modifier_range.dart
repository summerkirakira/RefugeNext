//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'blueprint_modifier_range.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class BlueprintModifierRange {
  /// Returns a new [BlueprintModifierRange] instance.
  BlueprintModifierRange({

     this.atMinQuality,

     this.atMaxQuality,
  });

      /// Modifier value at minimum quality
  @JsonKey(
    
    name: r'at_min_quality',
    required: false,
    includeIfNull: false,
  )


  final double? atMinQuality;



      /// Modifier value at maximum quality
  @JsonKey(
    
    name: r'at_max_quality',
    required: false,
    includeIfNull: false,
  )


  final double? atMaxQuality;





    @override
    bool operator ==(Object other) => identical(this, other) || other is BlueprintModifierRange &&
      other.atMinQuality == atMinQuality &&
      other.atMaxQuality == atMaxQuality;

    @override
    int get hashCode =>
        (atMinQuality == null ? 0 : atMinQuality.hashCode) +
        (atMaxQuality == null ? 0 : atMaxQuality.hashCode);

  factory BlueprintModifierRange.fromJson(Map<String, dynamic> json) => _$BlueprintModifierRangeFromJson(json);

  Map<String, dynamic> toJson() => _$BlueprintModifierRangeToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

