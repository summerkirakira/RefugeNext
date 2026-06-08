// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weapon_modifier_aim.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeaponModifierAim _$WeaponModifierAimFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'WeaponModifierAim',
  json,
  ($checkedConvert) {
    final val = WeaponModifierAim(
      zoomScale: $checkedConvert('zoom_scale', (v) => (v as num?)?.toDouble()),
      secondZoomScale: $checkedConvert(
        'second_zoom_scale',
        (v) => (v as num?)?.toDouble(),
      ),
      zoomTimeScale: $checkedConvert(
        'zoom_time_scale',
        (v) => (v as num?)?.toDouble(),
      ),
      zoomTimeChange: $checkedConvert(
        'zoom_time_change',
        (v) => (v as num?)?.toDouble(),
      ),
      hideWeaponInAds: $checkedConvert('hide_weapon_in_ads', (v) => v as bool?),
      fstopMultiplier: $checkedConvert(
        'fstop_multiplier',
        (v) => (v as num?)?.toDouble(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'zoomScale': 'zoom_scale',
    'secondZoomScale': 'second_zoom_scale',
    'zoomTimeScale': 'zoom_time_scale',
    'zoomTimeChange': 'zoom_time_change',
    'hideWeaponInAds': 'hide_weapon_in_ads',
    'fstopMultiplier': 'fstop_multiplier',
  },
);

Map<String, dynamic> _$WeaponModifierAimToJson(WeaponModifierAim instance) =>
    <String, dynamic>{
      'zoom_scale': ?instance.zoomScale,
      'second_zoom_scale': ?instance.secondZoomScale,
      'zoom_time_scale': ?instance.zoomTimeScale,
      'zoom_time_change': ?instance.zoomTimeChange,
      'hide_weapon_in_ads': ?instance.hideWeaponInAds,
      'fstop_multiplier': ?instance.fstopMultiplier,
    };
