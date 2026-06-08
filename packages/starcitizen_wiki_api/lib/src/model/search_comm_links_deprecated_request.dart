//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'search_comm_links_deprecated_request.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SearchCommLinksDeprecatedRequest {
  /// Returns a new [SearchCommLinksDeprecatedRequest] instance.
  SearchCommLinksDeprecatedRequest({

     this.keyword,

     this.query,
  });

      /// Search term for partial title match (min 3 characters)
  @JsonKey(
    
    name: r'keyword',
    required: false,
    includeIfNull: false,
  )


  final String? keyword;



      /// Search term for partial title match or numeric CIG ID (min 1 character)
  @JsonKey(
    
    name: r'query',
    required: false,
    includeIfNull: false,
  )


  final String? query;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SearchCommLinksDeprecatedRequest &&
      other.keyword == keyword &&
      other.query == query;

    @override
    int get hashCode =>
        keyword.hashCode +
        query.hashCode;

  factory SearchCommLinksDeprecatedRequest.fromJson(Map<String, dynamic> json) => _$SearchCommLinksDeprecatedRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SearchCommLinksDeprecatedRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

