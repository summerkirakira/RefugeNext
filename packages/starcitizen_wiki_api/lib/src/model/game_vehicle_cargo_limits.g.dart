// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_vehicle_cargo_limits.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameVehicleCargoLimits _$GameVehicleCargoLimitsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'GameVehicleCargoLimits',
  json,
  ($checkedConvert) {
    final val = GameVehicleCargoLimits(
      min: $checkedConvert(
        'min',
        (v) => v == null
            ? null
            : GameVehicleCargoLimitsMin.fromJson(v as Map<String, dynamic>),
      ),
      minScuBox: $checkedConvert('min_scu_box', (v) => v as num?),
      max: $checkedConvert(
        'max',
        (v) => v == null
            ? null
            : GameVehicleCargoLimitsMax.fromJson(v as Map<String, dynamic>),
      ),
      maxScuBox: $checkedConvert('max_scu_box', (v) => v as num?),
    );
    return val;
  },
  fieldKeyMap: const {'minScuBox': 'min_scu_box', 'maxScuBox': 'max_scu_box'},
);

Map<String, dynamic> _$GameVehicleCargoLimitsToJson(
  GameVehicleCargoLimits instance,
) => <String, dynamic>{
  'min': ?instance.min?.toJson(),
  'min_scu_box': ?instance.minScuBox,
  'max': ?instance.max?.toJson(),
  'max_scu_box': ?instance.maxScuBox,
};
