//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/comm_link_image_tags_inner.dart';
import 'package:starcitizen_wiki_api/src/model/comm_link_image_comm_links_inner.dart';
import 'package:starcitizen_wiki_api/src/model/comm_link_image_base_image.dart';
import 'package:starcitizen_wiki_api/src/model/comm_link_image_duplicates_inner.dart';
import 'package:json_annotation/json_annotation.dart';

part 'comm_link_image.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CommLinkImage {
  /// Returns a new [CommLinkImage] instance.
  CommLinkImage({

     this.id,

     this.name,

     this.rsiUrl,

     this.apiUrl,

     this.alt,

     this.size,

     this.mimeType,

     this.lastModified,

     this.tags,

     this.similarUrl,

     this.commLinks,

     this.duplicates,

     this.baseImage,

     this.similarity,
  });

      /// Internal database identifier.
  @JsonKey(
    
    name: r'id',
    required: false,
    includeIfNull: false,
  )


  final int? id;



      /// File name or path segment of the image.
  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



      /// Full URL to the image on the RSI media CDN.
  @JsonKey(
    
    name: r'rsi_url',
    required: false,
    includeIfNull: false,
  )


  final String? rsiUrl;



      /// API URL for this image resource.
  @JsonKey(
    
    name: r'api_url',
    required: false,
    includeIfNull: false,
  )


  final String? apiUrl;



      /// Alternative text for the image.
  @JsonKey(
    
    name: r'alt',
    required: false,
    includeIfNull: false,
  )


  final String? alt;



      /// File size in bytes.
  @JsonKey(
    
    name: r'size',
    required: false,
    includeIfNull: false,
  )


  final int? size;



      /// MIME type of the image file.
  @JsonKey(
    
    name: r'mime_type',
    required: false,
    includeIfNull: false,
  )


  final String? mimeType;



      /// ISO 8601 timestamp of when the image was last modified on the CDN.
  @JsonKey(
    
    name: r'last_modified',
    required: false,
    includeIfNull: false,
  )


  final DateTime? lastModified;



      /// Tags associated with the image when the `tags` relation is loaded.
  @JsonKey(
    
    name: r'tags',
    required: false,
    includeIfNull: false,
  )


  final List<CommLinkImageTagsInner>? tags;



      /// API URL to find visually similar images.
  @JsonKey(
    
    name: r'similar_url',
    required: false,
    includeIfNull: false,
  )


  final String? similarUrl;



      /// Comm-Links that reference this image, included when the `commLinks` relation is loaded.
  @JsonKey(
    
    name: r'comm_links',
    required: false,
    includeIfNull: false,
  )


  final List<CommLinkImageCommLinksInner>? commLinks;



      /// Duplicate images that share the same base image, included when the `duplicates` relation is loaded.
  @JsonKey(
    
    name: r'duplicates',
    required: false,
    includeIfNull: false,
  )


  final List<CommLinkImageDuplicatesInner>? duplicates;



  @JsonKey(
    
    name: r'base_image',
    required: false,
    includeIfNull: false,
  )


  final CommLinkImageBaseImage? baseImage;



      /// Similarity percentage to the search image. Only present in reverse image search results.
  @JsonKey(
    
    name: r'similarity',
    required: false,
    includeIfNull: false,
  )


  final int? similarity;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CommLinkImage &&
      other.id == id &&
      other.name == name &&
      other.rsiUrl == rsiUrl &&
      other.apiUrl == apiUrl &&
      other.alt == alt &&
      other.size == size &&
      other.mimeType == mimeType &&
      other.lastModified == lastModified &&
      other.tags == tags &&
      other.similarUrl == similarUrl &&
      other.commLinks == commLinks &&
      other.duplicates == duplicates &&
      other.baseImage == baseImage &&
      other.similarity == similarity;

    @override
    int get hashCode =>
        id.hashCode +
        name.hashCode +
        rsiUrl.hashCode +
        (apiUrl == null ? 0 : apiUrl.hashCode) +
        alt.hashCode +
        size.hashCode +
        mimeType.hashCode +
        lastModified.hashCode +
        (tags == null ? 0 : tags.hashCode) +
        similarUrl.hashCode +
        (commLinks == null ? 0 : commLinks.hashCode) +
        (duplicates == null ? 0 : duplicates.hashCode) +
        (baseImage == null ? 0 : baseImage.hashCode) +
        (similarity == null ? 0 : similarity.hashCode);

  factory CommLinkImage.fromJson(Map<String, dynamic> json) => _$CommLinkImageFromJson(json);

  Map<String, dynamic> toJson() => _$CommLinkImageToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

