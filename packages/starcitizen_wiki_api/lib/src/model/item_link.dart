//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/canonical_resource_meta.dart';
import 'package:starcitizen_wiki_api/src/model/manufacturer_link.dart';
import 'package:json_annotation/json_annotation.dart';

part 'item_link.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ItemLink {
  /// Returns a new [ItemLink] instance.
  ItemLink({

     this.updatedAt,

     this.version,

     this.deprecatedFields,

     this.resource,

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

     this.manufacturer,

     this.link,

     this.webUrl,

     this.size,

     this.baseVariant,

     this.variants,
  });

      /// Timestamp this data was last updated.
  @JsonKey(
    
    name: r'updated_at',
    required: false,
    includeIfNull: false,
  )


  final DateTime? updatedAt;



      /// The Game Version this item exists in.
  @JsonKey(
    
    name: r'version',
    required: false,
    includeIfNull: false,
  )


  final String? version;



      /// Deprecated fields that will be removed in future versions.
  @JsonKey(
    
    name: r'deprecated_fields',
    required: false,
    includeIfNull: false,
  )


  final String? deprecatedFields;



  @JsonKey(
    
    name: r'resource',
    required: false,
    includeIfNull: false,
  )


  final CanonicalResourceMeta? resource;



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



      /// Item type identifier (e.g. Weapon, Armor, Clothing).
  @JsonKey(
    
    name: r'type',
    required: false,
    includeIfNull: false,
  )


  final String? type;



      /// Human-readable label for the item type.
  @JsonKey(
    
    name: r'type_label',
    required: false,
    includeIfNull: false,
  )


  final String? typeLabel;



      /// Item sub-type identifier.
  @JsonKey(
    
    name: r'sub_type',
    required: false,
    includeIfNull: false,
  )


  final String? subType;



      /// Human-readable label for the item sub-type.
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



      /// Human-readable label for the item classification.
  @JsonKey(
    
    name: r'classification_label',
    required: false,
    includeIfNull: false,
  )


  final String? classificationLabel;



      /// Whether this item is the base variant.
  @JsonKey(
    
    name: r'is_base_variant',
    required: false,
    includeIfNull: false,
  )


  final bool? isBaseVariant;



      /// Extracted variant name, e.g. \"Executive Edition\" or \"Aqua\".
  @JsonKey(
    
    name: r'variant_name',
    required: false,
    includeIfNull: false,
  )


  final String? variantName;



  @JsonKey(
    
    name: r'manufacturer',
    required: false,
    includeIfNull: false,
  )


  final ManufacturerLink? manufacturer;



      /// API URL for the full item resource.
  @JsonKey(
    
    name: r'link',
    required: false,
    includeIfNull: false,
  )


  final String? link;



      /// Web URL for the item detail page.
  @JsonKey(
    
    name: r'web_url',
    required: false,
    includeIfNull: false,
  )


  final String? webUrl;



      /// Item size (1-12 for vehicle items, smaller for FPS).
  @JsonKey(
    
    name: r'size',
    required: false,
    includeIfNull: false,
  )


  final int? size;



      /// API URL of the base variant item. Only present for variant items.
  @JsonKey(
    
    name: r'base_variant',
    required: false,
    includeIfNull: false,
  )


  final String? baseVariant;



      /// List of variant items sharing the same base item.
  @JsonKey(
    
    name: r'variants',
    required: false,
    includeIfNull: false,
  )


  final List<ItemLink>? variants;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ItemLink &&
      other.updatedAt == updatedAt &&
      other.version == version &&
      other.deprecatedFields == deprecatedFields &&
      other.resource == resource &&
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
      other.manufacturer == manufacturer &&
      other.link == link &&
      other.webUrl == webUrl &&
      other.size == size &&
      other.baseVariant == baseVariant &&
      other.variants == variants;

    @override
    int get hashCode =>
        updatedAt.hashCode +
        version.hashCode +
        deprecatedFields.hashCode +
        resource.hashCode +
        uuid.hashCode +
        name.hashCode +
        className.hashCode +
        type.hashCode +
        (typeLabel == null ? 0 : typeLabel.hashCode) +
        (subType == null ? 0 : subType.hashCode) +
        (subTypeLabel == null ? 0 : subTypeLabel.hashCode) +
        (classification == null ? 0 : classification.hashCode) +
        (classificationLabel == null ? 0 : classificationLabel.hashCode) +
        isBaseVariant.hashCode +
        (variantName == null ? 0 : variantName.hashCode) +
        manufacturer.hashCode +
        link.hashCode +
        (webUrl == null ? 0 : webUrl.hashCode) +
        (size == null ? 0 : size.hashCode) +
        (baseVariant == null ? 0 : baseVariant.hashCode) +
        (variants == null ? 0 : variants.hashCode);

  factory ItemLink.fromJson(Map<String, dynamic> json) => _$ItemLinkFromJson(json);

  Map<String, dynamic> toJson() => _$ItemLinkToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

