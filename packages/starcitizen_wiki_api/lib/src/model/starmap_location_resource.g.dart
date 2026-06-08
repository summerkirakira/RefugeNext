// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'starmap_location_resource.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StarmapLocationResource _$StarmapLocationResourceFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'StarmapLocationResource',
  json,
  ($checkedConvert) {
    final val = StarmapLocationResource(
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
      name: $checkedConvert('name', (v) => v as String?),
      uuid: $checkedConvert('uuid', (v) => v as String?),
      tier: $checkedConvert('tier', (v) => v as String?),
      link: $checkedConvert('link', (v) => v as String?),
      webUrl: $checkedConvert('web_url', (v) => v as String?),
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
    'webUrl': 'web_url',
  },
);

Map<String, dynamic> _$StarmapLocationResourceToJson(
  StarmapLocationResource instance,
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
  'name': ?instance.name,
  'uuid': ?instance.uuid,
  'tier': ?instance.tier,
  'link': ?instance.link,
  'web_url': ?instance.webUrl,
};
