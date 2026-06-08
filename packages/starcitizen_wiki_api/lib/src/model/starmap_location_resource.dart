//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/material_entry.dart';
import 'package:starcitizen_wiki_api/src/model/area_exception.dart';
import 'package:starcitizen_wiki_api/src/model/harvestable_setup.dart';
import 'package:starcitizen_wiki_api/src/model/clustering.dart';
import 'package:json_annotation/json_annotation.dart';

part 'starmap_location_resource.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class StarmapLocationResource {
  /// Returns a new [StarmapLocationResource] instance.
  StarmapLocationResource({

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

     this.name,

     this.uuid,

     this.tier,

     this.link,

     this.webUrl,
  });

      /// Unique deposit key identifier.
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



      /// Electromagnetic signature strength of the deposit.
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



      /// Commodity name of the resource deposit.
  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



      /// UUID of the commodity, null for non-commodity deposits.
  @JsonKey(
    
    name: r'uuid',
    required: false,
    includeIfNull: false,
  )


  final String? uuid;



      /// Rarity tier of the commodity.
  @JsonKey(
    
    name: r'tier',
    required: false,
    includeIfNull: false,
  )


  final String? tier;



      /// API URL for the commodity detail endpoint.
  @JsonKey(
    
    name: r'link',
    required: false,
    includeIfNull: false,
  )


  final String? link;



      /// Web frontend URL for the commodity detail page.
  @JsonKey(
    
    name: r'web_url',
    required: false,
    includeIfNull: false,
  )


  final String? webUrl;





    @override
    bool operator ==(Object other) => identical(this, other) || other is StarmapLocationResource &&
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
      other.name == name &&
      other.uuid == uuid &&
      other.tier == tier &&
      other.link == link &&
      other.webUrl == webUrl;

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
        name.hashCode +
        (uuid == null ? 0 : uuid.hashCode) +
        (tier == null ? 0 : tier.hashCode) +
        (link == null ? 0 : link.hashCode) +
        (webUrl == null ? 0 : webUrl.hashCode);

  factory StarmapLocationResource.fromJson(Map<String, dynamic> json) => _$StarmapLocationResourceFromJson(json);

  Map<String, dynamic> toJson() => _$StarmapLocationResourceToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

