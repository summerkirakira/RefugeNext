import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'promote_property.freezed.dart';
part 'promote_property.g.dart';

@freezed
class PromoteProperty with _$PromoteProperty {
  const factory PromoteProperty({
    required Data data,
  }) = _PromoteProperty;

  factory PromoteProperty.fromJson(Map<String, dynamic> json) =>
      _$PromotePropertyFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    required PromotionalCode promotionalCode,
    required Heap heap,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@freezed
class PromotionalCode with _$PromotionalCode {
  const factory PromotionalCode({
    required PromotionalCodeValidation validate,
    @JsonKey(name: '__typename') required String typename,
  }) = _PromotionalCode;

  factory PromotionalCode.fromJson(Map<String, dynamic> json) =>
      _$PromotionalCodeFromJson(json);
}

@freezed
class PromotionalCodeValidation with _$PromotionalCodeValidation {
  const factory PromotionalCodeValidation({
    required bool isValid,
    required String error,
    @JsonKey(name: '__typename') required String typename,
  }) = _PromotionalCodeValidation;

  factory PromotionalCodeValidation.fromJson(Map<String, dynamic> json) =>
      _$PromotionalCodeValidationFromJson(json);
}

@freezed
class Heap with _$Heap {
  const factory Heap({
    required HeapVariable launcherDownloadLink,
    @JsonKey(name: '__typename') required String typename,
  }) = _Heap;

  factory Heap.fromJson(Map<String, dynamic> json) => _$HeapFromJson(json);
}

@freezed
class HeapVariable with _$HeapVariable {
  const factory HeapVariable({
    required String value,
    @JsonKey(name: '__typename') required String typename,
  }) = _HeapVariable;

  factory HeapVariable.fromJson(Map<String, dynamic> json) =>
      _$HeapVariableFromJson(json);
}
