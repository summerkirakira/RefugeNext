// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_port_item_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GamePortItemSummary _$GamePortItemSummaryFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'GamePortItemSummary',
      json,
      ($checkedConvert) {
        final val = GamePortItemSummary(
          uuid: $checkedConvert('uuid', (v) => v as String?),
          name: $checkedConvert('name', (v) => v as String?),
          className: $checkedConvert('class_name', (v) => v as String?),
          type: $checkedConvert('type', (v) => v as String?),
          subType: $checkedConvert('sub_type', (v) => v as String?),
          size: $checkedConvert('size', (v) => (v as num?)?.toInt()),
          grade: $checkedConvert('grade', (v) => (v as num?)?.toInt()),
          manufacturer: $checkedConvert(
            'manufacturer',
            (v) => v == null
                ? null
                : GamePortItemSummaryManufacturer.fromJson(
                    v as Map<String, dynamic>,
                  ),
          ),
          link: $checkedConvert('link', (v) => v as String?),
          webUrl: $checkedConvert('web_url', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'className': 'class_name',
        'subType': 'sub_type',
        'webUrl': 'web_url',
      },
    );

Map<String, dynamic> _$GamePortItemSummaryToJson(
  GamePortItemSummary instance,
) => <String, dynamic>{
  'uuid': ?instance.uuid,
  'name': ?instance.name,
  'class_name': ?instance.className,
  'type': ?instance.type,
  'sub_type': ?instance.subType,
  'size': ?instance.size,
  'grade': ?instance.grade,
  'manufacturer': ?instance.manufacturer?.toJson(),
  'link': ?instance.link,
  'web_url': ?instance.webUrl,
};
