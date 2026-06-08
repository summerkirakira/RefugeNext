//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/search_game_data200_response_data_inner_results_inner.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_game_data200_response_data_inner.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SearchGameData200ResponseDataInner {
  /// Returns a new [SearchGameData200ResponseDataInner] instance.
  SearchGameData200ResponseDataInner({

     this.type,

     this.label,

     this.results,
  });

  @JsonKey(
    
    name: r'type',
    required: false,
    includeIfNull: false,
  )


  final String? type;



  @JsonKey(
    
    name: r'label',
    required: false,
    includeIfNull: false,
  )


  final String? label;



  @JsonKey(
    
    name: r'results',
    required: false,
    includeIfNull: false,
  )


  final List<SearchGameData200ResponseDataInnerResultsInner>? results;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SearchGameData200ResponseDataInner &&
      other.type == type &&
      other.label == label &&
      other.results == results;

    @override
    int get hashCode =>
        type.hashCode +
        label.hashCode +
        results.hashCode;

  factory SearchGameData200ResponseDataInner.fromJson(Map<String, dynamic> json) => _$SearchGameData200ResponseDataInnerFromJson(json);

  Map<String, dynamic> toJson() => _$SearchGameData200ResponseDataInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

