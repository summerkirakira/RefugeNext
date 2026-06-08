//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/list_vehicle_filters200_response_filters.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_vehicle_filters200_response.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ListVehicleFilters200Response {
  /// Returns a new [ListVehicleFilters200Response] instance.
  ListVehicleFilters200Response({

     this.filters,
  });

  @JsonKey(
    
    name: r'filters',
    required: false,
    includeIfNull: false,
  )


  final ListVehicleFilters200ResponseFilters? filters;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ListVehicleFilters200Response &&
      other.filters == filters;

    @override
    int get hashCode =>
        filters.hashCode;

  factory ListVehicleFilters200Response.fromJson(Map<String, dynamic> json) => _$ListVehicleFilters200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListVehicleFilters200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

