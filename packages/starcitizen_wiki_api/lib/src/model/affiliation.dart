//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'affiliation.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Affiliation {
  /// Returns a new [Affiliation] instance.
  Affiliation({

     this.id,

     this.name,

     this.code,

     this.color,
  });

  @JsonKey(
    
    name: r'id',
    required: false,
    includeIfNull: false,
  )


  final String? id;



  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



  @JsonKey(
    
    name: r'code',
    required: false,
    includeIfNull: false,
  )


  final String? code;



  @JsonKey(
    
    name: r'color',
    required: false,
    includeIfNull: false,
  )


  final String? color;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Affiliation &&
      other.id == id &&
      other.name == name &&
      other.code == code &&
      other.color == color;

    @override
    int get hashCode =>
        id.hashCode +
        name.hashCode +
        code.hashCode +
        color.hashCode;

  factory Affiliation.fromJson(Map<String, dynamic> json) => _$AffiliationFromJson(json);

  Map<String, dynamic> toJson() => _$AffiliationToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

