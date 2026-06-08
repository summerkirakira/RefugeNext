// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blueprint_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlueprintOutput _$BlueprintOutputFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'BlueprintOutput',
      json,
      ($checkedConvert) {
        final val = BlueprintOutput(
          uuid: $checkedConvert('uuid', (v) => v as String?),
          name: $checkedConvert('name', (v) => v as String?),
          class_: $checkedConvert('class', (v) => v as String?),
          type: $checkedConvert('type', (v) => v as String?),
          typeLabel: $checkedConvert('type_label', (v) => v as String?),
          subType: $checkedConvert('sub_type', (v) => v as String?),
          subtype: $checkedConvert('subtype', (v) => v as String?),
          grade: $checkedConvert('grade', (v) => v as String?),
          itemWebUrl: $checkedConvert('item_web_url', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'class_': 'class',
        'typeLabel': 'type_label',
        'subType': 'sub_type',
        'itemWebUrl': 'item_web_url',
      },
    );

Map<String, dynamic> _$BlueprintOutputToJson(BlueprintOutput instance) =>
    <String, dynamic>{
      'uuid': ?instance.uuid,
      'name': ?instance.name,
      'class': ?instance.class_,
      'type': ?instance.type,
      'type_label': ?instance.typeLabel,
      'sub_type': ?instance.subType,
      'subtype': ?instance.subtype,
      'grade': ?instance.grade,
      'item_web_url': ?instance.itemWebUrl,
    };
