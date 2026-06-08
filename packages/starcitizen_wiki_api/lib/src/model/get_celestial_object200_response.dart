//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/celestial_object.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_celestial_object200_response.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GetCelestialObject200Response {
  /// Returns a new [GetCelestialObject200Response] instance.
  GetCelestialObject200Response({

     this.data,
  });

  @JsonKey(
    
    name: r'data',
    required: false,
    includeIfNull: false,
  )


  final CelestialObject? data;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GetCelestialObject200Response &&
      other.data == data;

    @override
    int get hashCode =>
        data.hashCode;

  factory GetCelestialObject200Response.fromJson(Map<String, dynamic> json) => _$GetCelestialObject200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetCelestialObject200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

