// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_query_property.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreditQueryPropertyImpl _$$CreditQueryPropertyImplFromJson(
        Map<String, dynamic> json) =>
    _$CreditQueryPropertyImpl(
      customer: Customer.fromJson(json['customer'] as Map<String, dynamic>),
      store: Store.fromJson(json['store'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CreditQueryPropertyImplToJson(
        _$CreditQueryPropertyImpl instance) =>
    <String, dynamic>{
      'customer': instance.customer,
      'store': instance.store,
    };

_$CustomerImpl _$$CustomerImplFromJson(Map<String, dynamic> json) =>
    _$CustomerImpl(
      ledger: Ledger.fromJson(json['ledger'] as Map<String, dynamic>),
      typename: json['__typename'] as String,
    );

Map<String, dynamic> _$$CustomerImplToJson(_$CustomerImpl instance) =>
    <String, dynamic>{
      'ledger': instance.ledger,
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

_$StoreImpl _$$StoreImplFromJson(Map<String, dynamic> json) => _$StoreImpl(
      cart: Cart.fromJson(json['cart'] as Map<String, dynamic>),
      typename: json['__typename'] as String,
    );

Map<String, dynamic> _$$StoreImplToJson(_$StoreImpl instance) =>
    <String, dynamic>{
      'cart': instance.cart,
      '__typename': instance.typename,
    };

_$CartImpl _$$CartImplFromJson(Map<String, dynamic> json) => _$CartImpl(
      totals: Totals.fromJson(json['totals'] as Map<String, dynamic>),
      typename: json['__typename'] as String,
    );

Map<String, dynamic> _$$CartImplToJson(_$CartImpl instance) =>
    <String, dynamic>{
      'totals': instance.totals,
      '__typename': instance.typename,
    };

_$TotalsImpl _$$TotalsImplFromJson(Map<String, dynamic> json) => _$TotalsImpl(
      credits: Credits.fromJson(json['credits'] as Map<String, dynamic>),
      typename: json['__typename'] as String,
    );

Map<String, dynamic> _$$TotalsImplToJson(_$TotalsImpl instance) =>
    <String, dynamic>{
      'credits': instance.credits,
      '__typename': instance.typename,
    };

_$CreditsImpl _$$CreditsImplFromJson(Map<String, dynamic> json) =>
    _$CreditsImpl(
      applicable: json['applicable'] as bool,
      maxApplicable: (json['maxApplicable'] as num).toInt(),
      amount: (json['amount'] as num).toInt(),
      typename: json['__typename'] as String,
    );

Map<String, dynamic> _$$CreditsImplToJson(_$CreditsImpl instance) =>
    <String, dynamic>{
      'applicable': instance.applicable,
      'maxApplicable': instance.maxApplicable,
      'amount': instance.amount,
      '__typename': instance.typename,
    };
