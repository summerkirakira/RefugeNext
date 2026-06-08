//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/starsystem_position.dart';
import 'package:starcitizen_wiki_api/src/model/starsystem_aggregated.dart';
import 'package:starcitizen_wiki_api/src/model/starsystem_celestial_object.dart';
import 'package:starcitizen_wiki_api/src/model/starsystem_jumppoints.dart';
import 'package:json_annotation/json_annotation.dart';

part 'starsystem.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Starsystem {
  /// Returns a new [Starsystem] instance.
  Starsystem({

     this.id,

     this.code,

     this.systemApiUrl,

     this.name,

     this.status,

     this.type,

     this.webUrl,

     this.position,

     this.frostLine,

     this.habitableZoneInner,

     this.habitableZoneOuter,

     this.infoUrl,

     this.description,

     this.aggregated,

     this.timeModified,

     this.celestialObject,

     this.jumppoints,
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
    
    name: r'system_api_url',
    required: false,
    includeIfNull: false,
  )


  final String? systemApiUrl;



  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



  @JsonKey(
    
    name: r'status',
    required: false,
    includeIfNull: false,
  )


  final String? status;



  @JsonKey(
    
    name: r'type',
    required: false,
    includeIfNull: false,
  )


  final String? type;



  @JsonKey(
    
    name: r'web_url',
    required: false,
    includeIfNull: false,
  )


  final String? webUrl;



  @JsonKey(
    
    name: r'position',
    required: false,
    includeIfNull: false,
  )


  final StarsystemPosition? position;



  @JsonKey(
    
    name: r'frost_line',
    required: false,
    includeIfNull: false,
  )


  final double? frostLine;



  @JsonKey(
    
    name: r'habitable_zone_inner',
    required: false,
    includeIfNull: false,
  )


  final double? habitableZoneInner;



  @JsonKey(
    
    name: r'habitable_zone_outer',
    required: false,
    includeIfNull: false,
  )


  final double? habitableZoneOuter;



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
    
    name: r'aggregated',
    required: false,
    includeIfNull: false,
  )


  final StarsystemAggregated? aggregated;



  @JsonKey(
    
    name: r'time_modified',
    required: false,
    includeIfNull: false,
  )


  final String? timeModified;



  @JsonKey(
    
    name: r'celestial_object',
    required: false,
    includeIfNull: false,
  )


  final StarsystemCelestialObject? celestialObject;



  @JsonKey(
    
    name: r'jumppoints',
    required: false,
    includeIfNull: false,
  )


  final StarsystemJumppoints? jumppoints;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Starsystem &&
      other.id == id &&
      other.code == code &&
      other.systemApiUrl == systemApiUrl &&
      other.name == name &&
      other.status == status &&
      other.type == type &&
      other.webUrl == webUrl &&
      other.position == position &&
      other.frostLine == frostLine &&
      other.habitableZoneInner == habitableZoneInner &&
      other.habitableZoneOuter == habitableZoneOuter &&
      other.infoUrl == infoUrl &&
      other.description == description &&
      other.aggregated == aggregated &&
      other.timeModified == timeModified &&
      other.celestialObject == celestialObject &&
      other.jumppoints == jumppoints;

    @override
    int get hashCode =>
        id.hashCode +
        code.hashCode +
        systemApiUrl.hashCode +
        name.hashCode +
        status.hashCode +
        type.hashCode +
        webUrl.hashCode +
        position.hashCode +
        frostLine.hashCode +
        habitableZoneInner.hashCode +
        habitableZoneOuter.hashCode +
        infoUrl.hashCode +
        description.hashCode +
        aggregated.hashCode +
        timeModified.hashCode +
        (celestialObject == null ? 0 : celestialObject.hashCode) +
        (jumppoints == null ? 0 : jumppoints.hashCode);

  factory Starsystem.fromJson(Map<String, dynamic> json) => _$StarsystemFromJson(json);

  Map<String, dynamic> toJson() => _$StarsystemToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

