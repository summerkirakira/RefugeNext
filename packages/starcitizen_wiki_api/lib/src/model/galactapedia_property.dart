//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'galactapedia_property.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GalactapediaProperty {
  /// Returns a new [GalactapediaProperty] instance.
  GalactapediaProperty({

     this.name,

     this.value,
  });

  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



  @JsonKey(
    
    name: r'value',
    required: false,
    includeIfNull: false,
  )


  final String? value;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GalactapediaProperty &&
      other.name == name &&
      other.value == value;

    @override
    int get hashCode =>
        name.hashCode +
        value.hashCode;

  factory GalactapediaProperty.fromJson(Map<String, dynamic> json) => _$GalactapediaPropertyFromJson(json);

  Map<String, dynamic> toJson() => _$GalactapediaPropertyToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

