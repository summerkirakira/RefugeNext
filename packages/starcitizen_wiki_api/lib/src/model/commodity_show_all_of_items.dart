//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'commodity_show_all_of_items.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CommodityShowAllOfItems {
  /// Returns a new [CommodityShowAllOfItems] instance.
  CommodityShowAllOfItems({

     this.name,

     this.uuid,

     this.type,

     this.typeLabel,

     this.subType,

     this.subTypeLabel,

     this.size,

     this.webUrl,

     this.link,
  });

      /// Item display name.
  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



      /// UUID of the item entity.
  @JsonKey(
    
    name: r'uuid',
    required: false,
    includeIfNull: false,
  )


  final String? uuid;



      /// Item type classification.
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



      /// Item sub-type classification.
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



      /// Item size grade.
  @JsonKey(
    
    name: r'size',
    required: false,
    includeIfNull: false,
  )


  final int? size;



      /// Frontend URL for the item page.
  @JsonKey(
    
    name: r'web_url',
    required: false,
    includeIfNull: false,
  )


  final String? webUrl;



      /// API link to the item details.
  @JsonKey(
    
    name: r'link',
    required: false,
    includeIfNull: false,
  )


  final String? link;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CommodityShowAllOfItems &&
      other.name == name &&
      other.uuid == uuid &&
      other.type == type &&
      other.typeLabel == typeLabel &&
      other.subType == subType &&
      other.subTypeLabel == subTypeLabel &&
      other.size == size &&
      other.webUrl == webUrl &&
      other.link == link;

    @override
    int get hashCode =>
        name.hashCode +
        (uuid == null ? 0 : uuid.hashCode) +
        (type == null ? 0 : type.hashCode) +
        (typeLabel == null ? 0 : typeLabel.hashCode) +
        (subType == null ? 0 : subType.hashCode) +
        (subTypeLabel == null ? 0 : subTypeLabel.hashCode) +
        (size == null ? 0 : size.hashCode) +
        (webUrl == null ? 0 : webUrl.hashCode) +
        (link == null ? 0 : link.hashCode);

  factory CommodityShowAllOfItems.fromJson(Map<String, dynamic> json) => _$CommodityShowAllOfItemsFromJson(json);

  Map<String, dynamic> toJson() => _$CommodityShowAllOfItemsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

