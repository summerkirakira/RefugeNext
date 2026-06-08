// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weapon_attachment_rgb_color.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeaponAttachmentRgbColor _$WeaponAttachmentRgbColorFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('WeaponAttachmentRgbColor', json, ($checkedConvert) {
  final val = WeaponAttachmentRgbColor(
    r: $checkedConvert('r', (v) => (v as num?)?.toDouble()),
    g: $checkedConvert('g', (v) => (v as num?)?.toDouble()),
    b: $checkedConvert('b', (v) => (v as num?)?.toDouble()),
  );
  return val;
});

Map<String, dynamic> _$WeaponAttachmentRgbColorToJson(
  WeaponAttachmentRgbColor instance,
) => <String, dynamic>{'r': ?instance.r, 'g': ?instance.g, 'b': ?instance.b};
