//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/commodity_link_images_inner.dart';
import 'package:starcitizen_wiki_api/src/model/material_entry.dart';
import 'package:starcitizen_wiki_api/src/model/commodity_index_location.dart';
import 'package:starcitizen_wiki_api/src/model/commodity_link_refined_version.dart';
import 'package:starcitizen_wiki_api/src/model/area_exception.dart';
import 'package:starcitizen_wiki_api/src/model/harvestable_setup.dart';
import 'package:starcitizen_wiki_api/src/model/clustering.dart';
import 'package:json_annotation/json_annotation.dart';

part 'commodity_deposit_group.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CommodityDepositGroup {
  /// Returns a new [CommodityDepositGroup] instance.
  CommodityDepositGroup({

     this.key,

     this.label,

     this.signature,

     this.areaExceptions,

     this.clustering,

     this.harvestableSetup,

     this.providerNames,

     this.materials,

     this.qualityMin,

     this.qualityMax,

     this.relativeProbabilityMin,

     this.relativeProbabilityMax,

     this.relativeProbabilityMinPercent,

     this.relativeProbabilityMaxPercent,

     this.uuid,

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

     this.kind,

     this.commodityGroups,

     this.methods,

     this.systems,

     this.locations,

     this.link,

     this.webUrl,

     this.images,

     this.resourceUuid,

     this.groupName,

     this.resourceKind,
  });

      /// Internal commodity key (e.g. \"Quartz\").
  @JsonKey(
    
    name: r'key',
    required: false,
    includeIfNull: false,
  )


  final String? key;



      /// Human-readable deposit name derived from the key.
  @JsonKey(
    
    name: r'label',
    required: false,
    includeIfNull: false,
  )


  final String? label;



      /// Electromagnetic signature strength, used for scanner detection.
  @JsonKey(
    
    name: r'signature',
    required: false,
    includeIfNull: false,
  )


  final int? signature;



      /// Area-specific probability modifiers that override the default for this deposit.
  @JsonKey(
    
    name: r'area_exceptions',
    required: false,
    includeIfNull: false,
  )


  final List<AreaException>? areaExceptions;



      /// Clustering configuration for deposit groupings, if applicable.
  @JsonKey(
    
    name: r'clustering',
    required: false,
    includeIfNull: false,
  )


  final Clustering? clustering;



      /// Respawn and despawn timing data for harvestable deposits.
  @JsonKey(
    
    name: r'harvestable_setup',
    required: false,
    includeIfNull: false,
  )


  final HarvestableSetup? harvestableSetup;



      /// List of unique provider names that generate this deposit.
  @JsonKey(
    
    name: r'provider_names',
    required: false,
    includeIfNull: false,
  )


  final List<String>? providerNames;



      /// List of materials (commodities) found in this deposit with their quality and probability data.
  @JsonKey(
    
    name: r'materials',
    required: false,
    includeIfNull: false,
  )


  final List<MaterialEntry>? materials;



      /// Minimum quality across all instances of this deposit.
  @JsonKey(
    
    name: r'quality_min',
    required: false,
    includeIfNull: false,
  )


  final int? qualityMin;



      /// Maximum quality across all instances of this deposit.
  @JsonKey(
    
    name: r'quality_max',
    required: false,
    includeIfNull: false,
  )


  final int? qualityMax;



      /// Lowest relative probability among deposit instances (0-1).
  @JsonKey(
    
    name: r'relative_probability_min',
    required: false,
    includeIfNull: false,
  )


  final num? relativeProbabilityMin;



      /// Highest relative probability among deposit instances (0-1).
  @JsonKey(
    
    name: r'relative_probability_max',
    required: false,
    includeIfNull: false,
  )


  final num? relativeProbabilityMax;



      /// Lowest relative probability as a percentage (0-100).
  @JsonKey(
    
    name: r'relative_probability_min_percent',
    required: false,
    includeIfNull: false,
  )


  final num? relativeProbabilityMinPercent;



      /// Highest relative probability as a percentage (0-100).
  @JsonKey(
    
    name: r'relative_probability_max_percent',
    required: false,
    includeIfNull: false,
  )


  final num? relativeProbabilityMaxPercent;



      /// Unique commodity identifier.
  @JsonKey(
    
    name: r'uuid',
    required: false,
    includeIfNull: false,
  )


  final String? uuid;



      /// Display name of the commodity.
  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



      /// Name with leaf commodity group in parentheses, e.g. \"WiDoW (Vice)\".
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



      /// API link to this commodity's full details.
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



      /// UUID of the resource (commodity) this deposit yields.
  @JsonKey(
    
    name: r'resource_uuid',
    required: false,
    includeIfNull: false,
  )


  final String? resourceUuid;



      /// Internal group name for the mining category (e.g. \"SpaceShip_Mineables\").
  @JsonKey(
    
    name: r'group_name',
    required: false,
    includeIfNull: false,
  )


  final String? groupName;



      /// Resource extraction kind (e.g. \"Mineable\", \"Harvestable\").
  @JsonKey(
    
    name: r'resource_kind',
    required: false,
    includeIfNull: false,
  )


  final String? resourceKind;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CommodityDepositGroup &&
      other.key == key &&
      other.label == label &&
      other.signature == signature &&
      other.areaExceptions == areaExceptions &&
      other.clustering == clustering &&
      other.harvestableSetup == harvestableSetup &&
      other.providerNames == providerNames &&
      other.materials == materials &&
      other.qualityMin == qualityMin &&
      other.qualityMax == qualityMax &&
      other.relativeProbabilityMin == relativeProbabilityMin &&
      other.relativeProbabilityMax == relativeProbabilityMax &&
      other.relativeProbabilityMinPercent == relativeProbabilityMinPercent &&
      other.relativeProbabilityMaxPercent == relativeProbabilityMaxPercent &&
      other.uuid == uuid &&
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
      other.kind == kind &&
      other.commodityGroups == commodityGroups &&
      other.methods == methods &&
      other.systems == systems &&
      other.locations == locations &&
      other.link == link &&
      other.webUrl == webUrl &&
      other.images == images &&
      other.resourceUuid == resourceUuid &&
      other.groupName == groupName &&
      other.resourceKind == resourceKind;

    @override
    int get hashCode =>
        key.hashCode +
        label.hashCode +
        (signature == null ? 0 : signature.hashCode) +
        (areaExceptions == null ? 0 : areaExceptions.hashCode) +
        (clustering == null ? 0 : clustering.hashCode) +
        (harvestableSetup == null ? 0 : harvestableSetup.hashCode) +
        providerNames.hashCode +
        materials.hashCode +
        (qualityMin == null ? 0 : qualityMin.hashCode) +
        (qualityMax == null ? 0 : qualityMax.hashCode) +
        (relativeProbabilityMin == null ? 0 : relativeProbabilityMin.hashCode) +
        (relativeProbabilityMax == null ? 0 : relativeProbabilityMax.hashCode) +
        (relativeProbabilityMinPercent == null ? 0 : relativeProbabilityMinPercent.hashCode) +
        (relativeProbabilityMaxPercent == null ? 0 : relativeProbabilityMaxPercent.hashCode) +
        uuid.hashCode +
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
        (kind == null ? 0 : kind.hashCode) +
        (commodityGroups == null ? 0 : commodityGroups.hashCode) +
        methods.hashCode +
        systems.hashCode +
        locations.hashCode +
        link.hashCode +
        webUrl.hashCode +
        images.hashCode +
        (resourceUuid == null ? 0 : resourceUuid.hashCode) +
        groupName.hashCode +
        (resourceKind == null ? 0 : resourceKind.hashCode);

  factory CommodityDepositGroup.fromJson(Map<String, dynamic> json) => _$CommodityDepositGroupFromJson(json);

  Map<String, dynamic> toJson() => _$CommodityDepositGroupToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

