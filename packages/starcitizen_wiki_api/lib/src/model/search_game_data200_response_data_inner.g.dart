// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_game_data200_response_data_inner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchGameData200ResponseDataInner _$SearchGameData200ResponseDataInnerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('SearchGameData200ResponseDataInner', json, (
  $checkedConvert,
) {
  final val = SearchGameData200ResponseDataInner(
    type: $checkedConvert('type', (v) => v as String?),
    label: $checkedConvert('label', (v) => v as String?),
    results: $checkedConvert(
      'results',
      (v) => (v as List<dynamic>?)
          ?.map(
            (e) => SearchGameData200ResponseDataInnerResultsInner.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
    ),
  );
  return val;
});

Map<String, dynamic> _$SearchGameData200ResponseDataInnerToJson(
  SearchGameData200ResponseDataInner instance,
) => <String, dynamic>{
  'type': ?instance.type,
  'label': ?instance.label,
  'results': ?instance.results?.map((e) => e.toJson()).toList(),
};
