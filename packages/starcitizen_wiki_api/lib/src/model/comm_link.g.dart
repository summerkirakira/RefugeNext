// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comm_link.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommLink _$CommLinkFromJson(Map<String, dynamic> json) => $checkedCreate(
  'CommLink',
  json,
  ($checkedConvert) {
    final val = CommLink(
      id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
      title: $checkedConvert('title', (v) => v as String?),
      rsiUrl: $checkedConvert('rsi_url', (v) => v as String?),
      apiUrl: $checkedConvert('api_url', (v) => v as String?),
      apiPublicUrl: $checkedConvert('api_public_url', (v) => v as String?),
      channel: $checkedConvert('channel', (v) => v as String?),
      category: $checkedConvert('category', (v) => v as String?),
      series: $checkedConvert('series', (v) => v as String?),
      images: $checkedConvert(
        'images',
        (v) => (v as List<dynamic>?)
            ?.map((e) => CommLinkImage.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      imagesCount: $checkedConvert('images_count', (v) => (v as num?)?.toInt()),
      links: $checkedConvert(
        'links',
        (v) => (v as List<dynamic>?)
            ?.map((e) => CommLinkLink.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      linksCount: $checkedConvert('links_count', (v) => (v as num?)?.toInt()),
      commentCount: $checkedConvert(
        'comment_count',
        (v) => (v as num?)?.toInt(),
      ),
      createdAt: $checkedConvert(
        'created_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      translations: $checkedConvert(
        'translations',
        (v) =>
            v == null ? null : Translation.fromJson(v as Map<String, dynamic>),
      ),
      createdAtHuman: $checkedConvert('created_at_human', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'rsiUrl': 'rsi_url',
    'apiUrl': 'api_url',
    'apiPublicUrl': 'api_public_url',
    'imagesCount': 'images_count',
    'linksCount': 'links_count',
    'commentCount': 'comment_count',
    'createdAt': 'created_at',
    'createdAtHuman': 'created_at_human',
  },
);

Map<String, dynamic> _$CommLinkToJson(CommLink instance) => <String, dynamic>{
  'id': ?instance.id,
  'title': ?instance.title,
  'rsi_url': ?instance.rsiUrl,
  'api_url': ?instance.apiUrl,
  'api_public_url': ?instance.apiPublicUrl,
  'channel': ?instance.channel,
  'category': ?instance.category,
  'series': ?instance.series,
  'images': ?instance.images?.map((e) => e.toJson()).toList(),
  'images_count': ?instance.imagesCount,
  'links': ?instance.links?.map((e) => e.toJson()).toList(),
  'links_count': ?instance.linksCount,
  'comment_count': ?instance.commentCount,
  'created_at': ?instance.createdAt?.toIso8601String(),
  'translations': ?instance.translations?.toJson(),
  'created_at_human': ?instance.createdAtHuman,
};
