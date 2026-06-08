// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_value.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilterValue _$FilterValueFromJson(Map<String, dynamic> json) =>
    $checkedCreate('FilterValue', json, ($checkedConvert) {
      final val = FilterValue(
        value: $checkedConvert(
          'value',
          (v) => v == null
              ? null
              : FilterValueValue.fromJson(v as Map<String, dynamic>),
        ),
        label: $checkedConvert('label', (v) => v as String?),
        count: $checkedConvert('count', (v) => (v as num?)?.toInt()),
      );
      return val;
    });

Map<String, dynamic> _$FilterValueToJson(FilterValue instance) =>
    <String, dynamic>{
      'value': ?instance.value?.toJson(),
      'label': ?instance.label,
      'count': ?instance.count,
    };
