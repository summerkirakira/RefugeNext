// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weapon_attachment_laser_pointer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeaponAttachmentLaserPointer _$WeaponAttachmentLaserPointerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('WeaponAttachmentLaserPointer', json, ($checkedConvert) {
  final val = WeaponAttachmentLaserPointer(
    range: $checkedConvert('range', (v) => (v as num?)?.toDouble()),
    color: $checkedConvert(
      'color',
      (v) => v == null
          ? null
          : WeaponAttachmentRgbColor.fromJson(v as Map<String, dynamic>),
    ),
    colorCss: $checkedConvert('color_css', (v) => v as String?),
  );
  return val;
}, fieldKeyMap: const {'colorCss': 'color_css'});

Map<String, dynamic> _$WeaponAttachmentLaserPointerToJson(
  WeaponAttachmentLaserPointer instance,
) => <String, dynamic>{
  'range': ?instance.range,
  'color': ?instance.color?.toJson(),
  'color_css': ?instance.colorCss,
};
