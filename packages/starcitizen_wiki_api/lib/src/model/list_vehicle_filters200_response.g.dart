// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_vehicle_filters200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListVehicleFilters200Response _$ListVehicleFilters200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ListVehicleFilters200Response', json, ($checkedConvert) {
  final val = ListVehicleFilters200Response(
    filters: $checkedConvert(
      'filters',
      (v) => v == null
          ? null
          : ListVehicleFilters200ResponseFilters.fromJson(
              v as Map<String, dynamic>,
            ),
    ),
  );
  return val;
});

Map<String, dynamic> _$ListVehicleFilters200ResponseToJson(
  ListVehicleFilters200Response instance,
) => <String, dynamic>{'filters': ?instance.filters?.toJson()};
