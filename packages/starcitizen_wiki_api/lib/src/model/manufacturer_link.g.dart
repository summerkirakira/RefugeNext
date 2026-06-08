// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manufacturer_link.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ManufacturerLink _$ManufacturerLinkFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ManufacturerLink', json, ($checkedConvert) {
      final val = ManufacturerLink(
        name: $checkedConvert('name', (v) => v as String?),
        code: $checkedConvert('code', (v) => v as String?),
        uuid: $checkedConvert('uuid', (v) => v as String?),
        link: $checkedConvert('link', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$ManufacturerLinkToJson(ManufacturerLink instance) =>
    <String, dynamic>{
      'name': ?instance.name,
      'code': ?instance.code,
      'uuid': ?instance.uuid,
      'link': ?instance.link,
    };
