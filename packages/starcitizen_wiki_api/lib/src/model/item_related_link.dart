//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/item_related_link_manufacturer.dart';
import 'package:json_annotation/json_annotation.dart';

part 'item_related_link.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ItemRelatedLink {
  /// Returns a new [ItemRelatedLink] instance.
  ItemRelatedLink({

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

     this.version,

     this.link,

     this.webUrl,

     this.size,

     this.grade,

     this.gradeLabel,

     this.class_,
  });

      /// Unique identifier of the related item.
  @JsonKey(
    
    name: r'uuid',
    required: false,
    includeIfNull: false,
  )


  final String? uuid;



      /// Display name of the related item.
  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



      /// Internal class name of the related item.
  @JsonKey(
    
    name: r'class_name',
    required: false,
    includeIfNull: false,
  )


  final String? className;



      /// Item type identifier.
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



      /// Item sub-type identifier.
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



      /// Dot-separated classification path.
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



      /// Whether this related item is the base variant.
  @JsonKey(
    
    name: r'is_base_variant',
    required: false,
    includeIfNull: false,
  )


  final bool? isBaseVariant;



      /// Variant name if this is a variant item.
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


  final ItemRelatedLinkManufacturer? manufacturer;



      /// Game version code.
  @JsonKey(
    
    name: r'version',
    required: false,
    includeIfNull: false,
  )


  final String? version;



      /// API URL for the related item.
  @JsonKey(
    
    name: r'link',
    required: false,
    includeIfNull: false,
  )


  final String? link;



      /// Web URL for the related item.
  @JsonKey(
    
    name: r'web_url',
    required: false,
    includeIfNull: false,
  )


  final String? webUrl;



      /// Item size.
  @JsonKey(
    
    name: r'size',
    required: false,
    includeIfNull: false,
  )


  final int? size;



      /// Item grade.
  @JsonKey(
    
    name: r'grade',
    required: false,
    includeIfNull: false,
  )


  final int? grade;



      /// Grade (A/B/C/D for Ship items)
  @JsonKey(
    
    name: r'grade_label',
    required: false,
    includeIfNull: false,
  )


  final String? gradeLabel;



      /// Item class.
  @JsonKey(
    
    name: r'class',
    required: false,
    includeIfNull: false,
  )


  final String? class_;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ItemRelatedLink &&
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
      other.version == version &&
      other.link == link &&
      other.webUrl == webUrl &&
      other.size == size &&
      other.grade == grade &&
      other.gradeLabel == gradeLabel &&
      other.class_ == class_;

    @override
    int get hashCode =>
        uuid.hashCode +
        name.hashCode +
        (className == null ? 0 : className.hashCode) +
        (type == null ? 0 : type.hashCode) +
        (typeLabel == null ? 0 : typeLabel.hashCode) +
        (subType == null ? 0 : subType.hashCode) +
        (subTypeLabel == null ? 0 : subTypeLabel.hashCode) +
        (classification == null ? 0 : classification.hashCode) +
        (classificationLabel == null ? 0 : classificationLabel.hashCode) +
        isBaseVariant.hashCode +
        (variantName == null ? 0 : variantName.hashCode) +
        (manufacturer == null ? 0 : manufacturer.hashCode) +
        (version == null ? 0 : version.hashCode) +
        link.hashCode +
        webUrl.hashCode +
        (size == null ? 0 : size.hashCode) +
        (grade == null ? 0 : grade.hashCode) +
        (gradeLabel == null ? 0 : gradeLabel.hashCode) +
        (class_ == null ? 0 : class_.hashCode);

  factory ItemRelatedLink.fromJson(Map<String, dynamic> json) => _$ItemRelatedLinkFromJson(json);

  Map<String, dynamic> toJson() => _$ItemRelatedLinkToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

