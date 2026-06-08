// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'turret.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Turret _$TurretFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Turret',
  json,
  ($checkedConvert) {
    final val = Turret(
      rotationStyle: $checkedConvert('rotation_style', (v) => v as String?),
      mounts: $checkedConvert('mounts', (v) => (v as num?)?.toInt()),
      minSize: $checkedConvert('min_size', (v) => (v as num?)?.toInt()),
      maxSize: $checkedConvert('max_size', (v) => (v as num?)?.toInt()),
      yawAxis: $checkedConvert(
        'yaw_axis',
        (v) =>
            v == null ? null : TurretAxis.fromJson(v as Map<String, dynamic>),
      ),
      pitchAxis: $checkedConvert(
        'pitch_axis',
        (v) =>
            v == null ? null : TurretAxis.fromJson(v as Map<String, dynamic>),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'rotationStyle': 'rotation_style',
    'minSize': 'min_size',
    'maxSize': 'max_size',
    'yawAxis': 'yaw_axis',
    'pitchAxis': 'pitch_axis',
  },
);

Map<String, dynamic> _$TurretToJson(Turret instance) => <String, dynamic>{
  'rotation_style': ?instance.rotationStyle,
  'mounts': ?instance.mounts,
  'min_size': ?instance.minSize,
  'max_size': ?instance.maxSize,
  'yaw_axis': ?instance.yawAxis?.toJson(),
  'pitch_axis': ?instance.pitchAxis?.toJson(),
};
