//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/get_ground_vehicle200_response_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_ground_vehicle200_response.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GetGroundVehicle200Response {
  /// Returns a new [GetGroundVehicle200Response] instance.
  GetGroundVehicle200Response({

     this.data,
  });

  @JsonKey(
    
    name: r'data',
    required: false,
    includeIfNull: false,
  )


  final GetGroundVehicle200ResponseData? data;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GetGroundVehicle200Response &&
      other.data == data;

    @override
    int get hashCode =>
        data.hashCode;

  factory GetGroundVehicle200Response.fromJson(Map<String, dynamic> json) => _$GetGroundVehicle200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetGroundVehicle200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

