//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/starsystem.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_starsystems_deprecated200_response.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SearchStarsystemsDeprecated200Response {
  /// Returns a new [SearchStarsystemsDeprecated200Response] instance.
  SearchStarsystemsDeprecated200Response({

     this.data,
  });

  @JsonKey(
    
    name: r'data',
    required: false,
    includeIfNull: false,
  )


  final List<Starsystem>? data;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SearchStarsystemsDeprecated200Response &&
      other.data == data;

    @override
    int get hashCode =>
        data.hashCode;

  factory SearchStarsystemsDeprecated200Response.fromJson(Map<String, dynamic> json) => _$SearchStarsystemsDeprecated200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SearchStarsystemsDeprecated200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

