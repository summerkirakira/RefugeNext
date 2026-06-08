// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manufacturer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Manufacturer _$ManufacturerFromJson(Map<String, dynamic> json) =>
    $checkedCreate('Manufacturer', json, ($checkedConvert) {
      final val = Manufacturer(
        name: $checkedConvert('name', (v) => v as String?),
        code: $checkedConvert('code', (v) => v as String?),
        uuid: $checkedConvert('uuid', (v) => v as String?),
        link: $checkedConvert('link', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$ManufacturerToJson(Manufacturer instance) =>
    <String, dynamic>{
      'name': ?instance.name,
      'code': ?instance.code,
      'uuid': ?instance.uuid,
      'link': ?instance.link,
    };
