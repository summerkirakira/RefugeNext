// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ship_matrix_vehicle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShipMatrixVehicle _$ShipMatrixVehicleFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'ShipMatrixVehicle',
  json,
  ($checkedConvert) {
    final val = ShipMatrixVehicle(
      id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
      chassisId: $checkedConvert('chassis_id', (v) => (v as num?)?.toInt()),
      name: $checkedConvert('name', (v) => v as String?),
      slug: $checkedConvert('slug', (v) => v as String?),
      sizes: $checkedConvert(
        'sizes',
        (v) => v == null
            ? null
            : ShipMatrixVehicleSizes.fromJson(v as Map<String, dynamic>),
      ),
      dimension: $checkedConvert(
        'dimension',
        (v) => v == null
            ? null
            : ShipMatrixVehicleDimension.fromJson(v as Map<String, dynamic>),
      ),
      mass: $checkedConvert('mass', (v) => (v as num?)?.toDouble()),
      cargoCapacity: $checkedConvert(
        'cargo_capacity',
        (v) => (v as num?)?.toDouble(),
      ),
      crew: $checkedConvert(
        'crew',
        (v) => v == null
            ? null
            : MissionCombatSummaryTotal.fromJson(v as Map<String, dynamic>),
      ),
      speed: $checkedConvert(
        'speed',
        (v) => v == null
            ? null
            : ShipMatrixVehicleSpeed.fromJson(v as Map<String, dynamic>),
      ),
      agility: $checkedConvert(
        'agility',
        (v) => v == null
            ? null
            : ShipMatrixVehicleAgility.fromJson(v as Map<String, dynamic>),
      ),
      foci: $checkedConvert(
        'foci',
        (v) => (v as List<dynamic>?)
            ?.map((e) => Translation.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      productionStatus: $checkedConvert(
        'production_status',
        (v) =>
            v == null ? null : Translation.fromJson(v as Map<String, dynamic>),
      ),
      productionNote: $checkedConvert(
        'production_note',
        (v) =>
            v == null ? null : Translation.fromJson(v as Map<String, dynamic>),
      ),
      type: $checkedConvert(
        'type',
        (v) =>
            v == null ? null : Translation.fromJson(v as Map<String, dynamic>),
      ),
      description: $checkedConvert(
        'description',
        (v) =>
            v == null ? null : Translation.fromJson(v as Map<String, dynamic>),
      ),
      size: $checkedConvert(
        'size',
        (v) =>
            v == null ? null : Translation.fromJson(v as Map<String, dynamic>),
      ),
      msrp: $checkedConvert('msrp', (v) => (v as num?)?.toDouble()),
      pledgeUrl: $checkedConvert('pledge_url', (v) => v as String?),
      skus: $checkedConvert(
        'skus',
        (v) => (v as List<dynamic>?)
            ?.map((e) => VehicleSku.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      manufacturer: $checkedConvert(
        'manufacturer',
        (v) => v == null
            ? null
            : ShipMatrixVehicleManufacturer.fromJson(v as Map<String, dynamic>),
      ),
      updatedAt: $checkedConvert('updated_at', (v) => v as String?),
      components: $checkedConvert(
        'components',
        (v) => (v as List<dynamic>?)
            ?.map((e) => VehicleComponent.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      loaner: $checkedConvert(
        'loaner',
        (v) => (v as List<dynamic>?)
            ?.map((e) => VehicleLoaner.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      link: $checkedConvert('link', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'chassisId': 'chassis_id',
    'cargoCapacity': 'cargo_capacity',
    'productionStatus': 'production_status',
    'productionNote': 'production_note',
    'pledgeUrl': 'pledge_url',
    'updatedAt': 'updated_at',
  },
);

Map<String, dynamic> _$ShipMatrixVehicleToJson(ShipMatrixVehicle instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'chassis_id': ?instance.chassisId,
      'name': ?instance.name,
      'slug': ?instance.slug,
      'sizes': ?instance.sizes?.toJson(),
      'dimension': ?instance.dimension?.toJson(),
      'mass': ?instance.mass,
      'cargo_capacity': ?instance.cargoCapacity,
      'crew': ?instance.crew?.toJson(),
      'speed': ?instance.speed?.toJson(),
      'agility': ?instance.agility?.toJson(),
      'foci': ?instance.foci?.map((e) => e.toJson()).toList(),
      'production_status': ?instance.productionStatus?.toJson(),
      'production_note': ?instance.productionNote?.toJson(),
      'type': ?instance.type?.toJson(),
      'description': ?instance.description?.toJson(),
      'size': ?instance.size?.toJson(),
      'msrp': ?instance.msrp,
      'pledge_url': ?instance.pledgeUrl,
      'skus': ?instance.skus?.map((e) => e.toJson()).toList(),
      'manufacturer': ?instance.manufacturer?.toJson(),
      'updated_at': ?instance.updatedAt,
      'components': ?instance.components?.map((e) => e.toJson()).toList(),
      'loaner': ?instance.loaner?.map((e) => e.toJson()).toList(),
      'link': ?instance.link,
    };
