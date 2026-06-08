//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'item_related_link_manufacturer.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ItemRelatedLinkManufacturer {
  /// Returns a new [ItemRelatedLinkManufacturer] instance.
  ItemRelatedLinkManufacturer({

     this.code,

     this.name,

     this.link,
  });

  @JsonKey(
    
    name: r'code',
    required: false,
    includeIfNull: false,
  )


  final String? code;



  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



  @JsonKey(
    
    name: r'link',
    required: false,
    includeIfNull: false,
  )


  final String? link;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ItemRelatedLinkManufacturer &&
      other.code == code &&
      other.name == name &&
      other.link == link;

    @override
    int get hashCode =>
        (code == null ? 0 : code.hashCode) +
        (name == null ? 0 : name.hashCode) +
        link.hashCode;

  factory ItemRelatedLinkManufacturer.fromJson(Map<String, dynamic> json) => _$ItemRelatedLinkManufacturerFromJson(json);

  Map<String, dynamic> toJson() => _$ItemRelatedLinkManufacturerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

