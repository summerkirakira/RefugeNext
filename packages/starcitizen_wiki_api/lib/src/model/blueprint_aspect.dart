//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/blueprint_modifier.dart';
import 'package:starcitizen_wiki_api/src/model/blueprint_aspect_selection_group.dart';
import 'package:starcitizen_wiki_api/src/model/blueprint_aspect_input.dart';
import 'package:json_annotation/json_annotation.dart';

part 'blueprint_aspect.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class BlueprintAspect {
  /// Returns a new [BlueprintAspect] instance.
  BlueprintAspect({

     this.key,

     this.name,

     this.requiredCount,

     this.selectionGroup,

     this.input,

     this.modifiers,

     this.initialQuality,

     this.sliderMin,

     this.sliderMax,

     this.hasModifiers,

     this.hasDynamicModifiers,

     this.isSelected,
  });

      /// Internal key of the aspect
  @JsonKey(
    
    name: r'key',
    required: false,
    includeIfNull: false,
  )


  final String? key;



      /// Display name of the aspect
  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



      /// Required count from parent group
  @JsonKey(
    
    name: r'required_count',
    required: false,
    includeIfNull: false,
  )


  final int? requiredCount;



  @JsonKey(
    
    name: r'selection_group',
    required: false,
    includeIfNull: false,
  )


  final BlueprintAspectSelectionGroup? selectionGroup;



  @JsonKey(
    
    name: r'input',
    required: false,
    includeIfNull: false,
  )


  final BlueprintAspectInput? input;



      /// Quality-dependent modifier effects
  @JsonKey(
    
    name: r'modifiers',
    required: false,
    includeIfNull: false,
  )


  final List<BlueprintModifier>? modifiers;



      /// Default quality slider position
  @JsonKey(
    
    name: r'initial_quality',
    required: false,
    includeIfNull: false,
  )


  final int? initialQuality;



      /// Minimum quality slider value
  @JsonKey(
    
    name: r'slider_min',
    required: false,
    includeIfNull: false,
  )


  final int? sliderMin;



      /// Maximum quality slider value
  @JsonKey(
    
    name: r'slider_max',
    required: false,
    includeIfNull: false,
  )


  final int? sliderMax;



      /// Whether this aspect has any modifiers
  @JsonKey(
    
    name: r'has_modifiers',
    required: false,
    includeIfNull: false,
  )


  final bool? hasModifiers;



      /// Whether modifiers change with quality
  @JsonKey(
    
    name: r'has_dynamic_modifiers',
    required: false,
    includeIfNull: false,
  )


  final bool? hasDynamicModifiers;



      /// Whether this aspect is selected by default
  @JsonKey(
    
    name: r'is_selected',
    required: false,
    includeIfNull: false,
  )


  final bool? isSelected;





    @override
    bool operator ==(Object other) => identical(this, other) || other is BlueprintAspect &&
      other.key == key &&
      other.name == name &&
      other.requiredCount == requiredCount &&
      other.selectionGroup == selectionGroup &&
      other.input == input &&
      other.modifiers == modifiers &&
      other.initialQuality == initialQuality &&
      other.sliderMin == sliderMin &&
      other.sliderMax == sliderMax &&
      other.hasModifiers == hasModifiers &&
      other.hasDynamicModifiers == hasDynamicModifiers &&
      other.isSelected == isSelected;

    @override
    int get hashCode =>
        key.hashCode +
        name.hashCode +
        (requiredCount == null ? 0 : requiredCount.hashCode) +
        (selectionGroup == null ? 0 : selectionGroup.hashCode) +
        input.hashCode +
        modifiers.hashCode +
        initialQuality.hashCode +
        sliderMin.hashCode +
        sliderMax.hashCode +
        hasModifiers.hashCode +
        hasDynamicModifiers.hashCode +
        isSelected.hashCode;

  factory BlueprintAspect.fromJson(Map<String, dynamic> json) => _$BlueprintAspectFromJson(json);

  Map<String, dynamic> toJson() => _$BlueprintAspectToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

