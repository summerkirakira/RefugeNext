// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_loaner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleLoaner _$VehicleLoanerFromJson(Map<String, dynamic> json) =>
    $checkedCreate('VehicleLoaner', json, ($checkedConvert) {
      final val = VehicleLoaner(
        uuid: $checkedConvert('uuid', (v) => v as String?),
        name: $checkedConvert('name', (v) => v as String?),
        slug: $checkedConvert('slug', (v) => v as String?),
        link: $checkedConvert('link', (v) => v as String?),
        version: $checkedConvert('version', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$VehicleLoanerToJson(VehicleLoaner instance) =>
    <String, dynamic>{
      'uuid': ?instance.uuid,
      'name': ?instance.name,
      'slug': ?instance.slug,
      'link': ?instance.link,
      'version': ?instance.version,
    };
