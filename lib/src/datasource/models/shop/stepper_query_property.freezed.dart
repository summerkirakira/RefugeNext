// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stepper_query_property.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StepperQueryProperty _$StepperQueryPropertyFromJson(Map<String, dynamic> json) {
  return _StepperQueryProperty.fromJson(json);
}

/// @nodoc
mixin _$StepperQueryProperty {
  Store get store => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StepperQueryPropertyCopyWith<StepperQueryProperty> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StepperQueryPropertyCopyWith<$Res> {
  factory $StepperQueryPropertyCopyWith(StepperQueryProperty value,
          $Res Function(StepperQueryProperty) then) =
      _$StepperQueryPropertyCopyWithImpl<$Res, StepperQueryProperty>;
  @useResult
  $Res call({Store store});

  $StoreCopyWith<$Res> get store;
}

/// @nodoc
class _$StepperQueryPropertyCopyWithImpl<$Res,
        $Val extends StepperQueryProperty>
    implements $StepperQueryPropertyCopyWith<$Res> {
  _$StepperQueryPropertyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? store = null,
  }) {
    return _then(_value.copyWith(
      store: null == store
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as Store,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StoreCopyWith<$Res> get store {
    return $StoreCopyWith<$Res>(_value.store, (value) {
      return _then(_value.copyWith(store: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StepperQueryPropertyImplCopyWith<$Res>
    implements $StepperQueryPropertyCopyWith<$Res> {
  factory _$$StepperQueryPropertyImplCopyWith(_$StepperQueryPropertyImpl value,
          $Res Function(_$StepperQueryPropertyImpl) then) =
      __$$StepperQueryPropertyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Store store});

  @override
  $StoreCopyWith<$Res> get store;
}

/// @nodoc
class __$$StepperQueryPropertyImplCopyWithImpl<$Res>
    extends _$StepperQueryPropertyCopyWithImpl<$Res, _$StepperQueryPropertyImpl>
    implements _$$StepperQueryPropertyImplCopyWith<$Res> {
  __$$StepperQueryPropertyImplCopyWithImpl(_$StepperQueryPropertyImpl _value,
      $Res Function(_$StepperQueryPropertyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? store = null,
  }) {
    return _then(_$StepperQueryPropertyImpl(
      store: null == store
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as Store,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StepperQueryPropertyImpl implements _StepperQueryProperty {
  _$StepperQueryPropertyImpl({required this.store});

  factory _$StepperQueryPropertyImpl.fromJson(Map<String, dynamic> json) =>
      _$$StepperQueryPropertyImplFromJson(json);

  @override
  final Store store;

  @override
  String toString() {
    return 'StepperQueryProperty(store: $store)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StepperQueryPropertyImpl &&
            (identical(other.store, store) || other.store == store));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, store);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StepperQueryPropertyImplCopyWith<_$StepperQueryPropertyImpl>
      get copyWith =>
          __$$StepperQueryPropertyImplCopyWithImpl<_$StepperQueryPropertyImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StepperQueryPropertyImplToJson(
      this,
    );
  }
}

abstract class _StepperQueryProperty implements StepperQueryProperty {
  factory _StepperQueryProperty({required final Store store}) =
      _$StepperQueryPropertyImpl;

  factory _StepperQueryProperty.fromJson(Map<String, dynamic> json) =
      _$StepperQueryPropertyImpl.fromJson;

  @override
  Store get store;
  @override
  @JsonKey(ignore: true)
  _$$StepperQueryPropertyImplCopyWith<_$StepperQueryPropertyImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Store _$StoreFromJson(Map<String, dynamic> json) {
  return _Store.fromJson(json);
}

/// @nodoc
mixin _$Store {
  StoreContext get context => throw _privateConstructorUsedError;
  Cart get cart => throw _privateConstructorUsedError;
  Order get order => throw _privateConstructorUsedError;
  String get typeName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoreCopyWith<Store> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreCopyWith<$Res> {
  factory $StoreCopyWith(Store value, $Res Function(Store) then) =
      _$StoreCopyWithImpl<$Res, Store>;
  @useResult
  $Res call({StoreContext context, Cart cart, Order order, String typeName});

  $StoreContextCopyWith<$Res> get context;
  $CartCopyWith<$Res> get cart;
  $OrderCopyWith<$Res> get order;
}

/// @nodoc
class _$StoreCopyWithImpl<$Res, $Val extends Store>
    implements $StoreCopyWith<$Res> {
  _$StoreCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? cart = null,
    Object? order = null,
    Object? typeName = null,
  }) {
    return _then(_value.copyWith(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as StoreContext,
      cart: null == cart
          ? _value.cart
          : cart // ignore: cast_nullable_to_non_nullable
              as Cart,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as Order,
      typeName: null == typeName
          ? _value.typeName
          : typeName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
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
  $CartCopyWith<$Res> get cart {
    return $CartCopyWith<$Res>(_value.cart, (value) {
      return _then(_value.copyWith(cart: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderCopyWith<$Res> get order {
    return $OrderCopyWith<$Res>(_value.order, (value) {
      return _then(_value.copyWith(order: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StoreImplCopyWith<$Res> implements $StoreCopyWith<$Res> {
  factory _$$StoreImplCopyWith(
          _$StoreImpl value, $Res Function(_$StoreImpl) then) =
      __$$StoreImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({StoreContext context, Cart cart, Order order, String typeName});

  @override
  $StoreContextCopyWith<$Res> get context;
  @override
  $CartCopyWith<$Res> get cart;
  @override
  $OrderCopyWith<$Res> get order;
}

/// @nodoc
class __$$StoreImplCopyWithImpl<$Res>
    extends _$StoreCopyWithImpl<$Res, _$StoreImpl>
    implements _$$StoreImplCopyWith<$Res> {
  __$$StoreImplCopyWithImpl(
      _$StoreImpl _value, $Res Function(_$StoreImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? cart = null,
    Object? order = null,
    Object? typeName = null,
  }) {
    return _then(_$StoreImpl(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as StoreContext,
      cart: null == cart
          ? _value.cart
          : cart // ignore: cast_nullable_to_non_nullable
              as Cart,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as Order,
      typeName: null == typeName
          ? _value.typeName
          : typeName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StoreImpl implements _Store {
  _$StoreImpl(
      {required this.context,
      required this.cart,
      required this.order,
      this.typeName = 'TyStore'});

  factory _$StoreImpl.fromJson(Map<String, dynamic> json) =>
      _$$StoreImplFromJson(json);

  @override
  final StoreContext context;
  @override
  final Cart cart;
  @override
  final Order order;
  @override
  @JsonKey()
  final String typeName;

  @override
  String toString() {
    return 'Store(context: $context, cart: $cart, order: $order, typeName: $typeName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoreImpl &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.cart, cart) || other.cart == cart) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.typeName, typeName) ||
                other.typeName == typeName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, context, cart, order, typeName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StoreImplCopyWith<_$StoreImpl> get copyWith =>
      __$$StoreImplCopyWithImpl<_$StoreImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StoreImplToJson(
      this,
    );
  }
}

abstract class _Store implements Store {
  factory _Store(
      {required final StoreContext context,
      required final Cart cart,
      required final Order order,
      final String typeName}) = _$StoreImpl;

  factory _Store.fromJson(Map<String, dynamic> json) = _$StoreImpl.fromJson;

  @override
  StoreContext get context;
  @override
  Cart get cart;
  @override
  Order get order;
  @override
  String get typeName;
  @override
  @JsonKey(ignore: true)
  _$$StoreImplCopyWith<_$StoreImpl> get copyWith =>
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

Cart _$CartFromJson(Map<String, dynamic> json) {
  return _Cart.fromJson(json);
}

/// @nodoc
mixin _$Cart {
  bool get hasRecurring => throw _privateConstructorUsedError;
  int get lineItemsQties =>
      throw _privateConstructorUsedError; // required List<CartLineItem> lineItems,
  CheckoutFlow get flow => throw _privateConstructorUsedError;
  String get typeName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CartCopyWith<Cart> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartCopyWith<$Res> {
  factory $CartCopyWith(Cart value, $Res Function(Cart) then) =
      _$CartCopyWithImpl<$Res, Cart>;
  @useResult
  $Res call(
      {bool hasRecurring,
      int lineItemsQties,
      CheckoutFlow flow,
      String typeName});

  $CheckoutFlowCopyWith<$Res> get flow;
}

/// @nodoc
class _$CartCopyWithImpl<$Res, $Val extends Cart>
    implements $CartCopyWith<$Res> {
  _$CartCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasRecurring = null,
    Object? lineItemsQties = null,
    Object? flow = null,
    Object? typeName = null,
  }) {
    return _then(_value.copyWith(
      hasRecurring: null == hasRecurring
          ? _value.hasRecurring
          : hasRecurring // ignore: cast_nullable_to_non_nullable
              as bool,
      lineItemsQties: null == lineItemsQties
          ? _value.lineItemsQties
          : lineItemsQties // ignore: cast_nullable_to_non_nullable
              as int,
      flow: null == flow
          ? _value.flow
          : flow // ignore: cast_nullable_to_non_nullable
              as CheckoutFlow,
      typeName: null == typeName
          ? _value.typeName
          : typeName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CheckoutFlowCopyWith<$Res> get flow {
    return $CheckoutFlowCopyWith<$Res>(_value.flow, (value) {
      return _then(_value.copyWith(flow: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CartImplCopyWith<$Res> implements $CartCopyWith<$Res> {
  factory _$$CartImplCopyWith(
          _$CartImpl value, $Res Function(_$CartImpl) then) =
      __$$CartImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool hasRecurring,
      int lineItemsQties,
      CheckoutFlow flow,
      String typeName});

  @override
  $CheckoutFlowCopyWith<$Res> get flow;
}

/// @nodoc
class __$$CartImplCopyWithImpl<$Res>
    extends _$CartCopyWithImpl<$Res, _$CartImpl>
    implements _$$CartImplCopyWith<$Res> {
  __$$CartImplCopyWithImpl(_$CartImpl _value, $Res Function(_$CartImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasRecurring = null,
    Object? lineItemsQties = null,
    Object? flow = null,
    Object? typeName = null,
  }) {
    return _then(_$CartImpl(
      hasRecurring: null == hasRecurring
          ? _value.hasRecurring
          : hasRecurring // ignore: cast_nullable_to_non_nullable
              as bool,
      lineItemsQties: null == lineItemsQties
          ? _value.lineItemsQties
          : lineItemsQties // ignore: cast_nullable_to_non_nullable
              as int,
      flow: null == flow
          ? _value.flow
          : flow // ignore: cast_nullable_to_non_nullable
              as CheckoutFlow,
      typeName: null == typeName
          ? _value.typeName
          : typeName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CartImpl implements _Cart {
  _$CartImpl(
      {required this.hasRecurring,
      required this.lineItemsQties,
      required this.flow,
      this.typeName = 'TyShoppingCart'});

  factory _$CartImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartImplFromJson(json);

  @override
  final bool hasRecurring;
  @override
  final int lineItemsQties;
// required List<CartLineItem> lineItems,
  @override
  final CheckoutFlow flow;
  @override
  @JsonKey()
  final String typeName;

  @override
  String toString() {
    return 'Cart(hasRecurring: $hasRecurring, lineItemsQties: $lineItemsQties, flow: $flow, typeName: $typeName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartImpl &&
            (identical(other.hasRecurring, hasRecurring) ||
                other.hasRecurring == hasRecurring) &&
            (identical(other.lineItemsQties, lineItemsQties) ||
                other.lineItemsQties == lineItemsQties) &&
            (identical(other.flow, flow) || other.flow == flow) &&
            (identical(other.typeName, typeName) ||
                other.typeName == typeName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, hasRecurring, lineItemsQties, flow, typeName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CartImplCopyWith<_$CartImpl> get copyWith =>
      __$$CartImplCopyWithImpl<_$CartImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CartImplToJson(
      this,
    );
  }
}

abstract class _Cart implements Cart {
  factory _Cart(
      {required final bool hasRecurring,
      required final int lineItemsQties,
      required final CheckoutFlow flow,
      final String typeName}) = _$CartImpl;

  factory _Cart.fromJson(Map<String, dynamic> json) = _$CartImpl.fromJson;

  @override
  bool get hasRecurring;
  @override
  int get lineItemsQties;
  @override // required List<CartLineItem> lineItems,
  CheckoutFlow get flow;
  @override
  String get typeName;
  @override
  @JsonKey(ignore: true)
  _$$CartImplCopyWith<_$CartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CartLineItem _$CartLineItemFromJson(Map<String, dynamic> json) {
  return _CartLineItem.fromJson(json);
}

/// @nodoc
mixin _$CartLineItem {
  String get id => throw _privateConstructorUsedError;
  String get skuId => throw _privateConstructorUsedError;
  String? get identifier => throw _privateConstructorUsedError;
  List<String> get taxDescription => throw _privateConstructorUsedError;
  Sku get sku => throw _privateConstructorUsedError;
  BrowsePrice get unitPriceWithTax => throw _privateConstructorUsedError;
  int get qty => throw _privateConstructorUsedError;
  List<dynamic> get discounts => throw _privateConstructorUsedError;
  String get typeName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CartLineItemCopyWith<CartLineItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartLineItemCopyWith<$Res> {
  factory $CartLineItemCopyWith(
          CartLineItem value, $Res Function(CartLineItem) then) =
      _$CartLineItemCopyWithImpl<$Res, CartLineItem>;
  @useResult
  $Res call(
      {String id,
      String skuId,
      String? identifier,
      List<String> taxDescription,
      Sku sku,
      BrowsePrice unitPriceWithTax,
      int qty,
      List<dynamic> discounts,
      String typeName});

  $SkuCopyWith<$Res> get sku;
  $BrowsePriceCopyWith<$Res> get unitPriceWithTax;
}

/// @nodoc
class _$CartLineItemCopyWithImpl<$Res, $Val extends CartLineItem>
    implements $CartLineItemCopyWith<$Res> {
  _$CartLineItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? skuId = null,
    Object? identifier = freezed,
    Object? taxDescription = null,
    Object? sku = null,
    Object? unitPriceWithTax = null,
    Object? qty = null,
    Object? discounts = null,
    Object? typeName = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      skuId: null == skuId
          ? _value.skuId
          : skuId // ignore: cast_nullable_to_non_nullable
              as String,
      identifier: freezed == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String?,
      taxDescription: null == taxDescription
          ? _value.taxDescription
          : taxDescription // ignore: cast_nullable_to_non_nullable
              as List<String>,
      sku: null == sku
          ? _value.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as Sku,
      unitPriceWithTax: null == unitPriceWithTax
          ? _value.unitPriceWithTax
          : unitPriceWithTax // ignore: cast_nullable_to_non_nullable
              as BrowsePrice,
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
      discounts: null == discounts
          ? _value.discounts
          : discounts // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      typeName: null == typeName
          ? _value.typeName
          : typeName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SkuCopyWith<$Res> get sku {
    return $SkuCopyWith<$Res>(_value.sku, (value) {
      return _then(_value.copyWith(sku: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $BrowsePriceCopyWith<$Res> get unitPriceWithTax {
    return $BrowsePriceCopyWith<$Res>(_value.unitPriceWithTax, (value) {
      return _then(_value.copyWith(unitPriceWithTax: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CartLineItemImplCopyWith<$Res>
    implements $CartLineItemCopyWith<$Res> {
  factory _$$CartLineItemImplCopyWith(
          _$CartLineItemImpl value, $Res Function(_$CartLineItemImpl) then) =
      __$$CartLineItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String skuId,
      String? identifier,
      List<String> taxDescription,
      Sku sku,
      BrowsePrice unitPriceWithTax,
      int qty,
      List<dynamic> discounts,
      String typeName});

  @override
  $SkuCopyWith<$Res> get sku;
  @override
  $BrowsePriceCopyWith<$Res> get unitPriceWithTax;
}

/// @nodoc
class __$$CartLineItemImplCopyWithImpl<$Res>
    extends _$CartLineItemCopyWithImpl<$Res, _$CartLineItemImpl>
    implements _$$CartLineItemImplCopyWith<$Res> {
  __$$CartLineItemImplCopyWithImpl(
      _$CartLineItemImpl _value, $Res Function(_$CartLineItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? skuId = null,
    Object? identifier = freezed,
    Object? taxDescription = null,
    Object? sku = null,
    Object? unitPriceWithTax = null,
    Object? qty = null,
    Object? discounts = null,
    Object? typeName = null,
  }) {
    return _then(_$CartLineItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      skuId: null == skuId
          ? _value.skuId
          : skuId // ignore: cast_nullable_to_non_nullable
              as String,
      identifier: freezed == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String?,
      taxDescription: null == taxDescription
          ? _value._taxDescription
          : taxDescription // ignore: cast_nullable_to_non_nullable
              as List<String>,
      sku: null == sku
          ? _value.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as Sku,
      unitPriceWithTax: null == unitPriceWithTax
          ? _value.unitPriceWithTax
          : unitPriceWithTax // ignore: cast_nullable_to_non_nullable
              as BrowsePrice,
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
      discounts: null == discounts
          ? _value._discounts
          : discounts // ignore: cast_nullable_to_non_nullable
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
class _$CartLineItemImpl implements _CartLineItem {
  _$CartLineItemImpl(
      {required this.id,
      required this.skuId,
      this.identifier,
      final List<String> taxDescription = const [],
      required this.sku,
      required this.unitPriceWithTax,
      required this.qty,
      final List<dynamic> discounts = const [],
      this.typeName = 'BaseCartLineItem'})
      : _taxDescription = taxDescription,
        _discounts = discounts;

  factory _$CartLineItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartLineItemImplFromJson(json);

  @override
  final String id;
  @override
  final String skuId;
  @override
  final String? identifier;
  final List<String> _taxDescription;
  @override
  @JsonKey()
  List<String> get taxDescription {
    if (_taxDescription is EqualUnmodifiableListView) return _taxDescription;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_taxDescription);
  }

  @override
  final Sku sku;
  @override
  final BrowsePrice unitPriceWithTax;
  @override
  final int qty;
  final List<dynamic> _discounts;
  @override
  @JsonKey()
  List<dynamic> get discounts {
    if (_discounts is EqualUnmodifiableListView) return _discounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_discounts);
  }

  @override
  @JsonKey()
  final String typeName;

  @override
  String toString() {
    return 'CartLineItem(id: $id, skuId: $skuId, identifier: $identifier, taxDescription: $taxDescription, sku: $sku, unitPriceWithTax: $unitPriceWithTax, qty: $qty, discounts: $discounts, typeName: $typeName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartLineItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.skuId, skuId) || other.skuId == skuId) &&
            (identical(other.identifier, identifier) ||
                other.identifier == identifier) &&
            const DeepCollectionEquality()
                .equals(other._taxDescription, _taxDescription) &&
            (identical(other.sku, sku) || other.sku == sku) &&
            (identical(other.unitPriceWithTax, unitPriceWithTax) ||
                other.unitPriceWithTax == unitPriceWithTax) &&
            (identical(other.qty, qty) || other.qty == qty) &&
            const DeepCollectionEquality()
                .equals(other._discounts, _discounts) &&
            (identical(other.typeName, typeName) ||
                other.typeName == typeName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      skuId,
      identifier,
      const DeepCollectionEquality().hash(_taxDescription),
      sku,
      unitPriceWithTax,
      qty,
      const DeepCollectionEquality().hash(_discounts),
      typeName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CartLineItemImplCopyWith<_$CartLineItemImpl> get copyWith =>
      __$$CartLineItemImplCopyWithImpl<_$CartLineItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CartLineItemImplToJson(
      this,
    );
  }
}

abstract class _CartLineItem implements CartLineItem {
  factory _CartLineItem(
      {required final String id,
      required final String skuId,
      final String? identifier,
      final List<String> taxDescription,
      required final Sku sku,
      required final BrowsePrice unitPriceWithTax,
      required final int qty,
      final List<dynamic> discounts,
      final String typeName}) = _$CartLineItemImpl;

  factory _CartLineItem.fromJson(Map<String, dynamic> json) =
      _$CartLineItemImpl.fromJson;

  @override
  String get id;
  @override
  String get skuId;
  @override
  String? get identifier;
  @override
  List<String> get taxDescription;
  @override
  Sku get sku;
  @override
  BrowsePrice get unitPriceWithTax;
  @override
  int get qty;
  @override
  List<dynamic> get discounts;
  @override
  String get typeName;
  @override
  @JsonKey(ignore: true)
  _$$CartLineItemImplCopyWith<_$CartLineItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Sku _$SkuFromJson(Map<String, dynamic> json) {
  return _Sku.fromJson(json);
}

/// @nodoc
mixin _$Sku {
  String get id => throw _privateConstructorUsedError;
  String get productId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  String get subtitle => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get frequency => throw _privateConstructorUsedError;
  bool? get isWarbond => throw _privateConstructorUsedError;
  bool get isPackage => throw _privateConstructorUsedError;
  List<BaseGameItem> get gameItems => throw _privateConstructorUsedError;
  Stock get stock => throw _privateConstructorUsedError;
  ItemMedia get media => throw _privateConstructorUsedError;
  int get maxQty => throw _privateConstructorUsedError;
  int get minQty => throw _privateConstructorUsedError;
  SkuPublicType get publicType => throw _privateConstructorUsedError;
  BrowsePrice get nativePrice => throw _privateConstructorUsedError;
  BrowseTaxedPrice get price => throw _privateConstructorUsedError;
  String get typeName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SkuCopyWith<Sku> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SkuCopyWith<$Res> {
  factory $SkuCopyWith(Sku value, $Res Function(Sku) then) =
      _$SkuCopyWithImpl<$Res, Sku>;
  @useResult
  $Res call(
      {String id,
      String productId,
      String title,
      String label,
      String subtitle,
      String url,
      String type,
      String frequency,
      bool? isWarbond,
      bool isPackage,
      List<BaseGameItem> gameItems,
      Stock stock,
      ItemMedia media,
      int maxQty,
      int minQty,
      SkuPublicType publicType,
      BrowsePrice nativePrice,
      BrowseTaxedPrice price,
      String typeName});

  $StockCopyWith<$Res> get stock;
  $ItemMediaCopyWith<$Res> get media;
  $SkuPublicTypeCopyWith<$Res> get publicType;
  $BrowsePriceCopyWith<$Res> get nativePrice;
  $BrowseTaxedPriceCopyWith<$Res> get price;
}

/// @nodoc
class _$SkuCopyWithImpl<$Res, $Val extends Sku> implements $SkuCopyWith<$Res> {
  _$SkuCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? productId = null,
    Object? title = null,
    Object? label = null,
    Object? subtitle = null,
    Object? url = null,
    Object? type = null,
    Object? frequency = null,
    Object? isWarbond = freezed,
    Object? isPackage = null,
    Object? gameItems = null,
    Object? stock = null,
    Object? media = null,
    Object? maxQty = null,
    Object? minQty = null,
    Object? publicType = null,
    Object? nativePrice = null,
    Object? price = null,
    Object? typeName = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      subtitle: null == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      frequency: null == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as String,
      isWarbond: freezed == isWarbond
          ? _value.isWarbond
          : isWarbond // ignore: cast_nullable_to_non_nullable
              as bool?,
      isPackage: null == isPackage
          ? _value.isPackage
          : isPackage // ignore: cast_nullable_to_non_nullable
              as bool,
      gameItems: null == gameItems
          ? _value.gameItems
          : gameItems // ignore: cast_nullable_to_non_nullable
              as List<BaseGameItem>,
      stock: null == stock
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as Stock,
      media: null == media
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as ItemMedia,
      maxQty: null == maxQty
          ? _value.maxQty
          : maxQty // ignore: cast_nullable_to_non_nullable
              as int,
      minQty: null == minQty
          ? _value.minQty
          : minQty // ignore: cast_nullable_to_non_nullable
              as int,
      publicType: null == publicType
          ? _value.publicType
          : publicType // ignore: cast_nullable_to_non_nullable
              as SkuPublicType,
      nativePrice: null == nativePrice
          ? _value.nativePrice
          : nativePrice // ignore: cast_nullable_to_non_nullable
              as BrowsePrice,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as BrowseTaxedPrice,
      typeName: null == typeName
          ? _value.typeName
          : typeName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StockCopyWith<$Res> get stock {
    return $StockCopyWith<$Res>(_value.stock, (value) {
      return _then(_value.copyWith(stock: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ItemMediaCopyWith<$Res> get media {
    return $ItemMediaCopyWith<$Res>(_value.media, (value) {
      return _then(_value.copyWith(media: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SkuPublicTypeCopyWith<$Res> get publicType {
    return $SkuPublicTypeCopyWith<$Res>(_value.publicType, (value) {
      return _then(_value.copyWith(publicType: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $BrowsePriceCopyWith<$Res> get nativePrice {
    return $BrowsePriceCopyWith<$Res>(_value.nativePrice, (value) {
      return _then(_value.copyWith(nativePrice: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $BrowseTaxedPriceCopyWith<$Res> get price {
    return $BrowseTaxedPriceCopyWith<$Res>(_value.price, (value) {
      return _then(_value.copyWith(price: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SkuImplCopyWith<$Res> implements $SkuCopyWith<$Res> {
  factory _$$SkuImplCopyWith(_$SkuImpl value, $Res Function(_$SkuImpl) then) =
      __$$SkuImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String productId,
      String title,
      String label,
      String subtitle,
      String url,
      String type,
      String frequency,
      bool? isWarbond,
      bool isPackage,
      List<BaseGameItem> gameItems,
      Stock stock,
      ItemMedia media,
      int maxQty,
      int minQty,
      SkuPublicType publicType,
      BrowsePrice nativePrice,
      BrowseTaxedPrice price,
      String typeName});

  @override
  $StockCopyWith<$Res> get stock;
  @override
  $ItemMediaCopyWith<$Res> get media;
  @override
  $SkuPublicTypeCopyWith<$Res> get publicType;
  @override
  $BrowsePriceCopyWith<$Res> get nativePrice;
  @override
  $BrowseTaxedPriceCopyWith<$Res> get price;
}

/// @nodoc
class __$$SkuImplCopyWithImpl<$Res> extends _$SkuCopyWithImpl<$Res, _$SkuImpl>
    implements _$$SkuImplCopyWith<$Res> {
  __$$SkuImplCopyWithImpl(_$SkuImpl _value, $Res Function(_$SkuImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? productId = null,
    Object? title = null,
    Object? label = null,
    Object? subtitle = null,
    Object? url = null,
    Object? type = null,
    Object? frequency = null,
    Object? isWarbond = freezed,
    Object? isPackage = null,
    Object? gameItems = null,
    Object? stock = null,
    Object? media = null,
    Object? maxQty = null,
    Object? minQty = null,
    Object? publicType = null,
    Object? nativePrice = null,
    Object? price = null,
    Object? typeName = null,
  }) {
    return _then(_$SkuImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      subtitle: null == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      frequency: null == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as String,
      isWarbond: freezed == isWarbond
          ? _value.isWarbond
          : isWarbond // ignore: cast_nullable_to_non_nullable
              as bool?,
      isPackage: null == isPackage
          ? _value.isPackage
          : isPackage // ignore: cast_nullable_to_non_nullable
              as bool,
      gameItems: null == gameItems
          ? _value._gameItems
          : gameItems // ignore: cast_nullable_to_non_nullable
              as List<BaseGameItem>,
      stock: null == stock
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as Stock,
      media: null == media
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as ItemMedia,
      maxQty: null == maxQty
          ? _value.maxQty
          : maxQty // ignore: cast_nullable_to_non_nullable
              as int,
      minQty: null == minQty
          ? _value.minQty
          : minQty // ignore: cast_nullable_to_non_nullable
              as int,
      publicType: null == publicType
          ? _value.publicType
          : publicType // ignore: cast_nullable_to_non_nullable
              as SkuPublicType,
      nativePrice: null == nativePrice
          ? _value.nativePrice
          : nativePrice // ignore: cast_nullable_to_non_nullable
              as BrowsePrice,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as BrowseTaxedPrice,
      typeName: null == typeName
          ? _value.typeName
          : typeName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SkuImpl implements _Sku {
  _$SkuImpl(
      {required this.id,
      required this.productId,
      required this.title,
      required this.label,
      required this.subtitle,
      required this.url,
      required this.type,
      required this.frequency,
      this.isWarbond,
      this.isPackage = false,
      final List<BaseGameItem> gameItems = const [],
      required this.stock,
      required this.media,
      required this.maxQty,
      required this.minQty,
      required this.publicType,
      required this.nativePrice,
      required this.price,
      this.typeName = 'TySku'})
      : _gameItems = gameItems;

  factory _$SkuImpl.fromJson(Map<String, dynamic> json) =>
      _$$SkuImplFromJson(json);

  @override
  final String id;
  @override
  final String productId;
  @override
  final String title;
  @override
  final String label;
  @override
  final String subtitle;
  @override
  final String url;
  @override
  final String type;
  @override
  final String frequency;
  @override
  final bool? isWarbond;
  @override
  @JsonKey()
  final bool isPackage;
  final List<BaseGameItem> _gameItems;
  @override
  @JsonKey()
  List<BaseGameItem> get gameItems {
    if (_gameItems is EqualUnmodifiableListView) return _gameItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_gameItems);
  }

  @override
  final Stock stock;
  @override
  final ItemMedia media;
  @override
  final int maxQty;
  @override
  final int minQty;
  @override
  final SkuPublicType publicType;
  @override
  final BrowsePrice nativePrice;
  @override
  final BrowseTaxedPrice price;
  @override
  @JsonKey()
  final String typeName;

  @override
  String toString() {
    return 'Sku(id: $id, productId: $productId, title: $title, label: $label, subtitle: $subtitle, url: $url, type: $type, frequency: $frequency, isWarbond: $isWarbond, isPackage: $isPackage, gameItems: $gameItems, stock: $stock, media: $media, maxQty: $maxQty, minQty: $minQty, publicType: $publicType, nativePrice: $nativePrice, price: $price, typeName: $typeName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SkuImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.frequency, frequency) ||
                other.frequency == frequency) &&
            (identical(other.isWarbond, isWarbond) ||
                other.isWarbond == isWarbond) &&
            (identical(other.isPackage, isPackage) ||
                other.isPackage == isPackage) &&
            const DeepCollectionEquality()
                .equals(other._gameItems, _gameItems) &&
            (identical(other.stock, stock) || other.stock == stock) &&
            (identical(other.media, media) || other.media == media) &&
            (identical(other.maxQty, maxQty) || other.maxQty == maxQty) &&
            (identical(other.minQty, minQty) || other.minQty == minQty) &&
            (identical(other.publicType, publicType) ||
                other.publicType == publicType) &&
            (identical(other.nativePrice, nativePrice) ||
                other.nativePrice == nativePrice) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.typeName, typeName) ||
                other.typeName == typeName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        productId,
        title,
        label,
        subtitle,
        url,
        type,
        frequency,
        isWarbond,
        isPackage,
        const DeepCollectionEquality().hash(_gameItems),
        stock,
        media,
        maxQty,
        minQty,
        publicType,
        nativePrice,
        price,
        typeName
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SkuImplCopyWith<_$SkuImpl> get copyWith =>
      __$$SkuImplCopyWithImpl<_$SkuImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SkuImplToJson(
      this,
    );
  }
}

abstract class _Sku implements Sku {
  factory _Sku(
      {required final String id,
      required final String productId,
      required final String title,
      required final String label,
      required final String subtitle,
      required final String url,
      required final String type,
      required final String frequency,
      final bool? isWarbond,
      final bool isPackage,
      final List<BaseGameItem> gameItems,
      required final Stock stock,
      required final ItemMedia media,
      required final int maxQty,
      required final int minQty,
      required final SkuPublicType publicType,
      required final BrowsePrice nativePrice,
      required final BrowseTaxedPrice price,
      final String typeName}) = _$SkuImpl;

  factory _Sku.fromJson(Map<String, dynamic> json) = _$SkuImpl.fromJson;

  @override
  String get id;
  @override
  String get productId;
  @override
  String get title;
  @override
  String get label;
  @override
  String get subtitle;
  @override
  String get url;
  @override
  String get type;
  @override
  String get frequency;
  @override
  bool? get isWarbond;
  @override
  bool get isPackage;
  @override
  List<BaseGameItem> get gameItems;
  @override
  Stock get stock;
  @override
  ItemMedia get media;
  @override
  int get maxQty;
  @override
  int get minQty;
  @override
  SkuPublicType get publicType;
  @override
  BrowsePrice get nativePrice;
  @override
  BrowseTaxedPrice get price;
  @override
  String get typeName;
  @override
  @JsonKey(ignore: true)
  _$$SkuImplCopyWith<_$SkuImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BaseGameItem _$BaseGameItemFromJson(Map<String, dynamic> json) {
  return _BaseGameItem.fromJson(json);
}

/// @nodoc
mixin _$BaseGameItem {
  String get typeName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BaseGameItemCopyWith<BaseGameItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BaseGameItemCopyWith<$Res> {
  factory $BaseGameItemCopyWith(
          BaseGameItem value, $Res Function(BaseGameItem) then) =
      _$BaseGameItemCopyWithImpl<$Res, BaseGameItem>;
  @useResult
  $Res call({String typeName});
}

/// @nodoc
class _$BaseGameItemCopyWithImpl<$Res, $Val extends BaseGameItem>
    implements $BaseGameItemCopyWith<$Res> {
  _$BaseGameItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? typeName = null,
  }) {
    return _then(_value.copyWith(
      typeName: null == typeName
          ? _value.typeName
          : typeName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BaseGameItemImplCopyWith<$Res>
    implements $BaseGameItemCopyWith<$Res> {
  factory _$$BaseGameItemImplCopyWith(
          _$BaseGameItemImpl value, $Res Function(_$BaseGameItemImpl) then) =
      __$$BaseGameItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String typeName});
}

/// @nodoc
class __$$BaseGameItemImplCopyWithImpl<$Res>
    extends _$BaseGameItemCopyWithImpl<$Res, _$BaseGameItemImpl>
    implements _$$BaseGameItemImplCopyWith<$Res> {
  __$$BaseGameItemImplCopyWithImpl(
      _$BaseGameItemImpl _value, $Res Function(_$BaseGameItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? typeName = null,
  }) {
    return _then(_$BaseGameItemImpl(
      typeName: null == typeName
          ? _value.typeName
          : typeName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BaseGameItemImpl implements _BaseGameItem {
  _$BaseGameItemImpl({this.typeName = 'BaseGameItem'});

  factory _$BaseGameItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$BaseGameItemImplFromJson(json);

  @override
  @JsonKey()
  final String typeName;

  @override
  String toString() {
    return 'BaseGameItem(typeName: $typeName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BaseGameItemImpl &&
            (identical(other.typeName, typeName) ||
                other.typeName == typeName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, typeName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BaseGameItemImplCopyWith<_$BaseGameItemImpl> get copyWith =>
      __$$BaseGameItemImplCopyWithImpl<_$BaseGameItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BaseGameItemImplToJson(
      this,
    );
  }
}

abstract class _BaseGameItem implements BaseGameItem {
  factory _BaseGameItem({final String typeName}) = _$BaseGameItemImpl;

  factory _BaseGameItem.fromJson(Map<String, dynamic> json) =
      _$BaseGameItemImpl.fromJson;

  @override
  String get typeName;
  @override
  @JsonKey(ignore: true)
  _$$BaseGameItemImplCopyWith<_$BaseGameItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Stock _$StockFromJson(Map<String, dynamic> json) {
  return _Stock.fromJson(json);
}

/// @nodoc
mixin _$Stock {
  bool get unlimited => throw _privateConstructorUsedError;
  bool get show => throw _privateConstructorUsedError;
  bool get available => throw _privateConstructorUsedError;
  bool get backOrder => throw _privateConstructorUsedError;
  int get qty => throw _privateConstructorUsedError;
  int get backOrderQty => throw _privateConstructorUsedError;
  String get level => throw _privateConstructorUsedError;
  String get typeName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StockCopyWith<Stock> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockCopyWith<$Res> {
  factory $StockCopyWith(Stock value, $Res Function(Stock) then) =
      _$StockCopyWithImpl<$Res, Stock>;
  @useResult
  $Res call(
      {bool unlimited,
      bool show,
      bool available,
      bool backOrder,
      int qty,
      int backOrderQty,
      String level,
      String typeName});
}

/// @nodoc
class _$StockCopyWithImpl<$Res, $Val extends Stock>
    implements $StockCopyWith<$Res> {
  _$StockCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? unlimited = null,
    Object? show = null,
    Object? available = null,
    Object? backOrder = null,
    Object? qty = null,
    Object? backOrderQty = null,
    Object? level = null,
    Object? typeName = null,
  }) {
    return _then(_value.copyWith(
      unlimited: null == unlimited
          ? _value.unlimited
          : unlimited // ignore: cast_nullable_to_non_nullable
              as bool,
      show: null == show
          ? _value.show
          : show // ignore: cast_nullable_to_non_nullable
              as bool,
      available: null == available
          ? _value.available
          : available // ignore: cast_nullable_to_non_nullable
              as bool,
      backOrder: null == backOrder
          ? _value.backOrder
          : backOrder // ignore: cast_nullable_to_non_nullable
              as bool,
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
      backOrderQty: null == backOrderQty
          ? _value.backOrderQty
          : backOrderQty // ignore: cast_nullable_to_non_nullable
              as int,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as String,
      typeName: null == typeName
          ? _value.typeName
          : typeName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StockImplCopyWith<$Res> implements $StockCopyWith<$Res> {
  factory _$$StockImplCopyWith(
          _$StockImpl value, $Res Function(_$StockImpl) then) =
      __$$StockImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool unlimited,
      bool show,
      bool available,
      bool backOrder,
      int qty,
      int backOrderQty,
      String level,
      String typeName});
}

/// @nodoc
class __$$StockImplCopyWithImpl<$Res>
    extends _$StockCopyWithImpl<$Res, _$StockImpl>
    implements _$$StockImplCopyWith<$Res> {
  __$$StockImplCopyWithImpl(
      _$StockImpl _value, $Res Function(_$StockImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? unlimited = null,
    Object? show = null,
    Object? available = null,
    Object? backOrder = null,
    Object? qty = null,
    Object? backOrderQty = null,
    Object? level = null,
    Object? typeName = null,
  }) {
    return _then(_$StockImpl(
      unlimited: null == unlimited
          ? _value.unlimited
          : unlimited // ignore: cast_nullable_to_non_nullable
              as bool,
      show: null == show
          ? _value.show
          : show // ignore: cast_nullable_to_non_nullable
              as bool,
      available: null == available
          ? _value.available
          : available // ignore: cast_nullable_to_non_nullable
              as bool,
      backOrder: null == backOrder
          ? _value.backOrder
          : backOrder // ignore: cast_nullable_to_non_nullable
              as bool,
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
      backOrderQty: null == backOrderQty
          ? _value.backOrderQty
          : backOrderQty // ignore: cast_nullable_to_non_nullable
              as int,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
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
class _$StockImpl implements _Stock {
  _$StockImpl(
      {required this.unlimited,
      required this.show,
      required this.available,
      required this.backOrder,
      required this.qty,
      required this.backOrderQty,
      required this.level,
      this.typeName = 'TyStock'});

  factory _$StockImpl.fromJson(Map<String, dynamic> json) =>
      _$$StockImplFromJson(json);

  @override
  final bool unlimited;
  @override
  final bool show;
  @override
  final bool available;
  @override
  final bool backOrder;
  @override
  final int qty;
  @override
  final int backOrderQty;
  @override
  final String level;
  @override
  @JsonKey()
  final String typeName;

  @override
  String toString() {
    return 'Stock(unlimited: $unlimited, show: $show, available: $available, backOrder: $backOrder, qty: $qty, backOrderQty: $backOrderQty, level: $level, typeName: $typeName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StockImpl &&
            (identical(other.unlimited, unlimited) ||
                other.unlimited == unlimited) &&
            (identical(other.show, show) || other.show == show) &&
            (identical(other.available, available) ||
                other.available == available) &&
            (identical(other.backOrder, backOrder) ||
                other.backOrder == backOrder) &&
            (identical(other.qty, qty) || other.qty == qty) &&
            (identical(other.backOrderQty, backOrderQty) ||
                other.backOrderQty == backOrderQty) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.typeName, typeName) ||
                other.typeName == typeName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, unlimited, show, available,
      backOrder, qty, backOrderQty, level, typeName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StockImplCopyWith<_$StockImpl> get copyWith =>
      __$$StockImplCopyWithImpl<_$StockImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StockImplToJson(
      this,
    );
  }
}

abstract class _Stock implements Stock {
  factory _Stock(
      {required final bool unlimited,
      required final bool show,
      required final bool available,
      required final bool backOrder,
      required final int qty,
      required final int backOrderQty,
      required final String level,
      final String typeName}) = _$StockImpl;

  factory _Stock.fromJson(Map<String, dynamic> json) = _$StockImpl.fromJson;

  @override
  bool get unlimited;
  @override
  bool get show;
  @override
  bool get available;
  @override
  bool get backOrder;
  @override
  int get qty;
  @override
  int get backOrderQty;
  @override
  String get level;
  @override
  String get typeName;
  @override
  @JsonKey(ignore: true)
  _$$StockImplCopyWith<_$StockImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ItemMedia _$ItemMediaFromJson(Map<String, dynamic> json) {
  return _ItemMedia.fromJson(json);
}

/// @nodoc
mixin _$ItemMedia {
  ItemMediaDerived get thumbnail => throw _privateConstructorUsedError;
  String get typeName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemMediaCopyWith<ItemMedia> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemMediaCopyWith<$Res> {
  factory $ItemMediaCopyWith(ItemMedia value, $Res Function(ItemMedia) then) =
      _$ItemMediaCopyWithImpl<$Res, ItemMedia>;
  @useResult
  $Res call({ItemMediaDerived thumbnail, String typeName});

  $ItemMediaDerivedCopyWith<$Res> get thumbnail;
}

/// @nodoc
class _$ItemMediaCopyWithImpl<$Res, $Val extends ItemMedia>
    implements $ItemMediaCopyWith<$Res> {
  _$ItemMediaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? thumbnail = null,
    Object? typeName = null,
  }) {
    return _then(_value.copyWith(
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as ItemMediaDerived,
      typeName: null == typeName
          ? _value.typeName
          : typeName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ItemMediaDerivedCopyWith<$Res> get thumbnail {
    return $ItemMediaDerivedCopyWith<$Res>(_value.thumbnail, (value) {
      return _then(_value.copyWith(thumbnail: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ItemMediaImplCopyWith<$Res>
    implements $ItemMediaCopyWith<$Res> {
  factory _$$ItemMediaImplCopyWith(
          _$ItemMediaImpl value, $Res Function(_$ItemMediaImpl) then) =
      __$$ItemMediaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ItemMediaDerived thumbnail, String typeName});

  @override
  $ItemMediaDerivedCopyWith<$Res> get thumbnail;
}

/// @nodoc
class __$$ItemMediaImplCopyWithImpl<$Res>
    extends _$ItemMediaCopyWithImpl<$Res, _$ItemMediaImpl>
    implements _$$ItemMediaImplCopyWith<$Res> {
  __$$ItemMediaImplCopyWithImpl(
      _$ItemMediaImpl _value, $Res Function(_$ItemMediaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? thumbnail = null,
    Object? typeName = null,
  }) {
    return _then(_$ItemMediaImpl(
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as ItemMediaDerived,
      typeName: null == typeName
          ? _value.typeName
          : typeName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ItemMediaImpl implements _ItemMedia {
  _$ItemMediaImpl({required this.thumbnail, this.typeName = 'TyItemMedia'});

  factory _$ItemMediaImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemMediaImplFromJson(json);

  @override
  final ItemMediaDerived thumbnail;
  @override
  @JsonKey()
  final String typeName;

  @override
  String toString() {
    return 'ItemMedia(thumbnail: $thumbnail, typeName: $typeName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemMediaImpl &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail) &&
            (identical(other.typeName, typeName) ||
                other.typeName == typeName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, thumbnail, typeName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemMediaImplCopyWith<_$ItemMediaImpl> get copyWith =>
      __$$ItemMediaImplCopyWithImpl<_$ItemMediaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemMediaImplToJson(
      this,
    );
  }
}

abstract class _ItemMedia implements ItemMedia {
  factory _ItemMedia(
      {required final ItemMediaDerived thumbnail,
      final String typeName}) = _$ItemMediaImpl;

  factory _ItemMedia.fromJson(Map<String, dynamic> json) =
      _$ItemMediaImpl.fromJson;

  @override
  ItemMediaDerived get thumbnail;
  @override
  String get typeName;
  @override
  @JsonKey(ignore: true)
  _$$ItemMediaImplCopyWith<_$ItemMediaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ItemMediaDerived _$ItemMediaDerivedFromJson(Map<String, dynamic> json) {
  return _ItemMediaDerived.fromJson(json);
}

/// @nodoc
mixin _$ItemMediaDerived {
  String get storeSmall => throw _privateConstructorUsedError;
  String get typeName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemMediaDerivedCopyWith<ItemMediaDerived> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemMediaDerivedCopyWith<$Res> {
  factory $ItemMediaDerivedCopyWith(
          ItemMediaDerived value, $Res Function(ItemMediaDerived) then) =
      _$ItemMediaDerivedCopyWithImpl<$Res, ItemMediaDerived>;
  @useResult
  $Res call({String storeSmall, String typeName});
}

/// @nodoc
class _$ItemMediaDerivedCopyWithImpl<$Res, $Val extends ItemMediaDerived>
    implements $ItemMediaDerivedCopyWith<$Res> {
  _$ItemMediaDerivedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storeSmall = null,
    Object? typeName = null,
  }) {
    return _then(_value.copyWith(
      storeSmall: null == storeSmall
          ? _value.storeSmall
          : storeSmall // ignore: cast_nullable_to_non_nullable
              as String,
      typeName: null == typeName
          ? _value.typeName
          : typeName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ItemMediaDerivedImplCopyWith<$Res>
    implements $ItemMediaDerivedCopyWith<$Res> {
  factory _$$ItemMediaDerivedImplCopyWith(_$ItemMediaDerivedImpl value,
          $Res Function(_$ItemMediaDerivedImpl) then) =
      __$$ItemMediaDerivedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String storeSmall, String typeName});
}

/// @nodoc
class __$$ItemMediaDerivedImplCopyWithImpl<$Res>
    extends _$ItemMediaDerivedCopyWithImpl<$Res, _$ItemMediaDerivedImpl>
    implements _$$ItemMediaDerivedImplCopyWith<$Res> {
  __$$ItemMediaDerivedImplCopyWithImpl(_$ItemMediaDerivedImpl _value,
      $Res Function(_$ItemMediaDerivedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storeSmall = null,
    Object? typeName = null,
  }) {
    return _then(_$ItemMediaDerivedImpl(
      storeSmall: null == storeSmall
          ? _value.storeSmall
          : storeSmall // ignore: cast_nullable_to_non_nullable
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
class _$ItemMediaDerivedImpl implements _ItemMediaDerived {
  _$ItemMediaDerivedImpl(
      {required this.storeSmall, this.typeName = 'TyItemMediaDerived'});

  factory _$ItemMediaDerivedImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemMediaDerivedImplFromJson(json);

  @override
  final String storeSmall;
  @override
  @JsonKey()
  final String typeName;

  @override
  String toString() {
    return 'ItemMediaDerived(storeSmall: $storeSmall, typeName: $typeName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemMediaDerivedImpl &&
            (identical(other.storeSmall, storeSmall) ||
                other.storeSmall == storeSmall) &&
            (identical(other.typeName, typeName) ||
                other.typeName == typeName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, storeSmall, typeName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemMediaDerivedImplCopyWith<_$ItemMediaDerivedImpl> get copyWith =>
      __$$ItemMediaDerivedImplCopyWithImpl<_$ItemMediaDerivedImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemMediaDerivedImplToJson(
      this,
    );
  }
}

abstract class _ItemMediaDerived implements ItemMediaDerived {
  factory _ItemMediaDerived(
      {required final String storeSmall,
      final String typeName}) = _$ItemMediaDerivedImpl;

  factory _ItemMediaDerived.fromJson(Map<String, dynamic> json) =
      _$ItemMediaDerivedImpl.fromJson;

  @override
  String get storeSmall;
  @override
  String get typeName;
  @override
  @JsonKey(ignore: true)
  _$$ItemMediaDerivedImplCopyWith<_$ItemMediaDerivedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SkuPublicType _$SkuPublicTypeFromJson(Map<String, dynamic> json) {
  return _SkuPublicType.fromJson(json);
}

/// @nodoc
mixin _$SkuPublicType {
  String get code => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  String get typeName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SkuPublicTypeCopyWith<SkuPublicType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SkuPublicTypeCopyWith<$Res> {
  factory $SkuPublicTypeCopyWith(
          SkuPublicType value, $Res Function(SkuPublicType) then) =
      _$SkuPublicTypeCopyWithImpl<$Res, SkuPublicType>;
  @useResult
  $Res call({String code, String label, String typeName});
}

/// @nodoc
class _$SkuPublicTypeCopyWithImpl<$Res, $Val extends SkuPublicType>
    implements $SkuPublicTypeCopyWith<$Res> {
  _$SkuPublicTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? label = null,
    Object? typeName = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      typeName: null == typeName
          ? _value.typeName
          : typeName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SkuPublicTypeImplCopyWith<$Res>
    implements $SkuPublicTypeCopyWith<$Res> {
  factory _$$SkuPublicTypeImplCopyWith(
          _$SkuPublicTypeImpl value, $Res Function(_$SkuPublicTypeImpl) then) =
      __$$SkuPublicTypeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code, String label, String typeName});
}

/// @nodoc
class __$$SkuPublicTypeImplCopyWithImpl<$Res>
    extends _$SkuPublicTypeCopyWithImpl<$Res, _$SkuPublicTypeImpl>
    implements _$$SkuPublicTypeImplCopyWith<$Res> {
  __$$SkuPublicTypeImplCopyWithImpl(
      _$SkuPublicTypeImpl _value, $Res Function(_$SkuPublicTypeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? label = null,
    Object? typeName = null,
  }) {
    return _then(_$SkuPublicTypeImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
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
class _$SkuPublicTypeImpl implements _SkuPublicType {
  _$SkuPublicTypeImpl(
      {required this.code,
      required this.label,
      this.typeName = 'SkuPublicType'});

  factory _$SkuPublicTypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$SkuPublicTypeImplFromJson(json);

  @override
  final String code;
  @override
  final String label;
  @override
  @JsonKey()
  final String typeName;

  @override
  String toString() {
    return 'SkuPublicType(code: $code, label: $label, typeName: $typeName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SkuPublicTypeImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.typeName, typeName) ||
                other.typeName == typeName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, code, label, typeName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SkuPublicTypeImplCopyWith<_$SkuPublicTypeImpl> get copyWith =>
      __$$SkuPublicTypeImplCopyWithImpl<_$SkuPublicTypeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SkuPublicTypeImplToJson(
      this,
    );
  }
}

abstract class _SkuPublicType implements SkuPublicType {
  factory _SkuPublicType(
      {required final String code,
      required final String label,
      final String typeName}) = _$SkuPublicTypeImpl;

  factory _SkuPublicType.fromJson(Map<String, dynamic> json) =
      _$SkuPublicTypeImpl.fromJson;

  @override
  String get code;
  @override
  String get label;
  @override
  String get typeName;
  @override
  @JsonKey(ignore: true)
  _$$SkuPublicTypeImplCopyWith<_$SkuPublicTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BrowsePrice _$BrowsePriceFromJson(Map<String, dynamic> json) {
  return _BrowsePrice.fromJson(json);
}

/// @nodoc
mixin _$BrowsePrice {
  int get amount => throw _privateConstructorUsedError;
  int? get discounted => throw _privateConstructorUsedError;
  String get typeName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BrowsePriceCopyWith<BrowsePrice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BrowsePriceCopyWith<$Res> {
  factory $BrowsePriceCopyWith(
          BrowsePrice value, $Res Function(BrowsePrice) then) =
      _$BrowsePriceCopyWithImpl<$Res, BrowsePrice>;
  @useResult
  $Res call({int amount, int? discounted, String typeName});
}

/// @nodoc
class _$BrowsePriceCopyWithImpl<$Res, $Val extends BrowsePrice>
    implements $BrowsePriceCopyWith<$Res> {
  _$BrowsePriceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? discounted = freezed,
    Object? typeName = null,
  }) {
    return _then(_value.copyWith(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      discounted: freezed == discounted
          ? _value.discounted
          : discounted // ignore: cast_nullable_to_non_nullable
              as int?,
      typeName: null == typeName
          ? _value.typeName
          : typeName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BrowsePriceImplCopyWith<$Res>
    implements $BrowsePriceCopyWith<$Res> {
  factory _$$BrowsePriceImplCopyWith(
          _$BrowsePriceImpl value, $Res Function(_$BrowsePriceImpl) then) =
      __$$BrowsePriceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int amount, int? discounted, String typeName});
}

/// @nodoc
class __$$BrowsePriceImplCopyWithImpl<$Res>
    extends _$BrowsePriceCopyWithImpl<$Res, _$BrowsePriceImpl>
    implements _$$BrowsePriceImplCopyWith<$Res> {
  __$$BrowsePriceImplCopyWithImpl(
      _$BrowsePriceImpl _value, $Res Function(_$BrowsePriceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? discounted = freezed,
    Object? typeName = null,
  }) {
    return _then(_$BrowsePriceImpl(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      discounted: freezed == discounted
          ? _value.discounted
          : discounted // ignore: cast_nullable_to_non_nullable
              as int?,
      typeName: null == typeName
          ? _value.typeName
          : typeName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BrowsePriceImpl implements _BrowsePrice {
  _$BrowsePriceImpl(
      {required this.amount, this.discounted, this.typeName = 'TyBrowsePrice'});

  factory _$BrowsePriceImpl.fromJson(Map<String, dynamic> json) =>
      _$$BrowsePriceImplFromJson(json);

  @override
  final int amount;
  @override
  final int? discounted;
  @override
  @JsonKey()
  final String typeName;

  @override
  String toString() {
    return 'BrowsePrice(amount: $amount, discounted: $discounted, typeName: $typeName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BrowsePriceImpl &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.discounted, discounted) ||
                other.discounted == discounted) &&
            (identical(other.typeName, typeName) ||
                other.typeName == typeName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, amount, discounted, typeName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BrowsePriceImplCopyWith<_$BrowsePriceImpl> get copyWith =>
      __$$BrowsePriceImplCopyWithImpl<_$BrowsePriceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BrowsePriceImplToJson(
      this,
    );
  }
}

abstract class _BrowsePrice implements BrowsePrice {
  factory _BrowsePrice(
      {required final int amount,
      final int? discounted,
      final String typeName}) = _$BrowsePriceImpl;

  factory _BrowsePrice.fromJson(Map<String, dynamic> json) =
      _$BrowsePriceImpl.fromJson;

  @override
  int get amount;
  @override
  int? get discounted;
  @override
  String get typeName;
  @override
  @JsonKey(ignore: true)
  _$$BrowsePriceImplCopyWith<_$BrowsePriceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BrowseTaxedPrice _$BrowseTaxedPriceFromJson(Map<String, dynamic> json) {
  return _BrowseTaxedPrice.fromJson(json);
}

/// @nodoc
mixin _$BrowseTaxedPrice {
  int get amount => throw _privateConstructorUsedError;
  int? get discounted => throw _privateConstructorUsedError;
  List<String> get taxDescription => throw _privateConstructorUsedError;
  String get typeName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BrowseTaxedPriceCopyWith<BrowseTaxedPrice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BrowseTaxedPriceCopyWith<$Res> {
  factory $BrowseTaxedPriceCopyWith(
          BrowseTaxedPrice value, $Res Function(BrowseTaxedPrice) then) =
      _$BrowseTaxedPriceCopyWithImpl<$Res, BrowseTaxedPrice>;
  @useResult
  $Res call(
      {int amount,
      int? discounted,
      List<String> taxDescription,
      String typeName});
}

/// @nodoc
class _$BrowseTaxedPriceCopyWithImpl<$Res, $Val extends BrowseTaxedPrice>
    implements $BrowseTaxedPriceCopyWith<$Res> {
  _$BrowseTaxedPriceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? discounted = freezed,
    Object? taxDescription = null,
    Object? typeName = null,
  }) {
    return _then(_value.copyWith(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      discounted: freezed == discounted
          ? _value.discounted
          : discounted // ignore: cast_nullable_to_non_nullable
              as int?,
      taxDescription: null == taxDescription
          ? _value.taxDescription
          : taxDescription // ignore: cast_nullable_to_non_nullable
              as List<String>,
      typeName: null == typeName
          ? _value.typeName
          : typeName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BrowseTaxedPriceImplCopyWith<$Res>
    implements $BrowseTaxedPriceCopyWith<$Res> {
  factory _$$BrowseTaxedPriceImplCopyWith(_$BrowseTaxedPriceImpl value,
          $Res Function(_$BrowseTaxedPriceImpl) then) =
      __$$BrowseTaxedPriceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int amount,
      int? discounted,
      List<String> taxDescription,
      String typeName});
}

/// @nodoc
class __$$BrowseTaxedPriceImplCopyWithImpl<$Res>
    extends _$BrowseTaxedPriceCopyWithImpl<$Res, _$BrowseTaxedPriceImpl>
    implements _$$BrowseTaxedPriceImplCopyWith<$Res> {
  __$$BrowseTaxedPriceImplCopyWithImpl(_$BrowseTaxedPriceImpl _value,
      $Res Function(_$BrowseTaxedPriceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? discounted = freezed,
    Object? taxDescription = null,
    Object? typeName = null,
  }) {
    return _then(_$BrowseTaxedPriceImpl(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      discounted: freezed == discounted
          ? _value.discounted
          : discounted // ignore: cast_nullable_to_non_nullable
              as int?,
      taxDescription: null == taxDescription
          ? _value._taxDescription
          : taxDescription // ignore: cast_nullable_to_non_nullable
              as List<String>,
      typeName: null == typeName
          ? _value.typeName
          : typeName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BrowseTaxedPriceImpl implements _BrowseTaxedPrice {
  _$BrowseTaxedPriceImpl(
      {required this.amount,
      this.discounted,
      final List<String> taxDescription = const [],
      this.typeName = 'TyBrowseTaxedPrice'})
      : _taxDescription = taxDescription;

  factory _$BrowseTaxedPriceImpl.fromJson(Map<String, dynamic> json) =>
      _$$BrowseTaxedPriceImplFromJson(json);

  @override
  final int amount;
  @override
  final int? discounted;
  final List<String> _taxDescription;
  @override
  @JsonKey()
  List<String> get taxDescription {
    if (_taxDescription is EqualUnmodifiableListView) return _taxDescription;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_taxDescription);
  }

  @override
  @JsonKey()
  final String typeName;

  @override
  String toString() {
    return 'BrowseTaxedPrice(amount: $amount, discounted: $discounted, taxDescription: $taxDescription, typeName: $typeName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BrowseTaxedPriceImpl &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.discounted, discounted) ||
                other.discounted == discounted) &&
            const DeepCollectionEquality()
                .equals(other._taxDescription, _taxDescription) &&
            (identical(other.typeName, typeName) ||
                other.typeName == typeName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, amount, discounted,
      const DeepCollectionEquality().hash(_taxDescription), typeName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BrowseTaxedPriceImplCopyWith<_$BrowseTaxedPriceImpl> get copyWith =>
      __$$BrowseTaxedPriceImplCopyWithImpl<_$BrowseTaxedPriceImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BrowseTaxedPriceImplToJson(
      this,
    );
  }
}

abstract class _BrowseTaxedPrice implements BrowseTaxedPrice {
  factory _BrowseTaxedPrice(
      {required final int amount,
      final int? discounted,
      final List<String> taxDescription,
      final String typeName}) = _$BrowseTaxedPriceImpl;

  factory _BrowseTaxedPrice.fromJson(Map<String, dynamic> json) =
      _$BrowseTaxedPriceImpl.fromJson;

  @override
  int get amount;
  @override
  int? get discounted;
  @override
  List<String> get taxDescription;
  @override
  String get typeName;
  @override
  @JsonKey(ignore: true)
  _$$BrowseTaxedPriceImplCopyWith<_$BrowseTaxedPriceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CheckoutFlow _$CheckoutFlowFromJson(Map<String, dynamic> json) {
  return _CheckoutFlow.fromJson(json);
}

/// @nodoc
mixin _$CheckoutFlow {
  List<CartStep> get steps => throw _privateConstructorUsedError;
  Current get current => throw _privateConstructorUsedError;
  String get typeName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CheckoutFlowCopyWith<CheckoutFlow> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckoutFlowCopyWith<$Res> {
  factory $CheckoutFlowCopyWith(
          CheckoutFlow value, $Res Function(CheckoutFlow) then) =
      _$CheckoutFlowCopyWithImpl<$Res, CheckoutFlow>;
  @useResult
  $Res call({List<CartStep> steps, Current current, String typeName});

  $CurrentCopyWith<$Res> get current;
}

/// @nodoc
class _$CheckoutFlowCopyWithImpl<$Res, $Val extends CheckoutFlow>
    implements $CheckoutFlowCopyWith<$Res> {
  _$CheckoutFlowCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? steps = null,
    Object? current = null,
    Object? typeName = null,
  }) {
    return _then(_value.copyWith(
      steps: null == steps
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<CartStep>,
      current: null == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as Current,
      typeName: null == typeName
          ? _value.typeName
          : typeName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CurrentCopyWith<$Res> get current {
    return $CurrentCopyWith<$Res>(_value.current, (value) {
      return _then(_value.copyWith(current: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CheckoutFlowImplCopyWith<$Res>
    implements $CheckoutFlowCopyWith<$Res> {
  factory _$$CheckoutFlowImplCopyWith(
          _$CheckoutFlowImpl value, $Res Function(_$CheckoutFlowImpl) then) =
      __$$CheckoutFlowImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CartStep> steps, Current current, String typeName});

  @override
  $CurrentCopyWith<$Res> get current;
}

/// @nodoc
class __$$CheckoutFlowImplCopyWithImpl<$Res>
    extends _$CheckoutFlowCopyWithImpl<$Res, _$CheckoutFlowImpl>
    implements _$$CheckoutFlowImplCopyWith<$Res> {
  __$$CheckoutFlowImplCopyWithImpl(
      _$CheckoutFlowImpl _value, $Res Function(_$CheckoutFlowImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? steps = null,
    Object? current = null,
    Object? typeName = null,
  }) {
    return _then(_$CheckoutFlowImpl(
      steps: null == steps
          ? _value._steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<CartStep>,
      current: null == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as Current,
      typeName: null == typeName
          ? _value.typeName
          : typeName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CheckoutFlowImpl implements _CheckoutFlow {
  _$CheckoutFlowImpl(
      {required final List<CartStep> steps,
      required this.current,
      this.typeName = 'TyCheckoutFlow'})
      : _steps = steps;

  factory _$CheckoutFlowImpl.fromJson(Map<String, dynamic> json) =>
      _$$CheckoutFlowImplFromJson(json);

  final List<CartStep> _steps;
  @override
  List<CartStep> get steps {
    if (_steps is EqualUnmodifiableListView) return _steps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_steps);
  }

  @override
  final Current current;
  @override
  @JsonKey()
  final String typeName;

  @override
  String toString() {
    return 'CheckoutFlow(steps: $steps, current: $current, typeName: $typeName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckoutFlowImpl &&
            const DeepCollectionEquality().equals(other._steps, _steps) &&
            (identical(other.current, current) || other.current == current) &&
            (identical(other.typeName, typeName) ||
                other.typeName == typeName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_steps), current, typeName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckoutFlowImplCopyWith<_$CheckoutFlowImpl> get copyWith =>
      __$$CheckoutFlowImplCopyWithImpl<_$CheckoutFlowImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CheckoutFlowImplToJson(
      this,
    );
  }
}

abstract class _CheckoutFlow implements CheckoutFlow {
  factory _CheckoutFlow(
      {required final List<CartStep> steps,
      required final Current current,
      final String typeName}) = _$CheckoutFlowImpl;

  factory _CheckoutFlow.fromJson(Map<String, dynamic> json) =
      _$CheckoutFlowImpl.fromJson;

  @override
  List<CartStep> get steps;
  @override
  Current get current;
  @override
  String get typeName;
  @override
  @JsonKey(ignore: true)
  _$$CheckoutFlowImplCopyWith<_$CheckoutFlowImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Current _$CurrentFromJson(Map<String, dynamic> json) {
  return _Current.fromJson(json);
}

/// @nodoc
mixin _$Current {
  bool get orderCreated => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CurrentCopyWith<Current> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrentCopyWith<$Res> {
  factory $CurrentCopyWith(Current value, $Res Function(Current) then) =
      _$CurrentCopyWithImpl<$Res, Current>;
  @useResult
  $Res call({bool orderCreated});
}

/// @nodoc
class _$CurrentCopyWithImpl<$Res, $Val extends Current>
    implements $CurrentCopyWith<$Res> {
  _$CurrentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderCreated = null,
  }) {
    return _then(_value.copyWith(
      orderCreated: null == orderCreated
          ? _value.orderCreated
          : orderCreated // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CurrentImplCopyWith<$Res> implements $CurrentCopyWith<$Res> {
  factory _$$CurrentImplCopyWith(
          _$CurrentImpl value, $Res Function(_$CurrentImpl) then) =
      __$$CurrentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool orderCreated});
}

/// @nodoc
class __$$CurrentImplCopyWithImpl<$Res>
    extends _$CurrentCopyWithImpl<$Res, _$CurrentImpl>
    implements _$$CurrentImplCopyWith<$Res> {
  __$$CurrentImplCopyWithImpl(
      _$CurrentImpl _value, $Res Function(_$CurrentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderCreated = null,
  }) {
    return _then(_$CurrentImpl(
      orderCreated: null == orderCreated
          ? _value.orderCreated
          : orderCreated // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CurrentImpl implements _Current {
  _$CurrentImpl({required this.orderCreated});

  factory _$CurrentImpl.fromJson(Map<String, dynamic> json) =>
      _$$CurrentImplFromJson(json);

  @override
  final bool orderCreated;

  @override
  String toString() {
    return 'Current(orderCreated: $orderCreated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrentImpl &&
            (identical(other.orderCreated, orderCreated) ||
                other.orderCreated == orderCreated));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, orderCreated);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrentImplCopyWith<_$CurrentImpl> get copyWith =>
      __$$CurrentImplCopyWithImpl<_$CurrentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CurrentImplToJson(
      this,
    );
  }
}

abstract class _Current implements Current {
  factory _Current({required final bool orderCreated}) = _$CurrentImpl;

  factory _Current.fromJson(Map<String, dynamic> json) = _$CurrentImpl.fromJson;

  @override
  bool get orderCreated;
  @override
  @JsonKey(ignore: true)
  _$$CurrentImplCopyWith<_$CurrentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CartStep _$CartStepFromJson(Map<String, dynamic> json) {
  return _CartStep.fromJson(json);
}

/// @nodoc
mixin _$CartStep {
  String get step => throw _privateConstructorUsedError;
  String? get action => throw _privateConstructorUsedError;
  bool get finalStep => throw _privateConstructorUsedError;
  bool get active => throw _privateConstructorUsedError;
  bool? get orderCreated => throw _privateConstructorUsedError;
  String get typeName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CartStepCopyWith<CartStep> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartStepCopyWith<$Res> {
  factory $CartStepCopyWith(CartStep value, $Res Function(CartStep) then) =
      _$CartStepCopyWithImpl<$Res, CartStep>;
  @useResult
  $Res call(
      {String step,
      String? action,
      bool finalStep,
      bool active,
      bool? orderCreated,
      String typeName});
}

/// @nodoc
class _$CartStepCopyWithImpl<$Res, $Val extends CartStep>
    implements $CartStepCopyWith<$Res> {
  _$CartStepCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? step = null,
    Object? action = freezed,
    Object? finalStep = null,
    Object? active = null,
    Object? orderCreated = freezed,
    Object? typeName = null,
  }) {
    return _then(_value.copyWith(
      step: null == step
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as String,
      action: freezed == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String?,
      finalStep: null == finalStep
          ? _value.finalStep
          : finalStep // ignore: cast_nullable_to_non_nullable
              as bool,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      orderCreated: freezed == orderCreated
          ? _value.orderCreated
          : orderCreated // ignore: cast_nullable_to_non_nullable
              as bool?,
      typeName: null == typeName
          ? _value.typeName
          : typeName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CartStepImplCopyWith<$Res>
    implements $CartStepCopyWith<$Res> {
  factory _$$CartStepImplCopyWith(
          _$CartStepImpl value, $Res Function(_$CartStepImpl) then) =
      __$$CartStepImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String step,
      String? action,
      bool finalStep,
      bool active,
      bool? orderCreated,
      String typeName});
}

/// @nodoc
class __$$CartStepImplCopyWithImpl<$Res>
    extends _$CartStepCopyWithImpl<$Res, _$CartStepImpl>
    implements _$$CartStepImplCopyWith<$Res> {
  __$$CartStepImplCopyWithImpl(
      _$CartStepImpl _value, $Res Function(_$CartStepImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? step = null,
    Object? action = freezed,
    Object? finalStep = null,
    Object? active = null,
    Object? orderCreated = freezed,
    Object? typeName = null,
  }) {
    return _then(_$CartStepImpl(
      step: null == step
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as String,
      action: freezed == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String?,
      finalStep: null == finalStep
          ? _value.finalStep
          : finalStep // ignore: cast_nullable_to_non_nullable
              as bool,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      orderCreated: freezed == orderCreated
          ? _value.orderCreated
          : orderCreated // ignore: cast_nullable_to_non_nullable
              as bool?,
      typeName: null == typeName
          ? _value.typeName
          : typeName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CartStepImpl implements _CartStep {
  _$CartStepImpl(
      {required this.step,
      this.action,
      this.finalStep = false,
      this.active = false,
      this.orderCreated,
      this.typeName = 'TyCartStep'});

  factory _$CartStepImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartStepImplFromJson(json);

  @override
  final String step;
  @override
  final String? action;
  @override
  @JsonKey()
  final bool finalStep;
  @override
  @JsonKey()
  final bool active;
  @override
  final bool? orderCreated;
  @override
  @JsonKey()
  final String typeName;

  @override
  String toString() {
    return 'CartStep(step: $step, action: $action, finalStep: $finalStep, active: $active, orderCreated: $orderCreated, typeName: $typeName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartStepImpl &&
            (identical(other.step, step) || other.step == step) &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.finalStep, finalStep) ||
                other.finalStep == finalStep) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.orderCreated, orderCreated) ||
                other.orderCreated == orderCreated) &&
            (identical(other.typeName, typeName) ||
                other.typeName == typeName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, step, action, finalStep, active, orderCreated, typeName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CartStepImplCopyWith<_$CartStepImpl> get copyWith =>
      __$$CartStepImplCopyWithImpl<_$CartStepImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CartStepImplToJson(
      this,
    );
  }
}

abstract class _CartStep implements CartStep {
  factory _CartStep(
      {required final String step,
      final String? action,
      final bool finalStep,
      final bool active,
      final bool? orderCreated,
      final String typeName}) = _$CartStepImpl;

  factory _CartStep.fromJson(Map<String, dynamic> json) =
      _$CartStepImpl.fromJson;

  @override
  String get step;
  @override
  String? get action;
  @override
  bool get finalStep;
  @override
  bool get active;
  @override
  bool? get orderCreated;
  @override
  String get typeName;
  @override
  @JsonKey(ignore: true)
  _$$CartStepImplCopyWith<_$CartStepImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Order _$OrderFromJson(Map<String, dynamic> json) {
  return _Order.fromJson(json);
}

/// @nodoc
mixin _$Order {
  String get slug => throw _privateConstructorUsedError;
  String get typeName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderCopyWith<Order> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderCopyWith<$Res> {
  factory $OrderCopyWith(Order value, $Res Function(Order) then) =
      _$OrderCopyWithImpl<$Res, Order>;
  @useResult
  $Res call({String slug, String typeName});
}

/// @nodoc
class _$OrderCopyWithImpl<$Res, $Val extends Order>
    implements $OrderCopyWith<$Res> {
  _$OrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? slug = null,
    Object? typeName = null,
  }) {
    return _then(_value.copyWith(
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      typeName: null == typeName
          ? _value.typeName
          : typeName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderImplCopyWith<$Res> implements $OrderCopyWith<$Res> {
  factory _$$OrderImplCopyWith(
          _$OrderImpl value, $Res Function(_$OrderImpl) then) =
      __$$OrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String slug, String typeName});
}

/// @nodoc
class __$$OrderImplCopyWithImpl<$Res>
    extends _$OrderCopyWithImpl<$Res, _$OrderImpl>
    implements _$$OrderImplCopyWith<$Res> {
  __$$OrderImplCopyWithImpl(
      _$OrderImpl _value, $Res Function(_$OrderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? slug = null,
    Object? typeName = null,
  }) {
    return _then(_$OrderImpl(
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
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
class _$OrderImpl implements _Order {
  _$OrderImpl({required this.slug, this.typeName = 'TyOrder'});

  factory _$OrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderImplFromJson(json);

  @override
  final String slug;
  @override
  @JsonKey()
  final String typeName;

  @override
  String toString() {
    return 'Order(slug: $slug, typeName: $typeName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderImpl &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.typeName, typeName) ||
                other.typeName == typeName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, slug, typeName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderImplCopyWith<_$OrderImpl> get copyWith =>
      __$$OrderImplCopyWithImpl<_$OrderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderImplToJson(
      this,
    );
  }
}

abstract class _Order implements Order {
  factory _Order({required final String slug, final String typeName}) =
      _$OrderImpl;

  factory _Order.fromJson(Map<String, dynamic> json) = _$OrderImpl.fromJson;

  @override
  String get slug;
  @override
  String get typeName;
  @override
  @JsonKey(ignore: true)
  _$$OrderImplCopyWith<_$OrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
