// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_vehicle_port_compatible_types_inner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameVehiclePortCompatibleTypesInner
_$GameVehiclePortCompatibleTypesInnerFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'GameVehiclePortCompatibleTypesInner',
      json,
      ($checkedConvert) {
        final val = GameVehiclePortCompatibleTypesInner(
          type: $checkedConvert('type', (v) => v as String?),
          subTypes: $checkedConvert(
            'sub_types',
            (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
          ),
        );
        return val;
      },
      fieldKeyMap: const {'subTypes': 'sub_types'},
    );

Map<String, dynamic> _$GameVehiclePortCompatibleTypesInnerToJson(
  GameVehiclePortCompatibleTypesInner instance,
) => <String, dynamic>{'type': ?instance.type, 'sub_types': ?instance.subTypes};
