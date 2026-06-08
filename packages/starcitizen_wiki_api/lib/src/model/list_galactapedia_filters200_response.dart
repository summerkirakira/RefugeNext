//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/list_galactapedia_filters200_response_filters.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_galactapedia_filters200_response.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ListGalactapediaFilters200Response {
  /// Returns a new [ListGalactapediaFilters200Response] instance.
  ListGalactapediaFilters200Response({

     this.filters,
  });

  @JsonKey(
    
    name: r'filters',
    required: false,
    includeIfNull: false,
  )


  final ListGalactapediaFilters200ResponseFilters? filters;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ListGalactapediaFilters200Response &&
      other.filters == filters;

    @override
    int get hashCode =>
        filters.hashCode;

  factory ListGalactapediaFilters200Response.fromJson(Map<String, dynamic> json) => _$ListGalactapediaFilters200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListGalactapediaFilters200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

