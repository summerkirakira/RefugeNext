// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blueprint_dismantle_return_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlueprintDismantleReturnSummary _$BlueprintDismantleReturnSummaryFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'BlueprintDismantleReturnSummary',
  json,
  ($checkedConvert) {
    final val = BlueprintDismantleReturnSummary(
      name: $checkedConvert('name', (v) => v as String?),
      resourceTypeUuid: $checkedConvert(
        'resource_type_uuid',
        (v) => v as String?,
      ),
      quantityScu: $checkedConvert(
        'quantity_scu',
        (v) => (v as num?)?.toDouble(),
      ),
      link: $checkedConvert('link', (v) => v as String?),
      webUrl: $checkedConvert('web_url', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'resourceTypeUuid': 'resource_type_uuid',
    'quantityScu': 'quantity_scu',
    'webUrl': 'web_url',
  },
);

Map<String, dynamic> _$BlueprintDismantleReturnSummaryToJson(
  BlueprintDismantleReturnSummary instance,
) => <String, dynamic>{
  'name': ?instance.name,
  'resource_type_uuid': ?instance.resourceTypeUuid,
  'quantity_scu': ?instance.quantityScu,
  'link': ?instance.link,
  'web_url': ?instance.webUrl,
};
