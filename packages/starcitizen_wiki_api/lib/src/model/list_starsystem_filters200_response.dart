//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/list_starsystem_filters200_response_filters.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_starsystem_filters200_response.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ListStarsystemFilters200Response {
  /// Returns a new [ListStarsystemFilters200Response] instance.
  ListStarsystemFilters200Response({

     this.filters,
  });

  @JsonKey(
    
    name: r'filters',
    required: false,
    includeIfNull: false,
  )


  final ListStarsystemFilters200ResponseFilters? filters;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ListStarsystemFilters200Response &&
      other.filters == filters;

    @override
    int get hashCode =>
        filters.hashCode;

  factory ListStarsystemFilters200Response.fromJson(Map<String, dynamic> json) => _$ListStarsystemFilters200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListStarsystemFilters200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

