//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'filter_value_value.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class FilterValueValue {
  /// Returns a new [FilterValueValue] instance.
  FilterValueValue();



    @override
    bool operator ==(Object other) => identical(this, other) || other is FilterValueValue;

    @override
    int get hashCode => runtimeType.hashCode;

  factory FilterValueValue.fromJson(Map<String, dynamic> json) => _$FilterValueValueFromJson(json);

  Map<String, dynamic> toJson() => _$FilterValueValueToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

