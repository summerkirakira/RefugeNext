// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shield_regen_delay.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShieldRegenDelay _$ShieldRegenDelayFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ShieldRegenDelay', json, ($checkedConvert) {
      final val = ShieldRegenDelay(
        downed: $checkedConvert('downed', (v) => (v as num?)?.toDouble()),
        damage: $checkedConvert('damage', (v) => (v as num?)?.toDouble()),
      );
      return val;
    });

Map<String, dynamic> _$ShieldRegenDelayToJson(ShieldRegenDelay instance) =>
    <String, dynamic>{'downed': ?instance.downed, 'damage': ?instance.damage};
