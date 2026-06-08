// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weapon_attachment_flashlight_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeaponAttachmentFlashlightProfile _$WeaponAttachmentFlashlightProfileFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'WeaponAttachmentFlashlightProfile',
  json,
  ($checkedConvert) {
    final val = WeaponAttachmentFlashlightProfile(
      portName: $checkedConvert('port_name', (v) => v as String?),
      name: $checkedConvert('name', (v) => v as String?),
      lightType: $checkedConvert('light_type', (v) => v as String?),
      lightRadius: $checkedConvert(
        'light_radius',
        (v) => (v as num?)?.toDouble(),
      ),
      intensity: $checkedConvert('intensity', (v) => (v as num?)?.toDouble()),
      color: $checkedConvert(
        'color',
        (v) => v == null
            ? null
            : WeaponAttachmentRgbColor.fromJson(v as Map<String, dynamic>),
      ),
      colorCss: $checkedConvert('color_css', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'portName': 'port_name',
    'lightType': 'light_type',
    'lightRadius': 'light_radius',
    'colorCss': 'color_css',
  },
);

Map<String, dynamic> _$WeaponAttachmentFlashlightProfileToJson(
  WeaponAttachmentFlashlightProfile instance,
) => <String, dynamic>{
  'port_name': ?instance.portName,
  'name': ?instance.name,
  'light_type': ?instance.lightType,
  'light_radius': ?instance.lightRadius,
  'intensity': ?instance.intensity,
  'color': ?instance.color?.toJson(),
  'color_css': ?instance.colorCss,
};
