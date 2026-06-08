//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/translation.dart';
import 'package:starcitizen_wiki_api/src/model/comm_link_link.dart';
import 'package:starcitizen_wiki_api/src/model/comm_link_image.dart';
import 'package:json_annotation/json_annotation.dart';

part 'comm_link.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CommLink {
  /// Returns a new [CommLink] instance.
  CommLink({

     this.id,

     this.title,

     this.rsiUrl,

     this.apiUrl,

     this.apiPublicUrl,

     this.channel,

     this.category,

     this.series,

     this.images,

     this.imagesCount,

     this.links,

     this.linksCount,

     this.commentCount,

     this.createdAt,

     this.translations,

     this.createdAtHuman,
  });

      /// CIG identifier for the Comm-Link
  @JsonKey(
    
    name: r'id',
    required: false,
    includeIfNull: false,
  )


  final int? id;



      /// Title of the Comm-Link
  @JsonKey(
    
    name: r'title',
    required: false,
    includeIfNull: false,
  )


  final String? title;



      /// Link to the Comm-Link on the RSI website.
  @JsonKey(
    
    name: r'rsi_url',
    required: false,
    includeIfNull: false,
  )


  final String? rsiUrl;



      /// API URL for this Comm-Link resource.
  @JsonKey(
    
    name: r'api_url',
    required: false,
    includeIfNull: false,
  )


  final String? apiUrl;



      /// Public web URL for this Comm-Link on the API portal.
  @JsonKey(
    
    name: r'api_public_url',
    required: false,
    includeIfNull: false,
  )


  final String? apiPublicUrl;



      /// Publishing channel, e.g. Engineering, Transmission.
  @JsonKey(
    
    name: r'channel',
    required: false,
    includeIfNull: false,
  )


  final String? channel;



      /// Content category, e.g. General, Community, Lore, Development.
  @JsonKey(
    
    name: r'category',
    required: false,
    includeIfNull: false,
  )


  final String? category;



      /// Series the Comm-Link belongs to, e.g. Around the Verse, 10 For the Chairman.
  @JsonKey(
    
    name: r'series',
    required: false,
    includeIfNull: false,
  )


  final String? series;



      /// Included images when the `images` relation is loaded.
  @JsonKey(
    
    name: r'images',
    required: false,
    includeIfNull: false,
  )


  final List<CommLinkImage>? images;



      /// Total number of images associated with this Comm-Link.
  @JsonKey(
    
    name: r'images_count',
    required: false,
    includeIfNull: false,
  )


  final int? imagesCount;



      /// Included links when the `links` relation is loaded.
  @JsonKey(
    
    name: r'links',
    required: false,
    includeIfNull: false,
  )


  final List<CommLinkLink>? links;



      /// Total number of external links in the Comm-Link content.
  @JsonKey(
    
    name: r'links_count',
    required: false,
    includeIfNull: false,
  )


  final int? linksCount;



      /// Number of comments on the original RSI post.
  @JsonKey(
    
    name: r'comment_count',
    required: false,
    includeIfNull: false,
  )


  final int? commentCount;



      /// ISO 8601 timestamp of when the Comm-Link was published.
  @JsonKey(
    
    name: r'created_at',
    required: false,
    includeIfNull: false,
  )


  final DateTime? createdAt;



  @JsonKey(
    
    name: r'translations',
    required: false,
    includeIfNull: false,
  )


  final Translation? translations;



      /// Human-readable relative time since publication.
  @JsonKey(
    
    name: r'created_at_human',
    required: false,
    includeIfNull: false,
  )


  final String? createdAtHuman;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CommLink &&
      other.id == id &&
      other.title == title &&
      other.rsiUrl == rsiUrl &&
      other.apiUrl == apiUrl &&
      other.apiPublicUrl == apiPublicUrl &&
      other.channel == channel &&
      other.category == category &&
      other.series == series &&
      other.images == images &&
      other.imagesCount == imagesCount &&
      other.links == links &&
      other.linksCount == linksCount &&
      other.commentCount == commentCount &&
      other.createdAt == createdAt &&
      other.translations == translations &&
      other.createdAtHuman == createdAtHuman;

    @override
    int get hashCode =>
        id.hashCode +
        title.hashCode +
        rsiUrl.hashCode +
        apiUrl.hashCode +
        apiPublicUrl.hashCode +
        channel.hashCode +
        category.hashCode +
        series.hashCode +
        images.hashCode +
        imagesCount.hashCode +
        links.hashCode +
        linksCount.hashCode +
        commentCount.hashCode +
        createdAt.hashCode +
        translations.hashCode +
        createdAtHuman.hashCode;

  factory CommLink.fromJson(Map<String, dynamic> json) => _$CommLinkFromJson(json);

  Map<String, dynamic> toJson() => _$CommLinkToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

