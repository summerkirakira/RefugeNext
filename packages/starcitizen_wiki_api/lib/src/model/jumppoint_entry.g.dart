// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jumppoint_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JumppointEntry _$JumppointEntryFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'JumppointEntry',
      json,
      ($checkedConvert) {
        final val = JumppointEntry(
          id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
          systemId: $checkedConvert('system_id', (v) => v as String?),
          systemApiUrl: $checkedConvert('system_api_url', (v) => v as String?),
          celestialObjectApiUrl: $checkedConvert(
            'celestial_object_api_url',
            (v) => v as String?,
          ),
          status: $checkedConvert('status', (v) => v as String?),
          code: $checkedConvert('code', (v) => v as String?),
          designation: $checkedConvert('designation', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'systemId': 'system_id',
        'systemApiUrl': 'system_api_url',
        'celestialObjectApiUrl': 'celestial_object_api_url',
      },
    );

Map<String, dynamic> _$JumppointEntryToJson(JumppointEntry instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'system_id': ?instance.systemId,
      'system_api_url': ?instance.systemApiUrl,
      'celestial_object_api_url': ?instance.celestialObjectApiUrl,
      'status': ?instance.status,
      'code': ?instance.code,
      'designation': ?instance.designation,
    };
