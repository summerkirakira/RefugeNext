//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/translation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'galactapedia_article_translations.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GalactapediaArticleTranslations {
  /// Returns a new [GalactapediaArticleTranslations] instance.
  GalactapediaArticleTranslations();



    @override
    bool operator ==(Object other) => identical(this, other) || other is GalactapediaArticleTranslations;

    @override
    int get hashCode => runtimeType.hashCode;

  factory GalactapediaArticleTranslations.fromJson(Map<String, dynamic> json) => _$GalactapediaArticleTranslationsFromJson(json);

  Map<String, dynamic> toJson() => _$GalactapediaArticleTranslationsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

