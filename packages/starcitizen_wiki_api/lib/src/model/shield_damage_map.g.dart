// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shield_damage_map.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShieldDamageMap _$ShieldDamageMapFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ShieldDamageMap', json, ($checkedConvert) {
      final val = ShieldDamageMap(
        physical: $checkedConvert(
          'physical',
          (v) => v == null
              ? null
              : ShieldDamageRange.fromJson(v as Map<String, dynamic>),
        ),
        energy: $checkedConvert(
          'energy',
          (v) => v == null
              ? null
              : ShieldDamageRange.fromJson(v as Map<String, dynamic>),
        ),
        distortion: $checkedConvert(
          'distortion',
          (v) => v == null
              ? null
              : ShieldDamageRange.fromJson(v as Map<String, dynamic>),
        ),
        thermal: $checkedConvert(
          'thermal',
          (v) => v == null
              ? null
              : ShieldDamageRange.fromJson(v as Map<String, dynamic>),
        ),
        biochemical: $checkedConvert(
          'biochemical',
          (v) => v == null
              ? null
              : ShieldDamageRange.fromJson(v as Map<String, dynamic>),
        ),
        stun: $checkedConvert(
          'stun',
          (v) => v == null
              ? null
              : ShieldDamageRange.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$ShieldDamageMapToJson(ShieldDamageMap instance) =>
    <String, dynamic>{
      'physical': ?instance.physical?.toJson(),
      'energy': ?instance.energy?.toJson(),
      'distortion': ?instance.distortion?.toJson(),
      'thermal': ?instance.thermal?.toJson(),
      'biochemical': ?instance.biochemical?.toJson(),
      'stun': ?instance.stun?.toJson(),
    };
