// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commodity_link.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommodityLink _$CommodityLinkFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'CommodityLink',
  json,
  ($checkedConvert) {
    final val = CommodityLink(
      uuid: $checkedConvert('uuid', (v) => v as String?),
      key: $checkedConvert('key', (v) => v as String?),
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
      signature: $checkedConvert('signature', (v) => (v as num?)?.toInt()),
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
    );
    return val;
  },
  fieldKeyMap: const {
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
  },
);

Map<String, dynamic> _$CommodityLinkToJson(CommodityLink instance) =>
    <String, dynamic>{
      'uuid': ?instance.uuid,
      'key': ?instance.key,
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
      'signature': ?instance.signature,
      'kind': ?instance.kind,
      'commodity_groups': ?instance.commodityGroups,
      'methods': ?instance.methods,
      'systems': ?instance.systems,
      'locations': ?instance.locations?.map((e) => e.toJson()).toList(),
      'link': ?instance.link,
      'web_url': ?instance.webUrl,
      'images': ?instance.images?.map((e) => e.toJson()).toList(),
    };
