//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/list_ship_matrix_filters200_response_filters.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_ship_matrix_filters200_response.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ListShipMatrixFilters200Response {
  /// Returns a new [ListShipMatrixFilters200Response] instance.
  ListShipMatrixFilters200Response({

     this.filters,
  });

  @JsonKey(
    
    name: r'filters',
    required: false,
    includeIfNull: false,
  )


  final ListShipMatrixFilters200ResponseFilters? filters;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ListShipMatrixFilters200Response &&
      other.filters == filters;

    @override
    int get hashCode =>
        filters.hashCode;

  factory ListShipMatrixFilters200Response.fromJson(Map<String, dynamic> json) => _$ListShipMatrixFilters200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListShipMatrixFilters200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

