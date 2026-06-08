// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weapon_attachment_iron_sight.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeaponAttachmentIronSight _$WeaponAttachmentIronSightFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'WeaponAttachmentIronSight',
  json,
  ($checkedConvert) {
    final val = WeaponAttachmentIronSight(
      defaultRange: $checkedConvert(
        'default_range',
        (v) => (v as num?)?.toDouble(),
      ),
      maxRange: $checkedConvert('max_range', (v) => (v as num?)?.toDouble()),
      rangeIncrement: $checkedConvert(
        'range_increment',
        (v) => (v as num?)?.toDouble(),
      ),
      autoZeroingTime: $checkedConvert(
        'auto_zeroing_time',
        (v) => (v as num?)?.toDouble(),
      ),
      zoomScale: $checkedConvert('zoom_scale', (v) => (v as num?)?.toDouble()),
      zoomTimeScale: $checkedConvert(
        'zoom_time_scale',
        (v) => (v as num?)?.toDouble(),
      ),
      zoomTimeChange: $checkedConvert(
        'zoom_time_change',
        (v) => (v as num?)?.toDouble(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'defaultRange': 'default_range',
    'maxRange': 'max_range',
    'rangeIncrement': 'range_increment',
    'autoZeroingTime': 'auto_zeroing_time',
    'zoomScale': 'zoom_scale',
    'zoomTimeScale': 'zoom_time_scale',
    'zoomTimeChange': 'zoom_time_change',
  },
);

Map<String, dynamic> _$WeaponAttachmentIronSightToJson(
  WeaponAttachmentIronSight instance,
) => <String, dynamic>{
  'default_range': ?instance.defaultRange,
  'max_range': ?instance.maxRange,
  'range_increment': ?instance.rangeIncrement,
  'auto_zeroing_time': ?instance.autoZeroingTime,
  'zoom_scale': ?instance.zoomScale,
  'zoom_time_scale': ?instance.zoomTimeScale,
  'zoom_time_change': ?instance.zoomTimeChange,
};
