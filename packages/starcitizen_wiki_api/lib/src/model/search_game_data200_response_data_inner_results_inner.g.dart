// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_game_data200_response_data_inner_results_inner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchGameData200ResponseDataInnerResultsInner
_$SearchGameData200ResponseDataInnerResultsInnerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'SearchGameData200ResponseDataInnerResultsInner',
  json,
  ($checkedConvert) {
    final val = SearchGameData200ResponseDataInnerResultsInner(
      name: $checkedConvert('name', (v) => v as String?),
      className: $checkedConvert('class_name', (v) => v as String?),
      classification: $checkedConvert('classification', (v) => v as String?),
      classificationLabel: $checkedConvert(
        'classification_label',
        (v) => v as String?,
      ),
      itemTypeLabel: $checkedConvert('item_type_label', (v) => v as String?),
      extraLabel: $checkedConvert('extra_label', (v) => v as String?),
      webUrl: $checkedConvert('web_url', (v) => v as String?),
      apiUrl: $checkedConvert('api_url', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'className': 'class_name',
    'classificationLabel': 'classification_label',
    'itemTypeLabel': 'item_type_label',
    'extraLabel': 'extra_label',
    'webUrl': 'web_url',
    'apiUrl': 'api_url',
  },
);

Map<String, dynamic> _$SearchGameData200ResponseDataInnerResultsInnerToJson(
  SearchGameData200ResponseDataInnerResultsInner instance,
) => <String, dynamic>{
  'name': ?instance.name,
  'class_name': ?instance.className,
  'classification': ?instance.classification,
  'classification_label': ?instance.classificationLabel,
  'item_type_label': ?instance.itemTypeLabel,
  'extra_label': ?instance.extraLabel,
  'web_url': ?instance.webUrl,
  'api_url': ?instance.apiUrl,
};
