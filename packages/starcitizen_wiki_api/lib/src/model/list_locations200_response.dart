//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/game_starmap_location.dart';
import 'package:starcitizen_wiki_api/src/model/pagination_meta.dart';
import 'package:starcitizen_wiki_api/src/model/pagination_links.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_locations200_response.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ListLocations200Response {
  /// Returns a new [ListLocations200Response] instance.
  ListLocations200Response({

     this.data,

     this.links,

     this.meta,
  });

  @JsonKey(
    
    name: r'data',
    required: false,
    includeIfNull: false,
  )


  final List<GameStarmapLocation>? data;



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
    bool operator ==(Object other) => identical(this, other) || other is ListLocations200Response &&
      other.data == data &&
      other.links == links &&
      other.meta == meta;

    @override
    int get hashCode =>
        data.hashCode +
        links.hashCode +
        meta.hashCode;

  factory ListLocations200Response.fromJson(Map<String, dynamic> json) => _$ListLocations200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListLocations200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

