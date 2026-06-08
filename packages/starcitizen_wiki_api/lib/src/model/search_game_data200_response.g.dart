// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_game_data200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchGameData200Response _$SearchGameData200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('SearchGameData200Response', json, ($checkedConvert) {
  final val = SearchGameData200Response(
    data: $checkedConvert(
      'data',
      (v) => (v as List<dynamic>?)
          ?.map(
            (e) => SearchGameData200ResponseDataInner.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
    ),
  );
  return val;
});

Map<String, dynamic> _$SearchGameData200ResponseToJson(
  SearchGameData200Response instance,
) => <String, dynamic>{'data': ?instance.data?.map((e) => e.toJson()).toList()};
