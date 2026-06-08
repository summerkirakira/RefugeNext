// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weapon_attachment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeaponAttachment _$WeaponAttachmentFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'WeaponAttachment',
      json,
      ($checkedConvert) {
        final val = WeaponAttachment(
          ironSight: $checkedConvert(
            'iron_sight',
            (v) => v == null
                ? null
                : WeaponAttachmentIronSight.fromJson(v as Map<String, dynamic>),
          ),
          laserPointer: $checkedConvert(
            'laser_pointer',
            (v) => v == null
                ? null
                : WeaponAttachmentLaserPointer.fromJson(
                    v as Map<String, dynamic>,
                  ),
          ),
          flashlight: $checkedConvert(
            'flashlight',
            (v) => (v as Map<String, dynamic>?)?.map(
              (k, e) => MapEntry(
                k,
                WeaponAttachmentFlashlightProfile.fromJson(
                  e as Map<String, dynamic>,
                ),
              ),
            ),
          ),
          magazine: $checkedConvert(
            'magazine',
            (v) => v == null
                ? null
                : WeaponAttachmentMagazine.fromJson(v as Map<String, dynamic>),
          ),
          compensator: $checkedConvert(
            'compensator',
            (v) => v == null
                ? null
                : WeaponAttachmentBarrelAttachment.fromJson(
                    v as Map<String, dynamic>,
                  ),
          ),
          flashHider: $checkedConvert(
            'flash_hider',
            (v) => v == null
                ? null
                : WeaponAttachmentBarrelAttachment.fromJson(
                    v as Map<String, dynamic>,
                  ),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'ironSight': 'iron_sight',
        'laserPointer': 'laser_pointer',
        'flashHider': 'flash_hider',
      },
    );

Map<String, dynamic> _$WeaponAttachmentToJson(
  WeaponAttachment instance,
) => <String, dynamic>{
  'iron_sight': ?instance.ironSight?.toJson(),
  'laser_pointer': ?instance.laserPointer?.toJson(),
  'flashlight': ?instance.flashlight?.map((k, e) => MapEntry(k, e.toJson())),
  'magazine': ?instance.magazine?.toJson(),
  'compensator': ?instance.compensator?.toJson(),
  'flash_hider': ?instance.flashHider?.toJson(),
};
