//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/pagination_meta.dart';
import 'package:starcitizen_wiki_api/src/model/pagination_links.dart';
import 'package:starcitizen_wiki_api/src/model/comm_link_image.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_comm_link_images200_response.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ListCommLinkImages200Response {
  /// Returns a new [ListCommLinkImages200Response] instance.
  ListCommLinkImages200Response({

     this.data,

     this.links,

     this.meta,
  });

  @JsonKey(
    
    name: r'data',
    required: false,
    includeIfNull: false,
  )


  final List<CommLinkImage>? data;



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
    bool operator ==(Object other) => identical(this, other) || other is ListCommLinkImages200Response &&
      other.data == data &&
      other.links == links &&
      other.meta == meta;

    @override
    int get hashCode =>
        data.hashCode +
        links.hashCode +
        meta.hashCode;

  factory ListCommLinkImages200Response.fromJson(Map<String, dynamic> json) => _$ListCommLinkImages200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListCommLinkImages200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

