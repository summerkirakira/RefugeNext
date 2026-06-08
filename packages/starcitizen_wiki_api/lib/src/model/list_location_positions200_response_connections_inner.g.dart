// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_location_positions200_response_connections_inner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListLocationPositions200ResponseConnectionsInner
_$ListLocationPositions200ResponseConnectionsInnerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'ListLocationPositions200ResponseConnectionsInner',
  json,
  ($checkedConvert) {
    final val = ListLocationPositions200ResponseConnectionsInner(
      entryUuid: $checkedConvert('entry_uuid', (v) => v as String?),
      exitUuid: $checkedConvert('exit_uuid', (v) => v as String?),
      entrySystem: $checkedConvert('entry_system', (v) => v as String?),
      exitSystem: $checkedConvert('exit_system', (v) => v as String?),
      fuelCost: $checkedConvert('fuel_cost', (v) => v as num?),
      sizeClass: $checkedConvert(
        'size_class',
        (v) => $enumDecodeNullable(
          _$ListLocationPositions200ResponseConnectionsInnerSizeClassEnumEnumMap,
          v,
        ),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'entryUuid': 'entry_uuid',
    'exitUuid': 'exit_uuid',
    'entrySystem': 'entry_system',
    'exitSystem': 'exit_system',
    'fuelCost': 'fuel_cost',
    'sizeClass': 'size_class',
  },
);

Map<String, dynamic> _$ListLocationPositions200ResponseConnectionsInnerToJson(
  ListLocationPositions200ResponseConnectionsInner instance,
) => <String, dynamic>{
  'entry_uuid': ?instance.entryUuid,
  'exit_uuid': ?instance.exitUuid,
  'entry_system': ?instance.entrySystem,
  'exit_system': ?instance.exitSystem,
  'fuel_cost': ?instance.fuelCost,
  'size_class':
      ?_$ListLocationPositions200ResponseConnectionsInnerSizeClassEnumEnumMap[instance
          .sizeClass],
};

const _$ListLocationPositions200ResponseConnectionsInnerSizeClassEnumEnumMap = {
  ListLocationPositions200ResponseConnectionsInnerSizeClassEnum.small: 'small',
  ListLocationPositions200ResponseConnectionsInnerSizeClassEnum.large: 'large',
  ListLocationPositions200ResponseConnectionsInnerSizeClassEnum.unknown:
      'unknown',
};
