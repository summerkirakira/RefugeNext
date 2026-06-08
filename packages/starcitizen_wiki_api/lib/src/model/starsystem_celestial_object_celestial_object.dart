//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/celestial_object.dart';
import 'package:json_annotation/json_annotation.dart';

part 'starsystem_celestial_object_celestial_object.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class StarsystemCelestialObjectCelestialObject {
  /// Returns a new [StarsystemCelestialObjectCelestialObject] instance.
  StarsystemCelestialObjectCelestialObject({

     this.data,
  });

  @JsonKey(
    
    name: r'data',
    required: false,
    includeIfNull: false,
  )


  final CelestialObject? data;





    @override
    bool operator ==(Object other) => identical(this, other) || other is StarsystemCelestialObjectCelestialObject &&
      other.data == data;

    @override
    int get hashCode =>
        data.hashCode;

  factory StarsystemCelestialObjectCelestialObject.fromJson(Map<String, dynamic> json) => _$StarsystemCelestialObjectCelestialObjectFromJson(json);

  Map<String, dynamic> toJson() => _$StarsystemCelestialObjectCelestialObjectToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

