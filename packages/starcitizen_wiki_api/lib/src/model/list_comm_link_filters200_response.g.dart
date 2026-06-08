// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_comm_link_filters200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListCommLinkFilters200Response _$ListCommLinkFilters200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ListCommLinkFilters200Response', json, ($checkedConvert) {
  final val = ListCommLinkFilters200Response(
    filters: $checkedConvert(
      'filters',
      (v) => v == null
          ? null
          : ListCommLinkFilters200ResponseFilters.fromJson(
              v as Map<String, dynamic>,
            ),
    ),
  );
  return val;
});

Map<String, dynamic> _$ListCommLinkFilters200ResponseToJson(
  ListCommLinkFilters200Response instance,
) => <String, dynamic>{'filters': ?instance.filters?.toJson()};
