//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/ship_matrix_vehicle.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_ship_matrix_vehicles_deprecated200_response.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SearchShipMatrixVehiclesDeprecated200Response {
  /// Returns a new [SearchShipMatrixVehiclesDeprecated200Response] instance.
  SearchShipMatrixVehiclesDeprecated200Response({

     this.data,
  });

  @JsonKey(
    
    name: r'data',
    required: false,
    includeIfNull: false,
  )


  final List<ShipMatrixVehicle>? data;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SearchShipMatrixVehiclesDeprecated200Response &&
      other.data == data;

    @override
    int get hashCode =>
        data.hashCode;

  factory SearchShipMatrixVehiclesDeprecated200Response.fromJson(Map<String, dynamic> json) => _$SearchShipMatrixVehiclesDeprecated200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SearchShipMatrixVehiclesDeprecated200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

