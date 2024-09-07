// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'credit_query_property.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreditQueryProperty _$CreditQueryPropertyFromJson(Map<String, dynamic> json) {
  return _CreditQueryProperty.fromJson(json);
}

/// @nodoc
mixin _$CreditQueryProperty {
  Ledger get ledgerCredit => throw _privateConstructorUsedError;
  Ledger get ledgerUec => throw _privateConstructorUsedError;
  Ledger get ledgerRec => throw _privateConstructorUsedError;
  @JsonKey(name: '__typename')
  String get typename => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreditQueryPropertyCopyWith<CreditQueryProperty> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreditQueryPropertyCopyWith<$Res> {
  factory $CreditQueryPropertyCopyWith(
          CreditQueryProperty value, $Res Function(CreditQueryProperty) then) =
      _$CreditQueryPropertyCopyWithImpl<$Res, CreditQueryProperty>;
  @useResult
  $Res call(
      {Ledger ledgerCredit,
      Ledger ledgerUec,
      Ledger ledgerRec,
      @JsonKey(name: '__typename') String typename});

  $LedgerCopyWith<$Res> get ledgerCredit;
  $LedgerCopyWith<$Res> get ledgerUec;
  $LedgerCopyWith<$Res> get ledgerRec;
}

/// @nodoc
class _$CreditQueryPropertyCopyWithImpl<$Res, $Val extends CreditQueryProperty>
    implements $CreditQueryPropertyCopyWith<$Res> {
  _$CreditQueryPropertyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ledgerCredit = null,
    Object? ledgerUec = null,
    Object? ledgerRec = null,
    Object? typename = null,
  }) {
    return _then(_value.copyWith(
      ledgerCredit: null == ledgerCredit
          ? _value.ledgerCredit
          : ledgerCredit // ignore: cast_nullable_to_non_nullable
              as Ledger,
      ledgerUec: null == ledgerUec
          ? _value.ledgerUec
          : ledgerUec // ignore: cast_nullable_to_non_nullable
              as Ledger,
      ledgerRec: null == ledgerRec
          ? _value.ledgerRec
          : ledgerRec // ignore: cast_nullable_to_non_nullable
              as Ledger,
      typename: null == typename
          ? _value.typename
          : typename // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LedgerCopyWith<$Res> get ledgerCredit {
    return $LedgerCopyWith<$Res>(_value.ledgerCredit, (value) {
      return _then(_value.copyWith(ledgerCredit: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $LedgerCopyWith<$Res> get ledgerUec {
    return $LedgerCopyWith<$Res>(_value.ledgerUec, (value) {
      return _then(_value.copyWith(ledgerUec: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $LedgerCopyWith<$Res> get ledgerRec {
    return $LedgerCopyWith<$Res>(_value.ledgerRec, (value) {
      return _then(_value.copyWith(ledgerRec: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CreditQueryPropertyImplCopyWith<$Res>
    implements $CreditQueryPropertyCopyWith<$Res> {
  factory _$$CreditQueryPropertyImplCopyWith(_$CreditQueryPropertyImpl value,
          $Res Function(_$CreditQueryPropertyImpl) then) =
      __$$CreditQueryPropertyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Ledger ledgerCredit,
      Ledger ledgerUec,
      Ledger ledgerRec,
      @JsonKey(name: '__typename') String typename});

  @override
  $LedgerCopyWith<$Res> get ledgerCredit;
  @override
  $LedgerCopyWith<$Res> get ledgerUec;
  @override
  $LedgerCopyWith<$Res> get ledgerRec;
}

/// @nodoc
class __$$CreditQueryPropertyImplCopyWithImpl<$Res>
    extends _$CreditQueryPropertyCopyWithImpl<$Res, _$CreditQueryPropertyImpl>
    implements _$$CreditQueryPropertyImplCopyWith<$Res> {
  __$$CreditQueryPropertyImplCopyWithImpl(_$CreditQueryPropertyImpl _value,
      $Res Function(_$CreditQueryPropertyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ledgerCredit = null,
    Object? ledgerUec = null,
    Object? ledgerRec = null,
    Object? typename = null,
  }) {
    return _then(_$CreditQueryPropertyImpl(
      ledgerCredit: null == ledgerCredit
          ? _value.ledgerCredit
          : ledgerCredit // ignore: cast_nullable_to_non_nullable
              as Ledger,
      ledgerUec: null == ledgerUec
          ? _value.ledgerUec
          : ledgerUec // ignore: cast_nullable_to_non_nullable
              as Ledger,
      ledgerRec: null == ledgerRec
          ? _value.ledgerRec
          : ledgerRec // ignore: cast_nullable_to_non_nullable
              as Ledger,
      typename: null == typename
          ? _value.typename
          : typename // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreditQueryPropertyImpl implements _CreditQueryProperty {
  _$CreditQueryPropertyImpl(
      {required this.ledgerCredit,
      required this.ledgerUec,
      required this.ledgerRec,
      @JsonKey(name: '__typename') required this.typename});

  factory _$CreditQueryPropertyImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreditQueryPropertyImplFromJson(json);

  @override
  final Ledger ledgerCredit;
  @override
  final Ledger ledgerUec;
  @override
  final Ledger ledgerRec;
  @override
  @JsonKey(name: '__typename')
  final String typename;

  @override
  String toString() {
    return 'CreditQueryProperty(ledgerCredit: $ledgerCredit, ledgerUec: $ledgerUec, ledgerRec: $ledgerRec, typename: $typename)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreditQueryPropertyImpl &&
            (identical(other.ledgerCredit, ledgerCredit) ||
                other.ledgerCredit == ledgerCredit) &&
            (identical(other.ledgerUec, ledgerUec) ||
                other.ledgerUec == ledgerUec) &&
            (identical(other.ledgerRec, ledgerRec) ||
                other.ledgerRec == ledgerRec) &&
            (identical(other.typename, typename) ||
                other.typename == typename));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, ledgerCredit, ledgerUec, ledgerRec, typename);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreditQueryPropertyImplCopyWith<_$CreditQueryPropertyImpl> get copyWith =>
      __$$CreditQueryPropertyImplCopyWithImpl<_$CreditQueryPropertyImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreditQueryPropertyImplToJson(
      this,
    );
  }
}

abstract class _CreditQueryProperty implements CreditQueryProperty {
  factory _CreditQueryProperty(
          {required final Ledger ledgerCredit,
          required final Ledger ledgerUec,
          required final Ledger ledgerRec,
          @JsonKey(name: '__typename') required final String typename}) =
      _$CreditQueryPropertyImpl;

  factory _CreditQueryProperty.fromJson(Map<String, dynamic> json) =
      _$CreditQueryPropertyImpl.fromJson;

  @override
  Ledger get ledgerCredit;
  @override
  Ledger get ledgerUec;
  @override
  Ledger get ledgerRec;
  @override
  @JsonKey(name: '__typename')
  String get typename;
  @override
  @JsonKey(ignore: true)
  _$$CreditQueryPropertyImplCopyWith<_$CreditQueryPropertyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Ledger _$LedgerFromJson(Map<String, dynamic> json) {
  return _Ledger.fromJson(json);
}

/// @nodoc
mixin _$Ledger {
  String get name => throw _privateConstructorUsedError;
  Amount get amount => throw _privateConstructorUsedError;
  @JsonKey(name: '__typename')
  String get typename => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LedgerCopyWith<Ledger> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LedgerCopyWith<$Res> {
  factory $LedgerCopyWith(Ledger value, $Res Function(Ledger) then) =
      _$LedgerCopyWithImpl<$Res, Ledger>;
  @useResult
  $Res call(
      {String name,
      Amount amount,
      @JsonKey(name: '__typename') String typename});

  $AmountCopyWith<$Res> get amount;
}

/// @nodoc
class _$LedgerCopyWithImpl<$Res, $Val extends Ledger>
    implements $LedgerCopyWith<$Res> {
  _$LedgerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? amount = null,
    Object? typename = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as Amount,
      typename: null == typename
          ? _value.typename
          : typename // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AmountCopyWith<$Res> get amount {
    return $AmountCopyWith<$Res>(_value.amount, (value) {
      return _then(_value.copyWith(amount: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LedgerImplCopyWith<$Res> implements $LedgerCopyWith<$Res> {
  factory _$$LedgerImplCopyWith(
          _$LedgerImpl value, $Res Function(_$LedgerImpl) then) =
      __$$LedgerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      Amount amount,
      @JsonKey(name: '__typename') String typename});

  @override
  $AmountCopyWith<$Res> get amount;
}

/// @nodoc
class __$$LedgerImplCopyWithImpl<$Res>
    extends _$LedgerCopyWithImpl<$Res, _$LedgerImpl>
    implements _$$LedgerImplCopyWith<$Res> {
  __$$LedgerImplCopyWithImpl(
      _$LedgerImpl _value, $Res Function(_$LedgerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? amount = null,
    Object? typename = null,
  }) {
    return _then(_$LedgerImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as Amount,
      typename: null == typename
          ? _value.typename
          : typename // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LedgerImpl implements _Ledger {
  _$LedgerImpl(
      {required this.name,
      required this.amount,
      @JsonKey(name: '__typename') required this.typename});

  factory _$LedgerImpl.fromJson(Map<String, dynamic> json) =>
      _$$LedgerImplFromJson(json);

  @override
  final String name;
  @override
  final Amount amount;
  @override
  @JsonKey(name: '__typename')
  final String typename;

  @override
  String toString() {
    return 'Ledger(name: $name, amount: $amount, typename: $typename)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LedgerImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.typename, typename) ||
                other.typename == typename));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, amount, typename);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LedgerImplCopyWith<_$LedgerImpl> get copyWith =>
      __$$LedgerImplCopyWithImpl<_$LedgerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LedgerImplToJson(
      this,
    );
  }
}

abstract class _Ledger implements Ledger {
  factory _Ledger(
          {required final String name,
          required final Amount amount,
          @JsonKey(name: '__typename') required final String typename}) =
      _$LedgerImpl;

  factory _Ledger.fromJson(Map<String, dynamic> json) = _$LedgerImpl.fromJson;

  @override
  String get name;
  @override
  Amount get amount;
  @override
  @JsonKey(name: '__typename')
  String get typename;
  @override
  @JsonKey(ignore: true)
  _$$LedgerImplCopyWith<_$LedgerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Amount _$AmountFromJson(Map<String, dynamic> json) {
  return _Amount.fromJson(json);
}

/// @nodoc
mixin _$Amount {
  int get value => throw _privateConstructorUsedError;
  Currency get currency => throw _privateConstructorUsedError;
  @JsonKey(name: '__typename')
  String get typename => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AmountCopyWith<Amount> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AmountCopyWith<$Res> {
  factory $AmountCopyWith(Amount value, $Res Function(Amount) then) =
      _$AmountCopyWithImpl<$Res, Amount>;
  @useResult
  $Res call(
      {int value,
      Currency currency,
      @JsonKey(name: '__typename') String typename});

  $CurrencyCopyWith<$Res> get currency;
}

/// @nodoc
class _$AmountCopyWithImpl<$Res, $Val extends Amount>
    implements $AmountCopyWith<$Res> {
  _$AmountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? currency = null,
    Object? typename = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency,
      typename: null == typename
          ? _value.typename
          : typename // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CurrencyCopyWith<$Res> get currency {
    return $CurrencyCopyWith<$Res>(_value.currency, (value) {
      return _then(_value.copyWith(currency: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AmountImplCopyWith<$Res> implements $AmountCopyWith<$Res> {
  factory _$$AmountImplCopyWith(
          _$AmountImpl value, $Res Function(_$AmountImpl) then) =
      __$$AmountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int value,
      Currency currency,
      @JsonKey(name: '__typename') String typename});

  @override
  $CurrencyCopyWith<$Res> get currency;
}

/// @nodoc
class __$$AmountImplCopyWithImpl<$Res>
    extends _$AmountCopyWithImpl<$Res, _$AmountImpl>
    implements _$$AmountImplCopyWith<$Res> {
  __$$AmountImplCopyWithImpl(
      _$AmountImpl _value, $Res Function(_$AmountImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? currency = null,
    Object? typename = null,
  }) {
    return _then(_$AmountImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency,
      typename: null == typename
          ? _value.typename
          : typename // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AmountImpl implements _Amount {
  _$AmountImpl(
      {required this.value,
      required this.currency,
      @JsonKey(name: '__typename') required this.typename});

  factory _$AmountImpl.fromJson(Map<String, dynamic> json) =>
      _$$AmountImplFromJson(json);

  @override
  final int value;
  @override
  final Currency currency;
  @override
  @JsonKey(name: '__typename')
  final String typename;

  @override
  String toString() {
    return 'Amount(value: $value, currency: $currency, typename: $typename)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AmountImpl &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.typename, typename) ||
                other.typename == typename));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, value, currency, typename);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AmountImplCopyWith<_$AmountImpl> get copyWith =>
      __$$AmountImplCopyWithImpl<_$AmountImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AmountImplToJson(
      this,
    );
  }
}

abstract class _Amount implements Amount {
  factory _Amount(
          {required final int value,
          required final Currency currency,
          @JsonKey(name: '__typename') required final String typename}) =
      _$AmountImpl;

  factory _Amount.fromJson(Map<String, dynamic> json) = _$AmountImpl.fromJson;

  @override
  int get value;
  @override
  Currency get currency;
  @override
  @JsonKey(name: '__typename')
  String get typename;
  @override
  @JsonKey(ignore: true)
  _$$AmountImplCopyWith<_$AmountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Currency _$CurrencyFromJson(Map<String, dynamic> json) {
  return _Currency.fromJson(json);
}

/// @nodoc
mixin _$Currency {
  String get code => throw _privateConstructorUsedError;
  String get symbol => throw _privateConstructorUsedError;
  @JsonKey(name: '__typename')
  String get typename => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CurrencyCopyWith<Currency> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrencyCopyWith<$Res> {
  factory $CurrencyCopyWith(Currency value, $Res Function(Currency) then) =
      _$CurrencyCopyWithImpl<$Res, Currency>;
  @useResult
  $Res call(
      {String code,
      String symbol,
      @JsonKey(name: '__typename') String typename});
}

/// @nodoc
class _$CurrencyCopyWithImpl<$Res, $Val extends Currency>
    implements $CurrencyCopyWith<$Res> {
  _$CurrencyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? symbol = null,
    Object? typename = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      typename: null == typename
          ? _value.typename
          : typename // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CurrencyImplCopyWith<$Res>
    implements $CurrencyCopyWith<$Res> {
  factory _$$CurrencyImplCopyWith(
          _$CurrencyImpl value, $Res Function(_$CurrencyImpl) then) =
      __$$CurrencyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String code,
      String symbol,
      @JsonKey(name: '__typename') String typename});
}

/// @nodoc
class __$$CurrencyImplCopyWithImpl<$Res>
    extends _$CurrencyCopyWithImpl<$Res, _$CurrencyImpl>
    implements _$$CurrencyImplCopyWith<$Res> {
  __$$CurrencyImplCopyWithImpl(
      _$CurrencyImpl _value, $Res Function(_$CurrencyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? symbol = null,
    Object? typename = null,
  }) {
    return _then(_$CurrencyImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      typename: null == typename
          ? _value.typename
          : typename // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CurrencyImpl implements _Currency {
  _$CurrencyImpl(
      {required this.code,
      required this.symbol,
      @JsonKey(name: '__typename') required this.typename});

  factory _$CurrencyImpl.fromJson(Map<String, dynamic> json) =>
      _$$CurrencyImplFromJson(json);

  @override
  final String code;
  @override
  final String symbol;
  @override
  @JsonKey(name: '__typename')
  final String typename;

  @override
  String toString() {
    return 'Currency(code: $code, symbol: $symbol, typename: $typename)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrencyImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.typename, typename) ||
                other.typename == typename));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, code, symbol, typename);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrencyImplCopyWith<_$CurrencyImpl> get copyWith =>
      __$$CurrencyImplCopyWithImpl<_$CurrencyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CurrencyImplToJson(
      this,
    );
  }
}

abstract class _Currency implements Currency {
  factory _Currency(
          {required final String code,
          required final String symbol,
          @JsonKey(name: '__typename') required final String typename}) =
      _$CurrencyImpl;

  factory _Currency.fromJson(Map<String, dynamic> json) =
      _$CurrencyImpl.fromJson;

  @override
  String get code;
  @override
  String get symbol;
  @override
  @JsonKey(name: '__typename')
  String get typename;
  @override
  @JsonKey(ignore: true)
  _$$CurrencyImplCopyWith<_$CurrencyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
