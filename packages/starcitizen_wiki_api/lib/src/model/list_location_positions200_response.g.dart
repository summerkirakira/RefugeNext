// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_location_positions200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListLocationPositions200Response _$ListLocationPositions200ResponseFromJson(
  Map<String, dynamic> json,
) =>
    $checkedCreate('ListLocationPositions200Response', json, ($checkedConvert) {
      final val = ListLocationPositions200Response(
        data: $checkedConvert(
          'data',
          (v) => (v as List<dynamic>?)
              ?.map(
                (e) => ListLocationPositions200ResponseDataInner.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList(),
        ),
        connections: $checkedConvert(
          'connections',
          (v) => (v as List<dynamic>?)
              ?.map(
                (e) =>
                    ListLocationPositions200ResponseConnectionsInner.fromJson(
                      e as Map<String, dynamic>,
                    ),
              )
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$ListLocationPositions200ResponseToJson(
  ListLocationPositions200Response instance,
) => <String, dynamic>{
  'data': ?instance.data?.map((e) => e.toJson()).toList(),
  'connections': ?instance.connections?.map((e) => e.toJson()).toList(),
};
