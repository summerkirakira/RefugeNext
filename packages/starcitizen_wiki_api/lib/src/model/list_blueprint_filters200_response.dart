//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/list_blueprint_filters200_response_filters.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_blueprint_filters200_response.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ListBlueprintFilters200Response {
  /// Returns a new [ListBlueprintFilters200Response] instance.
  ListBlueprintFilters200Response({

     this.filters,
  });

  @JsonKey(
    
    name: r'filters',
    required: false,
    includeIfNull: false,
  )


  final ListBlueprintFilters200ResponseFilters? filters;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ListBlueprintFilters200Response &&
      other.filters == filters;

    @override
    int get hashCode =>
        filters.hashCode;

  factory ListBlueprintFilters200Response.fromJson(Map<String, dynamic> json) => _$ListBlueprintFilters200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListBlueprintFilters200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

