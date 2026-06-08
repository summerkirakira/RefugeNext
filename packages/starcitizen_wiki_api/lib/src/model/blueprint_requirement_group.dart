//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/blueprint_modifier.dart';
import 'package:starcitizen_wiki_api/src/model/blueprint_requirement_child.dart';
import 'package:json_annotation/json_annotation.dart';

part 'blueprint_requirement_group.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class BlueprintRequirementGroup {
  /// Returns a new [BlueprintRequirementGroup] instance.
  BlueprintRequirementGroup({

     this.key,

     this.name,

     this.kind,

     this.requiredCount,

     this.modifiers,

     this.children,
  });

      /// Internal key of the requirement group
  @JsonKey(
    
    name: r'key',
    required: false,
    includeIfNull: false,
  )


  final String? key;



      /// Display name of the requirement group
  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



      /// Always \"group\"
  @JsonKey(
    
    name: r'kind',
    required: false,
    includeIfNull: false,
  )


  final BlueprintRequirementGroupKindEnum? kind;



      /// Number of children that must be fulfilled within this group
  @JsonKey(
    
    name: r'required_count',
    required: false,
    includeIfNull: false,
  )


  final int? requiredCount;



      /// Quality-dependent modifier effects applied at the group level
  @JsonKey(
    
    name: r'modifiers',
    required: false,
    includeIfNull: false,
  )


  final List<BlueprintModifier>? modifiers;



      /// Individual resources or items within this group
  @JsonKey(
    
    name: r'children',
    required: false,
    includeIfNull: false,
  )


  final List<BlueprintRequirementChild>? children;





    @override
    bool operator ==(Object other) => identical(this, other) || other is BlueprintRequirementGroup &&
      other.key == key &&
      other.name == name &&
      other.kind == kind &&
      other.requiredCount == requiredCount &&
      other.modifiers == modifiers &&
      other.children == children;

    @override
    int get hashCode =>
        (key == null ? 0 : key.hashCode) +
        (name == null ? 0 : name.hashCode) +
        kind.hashCode +
        (requiredCount == null ? 0 : requiredCount.hashCode) +
        modifiers.hashCode +
        children.hashCode;

  factory BlueprintRequirementGroup.fromJson(Map<String, dynamic> json) => _$BlueprintRequirementGroupFromJson(json);

  Map<String, dynamic> toJson() => _$BlueprintRequirementGroupToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// Always \"group\"
enum BlueprintRequirementGroupKindEnum {
    /// Always \"group\"
@JsonValue(r'group')
group(r'group');

const BlueprintRequirementGroupKindEnum(this.value);

final String value;

@override
String toString() => value;
}


