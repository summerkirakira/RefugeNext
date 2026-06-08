//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'blueprint_aspect_selection_group.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class BlueprintAspectSelectionGroup {
  /// Returns a new [BlueprintAspectSelectionGroup] instance.
  BlueprintAspectSelectionGroup({

     this.key,

     this.name,

     this.requiredCount,

     this.optionCount,
  });

      /// Internal key of the selection group
  @JsonKey(
    
    name: r'key',
    required: false,
    includeIfNull: false,
  )


  final String? key;



      /// Display name of the selection group
  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



      /// Number of options that must be selected
  @JsonKey(
    
    name: r'required_count',
    required: false,
    includeIfNull: false,
  )


  final int? requiredCount;



      /// Total number of available options
  @JsonKey(
    
    name: r'option_count',
    required: false,
    includeIfNull: false,
  )


  final int? optionCount;





    @override
    bool operator ==(Object other) => identical(this, other) || other is BlueprintAspectSelectionGroup &&
      other.key == key &&
      other.name == name &&
      other.requiredCount == requiredCount &&
      other.optionCount == optionCount;

    @override
    int get hashCode =>
        key.hashCode +
        name.hashCode +
        requiredCount.hashCode +
        optionCount.hashCode;

  factory BlueprintAspectSelectionGroup.fromJson(Map<String, dynamic> json) => _$BlueprintAspectSelectionGroupFromJson(json);

  Map<String, dynamic> toJson() => _$BlueprintAspectSelectionGroupToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

