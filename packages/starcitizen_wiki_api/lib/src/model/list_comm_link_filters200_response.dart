//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/list_comm_link_filters200_response_filters.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_comm_link_filters200_response.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ListCommLinkFilters200Response {
  /// Returns a new [ListCommLinkFilters200Response] instance.
  ListCommLinkFilters200Response({

     this.filters,
  });

  @JsonKey(
    
    name: r'filters',
    required: false,
    includeIfNull: false,
  )


  final ListCommLinkFilters200ResponseFilters? filters;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ListCommLinkFilters200Response &&
      other.filters == filters;

    @override
    int get hashCode =>
        filters.hashCode;

  factory ListCommLinkFilters200Response.fromJson(Map<String, dynamic> json) => _$ListCommLinkFilters200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListCommLinkFilters200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

