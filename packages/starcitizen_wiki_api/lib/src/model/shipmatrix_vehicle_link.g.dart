// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipmatrix_vehicle_link.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShipmatrixVehicleLink _$ShipmatrixVehicleLinkFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'ShipmatrixVehicleLink',
  json,
  ($checkedConvert) {
    final val = ShipmatrixVehicleLink(
      updatedAt: $checkedConvert('updated_at', (v) => v as String?),
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
      id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
      name: $checkedConvert('name', (v) => v as String?),
      slug: $checkedConvert('slug', (v) => v as String?),
      size: $checkedConvert(
        'size',
        (v) =>
            v == null ? null : Translation.fromJson(v as Map<String, dynamic>),
      ),
      type: $checkedConvert(
        'type',
        (v) =>
            v == null ? null : Translation.fromJson(v as Map<String, dynamic>),
      ),
      manufacturer: $checkedConvert(
        'manufacturer',
        (v) => v == null
            ? null
            : ShipmatrixManufacturerLink.fromJson(v as Map<String, dynamic>),
      ),
      productionStatus: $checkedConvert(
        'production_status',
        (v) =>
            v == null ? null : Translation.fromJson(v as Map<String, dynamic>),
      ),
      link: $checkedConvert('link', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'updatedAt': 'updated_at',
    'deprecatedFields': 'deprecated_fields',
    'productionStatus': 'production_status',
  },
);

Map<String, dynamic> _$ShipmatrixVehicleLinkToJson(
  ShipmatrixVehicleLink instance,
) => <String, dynamic>{
  'updated_at': ?instance.updatedAt,
  'version': ?instance.version,
  'deprecated_fields': ?instance.deprecatedFields,
  'resource': ?instance.resource?.toJson(),
  'id': ?instance.id,
  'name': ?instance.name,
  'slug': ?instance.slug,
  'size': ?instance.size?.toJson(),
  'type': ?instance.type?.toJson(),
  'manufacturer': ?instance.manufacturer?.toJson(),
  'production_status': ?instance.productionStatus?.toJson(),
  'link': ?instance.link,
};
