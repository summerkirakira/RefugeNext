// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promote_property.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PromotePropertyImpl _$$PromotePropertyImplFromJson(
        Map<String, dynamic> json) =>
    _$PromotePropertyImpl(
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PromotePropertyImplToJson(
        _$PromotePropertyImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      promotionalCode: PromotionalCode.fromJson(
          json['promotionalCode'] as Map<String, dynamic>),
      heap: Heap.fromJson(json['heap'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'promotionalCode': instance.promotionalCode,
      'heap': instance.heap,
    };

_$PromotionalCodeImpl _$$PromotionalCodeImplFromJson(
        Map<String, dynamic> json) =>
    _$PromotionalCodeImpl(
      validate: PromotionalCodeValidation.fromJson(
          json['validate'] as Map<String, dynamic>),
      typename: json['__typename'] as String,
    );

Map<String, dynamic> _$$PromotionalCodeImplToJson(
        _$PromotionalCodeImpl instance) =>
    <String, dynamic>{
      'validate': instance.validate,
      '__typename': instance.typename,
    };

_$PromotionalCodeValidationImpl _$$PromotionalCodeValidationImplFromJson(
        Map<String, dynamic> json) =>
    _$PromotionalCodeValidationImpl(
      isValid: json['isValid'] as bool,
      error: json['error'] as String,
      typename: json['__typename'] as String,
    );

Map<String, dynamic> _$$PromotionalCodeValidationImplToJson(
        _$PromotionalCodeValidationImpl instance) =>
    <String, dynamic>{
      'isValid': instance.isValid,
      'error': instance.error,
      '__typename': instance.typename,
    };

_$HeapImpl _$$HeapImplFromJson(Map<String, dynamic> json) => _$HeapImpl(
      launcherDownloadLink: HeapVariable.fromJson(
          json['launcherDownloadLink'] as Map<String, dynamic>),
      typename: json['__typename'] as String,
    );

Map<String, dynamic> _$$HeapImplToJson(_$HeapImpl instance) =>
    <String, dynamic>{
      'launcherDownloadLink': instance.launcherDownloadLink,
      '__typename': instance.typename,
    };

_$HeapVariableImpl _$$HeapVariableImplFromJson(Map<String, dynamic> json) =>
    _$HeapVariableImpl(
      value: json['value'] as String,
      typename: json['__typename'] as String,
    );

Map<String, dynamic> _$$HeapVariableImplToJson(_$HeapVariableImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      '__typename': instance.typename,
    };
