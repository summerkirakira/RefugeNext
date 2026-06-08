//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/filter_value_value.dart';
import 'package:json_annotation/json_annotation.dart';

part 'filter_value.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class FilterValue {
  /// Returns a new [FilterValue] instance.
  FilterValue({

     this.value,

     this.label,

     this.count,
  });

  @JsonKey(
    
    name: r'value',
    required: false,
    includeIfNull: false,
  )


  final FilterValueValue? value;



  @JsonKey(
    
    name: r'label',
    required: false,
    includeIfNull: false,
  )


  final String? label;



      /// Result count when supplied by the facet.
  @JsonKey(
    
    name: r'count',
    required: false,
    includeIfNull: false,
  )


  final int? count;





    @override
    bool operator ==(Object other) => identical(this, other) || other is FilterValue &&
      other.value == value &&
      other.label == label &&
      other.count == count;

    @override
    int get hashCode =>
        (value == null ? 0 : value.hashCode) +
        label.hashCode +
        (count == null ? 0 : count.hashCode);

  factory FilterValue.fromJson(Map<String, dynamic> json) => _$FilterValueFromJson(json);

  Map<String, dynamic> toJson() => _$FilterValueToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

