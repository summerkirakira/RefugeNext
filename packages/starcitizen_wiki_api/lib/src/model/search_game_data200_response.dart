//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/search_game_data200_response_data_inner.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_game_data200_response.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SearchGameData200Response {
  /// Returns a new [SearchGameData200Response] instance.
  SearchGameData200Response({

     this.data,
  });

  @JsonKey(
    
    name: r'data',
    required: false,
    includeIfNull: false,
  )


  final List<SearchGameData200ResponseDataInner>? data;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SearchGameData200Response &&
      other.data == data;

    @override
    int get hashCode =>
        data.hashCode;

  factory SearchGameData200Response.fromJson(Map<String, dynamic> json) => _$SearchGameData200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SearchGameData200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

