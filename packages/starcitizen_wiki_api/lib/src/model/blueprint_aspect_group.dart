//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'blueprint_aspect_group.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class BlueprintAspectGroup {
  /// Returns a new [BlueprintAspectGroup] instance.
  BlueprintAspectGroup({

     this.key,

     this.name,

     this.displayName,

     this.requiredCount,

     this.optionCount,

     this.isChoiceGroup,

     this.selectedCount,

     this.aspectIndexes,
  });

      /// Internal key of the aspect group
  @JsonKey(
    
    name: r'key',
    required: false,
    includeIfNull: false,
  )


  final String? key;



      /// Display name of the aspect group
  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



      /// User-facing display name, null if generic
  @JsonKey(
    
    name: r'display_name',
    required: false,
    includeIfNull: false,
  )


  final String? displayName;



      /// Number of aspects that must be selected
  @JsonKey(
    
    name: r'required_count',
    required: false,
    includeIfNull: false,
  )


  final int? requiredCount;



      /// Total number of aspect options
  @JsonKey(
    
    name: r'option_count',
    required: false,
    includeIfNull: false,
  )


  final int? optionCount;



      /// Whether this is a choice group (required < options)
  @JsonKey(
    
    name: r'is_choice_group',
    required: false,
    includeIfNull: false,
  )


  final bool? isChoiceGroup;



      /// Number of aspects selected by default
  @JsonKey(
    
    name: r'selected_count',
    required: false,
    includeIfNull: false,
  )


  final int? selectedCount;



      /// Indexes into the aspects array for this group
  @JsonKey(
    
    name: r'aspect_indexes',
    required: false,
    includeIfNull: false,
  )


  final List<int>? aspectIndexes;





    @override
    bool operator ==(Object other) => identical(this, other) || other is BlueprintAspectGroup &&
      other.key == key &&
      other.name == name &&
      other.displayName == displayName &&
      other.requiredCount == requiredCount &&
      other.optionCount == optionCount &&
      other.isChoiceGroup == isChoiceGroup &&
      other.selectedCount == selectedCount &&
      other.aspectIndexes == aspectIndexes;

    @override
    int get hashCode =>
        key.hashCode +
        name.hashCode +
        (displayName == null ? 0 : displayName.hashCode) +
        requiredCount.hashCode +
        optionCount.hashCode +
        isChoiceGroup.hashCode +
        selectedCount.hashCode +
        aspectIndexes.hashCode;

  factory BlueprintAspectGroup.fromJson(Map<String, dynamic> json) => _$BlueprintAspectGroupFromJson(json);

  Map<String, dynamic> toJson() => _$BlueprintAspectGroupToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

