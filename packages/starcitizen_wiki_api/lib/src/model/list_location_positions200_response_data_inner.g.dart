// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_location_positions200_response_data_inner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListLocationPositions200ResponseDataInner
_$ListLocationPositions200ResponseDataInnerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'ListLocationPositions200ResponseDataInner',
  json,
  ($checkedConvert) {
    final val = ListLocationPositions200ResponseDataInner(
      uuid: $checkedConvert('uuid', (v) => v as String?),
      name: $checkedConvert('name', (v) => v as String?),
      type: $checkedConvert('type', (v) => v as String?),
      system: $checkedConvert('system', (v) => v as String?),
      parentUuid: $checkedConvert('parent_uuid', (v) => v as String?),
      x: $checkedConvert('x', (v) => (v as num?)?.toDouble()),
      y: $checkedConvert('y', (v) => (v as num?)?.toDouble()),
      z: $checkedConvert('z', (v) => (v as num?)?.toDouble()),
    );
    return val;
  },
  fieldKeyMap: const {'parentUuid': 'parent_uuid'},
);

Map<String, dynamic> _$ListLocationPositions200ResponseDataInnerToJson(
  ListLocationPositions200ResponseDataInner instance,
) => <String, dynamic>{
  'uuid': ?instance.uuid,
  'name': ?instance.name,
  'type': ?instance.type,
  'system': ?instance.system,
  'parent_uuid': ?instance.parentUuid,
  'x': ?instance.x,
  'y': ?instance.y,
  'z': ?instance.z,
};
