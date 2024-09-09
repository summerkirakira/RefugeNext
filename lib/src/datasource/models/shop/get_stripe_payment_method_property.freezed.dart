// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_stripe_payment_method_property.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetStripePaymentMethodProperty _$GetStripePaymentMethodPropertyFromJson(
    Map<String, dynamic> json) {
  return _GetStripePaymentMethodProperty.fromJson(json);
}

/// @nodoc
mixin _$GetStripePaymentMethodProperty {
  OrderData get order => throw _privateConstructorUsedError;
  Customer get customer => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetStripePaymentMethodPropertyCopyWith<GetStripePaymentMethodProperty>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetStripePaymentMethodPropertyCopyWith<$Res> {
  factory $GetStripePaymentMethodPropertyCopyWith(
          GetStripePaymentMethodProperty value,
          $Res Function(GetStripePaymentMethodProperty) then) =
      _$GetStripePaymentMethodPropertyCopyWithImpl<$Res,
          GetStripePaymentMethodProperty>;
  @useResult
  $Res call({OrderData order, Customer customer});

  $OrderDataCopyWith<$Res> get order;
  $CustomerCopyWith<$Res> get customer;
}

/// @nodoc
class _$GetStripePaymentMethodPropertyCopyWithImpl<$Res,
        $Val extends GetStripePaymentMethodProperty>
    implements $GetStripePaymentMethodPropertyCopyWith<$Res> {
  _$GetStripePaymentMethodPropertyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? order = null,
    Object? customer = null,
  }) {
    return _then(_value.copyWith(
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as OrderData,
      customer: null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderDataCopyWith<$Res> get order {
    return $OrderDataCopyWith<$Res>(_value.order, (value) {
      return _then(_value.copyWith(order: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CustomerCopyWith<$Res> get customer {
    return $CustomerCopyWith<$Res>(_value.customer, (value) {
      return _then(_value.copyWith(customer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GetStripePaymentMethodPropertyImplCopyWith<$Res>
    implements $GetStripePaymentMethodPropertyCopyWith<$Res> {
  factory _$$GetStripePaymentMethodPropertyImplCopyWith(
          _$GetStripePaymentMethodPropertyImpl value,
          $Res Function(_$GetStripePaymentMethodPropertyImpl) then) =
      __$$GetStripePaymentMethodPropertyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({OrderData order, Customer customer});

  @override
  $OrderDataCopyWith<$Res> get order;
  @override
  $CustomerCopyWith<$Res> get customer;
}

/// @nodoc
class __$$GetStripePaymentMethodPropertyImplCopyWithImpl<$Res>
    extends _$GetStripePaymentMethodPropertyCopyWithImpl<$Res,
        _$GetStripePaymentMethodPropertyImpl>
    implements _$$GetStripePaymentMethodPropertyImplCopyWith<$Res> {
  __$$GetStripePaymentMethodPropertyImplCopyWithImpl(
      _$GetStripePaymentMethodPropertyImpl _value,
      $Res Function(_$GetStripePaymentMethodPropertyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? order = null,
    Object? customer = null,
  }) {
    return _then(_$GetStripePaymentMethodPropertyImpl(
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as OrderData,
      customer: null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetStripePaymentMethodPropertyImpl
    implements _GetStripePaymentMethodProperty {
  _$GetStripePaymentMethodPropertyImpl(
      {required this.order, required this.customer});

  factory _$GetStripePaymentMethodPropertyImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$GetStripePaymentMethodPropertyImplFromJson(json);

  @override
  final OrderData order;
  @override
  final Customer customer;

  @override
  String toString() {
    return 'GetStripePaymentMethodProperty(order: $order, customer: $customer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetStripePaymentMethodPropertyImpl &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.customer, customer) ||
                other.customer == customer));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, order, customer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetStripePaymentMethodPropertyImplCopyWith<
          _$GetStripePaymentMethodPropertyImpl>
      get copyWith => __$$GetStripePaymentMethodPropertyImplCopyWithImpl<
          _$GetStripePaymentMethodPropertyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetStripePaymentMethodPropertyImplToJson(
      this,
    );
  }
}

abstract class _GetStripePaymentMethodProperty
    implements GetStripePaymentMethodProperty {
  factory _GetStripePaymentMethodProperty(
      {required final OrderData order,
      required final Customer customer}) = _$GetStripePaymentMethodPropertyImpl;

  factory _GetStripePaymentMethodProperty.fromJson(Map<String, dynamic> json) =
      _$GetStripePaymentMethodPropertyImpl.fromJson;

  @override
  OrderData get order;
  @override
  Customer get customer;
  @override
  @JsonKey(ignore: true)
  _$$GetStripePaymentMethodPropertyImplCopyWith<
          _$GetStripePaymentMethodPropertyImpl>
      get copyWith => throw _privateConstructorUsedError;
}

OrderData _$OrderDataFromJson(Map<String, dynamic> json) {
  return _OrderData.fromJson(json);
}

/// @nodoc
mixin _$OrderData {
  Payment get payment => throw _privateConstructorUsedError;
  OrderDetails get order => throw _privateConstructorUsedError;
  PostalAddress get billingAddress => throw _privateConstructorUsedError;
  PostalAddress? get shippingAddress => throw _privateConstructorUsedError;
  StoreContext get context => throw _privateConstructorUsedError;
  CartTotal get totals => throw _privateConstructorUsedError;
  List<dynamic> get savedCards => throw _privateConstructorUsedError;
  String get typeName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderDataCopyWith<OrderData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderDataCopyWith<$Res> {
  factory $OrderDataCopyWith(OrderData value, $Res Function(OrderData) then) =
      _$OrderDataCopyWithImpl<$Res, OrderData>;
  @useResult
  $Res call(
      {Payment payment,
      OrderDetails order,
      PostalAddress billingAddress,
      PostalAddress? shippingAddress,
      StoreContext context,
      CartTotal totals,
      List<dynamic> savedCards,
      String typeName});

  $PaymentCopyWith<$Res> get payment;
  $OrderDetailsCopyWith<$Res> get order;
  $PostalAddressCopyWith<$Res> get billingAddress;
  $PostalAddressCopyWith<$Res>? get shippingAddress;
  $StoreContextCopyWith<$Res> get context;
  $CartTotalCopyWith<$Res> get totals;
}

/// @nodoc
class _$OrderDataCopyWithImpl<$Res, $Val extends OrderData>
    implements $OrderDataCopyWith<$Res> {
  _$OrderDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? payment = null,
    Object? order = null,
    Object? billingAddress = null,
    Object? shippingAddress = freezed,
    Object? context = null,
    Object? totals = null,
    Object? savedCards = null,
    Object? typeName = null,
  }) {
    return _then(_value.copyWith(
      payment: null == payment
          ? _value.payment
          : payment // ignore: cast_nullable_to_non_nullable
              as Payment,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as OrderDetails,
      billingAddress: null == billingAddress
          ? _value.billingAddress
          : billingAddress // ignore: cast_nullable_to_non_nullable
              as PostalAddress,
      shippingAddress: freezed == shippingAddress
          ? _value.shippingAddress
          : shippingAddress // ignore: cast_nullable_to_non_nullable
              as PostalAddress?,
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as StoreContext,
      totals: null == totals
          ? _value.totals
          : totals // ignore: cast_nullable_to_non_nullable
              as CartTotal,
      savedCards: null == savedCards
          ? _value.savedCards
          : savedCards // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      typeName: null == typeName
          ? _value.typeName
          : typeName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PaymentCopyWith<$Res> get payment {
    return $PaymentCopyWith<$Res>(_value.payment, (value) {
      return _then(_value.copyWith(payment: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderDetailsCopyWith<$Res> get order {
    return $OrderDetailsCopyWith<$Res>(_value.order, (value) {
      return _then(_value.copyWith(order: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PostalAddressCopyWith<$Res> get billingAddress {
    return $PostalAddressCopyWith<$Res>(_value.billingAddress, (value) {
      return _then(_value.copyWith(billingAddress: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PostalAddressCopyWith<$Res>? get shippingAddress {
    if (_value.shippingAddress == null) {
      return null;
    }

    return $PostalAddressCopyWith<$Res>(_value.shippingAddress!, (value) {
      return _then(_value.copyWith(shippingAddress: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $StoreContextCopyWith<$Res> get context {
    return $StoreContextCopyWith<$Res>(_value.context, (value) {
      return _then(_value.copyWith(context: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CartTotalCopyWith<$Res> get totals {
    return $CartTotalCopyWith<$Res>(_value.totals, (value) {
      return _then(_value.copyWith(totals: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderDataImplCopyWith<$Res>
    implements $OrderDataCopyWith<$Res> {
  factory _$$OrderDataImplCopyWith(
          _$OrderDataImpl value, $Res Function(_$OrderDataImpl) then) =
      __$$OrderDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Payment payment,
      OrderDetails order,
      PostalAddress billingAddress,
      PostalAddress? shippingAddress,
      StoreContext context,
      CartTotal totals,
      List<dynamic> savedCards,
      String typeName});

  @override
  $PaymentCopyWith<$Res> get payment;
  @override
  $OrderDetailsCopyWith<$Res> get order;
  @override
  $PostalAddressCopyWith<$Res> get billingAddress;
  @override
  $PostalAddressCopyWith<$Res>? get shippingAddress;
  @override
  $StoreContextCopyWith<$Res> get context;
  @override
  $CartTotalCopyWith<$Res> get totals;
}

/// @nodoc
class __$$OrderDataImplCopyWithImpl<$Res>
    extends _$OrderDataCopyWithImpl<$Res, _$OrderDataImpl>
    implements _$$OrderDataImplCopyWith<$Res> {
  __$$OrderDataImplCopyWithImpl(
      _$OrderDataImpl _value, $Res Function(_$OrderDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? payment = null,
    Object? order = null,
    Object? billingAddress = null,
    Object? shippingAddress = freezed,
    Object? context = null,
    Object? totals = null,
    Object? savedCards = null,
    Object? typeName = null,
  }) {
    return _then(_$OrderDataImpl(
      payment: null == payment
          ? _value.payment
          : payment // ignore: cast_nullable_to_non_nullable
              as Payment,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as OrderDetails,
      billingAddress: null == billingAddress
          ? _value.billingAddress
          : billingAddress // ignore: cast_nullable_to_non_nullable
              as PostalAddress,
      shippingAddress: freezed == shippingAddress
          ? _value.shippingAddress
          : shippingAddress // ignore: cast_nullable_to_non_nullable
              as PostalAddress?,
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as StoreContext,
      totals: null == totals
          ? _value.totals
          : totals // ignore: cast_nullable_to_non_nullable
              as CartTotal,
      savedCards: null == savedCards
          ? _value._savedCards
          : savedCards // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      typeName: null == typeName
          ? _value.typeName
          : typeName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderDataImpl implements _OrderData {
  _$OrderDataImpl(
      {required this.payment,
      required this.order,
      required this.billingAddress,
      this.shippingAddress,
      required this.context,
      required this.totals,
      final List<dynamic> savedCards = const [],
      this.typeName = 'TyOrderQueries'})
      : _savedCards = savedCards;

  factory _$OrderDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderDataImplFromJson(json);

  @override
  final Payment payment;
  @override
  final OrderDetails order;
  @override
  final PostalAddress billingAddress;
  @override
  final PostalAddress? shippingAddress;
  @override
  final StoreContext context;
  @override
  final CartTotal totals;
  final List<dynamic> _savedCards;
  @override
  @JsonKey()
  List<dynamic> get savedCards {
    if (_savedCards is EqualUnmodifiableListView) return _savedCards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_savedCards);
  }

  @override
  @JsonKey()
  final String typeName;

  @override
  String toString() {
    return 'OrderData(payment: $payment, order: $order, billingAddress: $billingAddress, shippingAddress: $shippingAddress, context: $context, totals: $totals, savedCards: $savedCards, typeName: $typeName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderDataImpl &&
            (identical(other.payment, payment) || other.payment == payment) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.billingAddress, billingAddress) ||
                other.billingAddress == billingAddress) &&
            (identical(other.shippingAddress, shippingAddress) ||
                other.shippingAddress == shippingAddress) &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.totals, totals) || other.totals == totals) &&
            const DeepCollectionEquality()
                .equals(other._savedCards, _savedCards) &&
            (identical(other.typeName, typeName) ||
                other.typeName == typeName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      payment,
      order,
      billingAddress,
      shippingAddress,
      context,
      totals,
      const DeepCollectionEquality().hash(_savedCards),
      typeName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderDataImplCopyWith<_$OrderDataImpl> get copyWith =>
      __$$OrderDataImplCopyWithImpl<_$OrderDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderDataImplToJson(
      this,
    );
  }
}

abstract class _OrderData implements OrderData {
  factory _OrderData(
      {required final Payment payment,
      required final OrderDetails order,
      required final PostalAddress billingAddress,
      final PostalAddress? shippingAddress,
      required final StoreContext context,
      required final CartTotal totals,
      final List<dynamic> savedCards,
      final String typeName}) = _$OrderDataImpl;

  factory _OrderData.fromJson(Map<String, dynamic> json) =
      _$OrderDataImpl.fromJson;

  @override
  Payment get payment;
  @override
  OrderDetails get order;
  @override
  PostalAddress get billingAddress;
  @override
  PostalAddress? get shippingAddress;
  @override
  StoreContext get context;
  @override
  CartTotal get totals;
  @override
  List<dynamic> get savedCards;
  @override
  String get typeName;
  @override
  @JsonKey(ignore: true)
  _$$OrderDataImplCopyWith<_$OrderDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Payment _$PaymentFromJson(Map<String, dynamic> json) {
  return _Payment.fromJson(json);
}

/// @nodoc
mixin _$Payment {
  ApiKey get apiKey => throw _privateConstructorUsedError;
  String get typeName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentCopyWith<Payment> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentCopyWith<$Res> {
  factory $PaymentCopyWith(Payment value, $Res Function(Payment) then) =
      _$PaymentCopyWithImpl<$Res, Payment>;
  @useResult
  $Res call({ApiKey apiKey, String typeName});

  $ApiKeyCopyWith<$Res> get apiKey;
}

/// @nodoc
class _$PaymentCopyWithImpl<$Res, $Val extends Payment>
    implements $PaymentCopyWith<$Res> {
  _$PaymentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apiKey = null,
    Object? typeName = null,
  }) {
    return _then(_value.copyWith(
      apiKey: null == apiKey
          ? _value.apiKey
          : apiKey // ignore: cast_nullable_to_non_nullable
              as ApiKey,
      typeName: null == typeName
          ? _value.typeName
          : typeName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ApiKeyCopyWith<$Res> get apiKey {
    return $ApiKeyCopyWith<$Res>(_value.apiKey, (value) {
      return _then(_value.copyWith(apiKey: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PaymentImplCopyWith<$Res> implements $PaymentCopyWith<$Res> {
  factory _$$PaymentImplCopyWith(
          _$PaymentImpl value, $Res Function(_$PaymentImpl) then) =
      __$$PaymentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ApiKey apiKey, String typeName});

  @override
  $ApiKeyCopyWith<$Res> get apiKey;
}

/// @nodoc
class __$$PaymentImplCopyWithImpl<$Res>
    extends _$PaymentCopyWithImpl<$Res, _$PaymentImpl>
    implements _$$PaymentImplCopyWith<$Res> {
  __$$PaymentImplCopyWithImpl(
      _$PaymentImpl _value, $Res Function(_$PaymentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apiKey = null,
    Object? typeName = null,
  }) {
    return _then(_$PaymentImpl(
      apiKey: null == apiKey
          ? _value.apiKey
          : apiKey // ignore: cast_nullable_to_non_nullable
              as ApiKey,
      typeName: null == typeName
          ? _value.typeName
          : typeName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentImpl implements _Payment {
  _$PaymentImpl({required this.apiKey, this.typeName = 'PaymentContext'});

  factory _$PaymentImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentImplFromJson(json);

  @override
  final ApiKey apiKey;
  @override
  @JsonKey()
  final String typeName;

  @override
  String toString() {
    return 'Payment(apiKey: $apiKey, typeName: $typeName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentImpl &&
            (identical(other.apiKey, apiKey) || other.apiKey == apiKey) &&
            (identical(other.typeName, typeName) ||
                other.typeName == typeName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, apiKey, typeName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentImplCopyWith<_$PaymentImpl> get copyWith =>
      __$$PaymentImplCopyWithImpl<_$PaymentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentImplToJson(
      this,
    );
  }
}

abstract class _Payment implements Payment {
  factory _Payment({required final ApiKey apiKey, final String typeName}) =
      _$PaymentImpl;

  factory _Payment.fromJson(Map<String, dynamic> json) = _$PaymentImpl.fromJson;

  @override
  ApiKey get apiKey;
  @override
  String get typeName;
  @override
  @JsonKey(ignore: true)
  _$$PaymentImplCopyWith<_$PaymentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ApiKey _$ApiKeyFromJson(Map<String, dynamic> json) {
  return _ApiKey.fromJson(json);
}

/// @nodoc
mixin _$ApiKey {
  String get value => throw _privateConstructorUsedError;
  String get typeName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApiKeyCopyWith<ApiKey> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiKeyCopyWith<$Res> {
  factory $ApiKeyCopyWith(ApiKey value, $Res Function(ApiKey) then) =
      _$ApiKeyCopyWithImpl<$Res, ApiKey>;
  @useResult
  $Res call({String value, String typeName});
}

/// @nodoc
class _$ApiKeyCopyWithImpl<$Res, $Val extends ApiKey>
    implements $ApiKeyCopyWith<$Res> {
  _$ApiKeyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? typeName = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      typeName: null == typeName
          ? _value.typeName
          : typeName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApiKeyImplCopyWith<$Res> implements $ApiKeyCopyWith<$Res> {
  factory _$$ApiKeyImplCopyWith(
          _$ApiKeyImpl value, $Res Function(_$ApiKeyImpl) then) =
      __$$ApiKeyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String value, String typeName});
}

/// @nodoc
class __$$ApiKeyImplCopyWithImpl<$Res>
    extends _$ApiKeyCopyWithImpl<$Res, _$ApiKeyImpl>
    implements _$$ApiKeyImplCopyWith<$Res> {
  __$$ApiKeyImplCopyWithImpl(
      _$ApiKeyImpl _value, $Res Function(_$ApiKeyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? typeName = null,
  }) {
    return _then(_$ApiKeyImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      typeName: null == typeName
          ? _value.typeName
          : typeName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ApiKeyImpl implements _ApiKey {
  _$ApiKeyImpl({required this.value, this.typeName = 'ApiKey'});

  factory _$ApiKeyImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApiKeyImplFromJson(json);

  @override
  final String value;
  @override
  @JsonKey()
  final String typeName;

  @override
  String toString() {
    return 'ApiKey(value: $value, typeName: $typeName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiKeyImpl &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.typeName, typeName) ||
                other.typeName == typeName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, value, typeName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiKeyImplCopyWith<_$ApiKeyImpl> get copyWith =>
      __$$ApiKeyImplCopyWithImpl<_$ApiKeyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApiKeyImplToJson(
      this,
    );
  }
}

abstract class _ApiKey implements ApiKey {
  factory _ApiKey({required final String value, final String typeName}) =
      _$ApiKeyImpl;

  factory _ApiKey.fromJson(Map<String, dynamic> json) = _$ApiKeyImpl.fromJson;

  @override
  String get value;
  @override
  String get typeName;
  @override
  @JsonKey(ignore: true)
  _$$ApiKeyImplCopyWith<_$ApiKeyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderDetails _$OrderDetailsFromJson(Map<String, dynamic> json) {
  return _OrderDetails.fromJson(json);
}

/// @nodoc
mixin _$OrderDetails {
  String get id => throw _privateConstructorUsedError;
  bool get recurring => throw _privateConstructorUsedError;
  String get slug => throw _privateConstructorUsedError;
  StripeIntentMethod get paymentMethod => throw _privateConstructorUsedError;
  String get typeName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderDetailsCopyWith<OrderDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderDetailsCopyWith<$Res> {
  factory $OrderDetailsCopyWith(
          OrderDetails value, $Res Function(OrderDetails) then) =
      _$OrderDetailsCopyWithImpl<$Res, OrderDetails>;
  @useResult
  $Res call(
      {String id,
      bool recurring,
      String slug,
      StripeIntentMethod paymentMethod,
      String typeName});

  $StripeIntentMethodCopyWith<$Res> get paymentMethod;
}

/// @nodoc
class _$OrderDetailsCopyWithImpl<$Res, $Val extends OrderDetails>
    implements $OrderDetailsCopyWith<$Res> {
  _$OrderDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? recurring = null,
    Object? slug = null,
    Object? paymentMethod = null,
    Object? typeName = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      recurring: null == recurring
          ? _value.recurring
          : recurring // ignore: cast_nullable_to_non_nullable
              as bool,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as StripeIntentMethod,
      typeName: null == typeName
          ? _value.typeName
          : typeName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StripeIntentMethodCopyWith<$Res> get paymentMethod {
    return $StripeIntentMethodCopyWith<$Res>(_value.paymentMethod, (value) {
      return _then(_value.copyWith(paymentMethod: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderDetailsImplCopyWith<$Res>
    implements $OrderDetailsCopyWith<$Res> {
  factory _$$OrderDetailsImplCopyWith(
          _$OrderDetailsImpl value, $Res Function(_$OrderDetailsImpl) then) =
      __$$OrderDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      bool recurring,
      String slug,
      StripeIntentMethod paymentMethod,
      String typeName});

  @override
  $StripeIntentMethodCopyWith<$Res> get paymentMethod;
}

/// @nodoc
class __$$OrderDetailsImplCopyWithImpl<$Res>
    extends _$OrderDetailsCopyWithImpl<$Res, _$OrderDetailsImpl>
    implements _$$OrderDetailsImplCopyWith<$Res> {
  __$$OrderDetailsImplCopyWithImpl(
      _$OrderDetailsImpl _value, $Res Function(_$OrderDetailsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? recurring = null,
    Object? slug = null,
    Object? paymentMethod = null,
    Object? typeName = null,
  }) {
    return _then(_$OrderDetailsImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      recurring: null == recurring
          ? _value.recurring
          : recurring // ignore: cast_nullable_to_non_nullable
              as bool,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as StripeIntentMethod,
      typeName: null == typeName
          ? _value.typeName
          : typeName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderDetailsImpl implements _OrderDetails {
  _$OrderDetailsImpl(
      {required this.id,
      required this.recurring,
      required this.slug,
      required this.paymentMethod,
      this.typeName = 'TyOrder'});

  factory _$OrderDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderDetailsImplFromJson(json);

  @override
  final String id;
  @override
  final bool recurring;
  @override
  final String slug;
  @override
  final StripeIntentMethod paymentMethod;
  @override
  @JsonKey()
  final String typeName;

  @override
  String toString() {
    return 'OrderDetails(id: $id, recurring: $recurring, slug: $slug, paymentMethod: $paymentMethod, typeName: $typeName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderDetailsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.recurring, recurring) ||
                other.recurring == recurring) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.typeName, typeName) ||
                other.typeName == typeName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, recurring, slug, paymentMethod, typeName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderDetailsImplCopyWith<_$OrderDetailsImpl> get copyWith =>
      __$$OrderDetailsImplCopyWithImpl<_$OrderDetailsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderDetailsImplToJson(
      this,
    );
  }
}

abstract class _OrderDetails implements OrderDetails {
  factory _OrderDetails(
      {required final String id,
      required final bool recurring,
      required final String slug,
      required final StripeIntentMethod paymentMethod,
      final String typeName}) = _$OrderDetailsImpl;

  factory _OrderDetails.fromJson(Map<String, dynamic> json) =
      _$OrderDetailsImpl.fromJson;

  @override
  String get id;
  @override
  bool get recurring;
  @override
  String get slug;
  @override
  StripeIntentMethod get paymentMethod;
  @override
  String get typeName;
  @override
  @JsonKey(ignore: true)
  _$$OrderDetailsImplCopyWith<_$OrderDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StripeIntentMethod _$StripeIntentMethodFromJson(Map<String, dynamic> json) {
  return _StripeIntentMethod.fromJson(json);
}

/// @nodoc
mixin _$StripeIntentMethod {
  String get clientSecret => throw _privateConstructorUsedError;
  String get typeName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StripeIntentMethodCopyWith<StripeIntentMethod> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StripeIntentMethodCopyWith<$Res> {
  factory $StripeIntentMethodCopyWith(
          StripeIntentMethod value, $Res Function(StripeIntentMethod) then) =
      _$StripeIntentMethodCopyWithImpl<$Res, StripeIntentMethod>;
  @useResult
  $Res call({String clientSecret, String typeName});
}

/// @nodoc
class _$StripeIntentMethodCopyWithImpl<$Res, $Val extends StripeIntentMethod>
    implements $StripeIntentMethodCopyWith<$Res> {
  _$StripeIntentMethodCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientSecret = null,
    Object? typeName = null,
  }) {
    return _then(_value.copyWith(
      clientSecret: null == clientSecret
          ? _value.clientSecret
          : clientSecret // ignore: cast_nullable_to_non_nullable
              as String,
      typeName: null == typeName
          ? _value.typeName
          : typeName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StripeIntentMethodImplCopyWith<$Res>
    implements $StripeIntentMethodCopyWith<$Res> {
  factory _$$StripeIntentMethodImplCopyWith(_$StripeIntentMethodImpl value,
          $Res Function(_$StripeIntentMethodImpl) then) =
      __$$StripeIntentMethodImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String clientSecret, String typeName});
}

/// @nodoc
class __$$StripeIntentMethodImplCopyWithImpl<$Res>
    extends _$StripeIntentMethodCopyWithImpl<$Res, _$StripeIntentMethodImpl>
    implements _$$StripeIntentMethodImplCopyWith<$Res> {
  __$$StripeIntentMethodImplCopyWithImpl(_$StripeIntentMethodImpl _value,
      $Res Function(_$StripeIntentMethodImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientSecret = null,
    Object? typeName = null,
  }) {
    return _then(_$StripeIntentMethodImpl(
      clientSecret: null == clientSecret
          ? _value.clientSecret
          : clientSecret // ignore: cast_nullable_to_non_nullable
              as String,
      typeName: null == typeName
          ? _value.typeName
          : typeName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StripeIntentMethodImpl implements _StripeIntentMethod {
  _$StripeIntentMethodImpl(
      {required this.clientSecret, this.typeName = 'StripeIntentMethod'});

  factory _$StripeIntentMethodImpl.fromJson(Map<String, dynamic> json) =>
      _$$StripeIntentMethodImplFromJson(json);

  @override
  final String clientSecret;
  @override
  @JsonKey()
  final String typeName;

  @override
  String toString() {
    return 'StripeIntentMethod(clientSecret: $clientSecret, typeName: $typeName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StripeIntentMethodImpl &&
            (identical(other.clientSecret, clientSecret) ||
                other.clientSecret == clientSecret) &&
            (identical(other.typeName, typeName) ||
                other.typeName == typeName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, clientSecret, typeName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StripeIntentMethodImplCopyWith<_$StripeIntentMethodImpl> get copyWith =>
      __$$StripeIntentMethodImplCopyWithImpl<_$StripeIntentMethodImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StripeIntentMethodImplToJson(
      this,
    );
  }
}

abstract class _StripeIntentMethod implements StripeIntentMethod {
  factory _StripeIntentMethod(
      {required final String clientSecret,
      final String typeName}) = _$StripeIntentMethodImpl;

  factory _StripeIntentMethod.fromJson(Map<String, dynamic> json) =
      _$StripeIntentMethodImpl.fromJson;

  @override
  String get clientSecret;
  @override
  String get typeName;
  @override
  @JsonKey(ignore: true)
  _$$StripeIntentMethodImplCopyWith<_$StripeIntentMethodImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PostalAddress _$PostalAddressFromJson(Map<String, dynamic> json) {
  return _PostalAddress.fromJson(json);
}

/// @nodoc
mixin _$PostalAddress {
  String get id => throw _privateConstructorUsedError;
  String get typeName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostalAddressCopyWith<PostalAddress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostalAddressCopyWith<$Res> {
  factory $PostalAddressCopyWith(
          PostalAddress value, $Res Function(PostalAddress) then) =
      _$PostalAddressCopyWithImpl<$Res, PostalAddress>;
  @useResult
  $Res call({String id, String typeName});
}

/// @nodoc
class _$PostalAddressCopyWithImpl<$Res, $Val extends PostalAddress>
    implements $PostalAddressCopyWith<$Res> {
  _$PostalAddressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? typeName = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      typeName: null == typeName
          ? _value.typeName
          : typeName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PostalAddressImplCopyWith<$Res>
    implements $PostalAddressCopyWith<$Res> {
  factory _$$PostalAddressImplCopyWith(
          _$PostalAddressImpl value, $Res Function(_$PostalAddressImpl) then) =
      __$$PostalAddressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String typeName});
}

/// @nodoc
class __$$PostalAddressImplCopyWithImpl<$Res>
    extends _$PostalAddressCopyWithImpl<$Res, _$PostalAddressImpl>
    implements _$$PostalAddressImplCopyWith<$Res> {
  __$$PostalAddressImplCopyWithImpl(
      _$PostalAddressImpl _value, $Res Function(_$PostalAddressImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? typeName = null,
  }) {
    return _then(_$PostalAddressImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      typeName: null == typeName
          ? _value.typeName
          : typeName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PostalAddressImpl implements _PostalAddress {
  _$PostalAddressImpl({required this.id, this.typeName = 'PostalAddress'});

  factory _$PostalAddressImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostalAddressImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey()
  final String typeName;

  @override
  String toString() {
    return 'PostalAddress(id: $id, typeName: $typeName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostalAddressImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.typeName, typeName) ||
                other.typeName == typeName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, typeName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostalAddressImplCopyWith<_$PostalAddressImpl> get copyWith =>
      __$$PostalAddressImplCopyWithImpl<_$PostalAddressImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostalAddressImplToJson(
      this,
    );
  }
}

abstract class _PostalAddress implements PostalAddress {
  factory _PostalAddress({required final String id, final String typeName}) =
      _$PostalAddressImpl;

  factory _PostalAddress.fromJson(Map<String, dynamic> json) =
      _$PostalAddressImpl.fromJson;

  @override
  String get id;
  @override
  String get typeName;
  @override
  @JsonKey(ignore: true)
  _$$PostalAddressImplCopyWith<_$PostalAddressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StoreContext _$StoreContextFromJson(Map<String, dynamic> json) {
  return _StoreContext.fromJson(json);
}

/// @nodoc
mixin _$StoreContext {
  PricingContext get pricing => throw _privateConstructorUsedError;
  String get typeName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoreContextCopyWith<StoreContext> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreContextCopyWith<$Res> {
  factory $StoreContextCopyWith(
          StoreContext value, $Res Function(StoreContext) then) =
      _$StoreContextCopyWithImpl<$Res, StoreContext>;
  @useResult
  $Res call({PricingContext pricing, String typeName});

  $PricingContextCopyWith<$Res> get pricing;
}

/// @nodoc
class _$StoreContextCopyWithImpl<$Res, $Val extends StoreContext>
    implements $StoreContextCopyWith<$Res> {
  _$StoreContextCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pricing = null,
    Object? typeName = null,
  }) {
    return _then(_value.copyWith(
      pricing: null == pricing
          ? _value.pricing
          : pricing // ignore: cast_nullable_to_non_nullable
              as PricingContext,
      typeName: null == typeName
          ? _value.typeName
          : typeName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PricingContextCopyWith<$Res> get pricing {
    return $PricingContextCopyWith<$Res>(_value.pricing, (value) {
      return _then(_value.copyWith(pricing: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StoreContextImplCopyWith<$Res>
    implements $StoreContextCopyWith<$Res> {
  factory _$$StoreContextImplCopyWith(
          _$StoreContextImpl value, $Res Function(_$StoreContextImpl) then) =
      __$$StoreContextImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PricingContext pricing, String typeName});

  @override
  $PricingContextCopyWith<$Res> get pricing;
}

/// @nodoc
class __$$StoreContextImplCopyWithImpl<$Res>
    extends _$StoreContextCopyWithImpl<$Res, _$StoreContextImpl>
    implements _$$StoreContextImplCopyWith<$Res> {
  __$$StoreContextImplCopyWithImpl(
      _$StoreContextImpl _value, $Res Function(_$StoreContextImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pricing = null,
    Object? typeName = null,
  }) {
    return _then(_$StoreContextImpl(
      pricing: null == pricing
          ? _value.pricing
          : pricing // ignore: cast_nullable_to_non_nullable
              as PricingContext,
      typeName: null == typeName
          ? _value.typeName
          : typeName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StoreContextImpl implements _StoreContext {
  _$StoreContextImpl({required this.pricing, this.typeName = 'StoreContext'});

  factory _$StoreContextImpl.fromJson(Map<String, dynamic> json) =>
      _$$StoreContextImplFromJson(json);

  @override
  final PricingContext pricing;
  @override
  @JsonKey()
  final String typeName;

  @override
  String toString() {
    return 'StoreContext(pricing: $pricing, typeName: $typeName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoreContextImpl &&
            (identical(other.pricing, pricing) || other.pricing == pricing) &&
            (identical(other.typeName, typeName) ||
                other.typeName == typeName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, pricing, typeName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StoreContextImplCopyWith<_$StoreContextImpl> get copyWith =>
      __$$StoreContextImplCopyWithImpl<_$StoreContextImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StoreContextImplToJson(
      this,
    );
  }
}

abstract class _StoreContext implements StoreContext {
  factory _StoreContext(
      {required final PricingContext pricing,
      final String typeName}) = _$StoreContextImpl;

  factory _StoreContext.fromJson(Map<String, dynamic> json) =
      _$StoreContextImpl.fromJson;

  @override
  PricingContext get pricing;
  @override
  String get typeName;
  @override
  @JsonKey(ignore: true)
  _$$StoreContextImplCopyWith<_$StoreContextImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PricingContext _$PricingContextFromJson(Map<String, dynamic> json) {
  return _PricingContext.fromJson(json);
}

/// @nodoc
mixin _$PricingContext {
  String get currencyCode => throw _privateConstructorUsedError;
  String get typeName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PricingContextCopyWith<PricingContext> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PricingContextCopyWith<$Res> {
  factory $PricingContextCopyWith(
          PricingContext value, $Res Function(PricingContext) then) =
      _$PricingContextCopyWithImpl<$Res, PricingContext>;
  @useResult
  $Res call({String currencyCode, String typeName});
}

/// @nodoc
class _$PricingContextCopyWithImpl<$Res, $Val extends PricingContext>
    implements $PricingContextCopyWith<$Res> {
  _$PricingContextCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currencyCode = null,
    Object? typeName = null,
  }) {
    return _then(_value.copyWith(
      currencyCode: null == currencyCode
          ? _value.currencyCode
          : currencyCode // ignore: cast_nullable_to_non_nullable
              as String,
      typeName: null == typeName
          ? _value.typeName
          : typeName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PricingContextImplCopyWith<$Res>
    implements $PricingContextCopyWith<$Res> {
  factory _$$PricingContextImplCopyWith(_$PricingContextImpl value,
          $Res Function(_$PricingContextImpl) then) =
      __$$PricingContextImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String currencyCode, String typeName});
}

/// @nodoc
class __$$PricingContextImplCopyWithImpl<$Res>
    extends _$PricingContextCopyWithImpl<$Res, _$PricingContextImpl>
    implements _$$PricingContextImplCopyWith<$Res> {
  __$$PricingContextImplCopyWithImpl(
      _$PricingContextImpl _value, $Res Function(_$PricingContextImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currencyCode = null,
    Object? typeName = null,
  }) {
    return _then(_$PricingContextImpl(
      currencyCode: null == currencyCode
          ? _value.currencyCode
          : currencyCode // ignore: cast_nullable_to_non_nullable
              as String,
      typeName: null == typeName
          ? _value.typeName
          : typeName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PricingContextImpl implements _PricingContext {
  _$PricingContextImpl(
      {required this.currencyCode, this.typeName = 'PricingContext'});

  factory _$PricingContextImpl.fromJson(Map<String, dynamic> json) =>
      _$$PricingContextImplFromJson(json);

  @override
  final String currencyCode;
  @override
  @JsonKey()
  final String typeName;

  @override
  String toString() {
    return 'PricingContext(currencyCode: $currencyCode, typeName: $typeName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PricingContextImpl &&
            (identical(other.currencyCode, currencyCode) ||
                other.currencyCode == currencyCode) &&
            (identical(other.typeName, typeName) ||
                other.typeName == typeName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, currencyCode, typeName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PricingContextImplCopyWith<_$PricingContextImpl> get copyWith =>
      __$$PricingContextImplCopyWithImpl<_$PricingContextImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PricingContextImplToJson(
      this,
    );
  }
}

abstract class _PricingContext implements PricingContext {
  factory _PricingContext(
      {required final String currencyCode,
      final String typeName}) = _$PricingContextImpl;

  factory _PricingContext.fromJson(Map<String, dynamic> json) =
      _$PricingContextImpl.fromJson;

  @override
  String get currencyCode;
  @override
  String get typeName;
  @override
  @JsonKey(ignore: true)
  _$$PricingContextImplCopyWith<_$PricingContextImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CartTotal _$CartTotalFromJson(Map<String, dynamic> json) {
  return _CartTotal.fromJson(json);
}

/// @nodoc
mixin _$CartTotal {
  int get total => throw _privateConstructorUsedError;
  String get typeName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CartTotalCopyWith<CartTotal> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartTotalCopyWith<$Res> {
  factory $CartTotalCopyWith(CartTotal value, $Res Function(CartTotal) then) =
      _$CartTotalCopyWithImpl<$Res, CartTotal>;
  @useResult
  $Res call({int total, String typeName});
}

/// @nodoc
class _$CartTotalCopyWithImpl<$Res, $Val extends CartTotal>
    implements $CartTotalCopyWith<$Res> {
  _$CartTotalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? typeName = null,
  }) {
    return _then(_value.copyWith(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      typeName: null == typeName
          ? _value.typeName
          : typeName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CartTotalImplCopyWith<$Res>
    implements $CartTotalCopyWith<$Res> {
  factory _$$CartTotalImplCopyWith(
          _$CartTotalImpl value, $Res Function(_$CartTotalImpl) then) =
      __$$CartTotalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int total, String typeName});
}

/// @nodoc
class __$$CartTotalImplCopyWithImpl<$Res>
    extends _$CartTotalCopyWithImpl<$Res, _$CartTotalImpl>
    implements _$$CartTotalImplCopyWith<$Res> {
  __$$CartTotalImplCopyWithImpl(
      _$CartTotalImpl _value, $Res Function(_$CartTotalImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? typeName = null,
  }) {
    return _then(_$CartTotalImpl(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      typeName: null == typeName
          ? _value.typeName
          : typeName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CartTotalImpl implements _CartTotal {
  _$CartTotalImpl({required this.total, this.typeName = 'TyCartTotal'});

  factory _$CartTotalImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartTotalImplFromJson(json);

  @override
  final int total;
  @override
  @JsonKey()
  final String typeName;

  @override
  String toString() {
    return 'CartTotal(total: $total, typeName: $typeName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartTotalImpl &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.typeName, typeName) ||
                other.typeName == typeName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, total, typeName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CartTotalImplCopyWith<_$CartTotalImpl> get copyWith =>
      __$$CartTotalImplCopyWithImpl<_$CartTotalImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CartTotalImplToJson(
      this,
    );
  }
}

abstract class _CartTotal implements CartTotal {
  factory _CartTotal({required final int total, final String typeName}) =
      _$CartTotalImpl;

  factory _CartTotal.fromJson(Map<String, dynamic> json) =
      _$CartTotalImpl.fromJson;

  @override
  int get total;
  @override
  String get typeName;
  @override
  @JsonKey(ignore: true)
  _$$CartTotalImplCopyWith<_$CartTotalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Customer _$CustomerFromJson(Map<String, dynamic> json) {
  return _Customer.fromJson(json);
}

/// @nodoc
mixin _$Customer {
  int get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get typeName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomerCopyWith<Customer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerCopyWith<$Res> {
  factory $CustomerCopyWith(Customer value, $Res Function(Customer) then) =
      _$CustomerCopyWithImpl<$Res, Customer>;
  @useResult
  $Res call({int id, String email, String typeName});
}

/// @nodoc
class _$CustomerCopyWithImpl<$Res, $Val extends Customer>
    implements $CustomerCopyWith<$Res> {
  _$CustomerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? typeName = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      typeName: null == typeName
          ? _value.typeName
          : typeName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomerImplCopyWith<$Res>
    implements $CustomerCopyWith<$Res> {
  factory _$$CustomerImplCopyWith(
          _$CustomerImpl value, $Res Function(_$CustomerImpl) then) =
      __$$CustomerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String email, String typeName});
}

/// @nodoc
class __$$CustomerImplCopyWithImpl<$Res>
    extends _$CustomerCopyWithImpl<$Res, _$CustomerImpl>
    implements _$$CustomerImplCopyWith<$Res> {
  __$$CustomerImplCopyWithImpl(
      _$CustomerImpl _value, $Res Function(_$CustomerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? typeName = null,
  }) {
    return _then(_$CustomerImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      typeName: null == typeName
          ? _value.typeName
          : typeName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomerImpl implements _Customer {
  _$CustomerImpl(
      {required this.id, required this.email, this.typeName = 'TyCustomer'});

  factory _$CustomerImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerImplFromJson(json);

  @override
  final int id;
  @override
  final String email;
  @override
  @JsonKey()
  final String typeName;

  @override
  String toString() {
    return 'Customer(id: $id, email: $email, typeName: $typeName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.typeName, typeName) ||
                other.typeName == typeName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, email, typeName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerImplCopyWith<_$CustomerImpl> get copyWith =>
      __$$CustomerImplCopyWithImpl<_$CustomerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerImplToJson(
      this,
    );
  }
}

abstract class _Customer implements Customer {
  factory _Customer(
      {required final int id,
      required final String email,
      final String typeName}) = _$CustomerImpl;

  factory _Customer.fromJson(Map<String, dynamic> json) =
      _$CustomerImpl.fromJson;

  @override
  int get id;
  @override
  String get email;
  @override
  String get typeName;
  @override
  @JsonKey(ignore: true)
  _$$CustomerImplCopyWith<_$CustomerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
