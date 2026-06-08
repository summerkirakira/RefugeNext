//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'game_vehicle_images_inner.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GameVehicleImagesInner {
  /// Returns a new [GameVehicleImagesInner] instance.
  GameVehicleImagesInner({

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



  @JsonKey(
    
    name: r'thumbnail_url',
    required: false,
    includeIfNull: false,
  )


  final String? thumbnailUrl;



  @JsonKey(
    
    name: r'thumbnail_width',
    required: false,
    includeIfNull: false,
  )


  final int? thumbnailWidth;



  @JsonKey(
    
    name: r'thumbnail_height',
    required: false,
    includeIfNull: false,
  )


  final int? thumbnailHeight;



  @JsonKey(
    
    name: r'original_url',
    required: false,
    includeIfNull: false,
  )


  final String? originalUrl;



  @JsonKey(
    
    name: r'original_width',
    required: false,
    includeIfNull: false,
  )


  final int? originalWidth;



  @JsonKey(
    
    name: r'original_height',
    required: false,
    includeIfNull: false,
  )


  final int? originalHeight;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GameVehicleImagesInner &&
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

  factory GameVehicleImagesInner.fromJson(Map<String, dynamic> json) => _$GameVehicleImagesInnerFromJson(json);

  Map<String, dynamic> toJson() => _$GameVehicleImagesInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

