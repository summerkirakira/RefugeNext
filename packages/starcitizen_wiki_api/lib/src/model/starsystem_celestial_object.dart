//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/starsystem_celestial_object_celestial_object.dart';
import 'package:json_annotation/json_annotation.dart';

part 'starsystem_celestial_object.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class StarsystemCelestialObject {
  /// Returns a new [StarsystemCelestialObject] instance.
  StarsystemCelestialObject({

     this.celestialObject,
  });

  @JsonKey(
    
    name: r'celestial_object',
    required: false,
    includeIfNull: false,
  )


  final StarsystemCelestialObjectCelestialObject? celestialObject;





    @override
    bool operator ==(Object other) => identical(this, other) || other is StarsystemCelestialObject &&
      other.celestialObject == celestialObject;

    @override
    int get hashCode =>
        (celestialObject == null ? 0 : celestialObject.hashCode);

  factory StarsystemCelestialObject.fromJson(Map<String, dynamic> json) => _$StarsystemCelestialObjectFromJson(json);

  Map<String, dynamic> toJson() => _$StarsystemCelestialObjectToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

