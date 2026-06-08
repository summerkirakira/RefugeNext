//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/galactapedia_article.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_galactapedia_article200_response.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GetGalactapediaArticle200Response {
  /// Returns a new [GetGalactapediaArticle200Response] instance.
  GetGalactapediaArticle200Response({

     this.data,
  });

  @JsonKey(
    
    name: r'data',
    required: false,
    includeIfNull: false,
  )


  final GalactapediaArticle? data;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GetGalactapediaArticle200Response &&
      other.data == data;

    @override
    int get hashCode =>
        data.hashCode;

  factory GetGalactapediaArticle200Response.fromJson(Map<String, dynamic> json) => _$GetGalactapediaArticle200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetGalactapediaArticle200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

