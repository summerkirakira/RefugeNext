//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/item_related_link_ext.dart';
import 'package:starcitizen_wiki_api/src/model/item_related_link.dart';
import 'package:json_annotation/json_annotation.dart';

part 'item_related_items.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ItemRelatedItems {
  /// Returns a new [ItemRelatedItems] instance.
  ItemRelatedItems({

     this.setName,

     this.baseItem,

     this.variantItems,

     this.setItems,
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





    @override
    bool operator ==(Object other) => identical(this, other) || other is ItemRelatedItems &&
      other.setName == setName &&
      other.baseItem == baseItem &&
      other.variantItems == variantItems &&
      other.setItems == setItems;

    @override
    int get hashCode =>
        (setName == null ? 0 : setName.hashCode) +
        (baseItem == null ? 0 : baseItem.hashCode) +
        (variantItems == null ? 0 : variantItems.hashCode) +
        (setItems == null ? 0 : setItems.hashCode);

  factory ItemRelatedItems.fromJson(Map<String, dynamic> json) => _$ItemRelatedItemsFromJson(json);

  Map<String, dynamic> toJson() => _$ItemRelatedItemsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

