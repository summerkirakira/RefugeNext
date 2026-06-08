// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'area_exception.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AreaException _$AreaExceptionFromJson(Map<String, dynamic> json) =>
    $checkedCreate('AreaException', json, ($checkedConvert) {
      final val = AreaException(
        name: $checkedConvert('name', (v) => v as String?),
        modifier: $checkedConvert('modifier', (v) => v as num?),
      );
      return val;
    });

Map<String, dynamic> _$AreaExceptionToJson(AreaException instance) =>
    <String, dynamic>{'name': ?instance.name, 'modifier': ?instance.modifier};
