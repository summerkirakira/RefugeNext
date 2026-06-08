// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_vehicle_damage_limits.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameVehicleDamageLimits _$GameVehicleDamageLimitsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'GameVehicleDamageLimits',
  json,
  ($checkedConvert) {
    final val = GameVehicleDamageLimits(
      beforeDestruction: $checkedConvert('before_destruction', (v) => v),
      beforeDetach: $checkedConvert('before_detach', (v) => v),
    );
    return val;
  },
  fieldKeyMap: const {
    'beforeDestruction': 'before_destruction',
    'beforeDetach': 'before_detach',
  },
);

Map<String, dynamic> _$GameVehicleDamageLimitsToJson(
  GameVehicleDamageLimits instance,
) => <String, dynamic>{
  'before_destruction': ?instance.beforeDestruction,
  'before_detach': ?instance.beforeDetach,
};
