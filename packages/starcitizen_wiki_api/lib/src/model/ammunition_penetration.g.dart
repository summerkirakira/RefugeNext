// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ammunition_penetration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AmmunitionPenetration _$AmmunitionPenetrationFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'AmmunitionPenetration',
  json,
  ($checkedConvert) {
    final val = AmmunitionPenetration(
      baseDistance: $checkedConvert(
        'base_distance',
        (v) => (v as num?)?.toDouble(),
      ),
      nearRadius: $checkedConvert(
        'near_radius',
        (v) => (v as num?)?.toDouble(),
      ),
      farRadius: $checkedConvert('far_radius', (v) => (v as num?)?.toDouble()),
      angle: $checkedConvert('angle', (v) => (v as num?)?.toDouble()),
    );
    return val;
  },
  fieldKeyMap: const {
    'baseDistance': 'base_distance',
    'nearRadius': 'near_radius',
    'farRadius': 'far_radius',
  },
);

Map<String, dynamic> _$AmmunitionPenetrationToJson(
  AmmunitionPenetration instance,
) => <String, dynamic>{
  'base_distance': ?instance.baseDistance,
  'near_radius': ?instance.nearRadius,
  'far_radius': ?instance.farRadius,
  'angle': ?instance.angle,
};
