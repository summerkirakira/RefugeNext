// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shield_damage_range.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShieldDamageRange _$ShieldDamageRangeFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ShieldDamageRange', json, ($checkedConvert) {
      final val = ShieldDamageRange(
        min: $checkedConvert('min', (v) => (v as num?)?.toDouble()),
        max: $checkedConvert('max', (v) => (v as num?)?.toDouble()),
      );
      return val;
    });

Map<String, dynamic> _$ShieldDamageRangeToJson(ShieldDamageRange instance) =>
    <String, dynamic>{'min': ?instance.min, 'max': ?instance.max};
