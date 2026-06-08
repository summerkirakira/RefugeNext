// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'self_destruct.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SelfDestruct _$SelfDestructFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'SelfDestruct',
  json,
  ($checkedConvert) {
    final val = SelfDestruct(
      damage: $checkedConvert('damage', (v) => (v as num?)?.toDouble()),
      radius: $checkedConvert('radius', (v) => (v as num?)?.toDouble()),
      minRadius: $checkedConvert('min_radius', (v) => (v as num?)?.toDouble()),
      physRadius: $checkedConvert(
        'phys_radius',
        (v) => (v as num?)?.toDouble(),
      ),
      minPhysRadius: $checkedConvert(
        'min_phys_radius',
        (v) => (v as num?)?.toDouble(),
      ),
      time: $checkedConvert('time', (v) => (v as num?)?.toDouble()),
      countdown: $checkedConvert('countdown', (v) => (v as num?)?.toDouble()),
    );
    return val;
  },
  fieldKeyMap: const {
    'minRadius': 'min_radius',
    'physRadius': 'phys_radius',
    'minPhysRadius': 'min_phys_radius',
  },
);

Map<String, dynamic> _$SelfDestructToJson(SelfDestruct instance) =>
    <String, dynamic>{
      'damage': ?instance.damage,
      'radius': ?instance.radius,
      'min_radius': ?instance.minRadius,
      'phys_radius': ?instance.physRadius,
      'min_phys_radius': ?instance.minPhysRadius,
      'time': ?instance.time,
      'countdown': ?instance.countdown,
    };
