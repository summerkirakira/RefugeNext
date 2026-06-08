//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'game_item_images_inner.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GameItemImagesInner {
  /// Returns a new [GameItemImagesInner] instance.
  GameItemImagesInner({

     this.source_,

     this.thumbnailUrl,

     this.thumbnailWidth,

     this.thumbnailHeight,

     this.originalUrl,

     this.originalWidth,

     this.originalHeight,
  });

      /// Image source identifier
  @JsonKey(
    
    name: r'source',
    required: false,
    includeIfNull: false,
  )


  final String? source_;



      /// URL of the thumbnail image.
  @JsonKey(
    
    name: r'thumbnail_url',
    required: false,
    includeIfNull: false,
  )


  final String? thumbnailUrl;



      /// Thumbnail width in pixels.
  @JsonKey(
    
    name: r'thumbnail_width',
    required: false,
    includeIfNull: false,
  )


  final int? thumbnailWidth;



      /// Thumbnail height in pixels.
  @JsonKey(
    
    name: r'thumbnail_height',
    required: false,
    includeIfNull: false,
  )


  final int? thumbnailHeight;



      /// URL of the original full-size image.
  @JsonKey(
    
    name: r'original_url',
    required: false,
    includeIfNull: false,
  )


  final String? originalUrl;



      /// Original image width in pixels.
  @JsonKey(
    
    name: r'original_width',
    required: false,
    includeIfNull: false,
  )


  final int? originalWidth;



      /// Original image height in pixels.
  @JsonKey(
    
    name: r'original_height',
    required: false,
    includeIfNull: false,
  )


  final int? originalHeight;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GameItemImagesInner &&
      other.source_ == source_ &&
      other.thumbnailUrl == thumbnailUrl &&
      other.thumbnailWidth == thumbnailWidth &&
      other.thumbnailHeight == thumbnailHeight &&
      other.originalUrl == originalUrl &&
      other.originalWidth == originalWidth &&
      other.originalHeight == originalHeight;

    @override
    int get hashCode =>
        source_.hashCode +
        (thumbnailUrl == null ? 0 : thumbnailUrl.hashCode) +
        (thumbnailWidth == null ? 0 : thumbnailWidth.hashCode) +
        (thumbnailHeight == null ? 0 : thumbnailHeight.hashCode) +
        (originalUrl == null ? 0 : originalUrl.hashCode) +
        (originalWidth == null ? 0 : originalWidth.hashCode) +
        (originalHeight == null ? 0 : originalHeight.hashCode);

  factory GameItemImagesInner.fromJson(Map<String, dynamic> json) => _$GameItemImagesInnerFromJson(json);

  Map<String, dynamic> toJson() => _$GameItemImagesInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

