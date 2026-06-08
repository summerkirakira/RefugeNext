//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'reverse_image_link_search_request.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ReverseImageLinkSearchRequest {
  /// Returns a new [ReverseImageLinkSearchRequest] instance.
  ReverseImageLinkSearchRequest({

    required  this.url,
  });

      /// Full URL to an image hosted on robertsspaceindustries.com or media.robertsspaceindustries.com
  @JsonKey(
    
    name: r'url',
    required: true,
    includeIfNull: false,
  )


  final String url;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ReverseImageLinkSearchRequest &&
      other.url == url;

    @override
    int get hashCode =>
        url.hashCode;

  factory ReverseImageLinkSearchRequest.fromJson(Map<String, dynamic> json) => _$ReverseImageLinkSearchRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ReverseImageLinkSearchRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

