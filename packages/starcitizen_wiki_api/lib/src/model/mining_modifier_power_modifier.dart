//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'mining_modifier_power_modifier.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MiningModifierPowerModifier {
  /// Returns a new [MiningModifierPowerModifier] instance.
  MiningModifierPowerModifier();



    @override
    bool operator ==(Object other) => identical(this, other) || other is MiningModifierPowerModifier;

    @override
    int get hashCode => runtimeType.hashCode;

  factory MiningModifierPowerModifier.fromJson(Map<String, dynamic> json) => _$MiningModifierPowerModifierFromJson(json);

  Map<String, dynamic> toJson() => _$MiningModifierPowerModifierToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

