//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'game_vehicle_game_description.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GameVehicleGameDescription {
  /// Returns a new [GameVehicleGameDescription] instance.
  GameVehicleGameDescription();



    @override
    bool operator ==(Object other) => identical(this, other) || other is GameVehicleGameDescription;

    @override
    int get hashCode => runtimeType.hashCode;

  factory GameVehicleGameDescription.fromJson(Map<String, dynamic> json) => _$GameVehicleGameDescriptionFromJson(json);

  Map<String, dynamic> toJson() => _$GameVehicleGameDescriptionToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

