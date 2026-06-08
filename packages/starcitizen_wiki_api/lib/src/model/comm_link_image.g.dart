// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comm_link_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommLinkImage _$CommLinkImageFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'CommLinkImage',
  json,
  ($checkedConvert) {
    final val = CommLinkImage(
      id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
      name: $checkedConvert('name', (v) => v as String?),
      rsiUrl: $checkedConvert('rsi_url', (v) => v as String?),
      apiUrl: $checkedConvert('api_url', (v) => v as String?),
      alt: $checkedConvert('alt', (v) => v as String?),
      size: $checkedConvert('size', (v) => (v as num?)?.toInt()),
      mimeType: $checkedConvert('mime_type', (v) => v as String?),
      lastModified: $checkedConvert(
        'last_modified',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      tags: $checkedConvert(
        'tags',
        (v) => (v as List<dynamic>?)
            ?.map(
              (e) => CommLinkImageTagsInner.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
      similarUrl: $checkedConvert('similar_url', (v) => v as String?),
      commLinks: $checkedConvert(
        'comm_links',
        (v) => (v as List<dynamic>?)
            ?.map(
              (e) => CommLinkImageCommLinksInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
      duplicates: $checkedConvert(
        'duplicates',
        (v) => (v as List<dynamic>?)
            ?.map(
              (e) => CommLinkImageDuplicatesInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
      baseImage: $checkedConvert(
        'base_image',
        (v) => v == null
            ? null
            : CommLinkImageBaseImage.fromJson(v as Map<String, dynamic>),
      ),
      similarity: $checkedConvert('similarity', (v) => (v as num?)?.toInt()),
    );
    return val;
  },
  fieldKeyMap: const {
    'rsiUrl': 'rsi_url',
    'apiUrl': 'api_url',
    'mimeType': 'mime_type',
    'lastModified': 'last_modified',
    'similarUrl': 'similar_url',
    'commLinks': 'comm_links',
    'baseImage': 'base_image',
  },
);

Map<String, dynamic> _$CommLinkImageToJson(CommLinkImage instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'name': ?instance.name,
      'rsi_url': ?instance.rsiUrl,
      'api_url': ?instance.apiUrl,
      'alt': ?instance.alt,
      'size': ?instance.size,
      'mime_type': ?instance.mimeType,
      'last_modified': ?instance.lastModified?.toIso8601String(),
      'tags': ?instance.tags?.map((e) => e.toJson()).toList(),
      'similar_url': ?instance.similarUrl,
      'comm_links': ?instance.commLinks?.map((e) => e.toJson()).toList(),
      'duplicates': ?instance.duplicates?.map((e) => e.toJson()).toList(),
      'base_image': ?instance.baseImage?.toJson(),
      'similarity': ?instance.similarity,
    };
