// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weapon_attachment_barrel_attachment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeaponAttachmentBarrelAttachment _$WeaponAttachmentBarrelAttachmentFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'WeaponAttachmentBarrelAttachment',
  json,
  ($checkedConvert) {
    final val = WeaponAttachmentBarrelAttachment(
      attachmentPoint: $checkedConvert('attachment_point', (v) => v as String?),
      type: $checkedConvert('type', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {'attachmentPoint': 'attachment_point'},
);

Map<String, dynamic> _$WeaponAttachmentBarrelAttachmentToJson(
  WeaponAttachmentBarrelAttachment instance,
) => <String, dynamic>{
  'attachment_point': ?instance.attachmentPoint,
  'type': ?instance.type,
};
