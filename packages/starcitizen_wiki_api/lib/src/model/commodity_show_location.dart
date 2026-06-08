//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/commodity_link_images_inner.dart';
import 'package:starcitizen_wiki_api/src/model/commodity_deposit_group.dart';
import 'package:starcitizen_wiki_api/src/model/commodity_index_location.dart';
import 'package:starcitizen_wiki_api/src/model/commodity_link_refined_version.dart';
import 'package:starcitizen_wiki_api/src/model/area_boost.dart';
import 'package:json_annotation/json_annotation.dart';

part 'commodity_show_location.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CommodityShowLocation {
  /// Returns a new [CommodityShowLocation] instance.
  CommodityShowLocation({

     this.uuid,

     this.key,

     this.name,

     this.displayName,

     this.slug,

     this.description,

     this.tier,

     this.refinedVersion,

     this.densityGPerCc,

     this.instability,

     this.resistance,

     this.boxSizesScu,

     this.validateDefaultCargoBox,

     this.hasDefaultCargoContainers,

     this.isMineable,

     this.hasShipMineables,

     this.hasGroundVehicleMineables,

     this.hasFpsMineables,

     this.hasHarvestables,

     this.hasSalvage,

     this.signature,

     this.kind,

     this.commodityGroups,

     this.methods,

     this.systems,

     this.locations,

     this.link,

     this.webUrl,

     this.images,

     this.designation,

     this.system,

     this.type,

     this.parentName,

     this.parentType,

     this.parentUuid,

     this.groupProbability,

     this.groupProbabilityPercent,

     this.relativeProbability,

     this.relativeProbabilityPercent,

     this.qualityMin,

     this.qualityMax,

     this.areas,

     this.resources,
  });

      /// UUID of this starmap location entity.
  @JsonKey(
    
    name: r'uuid',
    required: false,
    includeIfNull: false,
  )


  final String? uuid;



      /// Internal commodity key (e.g. \"Quartz\").
  @JsonKey(
    
    name: r'key',
    required: false,
    includeIfNull: false,
  )


  final String? key;



      /// Canonical location name.
  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



      /// Formatted display name combining designation and name.
  @JsonKey(
    
    name: r'display_name',
    required: false,
    includeIfNull: false,
  )


  final String? displayName;



      /// URL-friendly slug for the commodity.
  @JsonKey(
    
    name: r'slug',
    required: false,
    includeIfNull: false,
  )


  final String? slug;



      /// In-game lore description.
  @JsonKey(
    
    name: r'description',
    required: false,
    includeIfNull: false,
  )


  final String? description;



      /// Refinement tier (e.g. \"Raw\", \"Refined\").
  @JsonKey(
    
    name: r'tier',
    required: false,
    includeIfNull: false,
  )


  final String? tier;



  @JsonKey(
    
    name: r'refined_version',
    required: false,
    includeIfNull: false,
  )


  final CommodityLinkRefinedVersion? refinedVersion;



      /// Density in grams per cubic centimeter.
  @JsonKey(
    
    name: r'density_g_per_cc',
    required: false,
    includeIfNull: false,
  )


  final num? densityGPerCc;



      /// Instability rating affecting mining behavior.
  @JsonKey(
    
    name: r'instability',
    required: false,
    includeIfNull: false,
  )


  final num? instability;



      /// Resistance rating affecting mining difficulty.
  @JsonKey(
    
    name: r'resistance',
    required: false,
    includeIfNull: false,
  )


  final num? resistance;



      /// Standard cargo box sizes in SCU that this commodity fits into.
  @JsonKey(
    
    name: r'box_sizes_scu',
    required: false,
    includeIfNull: false,
  )


  final List<num>? boxSizesScu;



      /// Whether the default cargo box validation applies.
  @JsonKey(
    
    name: r'validate_default_cargo_box',
    required: false,
    includeIfNull: false,
  )


  final bool? validateDefaultCargoBox;



      /// Whether default cargo containers are available for this commodity.
  @JsonKey(
    
    name: r'has_default_cargo_containers',
    required: false,
    includeIfNull: false,
  )


  final bool? hasDefaultCargoContainers;



      /// Whether this commodity can be obtained through mining or harvesting.
  @JsonKey(
    
    name: r'is_mineable',
    required: false,
    includeIfNull: false,
  )


  final bool? isMineable;



      /// Whether ship mining deposits exist for this commodity.
  @JsonKey(
    
    name: r'has_ship_mineables',
    required: false,
    includeIfNull: false,
  )


  final bool? hasShipMineables;



      /// Whether ground vehicle mining deposits exist for this commodity.
  @JsonKey(
    
    name: r'has_ground_vehicle_mineables',
    required: false,
    includeIfNull: false,
  )


  final bool? hasGroundVehicleMineables;



      /// Whether FPS mining deposits exist for this commodity.
  @JsonKey(
    
    name: r'has_fps_mineables',
    required: false,
    includeIfNull: false,
  )


  final bool? hasFpsMineables;



      /// Whether harvestable deposits exist for this commodity.
  @JsonKey(
    
    name: r'has_harvestables',
    required: false,
    includeIfNull: false,
  )


  final bool? hasHarvestables;



      /// Whether salvage deposits exist for this commodity.
  @JsonKey(
    
    name: r'has_salvage',
    required: false,
    includeIfNull: false,
  )


  final bool? hasSalvage;



      /// Electromagnetic signature strength, used for scanner detection.
  @JsonKey(
    
    name: r'signature',
    required: false,
    includeIfNull: false,
  )


  final int? signature;



      /// Resource kind classification (e.g. \"Mineable\", \"Harvestable\").
  @JsonKey(
    
    name: r'kind',
    required: false,
    includeIfNull: false,
  )


  final String? kind;



      /// Ordered commodity groups from root to leaf (e.g. [\"ProcessedGoods\", \"Vice\"]).
  @JsonKey(
    
    name: r'commodity_groups',
    required: false,
    includeIfNull: false,
  )


  final List<String>? commodityGroups;



      /// Available extraction methods (e.g. [\"Ship\", \"Ground Vehicle\", \"FPS\"]).
  @JsonKey(
    
    name: r'methods',
    required: false,
    includeIfNull: false,
  )


  final List<String>? methods;



      /// Star systems where this commodity can be found.
  @JsonKey(
    
    name: r'systems',
    required: false,
    includeIfNull: false,
  )


  final List<String>? systems;



      /// Named locations where this commodity appears.
  @JsonKey(
    
    name: r'locations',
    required: false,
    includeIfNull: false,
  )


  final List<CommodityIndexLocation>? locations;



      /// API link to the full location details.
  @JsonKey(
    
    name: r'link',
    required: false,
    includeIfNull: false,
  )


  final String? link;



      /// Frontend URL for this commodity's page.
  @JsonKey(
    
    name: r'web_url',
    required: false,
    includeIfNull: false,
  )


  final String? webUrl;



      /// Images from external sources for this commodity.
  @JsonKey(
    
    name: r'images',
    required: false,
    includeIfNull: false,
  )


  final List<CommodityLinkImagesInner>? images;



      /// Location designation code (e.g. \"CRU-L1\").
  @JsonKey(
    
    name: r'designation',
    required: false,
    includeIfNull: false,
  )


  final String? designation;



      /// Star system this location belongs to.
  @JsonKey(
    
    name: r'system',
    required: false,
    includeIfNull: false,
  )


  final String? system;



      /// Location type classification (e.g. \"Moon\", \"Planet\", \"Outpost\").
  @JsonKey(
    
    name: r'type',
    required: false,
    includeIfNull: false,
  )


  final String? type;



      /// Name of the parent celestial body or location.
  @JsonKey(
    
    name: r'parent_name',
    required: false,
    includeIfNull: false,
  )


  final String? parentName;



      /// Type of the parent location.
  @JsonKey(
    
    name: r'parent_type',
    required: false,
    includeIfNull: false,
  )


  final String? parentType;



      /// UUID of the parent location entity.
  @JsonKey(
    
    name: r'parent_uuid',
    required: false,
    includeIfNull: false,
  )


  final String? parentUuid;



      /// Raw probability of this commodity group occurring at this location (0-1).
  @JsonKey(
    
    name: r'group_probability',
    required: false,
    includeIfNull: false,
  )


  final num? groupProbability;



      /// Group probability expressed as a percentage (0-100).
  @JsonKey(
    
    name: r'group_probability_percent',
    required: false,
    includeIfNull: false,
  )


  final num? groupProbabilityPercent;



      /// Raw relative probability compared to other commodities at this location (0-1).
  @JsonKey(
    
    name: r'relative_probability',
    required: false,
    includeIfNull: false,
  )


  final num? relativeProbability;



      /// Relative probability expressed as a percentage (0-100).
  @JsonKey(
    
    name: r'relative_probability_percent',
    required: false,
    includeIfNull: false,
  )


  final num? relativeProbabilityPercent;



      /// Minimum quality across all deposit instances at this location.
  @JsonKey(
    
    name: r'quality_min',
    required: false,
    includeIfNull: false,
  )


  final int? qualityMin;



      /// Maximum quality across all deposit instances at this location.
  @JsonKey(
    
    name: r'quality_max',
    required: false,
    includeIfNull: false,
  )


  final int? qualityMax;



      /// Areas with global modifiers that boost spawn rates at this location.
  @JsonKey(
    
    name: r'areas',
    required: false,
    includeIfNull: false,
  )


  final List<AreaBoost>? areas;



      /// Individual deposit groups for this commodity at this location.
  @JsonKey(
    
    name: r'resources',
    required: false,
    includeIfNull: false,
  )


  final List<CommodityDepositGroup>? resources;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CommodityShowLocation &&
      other.uuid == uuid &&
      other.key == key &&
      other.name == name &&
      other.displayName == displayName &&
      other.slug == slug &&
      other.description == description &&
      other.tier == tier &&
      other.refinedVersion == refinedVersion &&
      other.densityGPerCc == densityGPerCc &&
      other.instability == instability &&
      other.resistance == resistance &&
      other.boxSizesScu == boxSizesScu &&
      other.validateDefaultCargoBox == validateDefaultCargoBox &&
      other.hasDefaultCargoContainers == hasDefaultCargoContainers &&
      other.isMineable == isMineable &&
      other.hasShipMineables == hasShipMineables &&
      other.hasGroundVehicleMineables == hasGroundVehicleMineables &&
      other.hasFpsMineables == hasFpsMineables &&
      other.hasHarvestables == hasHarvestables &&
      other.hasSalvage == hasSalvage &&
      other.signature == signature &&
      other.kind == kind &&
      other.commodityGroups == commodityGroups &&
      other.methods == methods &&
      other.systems == systems &&
      other.locations == locations &&
      other.link == link &&
      other.webUrl == webUrl &&
      other.images == images &&
      other.designation == designation &&
      other.system == system &&
      other.type == type &&
      other.parentName == parentName &&
      other.parentType == parentType &&
      other.parentUuid == parentUuid &&
      other.groupProbability == groupProbability &&
      other.groupProbabilityPercent == groupProbabilityPercent &&
      other.relativeProbability == relativeProbability &&
      other.relativeProbabilityPercent == relativeProbabilityPercent &&
      other.qualityMin == qualityMin &&
      other.qualityMax == qualityMax &&
      other.areas == areas &&
      other.resources == resources;

    @override
    int get hashCode =>
        (uuid == null ? 0 : uuid.hashCode) +
        key.hashCode +
        name.hashCode +
        displayName.hashCode +
        slug.hashCode +
        (description == null ? 0 : description.hashCode) +
        (tier == null ? 0 : tier.hashCode) +
        (refinedVersion == null ? 0 : refinedVersion.hashCode) +
        (densityGPerCc == null ? 0 : densityGPerCc.hashCode) +
        (instability == null ? 0 : instability.hashCode) +
        (resistance == null ? 0 : resistance.hashCode) +
        boxSizesScu.hashCode +
        validateDefaultCargoBox.hashCode +
        hasDefaultCargoContainers.hashCode +
        isMineable.hashCode +
        hasShipMineables.hashCode +
        hasGroundVehicleMineables.hashCode +
        hasFpsMineables.hashCode +
        hasHarvestables.hashCode +
        hasSalvage.hashCode +
        (signature == null ? 0 : signature.hashCode) +
        (kind == null ? 0 : kind.hashCode) +
        (commodityGroups == null ? 0 : commodityGroups.hashCode) +
        methods.hashCode +
        systems.hashCode +
        locations.hashCode +
        (link == null ? 0 : link.hashCode) +
        webUrl.hashCode +
        images.hashCode +
        (designation == null ? 0 : designation.hashCode) +
        (system == null ? 0 : system.hashCode) +
        (type == null ? 0 : type.hashCode) +
        (parentName == null ? 0 : parentName.hashCode) +
        (parentType == null ? 0 : parentType.hashCode) +
        (parentUuid == null ? 0 : parentUuid.hashCode) +
        groupProbability.hashCode +
        groupProbabilityPercent.hashCode +
        relativeProbability.hashCode +
        relativeProbabilityPercent.hashCode +
        (qualityMin == null ? 0 : qualityMin.hashCode) +
        (qualityMax == null ? 0 : qualityMax.hashCode) +
        (areas == null ? 0 : areas.hashCode) +
        resources.hashCode;

  factory CommodityShowLocation.fromJson(Map<String, dynamic> json) => _$CommodityShowLocationFromJson(json);

  Map<String, dynamic> toJson() => _$CommodityShowLocationToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

