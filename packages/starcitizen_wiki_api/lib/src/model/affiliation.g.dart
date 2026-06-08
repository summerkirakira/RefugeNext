// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'affiliation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Affiliation _$AffiliationFromJson(Map<String, dynamic> json) =>
    $checkedCreate('Affiliation', json, ($checkedConvert) {
      final val = Affiliation(
        id: $checkedConvert('id', (v) => v as String?),
        name: $checkedConvert('name', (v) => v as String?),
        code: $checkedConvert('code', (v) => v as String?),
        color: $checkedConvert('color', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$AffiliationToJson(Affiliation instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'name': ?instance.name,
      'code': ?instance.code,
      'color': ?instance.color,
    };
