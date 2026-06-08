// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mission_chain_link.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MissionChainLink _$MissionChainLinkFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'MissionChainLink',
      json,
      ($checkedConvert) {
        final val = MissionChainLink(
          uuid: $checkedConvert('uuid', (v) => v as String?),
          title: $checkedConvert('title', (v) => v as String?),
          missionType: $checkedConvert('mission_type', (v) => v as String?),
          variantCount: $checkedConvert(
            'variant_count',
            (v) => (v as num?)?.toInt(),
          ),
          variants: $checkedConvert(
            'variants',
            (v) => (v as List<dynamic>?)
                ?.map(
                  (e) =>
                      MissionChainVariant.fromJson(e as Map<String, dynamic>),
                )
                .toList(),
          ),
          link: $checkedConvert('link', (v) => v as String?),
          webUrl: $checkedConvert('web_url', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'missionType': 'mission_type',
        'variantCount': 'variant_count',
        'webUrl': 'web_url',
      },
    );

Map<String, dynamic> _$MissionChainLinkToJson(MissionChainLink instance) =>
    <String, dynamic>{
      'uuid': ?instance.uuid,
      'title': ?instance.title,
      'mission_type': ?instance.missionType,
      'variant_count': ?instance.variantCount,
      'variants': ?instance.variants?.map((e) => e.toJson()).toList(),
      'link': ?instance.link,
      'web_url': ?instance.webUrl,
    };
