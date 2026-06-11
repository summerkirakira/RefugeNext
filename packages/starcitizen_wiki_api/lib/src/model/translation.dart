//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'translation.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Translation {
  /// Returns a new [Translation] instance.
  Translation({

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
    bool operator ==(Object other) => identical(this, other) || other is Translation &&
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

  factory Translation.fromJson(Map<String, dynamic> json) => _$TranslationFromJson(json);

  Map<String, dynamic> toJson() => _$TranslationToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

