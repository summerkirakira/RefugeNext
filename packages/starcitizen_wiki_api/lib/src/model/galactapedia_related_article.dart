//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'galactapedia_related_article.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GalactapediaRelatedArticle {
  /// Returns a new [GalactapediaRelatedArticle] instance.
  GalactapediaRelatedArticle({

     this.id,

     this.title,

     this.url,

     this.apiUrl,
  });

  @JsonKey(
    
    name: r'id',
    required: false,
    includeIfNull: false,
  )


  final String? id;



  @JsonKey(
    
    name: r'title',
    required: false,
    includeIfNull: false,
  )


  final String? title;



  @JsonKey(
    
    name: r'url',
    required: false,
    includeIfNull: false,
  )


  final String? url;



  @JsonKey(
    
    name: r'api_url',
    required: false,
    includeIfNull: false,
  )


  final String? apiUrl;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GalactapediaRelatedArticle &&
      other.id == id &&
      other.title == title &&
      other.url == url &&
      other.apiUrl == apiUrl;

    @override
    int get hashCode =>
        id.hashCode +
        title.hashCode +
        url.hashCode +
        apiUrl.hashCode;

  factory GalactapediaRelatedArticle.fromJson(Map<String, dynamic> json) => _$GalactapediaRelatedArticleFromJson(json);

  Map<String, dynamic> toJson() => _$GalactapediaRelatedArticleToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

