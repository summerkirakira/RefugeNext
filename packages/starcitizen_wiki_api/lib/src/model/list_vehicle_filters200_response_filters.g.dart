// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_vehicle_filters200_response_filters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListVehicleFilters200ResponseFilters
_$ListVehicleFilters200ResponseFiltersFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ListVehicleFilters200ResponseFilters',
      json,
      ($checkedConvert) {
        final val = ListVehicleFilters200ResponseFilters(
          manufacturer: $checkedConvert(
            'manufacturer',
            (v) => (v as List<dynamic>?)
                ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                .toList(),
          ),
          isVehicle: $checkedConvert(
            'is_vehicle',
            (v) => (v as List<dynamic>?)
                ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                .toList(),
          ),
          isGravlev: $checkedConvert(
            'is_gravlev',
            (v) => (v as List<dynamic>?)
                ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                .toList(),
          ),
          isSpaceship: $checkedConvert(
            'is_spaceship',
            (v) => (v as List<dynamic>?)
                ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                .toList(),
          ),
          size: $checkedConvert(
            'size',
            (v) => (v as List<dynamic>?)
                ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                .toList(),
          ),
          role: $checkedConvert(
            'role',
            (v) => (v as List<dynamic>?)
                ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                .toList(),
          ),
          career: $checkedConvert(
            'career',
            (v) => (v as List<dynamic>?)
                ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                .toList(),
          ),
          shieldPeriodFaceType: $checkedConvert(
            'shield.face_type',
            (v) => (v as List<dynamic>?)
                ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                .toList(),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'isVehicle': 'is_vehicle',
        'isGravlev': 'is_gravlev',
        'isSpaceship': 'is_spaceship',
        'shieldPeriodFaceType': 'shield.face_type',
      },
    );

Map<String, dynamic> _$ListVehicleFilters200ResponseFiltersToJson(
  ListVehicleFilters200ResponseFilters instance,
) => <String, dynamic>{
  'manufacturer': ?instance.manufacturer?.map((e) => e.toJson()).toList(),
  'is_vehicle': ?instance.isVehicle?.map((e) => e.toJson()).toList(),
  'is_gravlev': ?instance.isGravlev?.map((e) => e.toJson()).toList(),
  'is_spaceship': ?instance.isSpaceship?.map((e) => e.toJson()).toList(),
  'size': ?instance.size?.map((e) => e.toJson()).toList(),
  'role': ?instance.role?.map((e) => e.toJson()).toList(),
  'career': ?instance.career?.map((e) => e.toJson()).toList(),
  'shield.face_type': ?instance.shieldPeriodFaceType
      ?.map((e) => e.toJson())
      .toList(),
};
