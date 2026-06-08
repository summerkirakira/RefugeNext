// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_sku.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleSku _$VehicleSkuFromJson(Map<String, dynamic> json) =>
    $checkedCreate('VehicleSku', json, ($checkedConvert) {
      final val = VehicleSku(
        title: $checkedConvert('title', (v) => v as String?),
        price: $checkedConvert('price', (v) => (v as num?)?.toInt()),
        available: $checkedConvert('available', (v) => v as bool?),
        importedAt: $checkedConvert(
          'imported_at',
          (v) => v == null ? null : DateTime.parse(v as String),
        ),
      );
      return val;
    }, fieldKeyMap: const {'importedAt': 'imported_at'});

Map<String, dynamic> _$VehicleSkuToJson(VehicleSku instance) =>
    <String, dynamic>{
      'title': ?instance.title,
      'price': ?instance.price,
      'available': ?instance.available,
      'imported_at': ?instance.importedAt?.toIso8601String(),
    };
