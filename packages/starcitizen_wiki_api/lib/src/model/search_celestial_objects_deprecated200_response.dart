//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/celestial_object.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_celestial_objects_deprecated200_response.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SearchCelestialObjectsDeprecated200Response {
  /// Returns a new [SearchCelestialObjectsDeprecated200Response] instance.
  SearchCelestialObjectsDeprecated200Response({

     this.data,
  });

  @JsonKey(
    
    name: r'data',
    required: false,
    includeIfNull: false,
  )


  final List<CelestialObject>? data;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SearchCelestialObjectsDeprecated200Response &&
      other.data == data;

    @override
    int get hashCode =>
        data.hashCode;

  factory SearchCelestialObjectsDeprecated200Response.fromJson(Map<String, dynamic> json) => _$SearchCelestialObjectsDeprecated200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SearchCelestialObjectsDeprecated200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

