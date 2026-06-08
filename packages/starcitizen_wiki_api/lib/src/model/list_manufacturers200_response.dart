//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/pagination_meta.dart';
import 'package:starcitizen_wiki_api/src/model/pagination_links.dart';
import 'package:starcitizen_wiki_api/src/model/manufacturer_link.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_manufacturers200_response.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ListManufacturers200Response {
  /// Returns a new [ListManufacturers200Response] instance.
  ListManufacturers200Response({

     this.data,

     this.links,

     this.meta,
  });

  @JsonKey(
    
    name: r'data',
    required: false,
    includeIfNull: false,
  )


  final List<ManufacturerLink>? data;



  @JsonKey(
    
    name: r'links',
    required: false,
    includeIfNull: false,
  )


  final PaginationLinks? links;



  @JsonKey(
    
    name: r'meta',
    required: false,
    includeIfNull: false,
  )


  final PaginationMeta? meta;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ListManufacturers200Response &&
      other.data == data &&
      other.links == links &&
      other.meta == meta;

    @override
    int get hashCode =>
        data.hashCode +
        links.hashCode +
        meta.hashCode;

  factory ListManufacturers200Response.fromJson(Map<String, dynamic> json) => _$ListManufacturers200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListManufacturers200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

