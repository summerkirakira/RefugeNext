//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/translation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'game_item_description.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GameItemDescription {
  /// Returns a new [GameItemDescription] instance.
  GameItemDescription();



    @override
    bool operator ==(Object other) => identical(this, other) || other is GameItemDescription;

    @override
    int get hashCode => runtimeType.hashCode;

  factory GameItemDescription.fromJson(Map<String, dynamic> json) => _$GameItemDescriptionFromJson(json);

  Map<String, dynamic> toJson() => _$GameItemDescriptionToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

