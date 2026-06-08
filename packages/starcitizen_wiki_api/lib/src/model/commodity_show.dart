//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/commodity_version_entry.dart';
import 'package:starcitizen_wiki_api/src/model/commodity_show_all_of_uex_prices.dart';
import 'package:starcitizen_wiki_api/src/model/commodity_link_images_inner.dart';
import 'package:starcitizen_wiki_api/src/model/commodity_system_group.dart';
import 'package:starcitizen_wiki_api/src/model/commodity_show_all_of_blueprints.dart';
import 'package:starcitizen_wiki_api/src/model/commodity_link_refined_version.dart';
import 'package:starcitizen_wiki_api/src/model/commodity_show_all_of_items.dart';
import 'package:starcitizen_wiki_api/src/model/commodity_show_location.dart';
import 'package:json_annotation/json_annotation.dart';

part 'commodity_show.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CommodityShow {
  /// Returns a new [CommodityShow] instance.
  CommodityShow({

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

     this.systemsGrouped,

     this.rawVersions,

     this.blueprints,

     this.items,

     this.uexPrices,
  });

      /// Unique commodity identifier.
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



      /// Flat list of all locations with deposit details.
  @JsonKey(
    
    name: r'locations',
    required: false,
    includeIfNull: false,
  )


  final List<CommodityShowLocation>? locations;



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



      /// Locations organized by star system for hierarchical display.
  @JsonKey(
    
    name: r'systems_grouped',
    required: false,
    includeIfNull: false,
  )


  final List<CommoditySystemGroup>? systemsGrouped;



      /// Raw (unrefined) versions of this commodity, if this is a refined commodity.
  @JsonKey(
    
    name: r'raw_versions',
    required: false,
    includeIfNull: false,
  )


  final List<CommodityVersionEntry>? rawVersions;



      /// Crafting blueprints that use or produce this commodity.
  @JsonKey(
    
    name: r'blueprints',
    required: false,
    includeIfNull: false,
  )


  final List<CommodityShowAllOfBlueprints>? blueprints;



      /// Physical items associated with this commodity in the game.
  @JsonKey(
    
    name: r'items',
    required: false,
    includeIfNull: false,
  )


  final List<CommodityShowAllOfItems>? items;



  @JsonKey(
    
    name: r'uex_prices',
    required: false,
    includeIfNull: false,
  )


  final CommodityShowAllOfUexPrices? uexPrices;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CommodityShow &&
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
      other.systemsGrouped == systemsGrouped &&
      other.rawVersions == rawVersions &&
      other.blueprints == blueprints &&
      other.items == items &&
      other.uexPrices == uexPrices;

    @override
    int get hashCode =>
        uuid.hashCode +
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
        link.hashCode +
        webUrl.hashCode +
        images.hashCode +
        systemsGrouped.hashCode +
        (rawVersions == null ? 0 : rawVersions.hashCode) +
        (blueprints == null ? 0 : blueprints.hashCode) +
        (items == null ? 0 : items.hashCode) +
        (uexPrices == null ? 0 : uexPrices.hashCode);

  factory CommodityShow.fromJson(Map<String, dynamic> json) => _$CommodityShowFromJson(json);

  Map<String, dynamic> toJson() => _$CommodityShowToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

