//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/list_item_filters200_response_filters.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_item_filters200_response.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ListItemFilters200Response {
  /// Returns a new [ListItemFilters200Response] instance.
  ListItemFilters200Response({

     this.filters,
  });

  @JsonKey(
    
    name: r'filters',
    required: false,
    includeIfNull: false,
  )


  final ListItemFilters200ResponseFilters? filters;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ListItemFilters200Response &&
      other.filters == filters;

    @override
    int get hashCode =>
        filters.hashCode;

  factory ListItemFilters200Response.fromJson(Map<String, dynamic> json) => _$ListItemFilters200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListItemFilters200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

