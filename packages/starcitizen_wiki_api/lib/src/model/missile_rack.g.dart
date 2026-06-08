// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'missile_rack.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MissileRack _$MissileRackFromJson(Map<String, dynamic> json) => $checkedCreate(
  'MissileRack',
  json,
  ($checkedConvert) {
    final val = MissileRack(
      missileCount: $checkedConvert(
        'missile_count',
        (v) => (v as num?)?.toInt(),
      ),
      missileSize: $checkedConvert('missile_size', (v) => (v as num?)?.toInt()),
    );
    return val;
  },
  fieldKeyMap: const {
    'missileCount': 'missile_count',
    'missileSize': 'missile_size',
  },
);

Map<String, dynamic> _$MissileRackToJson(MissileRack instance) =>
    <String, dynamic>{
      'missile_count': ?instance.missileCount,
      'missile_size': ?instance.missileSize,
    };
