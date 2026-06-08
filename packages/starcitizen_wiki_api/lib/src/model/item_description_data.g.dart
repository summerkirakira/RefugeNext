// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_description_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemDescriptionData _$ItemDescriptionDataFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ItemDescriptionData', json, ($checkedConvert) {
      final val = ItemDescriptionData(
        name: $checkedConvert('name', (v) => v as String?),
        value: $checkedConvert('value', (v) => v as String?),
        type: $checkedConvert('type', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$ItemDescriptionDataToJson(
  ItemDescriptionData instance,
) => <String, dynamic>{
  'name': ?instance.name,
  'value': ?instance.value,
  'type': ?instance.type,
};
