// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_link.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleLink _$VehicleLinkFromJson(Map<String, dynamic> json) => $checkedCreate(
  'VehicleLink',
  json,
  ($checkedConvert) {
    final val = VehicleLink(
      updatedAt: $checkedConvert(
        'updated_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      version: $checkedConvert('version', (v) => v as String?),
      deprecatedFields: $checkedConvert(
        'deprecated_fields',
        (v) => v as String?,
      ),
      resource: $checkedConvert(
        'resource',
        (v) => v == null
            ? null
            : CanonicalResourceMeta.fromJson(v as Map<String, dynamic>),
      ),
      uuid: $checkedConvert('uuid', (v) => v as String?),
      name: $checkedConvert('name', (v) => v as String?),
      className: $checkedConvert('class_name', (v) => v as String?),
      career: $checkedConvert('career', (v) => v as String?),
      role: $checkedConvert('role', (v) => v as String?),
      sizeClass: $checkedConvert('size_class', (v) => (v as num?)?.toInt()),
      size: $checkedConvert('size', (v) => (v as num?)?.toInt()),
      isVehicle: $checkedConvert('is_vehicle', (v) => v as bool?),
      isGravlev: $checkedConvert('is_gravlev', (v) => v as bool?),
      isSpaceship: $checkedConvert('is_spaceship', (v) => v as bool?),
      manufacturer: $checkedConvert(
        'manufacturer',
        (v) => v == null
            ? null
            : ManufacturerLink.fromJson(v as Map<String, dynamic>),
      ),
      link: $checkedConvert('link', (v) => v as String?),
      webUrl: $checkedConvert('web_url', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'updatedAt': 'updated_at',
    'deprecatedFields': 'deprecated_fields',
    'className': 'class_name',
    'sizeClass': 'size_class',
    'isVehicle': 'is_vehicle',
    'isGravlev': 'is_gravlev',
    'isSpaceship': 'is_spaceship',
    'webUrl': 'web_url',
  },
);

Map<String, dynamic> _$VehicleLinkToJson(VehicleLink instance) =>
    <String, dynamic>{
      'updated_at': ?instance.updatedAt?.toIso8601String(),
      'version': ?instance.version,
      'deprecated_fields': ?instance.deprecatedFields,
      'resource': ?instance.resource?.toJson(),
      'uuid': ?instance.uuid,
      'name': ?instance.name,
      'class_name': ?instance.className,
      'career': ?instance.career,
      'role': ?instance.role,
      'size_class': ?instance.sizeClass,
      'size': ?instance.size,
      'is_vehicle': ?instance.isVehicle,
      'is_gravlev': ?instance.isGravlev,
      'is_spaceship': ?instance.isSpaceship,
      'manufacturer': ?instance.manufacturer?.toJson(),
      'link': ?instance.link,
      'web_url': ?instance.webUrl,
    };
