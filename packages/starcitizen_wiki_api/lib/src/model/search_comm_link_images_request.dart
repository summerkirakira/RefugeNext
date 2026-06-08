//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'search_comm_link_images_request.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SearchCommLinkImagesRequest {
  /// Returns a new [SearchCommLinkImagesRequest] instance.
  SearchCommLinkImagesRequest({

    required  this.query,
  });

      /// Search term matched against image filenames (partial match)
  @JsonKey(
    
    name: r'query',
    required: true,
    includeIfNull: false,
  )


  final String query;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SearchCommLinkImagesRequest &&
      other.query == query;

    @override
    int get hashCode =>
        query.hashCode;

  factory SearchCommLinkImagesRequest.fromJson(Map<String, dynamic> json) => _$SearchCommLinkImagesRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SearchCommLinkImagesRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

