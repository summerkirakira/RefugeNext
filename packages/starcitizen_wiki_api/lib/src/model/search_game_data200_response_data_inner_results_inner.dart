//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'search_game_data200_response_data_inner_results_inner.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SearchGameData200ResponseDataInnerResultsInner {
  /// Returns a new [SearchGameData200ResponseDataInnerResultsInner] instance.
  SearchGameData200ResponseDataInnerResultsInner({

     this.name,

     this.className,

     this.classification,

     this.classificationLabel,

     this.itemTypeLabel,

     this.extraLabel,

     this.webUrl,

     this.apiUrl,
  });

  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



  @JsonKey(
    
    name: r'class_name',
    required: false,
    includeIfNull: false,
  )


  final String? className;



  @JsonKey(
    
    name: r'classification',
    required: false,
    includeIfNull: false,
  )


  final String? classification;



  @JsonKey(
    
    name: r'classification_label',
    required: false,
    includeIfNull: false,
  )


  final String? classificationLabel;



  @JsonKey(
    
    name: r'item_type_label',
    required: false,
    includeIfNull: false,
  )


  final String? itemTypeLabel;



  @JsonKey(
    
    name: r'extra_label',
    required: false,
    includeIfNull: false,
  )


  final String? extraLabel;



  @JsonKey(
    
    name: r'web_url',
    required: false,
    includeIfNull: false,
  )


  final String? webUrl;



  @JsonKey(
    
    name: r'api_url',
    required: false,
    includeIfNull: false,
  )


  final String? apiUrl;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SearchGameData200ResponseDataInnerResultsInner &&
      other.name == name &&
      other.className == className &&
      other.classification == classification &&
      other.classificationLabel == classificationLabel &&
      other.itemTypeLabel == itemTypeLabel &&
      other.extraLabel == extraLabel &&
      other.webUrl == webUrl &&
      other.apiUrl == apiUrl;

    @override
    int get hashCode =>
        name.hashCode +
        (className == null ? 0 : className.hashCode) +
        (classification == null ? 0 : classification.hashCode) +
        (classificationLabel == null ? 0 : classificationLabel.hashCode) +
        (itemTypeLabel == null ? 0 : itemTypeLabel.hashCode) +
        (extraLabel == null ? 0 : extraLabel.hashCode) +
        webUrl.hashCode +
        apiUrl.hashCode;

  factory SearchGameData200ResponseDataInnerResultsInner.fromJson(Map<String, dynamic> json) => _$SearchGameData200ResponseDataInnerResultsInnerFromJson(json);

  Map<String, dynamic> toJson() => _$SearchGameData200ResponseDataInnerResultsInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

