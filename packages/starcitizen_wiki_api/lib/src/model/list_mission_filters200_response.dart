//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/list_mission_filters200_response_filters.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_mission_filters200_response.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ListMissionFilters200Response {
  /// Returns a new [ListMissionFilters200Response] instance.
  ListMissionFilters200Response({

     this.filters,
  });

  @JsonKey(
    
    name: r'filters',
    required: false,
    includeIfNull: false,
  )


  final ListMissionFilters200ResponseFilters? filters;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ListMissionFilters200Response &&
      other.filters == filters;

    @override
    int get hashCode =>
        filters.hashCode;

  factory ListMissionFilters200Response.fromJson(Map<String, dynamic> json) => _$ListMissionFilters200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListMissionFilters200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

