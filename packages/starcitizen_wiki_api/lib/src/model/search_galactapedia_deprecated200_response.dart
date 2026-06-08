//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/galactapedia_article.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_galactapedia_deprecated200_response.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SearchGalactapediaDeprecated200Response {
  /// Returns a new [SearchGalactapediaDeprecated200Response] instance.
  SearchGalactapediaDeprecated200Response({

     this.data,
  });

  @JsonKey(
    
    name: r'data',
    required: false,
    includeIfNull: false,
  )


  final List<GalactapediaArticle>? data;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SearchGalactapediaDeprecated200Response &&
      other.data == data;

    @override
    int get hashCode =>
        data.hashCode;

  factory SearchGalactapediaDeprecated200Response.fromJson(Map<String, dynamic> json) => _$SearchGalactapediaDeprecated200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SearchGalactapediaDeprecated200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

