//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'celestial_object_starsystem.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CelestialObjectStarsystem {
  /// Returns a new [CelestialObjectStarsystem] instance.
  CelestialObjectStarsystem({

     this.id,

     this.code,

     this.name,
  });

  @JsonKey(
    
    name: r'id',
    required: false,
    includeIfNull: false,
  )


  final int? id;



  @JsonKey(
    
    name: r'code',
    required: false,
    includeIfNull: false,
  )


  final String? code;



  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CelestialObjectStarsystem &&
      other.id == id &&
      other.code == code &&
      other.name == name;

    @override
    int get hashCode =>
        (id == null ? 0 : id.hashCode) +
        (code == null ? 0 : code.hashCode) +
        (name == null ? 0 : name.hashCode);

  factory CelestialObjectStarsystem.fromJson(Map<String, dynamic> json) => _$CelestialObjectStarsystemFromJson(json);

  Map<String, dynamic> toJson() => _$CelestialObjectStarsystemToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

