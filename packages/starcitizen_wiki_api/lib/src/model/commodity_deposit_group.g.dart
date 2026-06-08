// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commodity_deposit_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommodityDepositGroup _$CommodityDepositGroupFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'CommodityDepositGroup',
  json,
  ($checkedConvert) {
    final val = CommodityDepositGroup(
      key: $checkedConvert('key', (v) => v as String?),
      label: $checkedConvert('label', (v) => v as String?),
      signature: $checkedConvert('signature', (v) => (v as num?)?.toInt()),
      areaExceptions: $checkedConvert(
        'area_exceptions',
        (v) => (v as List<dynamic>?)
            ?.map((e) => AreaException.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      clustering: $checkedConvert(
        'clustering',
        (v) =>
            v == null ? null : Clustering.fromJson(v as Map<String, dynamic>),
      ),
      harvestableSetup: $checkedConvert(
        'harvestable_setup',
        (v) => v == null
            ? null
            : HarvestableSetup.fromJson(v as Map<String, dynamic>),
      ),
      providerNames: $checkedConvert(
        'provider_names',
        (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
      ),
      materials: $checkedConvert(
        'materials',
        (v) => (v as List<dynamic>?)
            ?.map((e) => MaterialEntry.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      qualityMin: $checkedConvert('quality_min', (v) => (v as num?)?.toInt()),
      qualityMax: $checkedConvert('quality_max', (v) => (v as num?)?.toInt()),
      relativeProbabilityMin: $checkedConvert(
        'relative_probability_min',
        (v) => v as num?,
      ),
      relativeProbabilityMax: $checkedConvert(
        'relative_probability_max',
        (v) => v as num?,
      ),
      relativeProbabilityMinPercent: $checkedConvert(
        'relative_probability_min_percent',
        (v) => v as num?,
      ),
      relativeProbabilityMaxPercent: $checkedConvert(
        'relative_probability_max_percent',
        (v) => v as num?,
      ),
      uuid: $checkedConvert('uuid', (v) => v as String?),
      name: $checkedConvert('name', (v) => v as String?),
      displayName: $checkedConvert('display_name', (v) => v as String?),
      slug: $checkedConvert('slug', (v) => v as String?),
      description: $checkedConvert('description', (v) => v as String?),
      tier: $checkedConvert('tier', (v) => v as String?),
      refinedVersion: $checkedConvert(
        'refined_version',
        (v) => v == null
            ? null
            : CommodityLinkRefinedVersion.fromJson(v as Map<String, dynamic>),
      ),
      densityGPerCc: $checkedConvert('density_g_per_cc', (v) => v as num?),
      instability: $checkedConvert('instability', (v) => v as num?),
      resistance: $checkedConvert('resistance', (v) => v as num?),
      boxSizesScu: $checkedConvert(
        'box_sizes_scu',
        (v) => (v as List<dynamic>?)?.map((e) => e as num).toList(),
      ),
      validateDefaultCargoBox: $checkedConvert(
        'validate_default_cargo_box',
        (v) => v as bool?,
      ),
      hasDefaultCargoContainers: $checkedConvert(
        'has_default_cargo_containers',
        (v) => v as bool?,
      ),
      isMineable: $checkedConvert('is_mineable', (v) => v as bool?),
      hasShipMineables: $checkedConvert(
        'has_ship_mineables',
        (v) => v as bool?,
      ),
      hasGroundVehicleMineables: $checkedConvert(
        'has_ground_vehicle_mineables',
        (v) => v as bool?,
      ),
      hasFpsMineables: $checkedConvert('has_fps_mineables', (v) => v as bool?),
      hasHarvestables: $checkedConvert('has_harvestables', (v) => v as bool?),
      hasSalvage: $checkedConvert('has_salvage', (v) => v as bool?),
      kind: $checkedConvert('kind', (v) => v as String?),
      commodityGroups: $checkedConvert(
        'commodity_groups',
        (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
      ),
      methods: $checkedConvert(
        'methods',
        (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
      ),
      systems: $checkedConvert(
        'systems',
        (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
      ),
      locations: $checkedConvert(
        'locations',
        (v) => (v as List<dynamic>?)
            ?.map(
              (e) => CommodityIndexLocation.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
      link: $checkedConvert('link', (v) => v as String?),
      webUrl: $checkedConvert('web_url', (v) => v as String?),
      images: $checkedConvert(
        'images',
        (v) => (v as List<dynamic>?)
            ?.map(
              (e) =>
                  CommodityLinkImagesInner.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
      resourceUuid: $checkedConvert('resource_uuid', (v) => v as String?),
      groupName: $checkedConvert('group_name', (v) => v as String?),
      resourceKind: $checkedConvert('resource_kind', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'areaExceptions': 'area_exceptions',
    'harvestableSetup': 'harvestable_setup',
    'providerNames': 'provider_names',
    'qualityMin': 'quality_min',
    'qualityMax': 'quality_max',
    'relativeProbabilityMin': 'relative_probability_min',
    'relativeProbabilityMax': 'relative_probability_max',
    'relativeProbabilityMinPercent': 'relative_probability_min_percent',
    'relativeProbabilityMaxPercent': 'relative_probability_max_percent',
    'displayName': 'display_name',
    'refinedVersion': 'refined_version',
    'densityGPerCc': 'density_g_per_cc',
    'boxSizesScu': 'box_sizes_scu',
    'validateDefaultCargoBox': 'validate_default_cargo_box',
    'hasDefaultCargoContainers': 'has_default_cargo_containers',
    'isMineable': 'is_mineable',
    'hasShipMineables': 'has_ship_mineables',
    'hasGroundVehicleMineables': 'has_ground_vehicle_mineables',
    'hasFpsMineables': 'has_fps_mineables',
    'hasHarvestables': 'has_harvestables',
    'hasSalvage': 'has_salvage',
    'commodityGroups': 'commodity_groups',
    'webUrl': 'web_url',
    'resourceUuid': 'resource_uuid',
    'groupName': 'group_name',
    'resourceKind': 'resource_kind',
  },
);

Map<String, dynamic> _$CommodityDepositGroupToJson(
  CommodityDepositGroup instance,
) => <String, dynamic>{
  'key': ?instance.key,
  'label': ?instance.label,
  'signature': ?instance.signature,
  'area_exceptions': ?instance.areaExceptions?.map((e) => e.toJson()).toList(),
  'clustering': ?instance.clustering?.toJson(),
  'harvestable_setup': ?instance.harvestableSetup?.toJson(),
  'provider_names': ?instance.providerNames,
  'materials': ?instance.materials?.map((e) => e.toJson()).toList(),
  'quality_min': ?instance.qualityMin,
  'quality_max': ?instance.qualityMax,
  'relative_probability_min': ?instance.relativeProbabilityMin,
  'relative_probability_max': ?instance.relativeProbabilityMax,
  'relative_probability_min_percent': ?instance.relativeProbabilityMinPercent,
  'relative_probability_max_percent': ?instance.relativeProbabilityMaxPercent,
  'uuid': ?instance.uuid,
  'name': ?instance.name,
  'display_name': ?instance.displayName,
  'slug': ?instance.slug,
  'description': ?instance.description,
  'tier': ?instance.tier,
  'refined_version': ?instance.refinedVersion?.toJson(),
  'density_g_per_cc': ?instance.densityGPerCc,
  'instability': ?instance.instability,
  'resistance': ?instance.resistance,
  'box_sizes_scu': ?instance.boxSizesScu,
  'validate_default_cargo_box': ?instance.validateDefaultCargoBox,
  'has_default_cargo_containers': ?instance.hasDefaultCargoContainers,
  'is_mineable': ?instance.isMineable,
  'has_ship_mineables': ?instance.hasShipMineables,
  'has_ground_vehicle_mineables': ?instance.hasGroundVehicleMineables,
  'has_fps_mineables': ?instance.hasFpsMineables,
  'has_harvestables': ?instance.hasHarvestables,
  'has_salvage': ?instance.hasSalvage,
  'kind': ?instance.kind,
  'commodity_groups': ?instance.commodityGroups,
  'methods': ?instance.methods,
  'systems': ?instance.systems,
  'locations': ?instance.locations?.map((e) => e.toJson()).toList(),
  'link': ?instance.link,
  'web_url': ?instance.webUrl,
  'images': ?instance.images?.map((e) => e.toJson()).toList(),
  'resource_uuid': ?instance.resourceUuid,
  'group_name': ?instance.groupName,
  'resource_kind': ?instance.resourceKind,
};
