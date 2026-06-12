// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_component.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleComponent _$VehicleComponentFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'VehicleComponent',
      json,
      ($checkedConvert) {
        final val = VehicleComponent(
          type: $checkedConvert('type', (v) => v as String?),
          name: $checkedConvert('name', (v) => v as String?),
          mounts: $checkedConvert('mounts', (v) => (v as num?)?.toInt()),
          componentSize: $checkedConvert('component_size', (v) => v as String?),
          category: $checkedConvert('category', (v) => v as String?),
          size: $checkedConvert('size', (v) => v as String?),
          details: $checkedConvert('details', (v) => v as String?),
          quantity: $checkedConvert('quantity', (v) => (v as num?)?.toInt()),
          manufacturer: $checkedConvert('manufacturer', (v) => v as String?),
          componentClass: $checkedConvert(
            'component_class',
            (v) => v as String?,
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'componentSize': 'component_size',
        'componentClass': 'component_class',
      },
    );

Map<String, dynamic> _$VehicleComponentToJson(VehicleComponent instance) =>
    <String, dynamic>{
      'type': ?instance.type,
      'name': ?instance.name,
      'mounts': ?instance.mounts,
      'component_size': ?instance.componentSize,
      'category': ?instance.category,
      'size': ?instance.size,
      'details': ?instance.details,
      'quantity': ?instance.quantity,
      'manufacturer': ?instance.manufacturer,
      'component_class': ?instance.componentClass,
    };
