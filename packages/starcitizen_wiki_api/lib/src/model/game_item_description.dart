//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
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
  GameItemDescription({

     this.enEN,

     this.deDE,

     this.zhCN,

     this.frFR,
  });

  @JsonKey(

    name: r'en_EN',
    required: false,
    includeIfNull: false,
  )


  final String? enEN;



  @JsonKey(

    name: r'de_DE',
    required: false,
    includeIfNull: false,
  )


  final String? deDE;



  @JsonKey(

    name: r'zh_CN',
    required: false,
    includeIfNull: false,
  )


  final String? zhCN;



  @JsonKey(

    name: r'fr_FR',
    required: false,
    includeIfNull: false,
  )


  final String? frFR;



    @override
    bool operator ==(Object other) => identical(this, other) || other is GameItemDescription &&
      other.enEN == enEN &&
      other.deDE == deDE &&
      other.zhCN == zhCN &&
      other.frFR == frFR;

    @override
    int get hashCode =>
        enEN.hashCode +
        deDE.hashCode +
        zhCN.hashCode +
        frFR.hashCode;

  factory GameItemDescription.fromJson(Map<String, dynamic> json) => _$GameItemDescriptionFromJson(json);

  Map<String, dynamic> toJson() => _$GameItemDescriptionToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

