//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/ship_matrix_vehicle.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_ship_matrix_vehicle200_response.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GetShipMatrixVehicle200Response {
  /// Returns a new [GetShipMatrixVehicle200Response] instance.
  GetShipMatrixVehicle200Response({

     this.data,
  });

  @JsonKey(
    
    name: r'data',
    required: false,
    includeIfNull: false,
  )


  final ShipMatrixVehicle? data;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GetShipMatrixVehicle200Response &&
      other.data == data;

    @override
    int get hashCode =>
        data.hashCode;

  factory GetShipMatrixVehicle200Response.fromJson(Map<String, dynamic> json) => _$GetShipMatrixVehicle200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetShipMatrixVehicle200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

