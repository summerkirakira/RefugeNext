//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/blueprint_modifier.dart';
import 'package:json_annotation/json_annotation.dart';

part 'blueprint_requirement_child.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class BlueprintRequirementChild {
  /// Returns a new [BlueprintRequirementChild] instance.
  BlueprintRequirementChild({

     this.key,

     this.kind,

     this.uuid,

     this.name,

     this.requiredCount,

     this.quantity,

     this.quantityScu,

     this.minQuality,

     this.modifiers,

     this.children,
  });

      /// Internal key of the requirement child
  @JsonKey(
    
    name: r'key',
    required: false,
    includeIfNull: false,
  )


  final String? key;



      /// Type of requirement entry
  @JsonKey(
    
    name: r'kind',
    required: false,
    includeIfNull: false,
  )


  final BlueprintRequirementChildKindEnum? kind;



      /// UUID of the required resource type or item
  @JsonKey(
    
    name: r'uuid',
    required: false,
    includeIfNull: false,
  )


  final String? uuid;



      /// Display name of the required resource or item
  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



      /// Number of this child required within its group
  @JsonKey(
    
    name: r'required_count',
    required: false,
    includeIfNull: false,
  )


  final int? requiredCount;



      /// Discrete item count required
  @JsonKey(
    
    name: r'quantity',
    required: false,
    includeIfNull: false,
  )


  final double? quantity;



      /// Quantity in Standard Cargo Units (for resources)
  @JsonKey(
    
    name: r'quantity_scu',
    required: false,
    includeIfNull: false,
  )


  final double? quantityScu;



      /// Minimum quality tier required
  @JsonKey(
    
    name: r'min_quality',
    required: false,
    includeIfNull: false,
  )


  final int? minQuality;



      /// Quality-dependent modifier effects for this child
  @JsonKey(
    
    name: r'modifiers',
    required: false,
    includeIfNull: false,
  )


  final List<BlueprintModifier>? modifiers;



      /// Nested children when kind is group
  @JsonKey(
    
    name: r'children',
    required: false,
    includeIfNull: false,
  )


  final List<BlueprintRequirementChild>? children;





    @override
    bool operator ==(Object other) => identical(this, other) || other is BlueprintRequirementChild &&
      other.key == key &&
      other.kind == kind &&
      other.uuid == uuid &&
      other.name == name &&
      other.requiredCount == requiredCount &&
      other.quantity == quantity &&
      other.quantityScu == quantityScu &&
      other.minQuality == minQuality &&
      other.modifiers == modifiers &&
      other.children == children;

    @override
    int get hashCode =>
        (key == null ? 0 : key.hashCode) +
        (kind == null ? 0 : kind.hashCode) +
        (uuid == null ? 0 : uuid.hashCode) +
        (name == null ? 0 : name.hashCode) +
        (requiredCount == null ? 0 : requiredCount.hashCode) +
        (quantity == null ? 0 : quantity.hashCode) +
        (quantityScu == null ? 0 : quantityScu.hashCode) +
        (minQuality == null ? 0 : minQuality.hashCode) +
        modifiers.hashCode +
        (children == null ? 0 : children.hashCode);

  factory BlueprintRequirementChild.fromJson(Map<String, dynamic> json) => _$BlueprintRequirementChildFromJson(json);

  Map<String, dynamic> toJson() => _$BlueprintRequirementChildToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// Type of requirement entry
enum BlueprintRequirementChildKindEnum {
    /// Type of requirement entry
@JsonValue(r'group')
group(r'group'),
    /// Type of requirement entry
@JsonValue(r'resource')
resource(r'resource'),
    /// Type of requirement entry
@JsonValue(r'item')
item(r'item');

const BlueprintRequirementChildKindEnum(this.value);

final String value;

@override
String toString() => value;
}


