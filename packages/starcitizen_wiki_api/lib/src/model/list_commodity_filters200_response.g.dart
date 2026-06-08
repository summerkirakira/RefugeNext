// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_commodity_filters200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListCommodityFilters200Response _$ListCommodityFilters200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ListCommodityFilters200Response', json, ($checkedConvert) {
  final val = ListCommodityFilters200Response(
    filters: $checkedConvert(
      'filters',
      (v) => v == null
          ? null
          : ListCommodityFilters200ResponseFilters.fromJson(
              v as Map<String, dynamic>,
            ),
    ),
  );
  return val;
});

Map<String, dynamic> _$ListCommodityFilters200ResponseToJson(
  ListCommodityFilters200Response instance,
) => <String, dynamic>{'filters': ?instance.filters?.toJson()};
