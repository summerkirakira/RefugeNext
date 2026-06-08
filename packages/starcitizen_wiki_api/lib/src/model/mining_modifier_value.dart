//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'mining_modifier_value.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MiningModifierValue {
  /// Returns a new [MiningModifierValue] instance.
  MiningModifierValue();



    @override
    bool operator ==(Object other) => identical(this, other) || other is MiningModifierValue;

    @override
    int get hashCode => runtimeType.hashCode;

  factory MiningModifierValue.fromJson(Map<String, dynamic> json) => _$MiningModifierValueFromJson(json);

  Map<String, dynamic> toJson() => _$MiningModifierValueToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

