//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'comm_link_image_tags_inner.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CommLinkImageTagsInner {
  /// Returns a new [CommLinkImageTagsInner] instance.
  CommLinkImageTagsInner({

     this.name,

     this.translatedName,

     this.imagesCount,
  });

      /// Tag name.
  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



      /// Translated tag name.
  @JsonKey(
    
    name: r'translated_name',
    required: false,
    includeIfNull: false,
  )


  final String? translatedName;



      /// Number of images sharing this tag.
  @JsonKey(
    
    name: r'images_count',
    required: false,
    includeIfNull: false,
  )


  final int? imagesCount;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CommLinkImageTagsInner &&
      other.name == name &&
      other.translatedName == translatedName &&
      other.imagesCount == imagesCount;

    @override
    int get hashCode =>
        name.hashCode +
        (translatedName == null ? 0 : translatedName.hashCode) +
        imagesCount.hashCode;

  factory CommLinkImageTagsInner.fromJson(Map<String, dynamic> json) => _$CommLinkImageTagsInnerFromJson(json);

  Map<String, dynamic> toJson() => _$CommLinkImageTagsInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

