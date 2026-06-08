//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'search_celestial_objects_deprecated_request.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SearchCelestialObjectsDeprecatedRequest {
  /// Returns a new [SearchCelestialObjectsDeprecatedRequest] instance.
  SearchCelestialObjectsDeprecatedRequest({

     this.query,
  });

  @JsonKey(
    
    name: r'query',
    required: false,
    includeIfNull: false,
  )


  final String? query;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SearchCelestialObjectsDeprecatedRequest &&
      other.query == query;

    @override
    int get hashCode =>
        query.hashCode;

  factory SearchCelestialObjectsDeprecatedRequest.fromJson(Map<String, dynamic> json) => _$SearchCelestialObjectsDeprecatedRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SearchCelestialObjectsDeprecatedRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

