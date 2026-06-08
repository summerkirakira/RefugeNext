// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_mission_filters200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListMissionFilters200Response _$ListMissionFilters200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ListMissionFilters200Response', json, ($checkedConvert) {
  final val = ListMissionFilters200Response(
    filters: $checkedConvert(
      'filters',
      (v) => v == null
          ? null
          : ListMissionFilters200ResponseFilters.fromJson(
              v as Map<String, dynamic>,
            ),
    ),
  );
  return val;
});

Map<String, dynamic> _$ListMissionFilters200ResponseToJson(
  ListMissionFilters200Response instance,
) => <String, dynamic>{'filters': ?instance.filters?.toJson()};
