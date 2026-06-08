// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'starsystem_position.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StarsystemPosition _$StarsystemPositionFromJson(Map<String, dynamic> json) =>
    $checkedCreate('StarsystemPosition', json, ($checkedConvert) {
      final val = StarsystemPosition(
        x: $checkedConvert('x', (v) => (v as num?)?.toDouble()),
        y: $checkedConvert('y', (v) => (v as num?)?.toDouble()),
        z: $checkedConvert('z', (v) => (v as num?)?.toDouble()),
      );
      return val;
    });

Map<String, dynamic> _$StarsystemPositionToJson(StarsystemPosition instance) =>
    <String, dynamic>{'x': ?instance.x, 'y': ?instance.y, 'z': ?instance.z};
