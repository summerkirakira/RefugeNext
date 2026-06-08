//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/item_related_link_ext.dart';
import 'package:starcitizen_wiki_api/src/model/item_emission.dart';
import 'package:starcitizen_wiki_api/src/model/item_related_link.dart';
import 'package:starcitizen_wiki_api/src/model/manufacturer_link.dart';
import 'package:starcitizen_wiki_api/src/model/resource_network.dart';
import 'package:json_annotation/json_annotation.dart';

part 'game_port_item.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GamePortItem {
  /// Returns a new [GamePortItem] instance.
  GamePortItem({

     this.setName,

     this.baseItem,

     this.variantItems,

     this.setItems,

     this.uuid,

     this.name,

     this.className,

     this.type,

     this.typeLabel,

     this.subType,

     this.subTypeLabel,

     this.classification,

     this.classificationLabel,

     this.isBaseVariant,

     this.variantName,

     this.link,

     this.webUrl,

     this.size,

     this.mass,

     this.grade,

     this.class_,

     this.manufacturer,

     this.resourceNetwork,

     this.emission,

     this.version,
  });

  @JsonKey(
    
    name: r'set_name',
    required: false,
    includeIfNull: false,
  )


  final String? setName;



  @JsonKey(
    
    name: r'base_item',
    required: false,
    includeIfNull: false,
  )


  final ItemRelatedLink? baseItem;



  @JsonKey(
    
    name: r'variant_items',
    required: false,
    includeIfNull: false,
  )


  final List<ItemRelatedLink>? variantItems;



  @JsonKey(
    
    name: r'set_items',
    required: false,
    includeIfNull: false,
  )


  final List<ItemRelatedLinkExt>? setItems;



      /// Unique identifier of the item.
  @JsonKey(
    
    name: r'uuid',
    required: false,
    includeIfNull: false,
  )


  final String? uuid;



      /// Display name of the item.
  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



      /// Internal class name of the item definition.
  @JsonKey(
    
    name: r'class_name',
    required: false,
    includeIfNull: false,
  )


  final String? className;



      /// AttachDef@Type (NOITEM_ prefix removed)
  @JsonKey(
    
    name: r'type',
    required: false,
    includeIfNull: false,
  )


  final String? type;



      /// Human-readable label for the item type
  @JsonKey(
    
    name: r'type_label',
    required: false,
    includeIfNull: false,
  )


  final String? typeLabel;



      /// AttachDef@SubType
  @JsonKey(
    
    name: r'sub_type',
    required: false,
    includeIfNull: false,
  )


  final String? subType;



      /// Human-readable label for the item sub-type
  @JsonKey(
    
    name: r'sub_type_label',
    required: false,
    includeIfNull: false,
  )


  final String? subTypeLabel;



      /// Dot-separated classification path (e.g. FPS.Clothing.Torso).
  @JsonKey(
    
    name: r'classification',
    required: false,
    includeIfNull: false,
  )


  final String? classification;



      /// Human-readable label for the item classification
  @JsonKey(
    
    name: r'classification_label',
    required: false,
    includeIfNull: false,
  )


  final String? classificationLabel;



      /// Whether this item is the base variant (has no parent variant).
  @JsonKey(
    
    name: r'is_base_variant',
    required: false,
    includeIfNull: false,
  )


  final bool? isBaseVariant;



      /// Extracted variant name, e.g. \"Executive Edition\" or \"Aqua\"
  @JsonKey(
    
    name: r'variant_name',
    required: false,
    includeIfNull: false,
  )


  final String? variantName;



      /// API URL for item detail endpoint
  @JsonKey(
    
    name: r'link',
    required: false,
    includeIfNull: false,
  )


  final String? link;



      /// Web URL for item detail page
  @JsonKey(
    
    name: r'web_url',
    required: false,
    includeIfNull: false,
  )


  final String? webUrl;



      /// AttachDef@Size
  @JsonKey(
    
    name: r'size',
    required: false,
    includeIfNull: false,
  )


  final int? size;



      /// Generated from SEntityRigidPhysicsControllerParams
  @JsonKey(
    
    name: r'mass',
    required: false,
    includeIfNull: false,
  )


  final double? mass;



      /// Derived formatting for ship grades (A, B, C, D) or extracted from DescriptionData.Grade
  @JsonKey(
    
    name: r'grade',
    required: false,
    includeIfNull: false,
  )


  final String? grade;



      /// From DescriptionData.Class if not set directly
  @JsonKey(
    
    name: r'class',
    required: false,
    includeIfNull: false,
  )


  final String? class_;



      /// Present when manufacturer is set
  @JsonKey(
    
    name: r'manufacturer',
    required: false,
    includeIfNull: false,
  )


  final ManufacturerLink? manufacturer;



      /// Present when stdItem.ResourceNetwork exists
  @JsonKey(
    
    name: r'resource_network',
    required: false,
    includeIfNull: false,
  )


  final ResourceNetwork? resourceNetwork;



      /// Present when stdItem.ResourceNetwork exists; calculated emission values
  @JsonKey(
    
    name: r'emission',
    required: false,
    includeIfNull: false,
  )


  final ItemEmission? emission;



      /// Game version code
  @JsonKey(
    
    name: r'version',
    required: false,
    includeIfNull: false,
  )


  final String? version;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GamePortItem &&
      other.setName == setName &&
      other.baseItem == baseItem &&
      other.variantItems == variantItems &&
      other.setItems == setItems &&
      other.uuid == uuid &&
      other.name == name &&
      other.className == className &&
      other.type == type &&
      other.typeLabel == typeLabel &&
      other.subType == subType &&
      other.subTypeLabel == subTypeLabel &&
      other.classification == classification &&
      other.classificationLabel == classificationLabel &&
      other.isBaseVariant == isBaseVariant &&
      other.variantName == variantName &&
      other.link == link &&
      other.webUrl == webUrl &&
      other.size == size &&
      other.mass == mass &&
      other.grade == grade &&
      other.class_ == class_ &&
      other.manufacturer == manufacturer &&
      other.resourceNetwork == resourceNetwork &&
      other.emission == emission &&
      other.version == version;

    @override
    int get hashCode =>
        (setName == null ? 0 : setName.hashCode) +
        (baseItem == null ? 0 : baseItem.hashCode) +
        (variantItems == null ? 0 : variantItems.hashCode) +
        (setItems == null ? 0 : setItems.hashCode) +
        uuid.hashCode +
        name.hashCode +
        className.hashCode +
        (type == null ? 0 : type.hashCode) +
        (typeLabel == null ? 0 : typeLabel.hashCode) +
        (subType == null ? 0 : subType.hashCode) +
        (subTypeLabel == null ? 0 : subTypeLabel.hashCode) +
        (classification == null ? 0 : classification.hashCode) +
        (classificationLabel == null ? 0 : classificationLabel.hashCode) +
        isBaseVariant.hashCode +
        (variantName == null ? 0 : variantName.hashCode) +
        link.hashCode +
        (webUrl == null ? 0 : webUrl.hashCode) +
        (size == null ? 0 : size.hashCode) +
        (mass == null ? 0 : mass.hashCode) +
        (grade == null ? 0 : grade.hashCode) +
        (class_ == null ? 0 : class_.hashCode) +
        (manufacturer == null ? 0 : manufacturer.hashCode) +
        (resourceNetwork == null ? 0 : resourceNetwork.hashCode) +
        (emission == null ? 0 : emission.hashCode) +
        version.hashCode;

  factory GamePortItem.fromJson(Map<String, dynamic> json) => _$GamePortItemFromJson(json);

  Map<String, dynamic> toJson() => _$GamePortItemToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

