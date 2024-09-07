// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_query_property.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreditQueryPropertyImpl _$$CreditQueryPropertyImplFromJson(
        Map<String, dynamic> json) =>
    _$CreditQueryPropertyImpl(
      ledgerCredit:
          Ledger.fromJson(json['ledgerCredit'] as Map<String, dynamic>),
      ledgerUec: Ledger.fromJson(json['ledgerUec'] as Map<String, dynamic>),
      ledgerRec: Ledger.fromJson(json['ledgerRec'] as Map<String, dynamic>),
      typename: json['__typename'] as String,
    );

Map<String, dynamic> _$$CreditQueryPropertyImplToJson(
        _$CreditQueryPropertyImpl instance) =>
    <String, dynamic>{
      'ledgerCredit': instance.ledgerCredit,
      'ledgerUec': instance.ledgerUec,
      'ledgerRec': instance.ledgerRec,
      '__typename': instance.typename,
    };

_$LedgerImpl _$$LedgerImplFromJson(Map<String, dynamic> json) => _$LedgerImpl(
      name: json['name'] as String,
      amount: Amount.fromJson(json['amount'] as Map<String, dynamic>),
      typename: json['__typename'] as String,
    );

Map<String, dynamic> _$$LedgerImplToJson(_$LedgerImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'amount': instance.amount,
      '__typename': instance.typename,
    };

_$AmountImpl _$$AmountImplFromJson(Map<String, dynamic> json) => _$AmountImpl(
      value: (json['value'] as num).toInt(),
      currency: Currency.fromJson(json['currency'] as Map<String, dynamic>),
      typename: json['__typename'] as String,
    );

Map<String, dynamic> _$$AmountImplToJson(_$AmountImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'currency': instance.currency,
      '__typename': instance.typename,
    };

_$CurrencyImpl _$$CurrencyImplFromJson(Map<String, dynamic> json) =>
    _$CurrencyImpl(
      code: json['code'] as String,
      symbol: json['symbol'] as String,
      typename: json['__typename'] as String,
    );

Map<String, dynamic> _$$CurrencyImplToJson(_$CurrencyImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'symbol': instance.symbol,
      '__typename': instance.typename,
    };
