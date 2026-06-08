//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/pagination_meta.dart';
import 'package:starcitizen_wiki_api/src/model/pagination_links.dart';
import 'package:starcitizen_wiki_api/src/model/starsystem.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_starsystems200_response.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ListStarsystems200Response {
  /// Returns a new [ListStarsystems200Response] instance.
  ListStarsystems200Response({

     this.data,

     this.links,

     this.meta,
  });

  @JsonKey(
    
    name: r'data',
    required: false,
    includeIfNull: false,
  )


  final List<Starsystem>? data;



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
    bool operator ==(Object other) => identical(this, other) || other is ListStarsystems200Response &&
      other.data == data &&
      other.links == links &&
      other.meta == meta;

    @override
    int get hashCode =>
        data.hashCode +
        links.hashCode +
        meta.hashCode;

  factory ListStarsystems200Response.fromJson(Map<String, dynamic> json) => _$ListStarsystems200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListStarsystems200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

