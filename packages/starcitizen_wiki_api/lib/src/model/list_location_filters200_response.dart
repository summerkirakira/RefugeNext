//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/list_location_filters200_response_filters.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_location_filters200_response.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ListLocationFilters200Response {
  /// Returns a new [ListLocationFilters200Response] instance.
  ListLocationFilters200Response({

     this.filters,
  });

  @JsonKey(
    
    name: r'filters',
    required: false,
    includeIfNull: false,
  )


  final ListLocationFilters200ResponseFilters? filters;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ListLocationFilters200Response &&
      other.filters == filters;

    @override
    int get hashCode =>
        filters.hashCode;

  factory ListLocationFilters200Response.fromJson(Map<String, dynamic> json) => _$ListLocationFilters200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListLocationFilters200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

