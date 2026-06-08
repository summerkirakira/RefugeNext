// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'galactapedia_property.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GalactapediaProperty _$GalactapediaPropertyFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('GalactapediaProperty', json, ($checkedConvert) {
  final val = GalactapediaProperty(
    name: $checkedConvert('name', (v) => v as String?),
    value: $checkedConvert('value', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$GalactapediaPropertyToJson(
  GalactapediaProperty instance,
) => <String, dynamic>{'name': ?instance.name, 'value': ?instance.value};
