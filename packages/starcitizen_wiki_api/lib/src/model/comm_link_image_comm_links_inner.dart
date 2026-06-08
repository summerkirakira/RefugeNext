//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'comm_link_image_comm_links_inner.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CommLinkImageCommLinksInner {
  /// Returns a new [CommLinkImageCommLinksInner] instance.
  CommLinkImageCommLinksInner({

     this.id,

     this.title,

     this.apiUrl,

     this.webUrl,
  });

      /// CIG identifier of the Comm-Link
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



      /// API URL for this Comm-Link resource.
  @JsonKey(
    
    name: r'api_url',
    required: false,
    includeIfNull: false,
  )


  final String? apiUrl;



      /// Public web URL for this Comm-Link.
  @JsonKey(
    
    name: r'web_url',
    required: false,
    includeIfNull: false,
  )


  final String? webUrl;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CommLinkImageCommLinksInner &&
      other.id == id &&
      other.title == title &&
      other.apiUrl == apiUrl &&
      other.webUrl == webUrl;

    @override
    int get hashCode =>
        id.hashCode +
        title.hashCode +
        apiUrl.hashCode +
        webUrl.hashCode;

  factory CommLinkImageCommLinksInner.fromJson(Map<String, dynamic> json) => _$CommLinkImageCommLinksInnerFromJson(json);

  Map<String, dynamic> toJson() => _$CommLinkImageCommLinksInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

