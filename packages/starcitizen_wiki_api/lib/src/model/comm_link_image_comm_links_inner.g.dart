// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comm_link_image_comm_links_inner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommLinkImageCommLinksInner _$CommLinkImageCommLinksInnerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'CommLinkImageCommLinksInner',
  json,
  ($checkedConvert) {
    final val = CommLinkImageCommLinksInner(
      id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
      title: $checkedConvert('title', (v) => v as String?),
      apiUrl: $checkedConvert('api_url', (v) => v as String?),
      webUrl: $checkedConvert('web_url', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {'apiUrl': 'api_url', 'webUrl': 'web_url'},
);

Map<String, dynamic> _$CommLinkImageCommLinksInnerToJson(
  CommLinkImageCommLinksInner instance,
) => <String, dynamic>{
  'id': ?instance.id,
  'title': ?instance.title,
  'api_url': ?instance.apiUrl,
  'web_url': ?instance.webUrl,
};
