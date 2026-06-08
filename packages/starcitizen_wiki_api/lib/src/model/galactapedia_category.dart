//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'galactapedia_category.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GalactapediaCategory {
  /// Returns a new [GalactapediaCategory] instance.
  GalactapediaCategory({

     this.id,

     this.name,
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





    @override
    bool operator ==(Object other) => identical(this, other) || other is GalactapediaCategory &&
      other.id == id &&
      other.name == name;

    @override
    int get hashCode =>
        id.hashCode +
        name.hashCode;

  factory GalactapediaCategory.fromJson(Map<String, dynamic> json) => _$GalactapediaCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$GalactapediaCategoryToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

