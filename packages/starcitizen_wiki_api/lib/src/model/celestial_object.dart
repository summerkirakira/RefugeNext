//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/celestial_object_sensor.dart';
import 'package:starcitizen_wiki_api/src/model/celestial_object_starsystem.dart';
import 'package:json_annotation/json_annotation.dart';

part 'celestial_object.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CelestialObject {
  /// Returns a new [CelestialObject] instance.
  CelestialObject({

     this.id,

     this.code,

     this.systemId,

     this.celestialObjectApiUrl,

     this.webUrl,

     this.name,

     this.type,

     this.age,

     this.habitable,

     this.fairchanceact,

     this.appearance,

     this.designation,

     this.distance,

     this.latitude,

     this.longitude,

     this.axialTilt,

     this.orbitPeriod,

     this.infoUrl,

     this.description,

     this.sensor,

     this.size,

     this.parentId,

     this.starsystem,

     this.timeModified,
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
    
    name: r'system_id',
    required: false,
    includeIfNull: false,
  )


  final int? systemId;



  @JsonKey(
    
    name: r'celestial_object_api_url',
    required: false,
    includeIfNull: false,
  )


  final String? celestialObjectApiUrl;



  @JsonKey(
    
    name: r'web_url',
    required: false,
    includeIfNull: false,
  )


  final String? webUrl;



  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



  @JsonKey(
    
    name: r'type',
    required: false,
    includeIfNull: false,
  )


  final String? type;



  @JsonKey(
    
    name: r'age',
    required: false,
    includeIfNull: false,
  )


  final int? age;



  @JsonKey(
    
    name: r'habitable',
    required: false,
    includeIfNull: false,
  )


  final bool? habitable;



  @JsonKey(
    
    name: r'fairchanceact',
    required: false,
    includeIfNull: false,
  )


  final bool? fairchanceact;



  @JsonKey(
    
    name: r'appearance',
    required: false,
    includeIfNull: false,
  )


  final String? appearance;



  @JsonKey(
    
    name: r'designation',
    required: false,
    includeIfNull: false,
  )


  final String? designation;



  @JsonKey(
    
    name: r'distance',
    required: false,
    includeIfNull: false,
  )


  final double? distance;



  @JsonKey(
    
    name: r'latitude',
    required: false,
    includeIfNull: false,
  )


  final double? latitude;



  @JsonKey(
    
    name: r'longitude',
    required: false,
    includeIfNull: false,
  )


  final double? longitude;



  @JsonKey(
    
    name: r'axial_tilt',
    required: false,
    includeIfNull: false,
  )


  final double? axialTilt;



  @JsonKey(
    
    name: r'orbit_period',
    required: false,
    includeIfNull: false,
  )


  final double? orbitPeriod;



  @JsonKey(
    
    name: r'info_url',
    required: false,
    includeIfNull: false,
  )


  final String? infoUrl;



  @JsonKey(
    
    name: r'description',
    required: false,
    includeIfNull: false,
  )


  final Object? description;



  @JsonKey(
    
    name: r'sensor',
    required: false,
    includeIfNull: false,
  )


  final CelestialObjectSensor? sensor;



  @JsonKey(
    
    name: r'size',
    required: false,
    includeIfNull: false,
  )


  final double? size;



  @JsonKey(
    
    name: r'parent_id',
    required: false,
    includeIfNull: false,
  )


  final int? parentId;



  @JsonKey(
    
    name: r'starsystem',
    required: false,
    includeIfNull: false,
  )


  final CelestialObjectStarsystem? starsystem;



  @JsonKey(
    
    name: r'time_modified',
    required: false,
    includeIfNull: false,
  )


  final String? timeModified;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CelestialObject &&
      other.id == id &&
      other.code == code &&
      other.systemId == systemId &&
      other.celestialObjectApiUrl == celestialObjectApiUrl &&
      other.webUrl == webUrl &&
      other.name == name &&
      other.type == type &&
      other.age == age &&
      other.habitable == habitable &&
      other.fairchanceact == fairchanceact &&
      other.appearance == appearance &&
      other.designation == designation &&
      other.distance == distance &&
      other.latitude == latitude &&
      other.longitude == longitude &&
      other.axialTilt == axialTilt &&
      other.orbitPeriod == orbitPeriod &&
      other.infoUrl == infoUrl &&
      other.description == description &&
      other.sensor == sensor &&
      other.size == size &&
      other.parentId == parentId &&
      other.starsystem == starsystem &&
      other.timeModified == timeModified;

    @override
    int get hashCode =>
        id.hashCode +
        code.hashCode +
        systemId.hashCode +
        celestialObjectApiUrl.hashCode +
        webUrl.hashCode +
        name.hashCode +
        type.hashCode +
        age.hashCode +
        habitable.hashCode +
        fairchanceact.hashCode +
        appearance.hashCode +
        designation.hashCode +
        distance.hashCode +
        latitude.hashCode +
        longitude.hashCode +
        axialTilt.hashCode +
        orbitPeriod.hashCode +
        infoUrl.hashCode +
        description.hashCode +
        sensor.hashCode +
        size.hashCode +
        parentId.hashCode +
        (starsystem == null ? 0 : starsystem.hashCode) +
        timeModified.hashCode;

  factory CelestialObject.fromJson(Map<String, dynamic> json) => _$CelestialObjectFromJson(json);

  Map<String, dynamic> toJson() => _$CelestialObjectToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

