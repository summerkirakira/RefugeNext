//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/game_starmap_location_tag.dart';
import 'package:starcitizen_wiki_api/src/model/game_starmap_location_amenity.dart';
import 'package:starcitizen_wiki_api/src/model/game_starmap_location_child_summary.dart';
import 'package:starcitizen_wiki_api/src/model/game_starmap_location_images_inner.dart';
import 'package:starcitizen_wiki_api/src/model/game_starmap_location_quantum_travel.dart';
import 'package:starcitizen_wiki_api/src/model/starmap_location_mining_type_group.dart';
import 'package:starcitizen_wiki_api/src/model/area_boost.dart';
import 'package:starcitizen_wiki_api/src/model/game_starmap_location_radar_contact_type.dart';
import 'package:starcitizen_wiki_api/src/model/game_starmap_location_type.dart';
import 'package:starcitizen_wiki_api/src/model/game_starmap_location_asteroid_ring.dart';
import 'package:starcitizen_wiki_api/src/model/game_starmap_location_affiliation.dart';
import 'package:starcitizen_wiki_api/src/model/game_starmap_location_mission_group.dart';
import 'package:starcitizen_wiki_api/src/model/game_starmap_location_linked_summary.dart';
import 'package:starcitizen_wiki_api/src/model/game_starmap_location_jurisdiction.dart';
import 'package:json_annotation/json_annotation.dart';

part 'game_starmap_location.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GameStarmapLocation {
  /// Returns a new [GameStarmapLocation] instance.
  GameStarmapLocation({

     this.uuid,

     this.slug,

     this.name,

     this.description,

     this.size,

     this.respawnLocationType,

     this.childCount,

     this.hasResources,

     this.missionCount,

     this.isScannable,

     this.hideInStarmap,

     this.hideInWorld,

     this.blockTravel,

     this.quantumTravel,

     this.asteroidRing,

     this.system,

     this.parent,

     this.star,

     this.children,

     this.type,

     this.jurisdiction,

     this.affiliation,

     this.amenities,

     this.tag,

     this.designation,

     this.radarContactType,

     this.link,

     this.webUrl,

     this.updatedAt,

     this.version,

     this.images,

     this.areaBoosts,

     this.resources,

     this.missions,
  });

      /// Unique identifier for this starmap location.
  @JsonKey(
    
    name: r'uuid',
    required: false,
    includeIfNull: false,
  )


  final String? uuid;



      /// URL-friendly slug for this location.
  @JsonKey(
    
    name: r'slug',
    required: false,
    includeIfNull: false,
  )


  final String? slug;



      /// Display name of the starmap location.
  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



      /// In-universe description of the location.
  @JsonKey(
    
    name: r'description',
    required: false,
    includeIfNull: false,
  )


  final String? description;



      /// Relative size of the location.
  @JsonKey(
    
    name: r'size',
    required: false,
    includeIfNull: false,
  )


  final num? size;



      /// Type of respawn facility available (e.g. Hospital, MedicalRoom).
  @JsonKey(
    
    name: r'respawn_location_type',
    required: false,
    includeIfNull: false,
  )


  final String? respawnLocationType;



      /// Number of direct child locations.
  @JsonKey(
    
    name: r'child_count',
    required: false,
    includeIfNull: false,
  )


  final int? childCount;



      /// Whether this location has harvestable resource deposits.
  @JsonKey(
    
    name: r'has_resources',
    required: false,
    includeIfNull: false,
  )


  final bool? hasResources;



      /// Number of available missions at this location.
  @JsonKey(
    
    name: r'mission_count',
    required: false,
    includeIfNull: false,
  )


  final int? missionCount;



      /// Whether this location can be detected by ship scanners.
  @JsonKey(
    
    name: r'is_scannable',
    required: false,
    includeIfNull: false,
  )


  final bool? isScannable;



      /// Whether this location is hidden from the in-game starmap.
  @JsonKey(
    
    name: r'hide_in_starmap',
    required: false,
    includeIfNull: false,
  )


  final bool? hideInStarmap;



      /// Whether this location is hidden in the game world.
  @JsonKey(
    
    name: r'hide_in_world',
    required: false,
    includeIfNull: false,
  )


  final bool? hideInWorld;



      /// Whether quantum travel to this location is blocked.
  @JsonKey(
    
    name: r'block_travel',
    required: false,
    includeIfNull: false,
  )


  final bool? blockTravel;



      /// Quantum travel parameters for this location.
  @JsonKey(
    
    name: r'quantum_travel',
    required: false,
    includeIfNull: false,
  )


  final GameStarmapLocationQuantumTravel? quantumTravel;



      /// Asteroid ring parameters, only present on locations with asteroid rings.
  @JsonKey(
    
    name: r'asteroid_ring',
    required: false,
    includeIfNull: false,
  )


  final GameStarmapLocationAsteroidRing? asteroidRing;



      /// Name of the star system this location belongs to (e.g. Stanton System).
  @JsonKey(
    
    name: r'system',
    required: false,
    includeIfNull: false,
  )


  final String? system;



      /// Parent location in the hierarchy.
  @JsonKey(
    
    name: r'parent',
    required: false,
    includeIfNull: false,
  )


  final GameStarmapLocationLinkedSummary? parent;



      /// Nearest star or celestial body.
  @JsonKey(
    
    name: r'star',
    required: false,
    includeIfNull: false,
  )


  final GameStarmapLocationLinkedSummary? star;



      /// Direct child locations. Only included when requested via `include=children`.
  @JsonKey(
    
    name: r'children',
    required: false,
    includeIfNull: false,
  )


  final List<GameStarmapLocationChildSummary>? children;



  @JsonKey(
    
    name: r'type',
    required: false,
    includeIfNull: false,
  )


  final GameStarmapLocationType? type;



      /// Legal jurisdiction governing this location.
  @JsonKey(
    
    name: r'jurisdiction',
    required: false,
    includeIfNull: false,
  )


  final GameStarmapLocationJurisdiction? jurisdiction;



      /// Faction or organization controlling this location.
  @JsonKey(
    
    name: r'affiliation',
    required: false,
    includeIfNull: false,
  )


  final GameStarmapLocationAffiliation? affiliation;



      /// Available amenities at this location.
  @JsonKey(
    
    name: r'amenities',
    required: false,
    includeIfNull: false,
  )


  final List<GameStarmapLocationAmenity>? amenities;



      /// Hierarchy entity tag for grouping and filtering.
  @JsonKey(
    
    name: r'tag',
    required: false,
    includeIfNull: false,
  )


  final GameStarmapLocationTag? tag;



      /// Official designation code for this location.
  @JsonKey(
    
    name: r'designation',
    required: false,
    includeIfNull: false,
  )


  final String? designation;



      /// Radar contact classification for navigation.
  @JsonKey(
    
    name: r'radar_contact_type',
    required: false,
    includeIfNull: false,
  )


  final GameStarmapLocationRadarContactType? radarContactType;



      /// API URL for this location's detail endpoint.
  @JsonKey(
    
    name: r'link',
    required: false,
    includeIfNull: false,
  )


  final String? link;



      /// Web frontend URL for this location.
  @JsonKey(
    
    name: r'web_url',
    required: false,
    includeIfNull: false,
  )


  final String? webUrl;



      /// Timestamp of the last data update.
  @JsonKey(
    
    name: r'updated_at',
    required: false,
    includeIfNull: false,
  )


  final DateTime? updatedAt;



      /// Game data version code.
  @JsonKey(
    
    name: r'version',
    required: false,
    includeIfNull: false,
  )


  final String? version;



      /// Images from external sources for this location.
  @JsonKey(
    
    name: r'images',
    required: false,
    includeIfNull: false,
  )


  final List<GameStarmapLocationImagesInner>? images;



      /// Areas with boosted deposit spawn rates. Only included when requested via `include=resources`.
  @JsonKey(
    
    name: r'area_boosts',
    required: false,
    includeIfNull: false,
  )


  final List<AreaBoost>? areaBoosts;



      /// Harvestable resource deposits grouped by extraction method. Only included when requested via `include=resources`.
  @JsonKey(
    
    name: r'resources',
    required: false,
    includeIfNull: false,
  )


  final List<StarmapLocationMiningTypeGroup>? resources;



      /// Available missions grouped by purpose. Only included when requested via `include=missions`.
  @JsonKey(
    
    name: r'missions',
    required: false,
    includeIfNull: false,
  )


  final List<GameStarmapLocationMissionGroup>? missions;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GameStarmapLocation &&
      other.uuid == uuid &&
      other.slug == slug &&
      other.name == name &&
      other.description == description &&
      other.size == size &&
      other.respawnLocationType == respawnLocationType &&
      other.childCount == childCount &&
      other.hasResources == hasResources &&
      other.missionCount == missionCount &&
      other.isScannable == isScannable &&
      other.hideInStarmap == hideInStarmap &&
      other.hideInWorld == hideInWorld &&
      other.blockTravel == blockTravel &&
      other.quantumTravel == quantumTravel &&
      other.asteroidRing == asteroidRing &&
      other.system == system &&
      other.parent == parent &&
      other.star == star &&
      other.children == children &&
      other.type == type &&
      other.jurisdiction == jurisdiction &&
      other.affiliation == affiliation &&
      other.amenities == amenities &&
      other.tag == tag &&
      other.designation == designation &&
      other.radarContactType == radarContactType &&
      other.link == link &&
      other.webUrl == webUrl &&
      other.updatedAt == updatedAt &&
      other.version == version &&
      other.images == images &&
      other.areaBoosts == areaBoosts &&
      other.resources == resources &&
      other.missions == missions;

    @override
    int get hashCode =>
        uuid.hashCode +
        (slug == null ? 0 : slug.hashCode) +
        name.hashCode +
        (description == null ? 0 : description.hashCode) +
        (size == null ? 0 : size.hashCode) +
        (respawnLocationType == null ? 0 : respawnLocationType.hashCode) +
        childCount.hashCode +
        (hasResources == null ? 0 : hasResources.hashCode) +
        missionCount.hashCode +
        isScannable.hashCode +
        hideInStarmap.hashCode +
        hideInWorld.hashCode +
        blockTravel.hashCode +
        (quantumTravel == null ? 0 : quantumTravel.hashCode) +
        (asteroidRing == null ? 0 : asteroidRing.hashCode) +
        (system == null ? 0 : system.hashCode) +
        (parent == null ? 0 : parent.hashCode) +
        (star == null ? 0 : star.hashCode) +
        (children == null ? 0 : children.hashCode) +
        type.hashCode +
        (jurisdiction == null ? 0 : jurisdiction.hashCode) +
        (affiliation == null ? 0 : affiliation.hashCode) +
        amenities.hashCode +
        (tag == null ? 0 : tag.hashCode) +
        (designation == null ? 0 : designation.hashCode) +
        (radarContactType == null ? 0 : radarContactType.hashCode) +
        link.hashCode +
        webUrl.hashCode +
        (updatedAt == null ? 0 : updatedAt.hashCode) +
        (version == null ? 0 : version.hashCode) +
        (images == null ? 0 : images.hashCode) +
        (areaBoosts == null ? 0 : areaBoosts.hashCode) +
        resources.hashCode +
        (missions == null ? 0 : missions.hashCode);

  factory GameStarmapLocation.fromJson(Map<String, dynamic> json) => _$GameStarmapLocationFromJson(json);

  Map<String, dynamic> toJson() => _$GameStarmapLocationToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

