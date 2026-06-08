// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'galactapedia_tag.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GalactapediaTag _$GalactapediaTagFromJson(Map<String, dynamic> json) =>
    $checkedCreate('GalactapediaTag', json, ($checkedConvert) {
      final val = GalactapediaTag(
        id: $checkedConvert('id', (v) => v as String?),
        name: $checkedConvert('name', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$GalactapediaTagToJson(GalactapediaTag instance) =>
    <String, dynamic>{'id': ?instance.id, 'name': ?instance.name};
