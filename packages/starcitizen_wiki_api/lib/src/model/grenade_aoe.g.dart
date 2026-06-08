// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grenade_aoe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GrenadeAoe _$GrenadeAoeFromJson(Map<String, dynamic> json) =>
    $checkedCreate('GrenadeAoe', json, ($checkedConvert) {
      final val = GrenadeAoe(
        min: $checkedConvert('min', (v) => (v as num?)?.toDouble()),
        max: $checkedConvert('max', (v) => (v as num?)?.toDouble()),
        minimum: $checkedConvert('minimum', (v) => (v as num?)?.toDouble()),
        maximum: $checkedConvert('maximum', (v) => (v as num?)?.toDouble()),
      );
      return val;
    });

Map<String, dynamic> _$GrenadeAoeToJson(GrenadeAoe instance) =>
    <String, dynamic>{
      'min': ?instance.min,
      'max': ?instance.max,
      'minimum': ?instance.minimum,
      'maximum': ?instance.maximum,
    };
