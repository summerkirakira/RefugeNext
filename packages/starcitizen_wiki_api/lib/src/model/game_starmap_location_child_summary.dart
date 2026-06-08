//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/game_starmap_location_amenity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'game_starmap_location_child_summary.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GameStarmapLocationChildSummary {
  /// Returns a new [GameStarmapLocationChildSummary] instance.
  GameStarmapLocationChildSummary({

     this.uuid,

     this.name,

     this.designation,

     this.webUrl,

     this.typeName,

     this.typeClassification,

     this.respawnLocationType,

     this.amenities,

     this.amenityLabels,

     this.hasResources,
  });

      /// Unique identifier of the child location.
  @JsonKey(
    
    name: r'uuid',
    required: false,
    includeIfNull: false,
  )


  final String? uuid;



      /// Display name of the child location.
  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



      /// Official designation code for the child location.
  @JsonKey(
    
    name: r'designation',
    required: false,
    includeIfNull: false,
  )


  final String? designation;



      /// Web frontend URL for the child location.
  @JsonKey(
    
    name: r'web_url',
    required: false,
    includeIfNull: false,
  )


  final String? webUrl;



      /// Location type name (e.g. Outpost, Asteroid).
  @JsonKey(
    
    name: r'type_name',
    required: false,
    includeIfNull: false,
  )


  final String? typeName;



      /// Sub-classification of the location type.
  @JsonKey(
    
    name: r'type_classification',
    required: false,
    includeIfNull: false,
  )


  final String? typeClassification;



      /// Type of respawn facility available, if any.
  @JsonKey(
    
    name: r'respawn_location_type',
    required: false,
    includeIfNull: false,
  )


  final String? respawnLocationType;



      /// Amenities available at this child location.
  @JsonKey(
    
    name: r'amenities',
    required: false,
    includeIfNull: false,
  )


  final List<GameStarmapLocationAmenity>? amenities;



      /// Simplified list of amenity display names or internal names.
  @JsonKey(
    
    name: r'amenity_labels',
    required: false,
    includeIfNull: false,
  )


  final List<String>? amenityLabels;



      /// Whether this child location has harvestable resource deposits.
  @JsonKey(
    
    name: r'has_resources',
    required: false,
    includeIfNull: false,
  )


  final bool? hasResources;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GameStarmapLocationChildSummary &&
      other.uuid == uuid &&
      other.name == name &&
      other.designation == designation &&
      other.webUrl == webUrl &&
      other.typeName == typeName &&
      other.typeClassification == typeClassification &&
      other.respawnLocationType == respawnLocationType &&
      other.amenities == amenities &&
      other.amenityLabels == amenityLabels &&
      other.hasResources == hasResources;

    @override
    int get hashCode =>
        uuid.hashCode +
        name.hashCode +
        (designation == null ? 0 : designation.hashCode) +
        webUrl.hashCode +
        typeName.hashCode +
        (typeClassification == null ? 0 : typeClassification.hashCode) +
        (respawnLocationType == null ? 0 : respawnLocationType.hashCode) +
        amenities.hashCode +
        amenityLabels.hashCode +
        hasResources.hashCode;

  factory GameStarmapLocationChildSummary.fromJson(Map<String, dynamic> json) => _$GameStarmapLocationChildSummaryFromJson(json);

  Map<String, dynamic> toJson() => _$GameStarmapLocationChildSummaryToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

