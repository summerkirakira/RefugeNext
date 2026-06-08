//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/blueprint_modifier.dart';
import 'package:json_annotation/json_annotation.dart';

part 'blueprint_requirement_node.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class BlueprintRequirementNode {
  /// Returns a new [BlueprintRequirementNode] instance.
  BlueprintRequirementNode({

     this.kind,

     this.key,

     this.name,

     this.uuid,

     this.requiredCount,

     this.quantity,

     this.quantityScu,

     this.minQuality,

     this.modifiers,

     this.children,
  });

      /// Node type in the requirement tree
  @JsonKey(
    
    name: r'kind',
    required: false,
    includeIfNull: false,
  )


  final BlueprintRequirementNodeKindEnum? kind;



      /// Internal key of the requirement node
  @JsonKey(
    
    name: r'key',
    required: false,
    includeIfNull: false,
  )


  final String? key;



      /// Display name of the requirement node
  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



      /// UUID of the required resource type or item
  @JsonKey(
    
    name: r'uuid',
    required: false,
    includeIfNull: false,
  )


  final String? uuid;



      /// Number of children that must be fulfilled
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



      /// Quality-dependent modifier effects
  @JsonKey(
    
    name: r'modifiers',
    required: false,
    includeIfNull: false,
  )


  final List<BlueprintModifier>? modifiers;



      /// Nested child nodes in the requirement tree
  @JsonKey(
    
    name: r'children',
    required: false,
    includeIfNull: false,
  )


  final List<BlueprintRequirementNode>? children;





    @override
    bool operator ==(Object other) => identical(this, other) || other is BlueprintRequirementNode &&
      other.kind == kind &&
      other.key == key &&
      other.name == name &&
      other.uuid == uuid &&
      other.requiredCount == requiredCount &&
      other.quantity == quantity &&
      other.quantityScu == quantityScu &&
      other.minQuality == minQuality &&
      other.modifiers == modifiers &&
      other.children == children;

    @override
    int get hashCode =>
        (kind == null ? 0 : kind.hashCode) +
        (key == null ? 0 : key.hashCode) +
        (name == null ? 0 : name.hashCode) +
        (uuid == null ? 0 : uuid.hashCode) +
        (requiredCount == null ? 0 : requiredCount.hashCode) +
        (quantity == null ? 0 : quantity.hashCode) +
        (quantityScu == null ? 0 : quantityScu.hashCode) +
        (minQuality == null ? 0 : minQuality.hashCode) +
        (modifiers == null ? 0 : modifiers.hashCode) +
        (children == null ? 0 : children.hashCode);

  factory BlueprintRequirementNode.fromJson(Map<String, dynamic> json) => _$BlueprintRequirementNodeFromJson(json);

  Map<String, dynamic> toJson() => _$BlueprintRequirementNodeToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// Node type in the requirement tree
enum BlueprintRequirementNodeKindEnum {
    /// Node type in the requirement tree
@JsonValue(r'root')
root(r'root'),
    /// Node type in the requirement tree
@JsonValue(r'group')
group(r'group'),
    /// Node type in the requirement tree
@JsonValue(r'resource')
resource(r'resource'),
    /// Node type in the requirement tree
@JsonValue(r'item')
item(r'item');

const BlueprintRequirementNodeKindEnum(this.value);

final String value;

@override
String toString() => value;
}


