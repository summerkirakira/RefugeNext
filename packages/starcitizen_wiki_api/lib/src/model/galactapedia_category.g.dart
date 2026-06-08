// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'galactapedia_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GalactapediaCategory _$GalactapediaCategoryFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('GalactapediaCategory', json, ($checkedConvert) {
  final val = GalactapediaCategory(
    id: $checkedConvert('id', (v) => v as String?),
    name: $checkedConvert('name', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$GalactapediaCategoryToJson(
  GalactapediaCategory instance,
) => <String, dynamic>{'id': ?instance.id, 'name': ?instance.name};
