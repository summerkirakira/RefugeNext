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

     this.en,

     this.de,

     this.zh,

     this.fr,
  });

  @JsonKey(
    
    name: r'en',
    required: false,
    includeIfNull: false,
  )


  final String? en;



  @JsonKey(
    
    name: r'de',
    required: false,
    includeIfNull: false,
  )


  final String? de;



  @JsonKey(
    
    name: r'zh',
    required: false,
    includeIfNull: false,
  )


  final String? zh;



  @JsonKey(
    
    name: r'fr',
    required: false,
    includeIfNull: false,
  )


  final String? fr;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Translation &&
      other.en == en &&
      other.de == de &&
      other.zh == zh &&
      other.fr == fr;

    @override
    int get hashCode =>
        en.hashCode +
        de.hashCode +
        zh.hashCode +
        fr.hashCode;

  factory Translation.fromJson(Map<String, dynamic> json) => _$TranslationFromJson(json);

  Map<String, dynamic> toJson() => _$TranslationToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

