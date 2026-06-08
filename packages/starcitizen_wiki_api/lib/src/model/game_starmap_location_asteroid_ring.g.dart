// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_starmap_location_asteroid_ring.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameStarmapLocationAsteroidRing _$GameStarmapLocationAsteroidRingFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'GameStarmapLocationAsteroidRing',
  json,
  ($checkedConvert) {
    final val = GameStarmapLocationAsteroidRing(
      densityScale: $checkedConvert('density_scale', (v) => v as num?),
      sizeScale: $checkedConvert('size_scale', (v) => v as num?),
      innerRadius: $checkedConvert('inner_radius', (v) => v as num?),
      outerRadius: $checkedConvert('outer_radius', (v) => v as num?),
      depth: $checkedConvert('depth', (v) => v as num?),
    );
    return val;
  },
  fieldKeyMap: const {
    'densityScale': 'density_scale',
    'sizeScale': 'size_scale',
    'innerRadius': 'inner_radius',
    'outerRadius': 'outer_radius',
  },
);

Map<String, dynamic> _$GameStarmapLocationAsteroidRingToJson(
  GameStarmapLocationAsteroidRing instance,
) => <String, dynamic>{
  'density_scale': ?instance.densityScale,
  'size_scale': ?instance.sizeScale,
  'inner_radius': ?instance.innerRadius,
  'outer_radius': ?instance.outerRadius,
  'depth': ?instance.depth,
};
