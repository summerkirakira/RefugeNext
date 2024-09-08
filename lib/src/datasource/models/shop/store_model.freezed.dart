// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'store_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StoreData _$StoreDataFromJson(Map<String, dynamic> json) {
  return _StoreData.fromJson(json);
}

/// @nodoc
mixin _$StoreData {
  Store get store => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoreDataCopyWith<StoreData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreDataCopyWith<$Res> {
  factory $StoreDataCopyWith(StoreData value, $Res Function(StoreData) then) =
      _$StoreDataCopyWithImpl<$Res, StoreData>;
  @useResult
  $Res call({Store store});

  $StoreCopyWith<$Res> get store;
}

/// @nodoc
class _$StoreDataCopyWithImpl<$Res, $Val extends StoreData>
    implements $StoreDataCopyWith<$Res> {
  _$StoreDataCopyWithImpl(this._value, this._then);

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
abstract class _$$StoreDataImplCopyWith<$Res>
    implements $StoreDataCopyWith<$Res> {
  factory _$$StoreDataImplCopyWith(
          _$StoreDataImpl value, $Res Function(_$StoreDataImpl) then) =
      __$$StoreDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Store store});

  @override
  $StoreCopyWith<$Res> get store;
}

/// @nodoc
class __$$StoreDataImplCopyWithImpl<$Res>
    extends _$StoreDataCopyWithImpl<$Res, _$StoreDataImpl>
    implements _$$StoreDataImplCopyWith<$Res> {
  __$$StoreDataImplCopyWithImpl(
      _$StoreDataImpl _value, $Res Function(_$StoreDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? store = null,
  }) {
    return _then(_$StoreDataImpl(
      store: null == store
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as Store,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StoreDataImpl implements _StoreData {
  _$StoreDataImpl({required this.store});

  factory _$StoreDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$StoreDataImplFromJson(json);

  @override
  final Store store;

  @override
  String toString() {
    return 'StoreData(store: $store)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoreDataImpl &&
            (identical(other.store, store) || other.store == store));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, store);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StoreDataImplCopyWith<_$StoreDataImpl> get copyWith =>
      __$$StoreDataImplCopyWithImpl<_$StoreDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StoreDataImplToJson(
      this,
    );
  }
}

abstract class _StoreData implements StoreData {
  factory _StoreData({required final Store store}) = _$StoreDataImpl;

  factory _StoreData.fromJson(Map<String, dynamic> json) =
      _$StoreDataImpl.fromJson;

  @override
  Store get store;
  @override
  @JsonKey(ignore: true)
  _$$StoreDataImplCopyWith<_$StoreDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Store _$StoreFromJson(Map<String, dynamic> json) {
  return _Store.fromJson(json);
}

/// @nodoc
mixin _$Store {
  Context get context => throw _privateConstructorUsedError;
  Cart get cart => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoreCopyWith<Store> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreCopyWith<$Res> {
  factory $StoreCopyWith(Store value, $Res Function(Store) then) =
      _$StoreCopyWithImpl<$Res, Store>;
  @useResult
  $Res call({Context context, Cart cart});

  $ContextCopyWith<$Res> get context;
  $CartCopyWith<$Res> get cart;
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
  }) {
    return _then(_value.copyWith(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as Context,
      cart: null == cart
          ? _value.cart
          : cart // ignore: cast_nullable_to_non_nullable
              as Cart,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ContextCopyWith<$Res> get context {
    return $ContextCopyWith<$Res>(_value.context, (value) {
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
}

/// @nodoc
abstract class _$$StoreImplCopyWith<$Res> implements $StoreCopyWith<$Res> {
  factory _$$StoreImplCopyWith(
          _$StoreImpl value, $Res Function(_$StoreImpl) then) =
      __$$StoreImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Context context, Cart cart});

  @override
  $ContextCopyWith<$Res> get context;
  @override
  $CartCopyWith<$Res> get cart;
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
  }) {
    return _then(_$StoreImpl(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as Context,
      cart: null == cart
          ? _value.cart
          : cart // ignore: cast_nullable_to_non_nullable
              as Cart,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StoreImpl implements _Store {
  _$StoreImpl({required this.context, required this.cart});

  factory _$StoreImpl.fromJson(Map<String, dynamic> json) =>
      _$$StoreImplFromJson(json);

  @override
  final Context context;
  @override
  final Cart cart;

  @override
  String toString() {
    return 'Store(context: $context, cart: $cart)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoreImpl &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.cart, cart) || other.cart == cart));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, context, cart);

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
  factory _Store({required final Context context, required final Cart cart}) =
      _$StoreImpl;

  factory _Store.fromJson(Map<String, dynamic> json) = _$StoreImpl.fromJson;

  @override
  Context get context;
  @override
  Cart get cart;
  @override
  @JsonKey(ignore: true)
  _$$StoreImplCopyWith<_$StoreImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Context _$ContextFromJson(Map<String, dynamic> json) {
  return _Context.fromJson(json);
}

/// @nodoc
mixin _$Context {
  Pricing get pricing => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContextCopyWith<Context> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContextCopyWith<$Res> {
  factory $ContextCopyWith(Context value, $Res Function(Context) then) =
      _$ContextCopyWithImpl<$Res, Context>;
  @useResult
  $Res call({Pricing pricing});

  $PricingCopyWith<$Res> get pricing;
}

/// @nodoc
class _$ContextCopyWithImpl<$Res, $Val extends Context>
    implements $ContextCopyWith<$Res> {
  _$ContextCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pricing = null,
  }) {
    return _then(_value.copyWith(
      pricing: null == pricing
          ? _value.pricing
          : pricing // ignore: cast_nullable_to_non_nullable
              as Pricing,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PricingCopyWith<$Res> get pricing {
    return $PricingCopyWith<$Res>(_value.pricing, (value) {
      return _then(_value.copyWith(pricing: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ContextImplCopyWith<$Res> implements $ContextCopyWith<$Res> {
  factory _$$ContextImplCopyWith(
          _$ContextImpl value, $Res Function(_$ContextImpl) then) =
      __$$ContextImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Pricing pricing});

  @override
  $PricingCopyWith<$Res> get pricing;
}

/// @nodoc
class __$$ContextImplCopyWithImpl<$Res>
    extends _$ContextCopyWithImpl<$Res, _$ContextImpl>
    implements _$$ContextImplCopyWith<$Res> {
  __$$ContextImplCopyWithImpl(
      _$ContextImpl _value, $Res Function(_$ContextImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pricing = null,
  }) {
    return _then(_$ContextImpl(
      pricing: null == pricing
          ? _value.pricing
          : pricing // ignore: cast_nullable_to_non_nullable
              as Pricing,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContextImpl implements _Context {
  _$ContextImpl({required this.pricing});

  factory _$ContextImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContextImplFromJson(json);

  @override
  final Pricing pricing;

  @override
  String toString() {
    return 'Context(pricing: $pricing)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContextImpl &&
            (identical(other.pricing, pricing) || other.pricing == pricing));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, pricing);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContextImplCopyWith<_$ContextImpl> get copyWith =>
      __$$ContextImplCopyWithImpl<_$ContextImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContextImplToJson(
      this,
    );
  }
}

abstract class _Context implements Context {
  factory _Context({required final Pricing pricing}) = _$ContextImpl;

  factory _Context.fromJson(Map<String, dynamic> json) = _$ContextImpl.fromJson;

  @override
  Pricing get pricing;
  @override
  @JsonKey(ignore: true)
  _$$ContextImplCopyWith<_$ContextImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Pricing _$PricingFromJson(Map<String, dynamic> json) {
  return _Pricing.fromJson(json);
}

/// @nodoc
mixin _$Pricing {
  String get currencyCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PricingCopyWith<Pricing> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PricingCopyWith<$Res> {
  factory $PricingCopyWith(Pricing value, $Res Function(Pricing) then) =
      _$PricingCopyWithImpl<$Res, Pricing>;
  @useResult
  $Res call({String currencyCode});
}

/// @nodoc
class _$PricingCopyWithImpl<$Res, $Val extends Pricing>
    implements $PricingCopyWith<$Res> {
  _$PricingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currencyCode = null,
  }) {
    return _then(_value.copyWith(
      currencyCode: null == currencyCode
          ? _value.currencyCode
          : currencyCode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PricingImplCopyWith<$Res> implements $PricingCopyWith<$Res> {
  factory _$$PricingImplCopyWith(
          _$PricingImpl value, $Res Function(_$PricingImpl) then) =
      __$$PricingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String currencyCode});
}

/// @nodoc
class __$$PricingImplCopyWithImpl<$Res>
    extends _$PricingCopyWithImpl<$Res, _$PricingImpl>
    implements _$$PricingImplCopyWith<$Res> {
  __$$PricingImplCopyWithImpl(
      _$PricingImpl _value, $Res Function(_$PricingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currencyCode = null,
  }) {
    return _then(_$PricingImpl(
      currencyCode: null == currencyCode
          ? _value.currencyCode
          : currencyCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PricingImpl implements _Pricing {
  _$PricingImpl({required this.currencyCode});

  factory _$PricingImpl.fromJson(Map<String, dynamic> json) =>
      _$$PricingImplFromJson(json);

  @override
  final String currencyCode;

  @override
  String toString() {
    return 'Pricing(currencyCode: $currencyCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PricingImpl &&
            (identical(other.currencyCode, currencyCode) ||
                other.currencyCode == currencyCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, currencyCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PricingImplCopyWith<_$PricingImpl> get copyWith =>
      __$$PricingImplCopyWithImpl<_$PricingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PricingImplToJson(
      this,
    );
  }
}

abstract class _Pricing implements Pricing {
  factory _Pricing({required final String currencyCode}) = _$PricingImpl;

  factory _Pricing.fromJson(Map<String, dynamic> json) = _$PricingImpl.fromJson;

  @override
  String get currencyCode;
  @override
  @JsonKey(ignore: true)
  _$$PricingImplCopyWith<_$PricingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Cart _$CartFromJson(Map<String, dynamic> json) {
  return _Cart.fromJson(json);
}

/// @nodoc
mixin _$Cart {
  bool get hasRecurring => throw _privateConstructorUsedError;
  bool get hasDigital => throw _privateConstructorUsedError;
  List<LineItem> get lineItems => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CartCopyWith<Cart> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartCopyWith<$Res> {
  factory $CartCopyWith(Cart value, $Res Function(Cart) then) =
      _$CartCopyWithImpl<$Res, Cart>;
  @useResult
  $Res call({bool hasRecurring, bool hasDigital, List<LineItem> lineItems});
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
    Object? hasDigital = null,
    Object? lineItems = null,
  }) {
    return _then(_value.copyWith(
      hasRecurring: null == hasRecurring
          ? _value.hasRecurring
          : hasRecurring // ignore: cast_nullable_to_non_nullable
              as bool,
      hasDigital: null == hasDigital
          ? _value.hasDigital
          : hasDigital // ignore: cast_nullable_to_non_nullable
              as bool,
      lineItems: null == lineItems
          ? _value.lineItems
          : lineItems // ignore: cast_nullable_to_non_nullable
              as List<LineItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CartImplCopyWith<$Res> implements $CartCopyWith<$Res> {
  factory _$$CartImplCopyWith(
          _$CartImpl value, $Res Function(_$CartImpl) then) =
      __$$CartImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool hasRecurring, bool hasDigital, List<LineItem> lineItems});
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
    Object? hasDigital = null,
    Object? lineItems = null,
  }) {
    return _then(_$CartImpl(
      hasRecurring: null == hasRecurring
          ? _value.hasRecurring
          : hasRecurring // ignore: cast_nullable_to_non_nullable
              as bool,
      hasDigital: null == hasDigital
          ? _value.hasDigital
          : hasDigital // ignore: cast_nullable_to_non_nullable
              as bool,
      lineItems: null == lineItems
          ? _value._lineItems
          : lineItems // ignore: cast_nullable_to_non_nullable
              as List<LineItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CartImpl implements _Cart {
  _$CartImpl(
      {required this.hasRecurring,
      required this.hasDigital,
      required final List<LineItem> lineItems})
      : _lineItems = lineItems;

  factory _$CartImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartImplFromJson(json);

  @override
  final bool hasRecurring;
  @override
  final bool hasDigital;
  final List<LineItem> _lineItems;
  @override
  List<LineItem> get lineItems {
    if (_lineItems is EqualUnmodifiableListView) return _lineItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lineItems);
  }

  @override
  String toString() {
    return 'Cart(hasRecurring: $hasRecurring, hasDigital: $hasDigital, lineItems: $lineItems)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartImpl &&
            (identical(other.hasRecurring, hasRecurring) ||
                other.hasRecurring == hasRecurring) &&
            (identical(other.hasDigital, hasDigital) ||
                other.hasDigital == hasDigital) &&
            const DeepCollectionEquality()
                .equals(other._lineItems, _lineItems));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, hasRecurring, hasDigital,
      const DeepCollectionEquality().hash(_lineItems));

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
      required final bool hasDigital,
      required final List<LineItem> lineItems}) = _$CartImpl;

  factory _Cart.fromJson(Map<String, dynamic> json) = _$CartImpl.fromJson;

  @override
  bool get hasRecurring;
  @override
  bool get hasDigital;
  @override
  List<LineItem> get lineItems;
  @override
  @JsonKey(ignore: true)
  _$$CartImplCopyWith<_$CartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LineItem _$LineItemFromJson(Map<String, dynamic> json) {
  return _LineItem.fromJson(json);
}

/// @nodoc
mixin _$LineItem {
  String get id => throw _privateConstructorUsedError;
  String get skuId => throw _privateConstructorUsedError;
  String? get identifier => throw _privateConstructorUsedError;
  List<String> get taxDescription => throw _privateConstructorUsedError;
  Sku get sku => throw _privateConstructorUsedError;
  UnitPrice get unitPriceWithTax => throw _privateConstructorUsedError;
  int get qty => throw _privateConstructorUsedError;
  Upgrade? get upgrade => throw _privateConstructorUsedError;
  List<dynamic> get discounts => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LineItemCopyWith<LineItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LineItemCopyWith<$Res> {
  factory $LineItemCopyWith(LineItem value, $Res Function(LineItem) then) =
      _$LineItemCopyWithImpl<$Res, LineItem>;
  @useResult
  $Res call(
      {String id,
      String skuId,
      String? identifier,
      List<String> taxDescription,
      Sku sku,
      UnitPrice unitPriceWithTax,
      int qty,
      Upgrade? upgrade,
      List<dynamic> discounts});

  $SkuCopyWith<$Res> get sku;
  $UnitPriceCopyWith<$Res> get unitPriceWithTax;
  $UpgradeCopyWith<$Res>? get upgrade;
}

/// @nodoc
class _$LineItemCopyWithImpl<$Res, $Val extends LineItem>
    implements $LineItemCopyWith<$Res> {
  _$LineItemCopyWithImpl(this._value, this._then);

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
    Object? upgrade = freezed,
    Object? discounts = null,
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
              as UnitPrice,
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
      upgrade: freezed == upgrade
          ? _value.upgrade
          : upgrade // ignore: cast_nullable_to_non_nullable
              as Upgrade?,
      discounts: null == discounts
          ? _value.discounts
          : discounts // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
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
  $UnitPriceCopyWith<$Res> get unitPriceWithTax {
    return $UnitPriceCopyWith<$Res>(_value.unitPriceWithTax, (value) {
      return _then(_value.copyWith(unitPriceWithTax: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UpgradeCopyWith<$Res>? get upgrade {
    if (_value.upgrade == null) {
      return null;
    }

    return $UpgradeCopyWith<$Res>(_value.upgrade!, (value) {
      return _then(_value.copyWith(upgrade: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LineItemImplCopyWith<$Res>
    implements $LineItemCopyWith<$Res> {
  factory _$$LineItemImplCopyWith(
          _$LineItemImpl value, $Res Function(_$LineItemImpl) then) =
      __$$LineItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String skuId,
      String? identifier,
      List<String> taxDescription,
      Sku sku,
      UnitPrice unitPriceWithTax,
      int qty,
      Upgrade? upgrade,
      List<dynamic> discounts});

  @override
  $SkuCopyWith<$Res> get sku;
  @override
  $UnitPriceCopyWith<$Res> get unitPriceWithTax;
  @override
  $UpgradeCopyWith<$Res>? get upgrade;
}

/// @nodoc
class __$$LineItemImplCopyWithImpl<$Res>
    extends _$LineItemCopyWithImpl<$Res, _$LineItemImpl>
    implements _$$LineItemImplCopyWith<$Res> {
  __$$LineItemImplCopyWithImpl(
      _$LineItemImpl _value, $Res Function(_$LineItemImpl) _then)
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
    Object? upgrade = freezed,
    Object? discounts = null,
  }) {
    return _then(_$LineItemImpl(
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
              as UnitPrice,
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
      upgrade: freezed == upgrade
          ? _value.upgrade
          : upgrade // ignore: cast_nullable_to_non_nullable
              as Upgrade?,
      discounts: null == discounts
          ? _value._discounts
          : discounts // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LineItemImpl implements _LineItem {
  _$LineItemImpl(
      {required this.id,
      required this.skuId,
      required this.identifier,
      required final List<String> taxDescription,
      required this.sku,
      required this.unitPriceWithTax,
      required this.qty,
      this.upgrade = null,
      required final List<dynamic> discounts})
      : _taxDescription = taxDescription,
        _discounts = discounts;

  factory _$LineItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$LineItemImplFromJson(json);

  @override
  final String id;
  @override
  final String skuId;
  @override
  final String? identifier;
  final List<String> _taxDescription;
  @override
  List<String> get taxDescription {
    if (_taxDescription is EqualUnmodifiableListView) return _taxDescription;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_taxDescription);
  }

  @override
  final Sku sku;
  @override
  final UnitPrice unitPriceWithTax;
  @override
  final int qty;
  @override
  @JsonKey()
  final Upgrade? upgrade;
  final List<dynamic> _discounts;
  @override
  List<dynamic> get discounts {
    if (_discounts is EqualUnmodifiableListView) return _discounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_discounts);
  }

  @override
  String toString() {
    return 'LineItem(id: $id, skuId: $skuId, identifier: $identifier, taxDescription: $taxDescription, sku: $sku, unitPriceWithTax: $unitPriceWithTax, qty: $qty, upgrade: $upgrade, discounts: $discounts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LineItemImpl &&
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
            (identical(other.upgrade, upgrade) || other.upgrade == upgrade) &&
            const DeepCollectionEquality()
                .equals(other._discounts, _discounts));
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
      upgrade,
      const DeepCollectionEquality().hash(_discounts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LineItemImplCopyWith<_$LineItemImpl> get copyWith =>
      __$$LineItemImplCopyWithImpl<_$LineItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LineItemImplToJson(
      this,
    );
  }
}

abstract class _LineItem implements LineItem {
  factory _LineItem(
      {required final String id,
      required final String skuId,
      required final String? identifier,
      required final List<String> taxDescription,
      required final Sku sku,
      required final UnitPrice unitPriceWithTax,
      required final int qty,
      final Upgrade? upgrade,
      required final List<dynamic> discounts}) = _$LineItemImpl;

  factory _LineItem.fromJson(Map<String, dynamic> json) =
      _$LineItemImpl.fromJson;

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
  UnitPrice get unitPriceWithTax;
  @override
  int get qty;
  @override
  Upgrade? get upgrade;
  @override
  List<dynamic> get discounts;
  @override
  @JsonKey(ignore: true)
  _$$LineItemImplCopyWith<_$LineItemImpl> get copyWith =>
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
  bool get isPackage =>
      throw _privateConstructorUsedError; // required List<GameItem> gameItems,
  Stock get stock => throw _privateConstructorUsedError;
  Media get media => throw _privateConstructorUsedError;
  int get maxQty => throw _privateConstructorUsedError;
  int get minQty => throw _privateConstructorUsedError;
  PublicType get publicType => throw _privateConstructorUsedError;
  Price get nativePrice => throw _privateConstructorUsedError;
  Price get price => throw _privateConstructorUsedError;

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
      Stock stock,
      Media media,
      int maxQty,
      int minQty,
      PublicType publicType,
      Price nativePrice,
      Price price});

  $StockCopyWith<$Res> get stock;
  $MediaCopyWith<$Res> get media;
  $PublicTypeCopyWith<$Res> get publicType;
  $PriceCopyWith<$Res> get nativePrice;
  $PriceCopyWith<$Res> get price;
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
    Object? stock = null,
    Object? media = null,
    Object? maxQty = null,
    Object? minQty = null,
    Object? publicType = null,
    Object? nativePrice = null,
    Object? price = null,
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
      stock: null == stock
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as Stock,
      media: null == media
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as Media,
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
              as PublicType,
      nativePrice: null == nativePrice
          ? _value.nativePrice
          : nativePrice // ignore: cast_nullable_to_non_nullable
              as Price,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as Price,
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
  $MediaCopyWith<$Res> get media {
    return $MediaCopyWith<$Res>(_value.media, (value) {
      return _then(_value.copyWith(media: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PublicTypeCopyWith<$Res> get publicType {
    return $PublicTypeCopyWith<$Res>(_value.publicType, (value) {
      return _then(_value.copyWith(publicType: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PriceCopyWith<$Res> get nativePrice {
    return $PriceCopyWith<$Res>(_value.nativePrice, (value) {
      return _then(_value.copyWith(nativePrice: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PriceCopyWith<$Res> get price {
    return $PriceCopyWith<$Res>(_value.price, (value) {
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
      Stock stock,
      Media media,
      int maxQty,
      int minQty,
      PublicType publicType,
      Price nativePrice,
      Price price});

  @override
  $StockCopyWith<$Res> get stock;
  @override
  $MediaCopyWith<$Res> get media;
  @override
  $PublicTypeCopyWith<$Res> get publicType;
  @override
  $PriceCopyWith<$Res> get nativePrice;
  @override
  $PriceCopyWith<$Res> get price;
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
    Object? stock = null,
    Object? media = null,
    Object? maxQty = null,
    Object? minQty = null,
    Object? publicType = null,
    Object? nativePrice = null,
    Object? price = null,
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
      stock: null == stock
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as Stock,
      media: null == media
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as Media,
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
              as PublicType,
      nativePrice: null == nativePrice
          ? _value.nativePrice
          : nativePrice // ignore: cast_nullable_to_non_nullable
              as Price,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as Price,
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
      required this.isPackage,
      required this.stock,
      required this.media,
      required this.maxQty,
      required this.minQty,
      required this.publicType,
      required this.nativePrice,
      required this.price});

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
  final bool isPackage;
// required List<GameItem> gameItems,
  @override
  final Stock stock;
  @override
  final Media media;
  @override
  final int maxQty;
  @override
  final int minQty;
  @override
  final PublicType publicType;
  @override
  final Price nativePrice;
  @override
  final Price price;

  @override
  String toString() {
    return 'Sku(id: $id, productId: $productId, title: $title, label: $label, subtitle: $subtitle, url: $url, type: $type, frequency: $frequency, isWarbond: $isWarbond, isPackage: $isPackage, stock: $stock, media: $media, maxQty: $maxQty, minQty: $minQty, publicType: $publicType, nativePrice: $nativePrice, price: $price)';
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
            (identical(other.stock, stock) || other.stock == stock) &&
            (identical(other.media, media) || other.media == media) &&
            (identical(other.maxQty, maxQty) || other.maxQty == maxQty) &&
            (identical(other.minQty, minQty) || other.minQty == minQty) &&
            (identical(other.publicType, publicType) ||
                other.publicType == publicType) &&
            (identical(other.nativePrice, nativePrice) ||
                other.nativePrice == nativePrice) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
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
      stock,
      media,
      maxQty,
      minQty,
      publicType,
      nativePrice,
      price);

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
      required final bool isPackage,
      required final Stock stock,
      required final Media media,
      required final int maxQty,
      required final int minQty,
      required final PublicType publicType,
      required final Price nativePrice,
      required final Price price}) = _$SkuImpl;

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
  @override // required List<GameItem> gameItems,
  Stock get stock;
  @override
  Media get media;
  @override
  int get maxQty;
  @override
  int get minQty;
  @override
  PublicType get publicType;
  @override
  Price get nativePrice;
  @override
  Price get price;
  @override
  @JsonKey(ignore: true)
  _$$SkuImplCopyWith<_$SkuImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GameItem _$GameItemFromJson(Map<String, dynamic> json) {
  return _GameItem.fromJson(json);
}

/// @nodoc
mixin _$GameItem {
  Specs? get specs => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GameItemCopyWith<GameItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameItemCopyWith<$Res> {
  factory $GameItemCopyWith(GameItem value, $Res Function(GameItem) then) =
      _$GameItemCopyWithImpl<$Res, GameItem>;
  @useResult
  $Res call({Specs? specs});

  $SpecsCopyWith<$Res>? get specs;
}

/// @nodoc
class _$GameItemCopyWithImpl<$Res, $Val extends GameItem>
    implements $GameItemCopyWith<$Res> {
  _$GameItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? specs = freezed,
  }) {
    return _then(_value.copyWith(
      specs: freezed == specs
          ? _value.specs
          : specs // ignore: cast_nullable_to_non_nullable
              as Specs?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SpecsCopyWith<$Res>? get specs {
    if (_value.specs == null) {
      return null;
    }

    return $SpecsCopyWith<$Res>(_value.specs!, (value) {
      return _then(_value.copyWith(specs: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GameItemImplCopyWith<$Res>
    implements $GameItemCopyWith<$Res> {
  factory _$$GameItemImplCopyWith(
          _$GameItemImpl value, $Res Function(_$GameItemImpl) then) =
      __$$GameItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Specs? specs});

  @override
  $SpecsCopyWith<$Res>? get specs;
}

/// @nodoc
class __$$GameItemImplCopyWithImpl<$Res>
    extends _$GameItemCopyWithImpl<$Res, _$GameItemImpl>
    implements _$$GameItemImplCopyWith<$Res> {
  __$$GameItemImplCopyWithImpl(
      _$GameItemImpl _value, $Res Function(_$GameItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? specs = freezed,
  }) {
    return _then(_$GameItemImpl(
      specs: freezed == specs
          ? _value.specs
          : specs // ignore: cast_nullable_to_non_nullable
              as Specs?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GameItemImpl implements _GameItem {
  _$GameItemImpl({this.specs});

  factory _$GameItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$GameItemImplFromJson(json);

  @override
  final Specs? specs;

  @override
  String toString() {
    return 'GameItem(specs: $specs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameItemImpl &&
            (identical(other.specs, specs) || other.specs == specs));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, specs);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GameItemImplCopyWith<_$GameItemImpl> get copyWith =>
      __$$GameItemImplCopyWithImpl<_$GameItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GameItemImplToJson(
      this,
    );
  }
}

abstract class _GameItem implements GameItem {
  factory _GameItem({final Specs? specs}) = _$GameItemImpl;

  factory _GameItem.fromJson(Map<String, dynamic> json) =
      _$GameItemImpl.fromJson;

  @override
  Specs? get specs;
  @override
  @JsonKey(ignore: true)
  _$$GameItemImplCopyWith<_$GameItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Specs _$SpecsFromJson(Map<String, dynamic> json) {
  return _Specs.fromJson(json);
}

/// @nodoc
mixin _$Specs {
  String? get productionStatus => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SpecsCopyWith<Specs> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpecsCopyWith<$Res> {
  factory $SpecsCopyWith(Specs value, $Res Function(Specs) then) =
      _$SpecsCopyWithImpl<$Res, Specs>;
  @useResult
  $Res call({String? productionStatus});
}

/// @nodoc
class _$SpecsCopyWithImpl<$Res, $Val extends Specs>
    implements $SpecsCopyWith<$Res> {
  _$SpecsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productionStatus = freezed,
  }) {
    return _then(_value.copyWith(
      productionStatus: freezed == productionStatus
          ? _value.productionStatus
          : productionStatus // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SpecsImplCopyWith<$Res> implements $SpecsCopyWith<$Res> {
  factory _$$SpecsImplCopyWith(
          _$SpecsImpl value, $Res Function(_$SpecsImpl) then) =
      __$$SpecsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? productionStatus});
}

/// @nodoc
class __$$SpecsImplCopyWithImpl<$Res>
    extends _$SpecsCopyWithImpl<$Res, _$SpecsImpl>
    implements _$$SpecsImplCopyWith<$Res> {
  __$$SpecsImplCopyWithImpl(
      _$SpecsImpl _value, $Res Function(_$SpecsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productionStatus = freezed,
  }) {
    return _then(_$SpecsImpl(
      productionStatus: freezed == productionStatus
          ? _value.productionStatus
          : productionStatus // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SpecsImpl implements _Specs {
  _$SpecsImpl({this.productionStatus});

  factory _$SpecsImpl.fromJson(Map<String, dynamic> json) =>
      _$$SpecsImplFromJson(json);

  @override
  final String? productionStatus;

  @override
  String toString() {
    return 'Specs(productionStatus: $productionStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpecsImpl &&
            (identical(other.productionStatus, productionStatus) ||
                other.productionStatus == productionStatus));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, productionStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SpecsImplCopyWith<_$SpecsImpl> get copyWith =>
      __$$SpecsImplCopyWithImpl<_$SpecsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SpecsImplToJson(
      this,
    );
  }
}

abstract class _Specs implements Specs {
  factory _Specs({final String? productionStatus}) = _$SpecsImpl;

  factory _Specs.fromJson(Map<String, dynamic> json) = _$SpecsImpl.fromJson;

  @override
  String? get productionStatus;
  @override
  @JsonKey(ignore: true)
  _$$SpecsImplCopyWith<_$SpecsImpl> get copyWith =>
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
      String level});
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
      String level});
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
      required this.level});

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
  String toString() {
    return 'Stock(unlimited: $unlimited, show: $show, available: $available, backOrder: $backOrder, qty: $qty, backOrderQty: $backOrderQty, level: $level)';
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
            (identical(other.level, level) || other.level == level));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, unlimited, show, available,
      backOrder, qty, backOrderQty, level);

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
      required final String level}) = _$StockImpl;

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
  @JsonKey(ignore: true)
  _$$StockImplCopyWith<_$StockImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Media _$MediaFromJson(Map<String, dynamic> json) {
  return _Media.fromJson(json);
}

/// @nodoc
mixin _$Media {
  ImageUrl? get thumbnail => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MediaCopyWith<Media> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaCopyWith<$Res> {
  factory $MediaCopyWith(Media value, $Res Function(Media) then) =
      _$MediaCopyWithImpl<$Res, Media>;
  @useResult
  $Res call({ImageUrl? thumbnail});

  $ImageUrlCopyWith<$Res>? get thumbnail;
}

/// @nodoc
class _$MediaCopyWithImpl<$Res, $Val extends Media>
    implements $MediaCopyWith<$Res> {
  _$MediaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? thumbnail = freezed,
  }) {
    return _then(_value.copyWith(
      thumbnail: freezed == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as ImageUrl?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ImageUrlCopyWith<$Res>? get thumbnail {
    if (_value.thumbnail == null) {
      return null;
    }

    return $ImageUrlCopyWith<$Res>(_value.thumbnail!, (value) {
      return _then(_value.copyWith(thumbnail: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MediaImplCopyWith<$Res> implements $MediaCopyWith<$Res> {
  factory _$$MediaImplCopyWith(
          _$MediaImpl value, $Res Function(_$MediaImpl) then) =
      __$$MediaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ImageUrl? thumbnail});

  @override
  $ImageUrlCopyWith<$Res>? get thumbnail;
}

/// @nodoc
class __$$MediaImplCopyWithImpl<$Res>
    extends _$MediaCopyWithImpl<$Res, _$MediaImpl>
    implements _$$MediaImplCopyWith<$Res> {
  __$$MediaImplCopyWithImpl(
      _$MediaImpl _value, $Res Function(_$MediaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? thumbnail = freezed,
  }) {
    return _then(_$MediaImpl(
      thumbnail: freezed == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as ImageUrl?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MediaImpl implements _Media {
  _$MediaImpl({required this.thumbnail});

  factory _$MediaImpl.fromJson(Map<String, dynamic> json) =>
      _$$MediaImplFromJson(json);

  @override
  final ImageUrl? thumbnail;

  @override
  String toString() {
    return 'Media(thumbnail: $thumbnail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MediaImpl &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, thumbnail);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MediaImplCopyWith<_$MediaImpl> get copyWith =>
      __$$MediaImplCopyWithImpl<_$MediaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MediaImplToJson(
      this,
    );
  }
}

abstract class _Media implements Media {
  factory _Media({required final ImageUrl? thumbnail}) = _$MediaImpl;

  factory _Media.fromJson(Map<String, dynamic> json) = _$MediaImpl.fromJson;

  @override
  ImageUrl? get thumbnail;
  @override
  @JsonKey(ignore: true)
  _$$MediaImplCopyWith<_$MediaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ImageUrl _$ImageUrlFromJson(Map<String, dynamic> json) {
  return _ImageUrl.fromJson(json);
}

/// @nodoc
mixin _$ImageUrl {
  String get storeSmall => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImageUrlCopyWith<ImageUrl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageUrlCopyWith<$Res> {
  factory $ImageUrlCopyWith(ImageUrl value, $Res Function(ImageUrl) then) =
      _$ImageUrlCopyWithImpl<$Res, ImageUrl>;
  @useResult
  $Res call({String storeSmall});
}

/// @nodoc
class _$ImageUrlCopyWithImpl<$Res, $Val extends ImageUrl>
    implements $ImageUrlCopyWith<$Res> {
  _$ImageUrlCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storeSmall = null,
  }) {
    return _then(_value.copyWith(
      storeSmall: null == storeSmall
          ? _value.storeSmall
          : storeSmall // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ImageUrlImplCopyWith<$Res>
    implements $ImageUrlCopyWith<$Res> {
  factory _$$ImageUrlImplCopyWith(
          _$ImageUrlImpl value, $Res Function(_$ImageUrlImpl) then) =
      __$$ImageUrlImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String storeSmall});
}

/// @nodoc
class __$$ImageUrlImplCopyWithImpl<$Res>
    extends _$ImageUrlCopyWithImpl<$Res, _$ImageUrlImpl>
    implements _$$ImageUrlImplCopyWith<$Res> {
  __$$ImageUrlImplCopyWithImpl(
      _$ImageUrlImpl _value, $Res Function(_$ImageUrlImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storeSmall = null,
  }) {
    return _then(_$ImageUrlImpl(
      storeSmall: null == storeSmall
          ? _value.storeSmall
          : storeSmall // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ImageUrlImpl implements _ImageUrl {
  const _$ImageUrlImpl({required this.storeSmall});

  factory _$ImageUrlImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImageUrlImplFromJson(json);

  @override
  final String storeSmall;

  @override
  String toString() {
    return 'ImageUrl(storeSmall: $storeSmall)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageUrlImpl &&
            (identical(other.storeSmall, storeSmall) ||
                other.storeSmall == storeSmall));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, storeSmall);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageUrlImplCopyWith<_$ImageUrlImpl> get copyWith =>
      __$$ImageUrlImplCopyWithImpl<_$ImageUrlImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImageUrlImplToJson(
      this,
    );
  }
}

abstract class _ImageUrl implements ImageUrl {
  const factory _ImageUrl({required final String storeSmall}) = _$ImageUrlImpl;

  factory _ImageUrl.fromJson(Map<String, dynamic> json) =
      _$ImageUrlImpl.fromJson;

  @override
  String get storeSmall;
  @override
  @JsonKey(ignore: true)
  _$$ImageUrlImplCopyWith<_$ImageUrlImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PublicType _$PublicTypeFromJson(Map<String, dynamic> json) {
  return _PublicType.fromJson(json);
}

/// @nodoc
mixin _$PublicType {
  String get code => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PublicTypeCopyWith<PublicType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PublicTypeCopyWith<$Res> {
  factory $PublicTypeCopyWith(
          PublicType value, $Res Function(PublicType) then) =
      _$PublicTypeCopyWithImpl<$Res, PublicType>;
  @useResult
  $Res call({String code, String label});
}

/// @nodoc
class _$PublicTypeCopyWithImpl<$Res, $Val extends PublicType>
    implements $PublicTypeCopyWith<$Res> {
  _$PublicTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? label = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PublicTypeImplCopyWith<$Res>
    implements $PublicTypeCopyWith<$Res> {
  factory _$$PublicTypeImplCopyWith(
          _$PublicTypeImpl value, $Res Function(_$PublicTypeImpl) then) =
      __$$PublicTypeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code, String label});
}

/// @nodoc
class __$$PublicTypeImplCopyWithImpl<$Res>
    extends _$PublicTypeCopyWithImpl<$Res, _$PublicTypeImpl>
    implements _$$PublicTypeImplCopyWith<$Res> {
  __$$PublicTypeImplCopyWithImpl(
      _$PublicTypeImpl _value, $Res Function(_$PublicTypeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? label = null,
  }) {
    return _then(_$PublicTypeImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PublicTypeImpl implements _PublicType {
  _$PublicTypeImpl({required this.code, required this.label});

  factory _$PublicTypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$PublicTypeImplFromJson(json);

  @override
  final String code;
  @override
  final String label;

  @override
  String toString() {
    return 'PublicType(code: $code, label: $label)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PublicTypeImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.label, label) || other.label == label));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, code, label);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PublicTypeImplCopyWith<_$PublicTypeImpl> get copyWith =>
      __$$PublicTypeImplCopyWithImpl<_$PublicTypeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PublicTypeImplToJson(
      this,
    );
  }
}

abstract class _PublicType implements PublicType {
  factory _PublicType(
      {required final String code,
      required final String label}) = _$PublicTypeImpl;

  factory _PublicType.fromJson(Map<String, dynamic> json) =
      _$PublicTypeImpl.fromJson;

  @override
  String get code;
  @override
  String get label;
  @override
  @JsonKey(ignore: true)
  _$$PublicTypeImplCopyWith<_$PublicTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Price _$PriceFromJson(Map<String, dynamic> json) {
  return _Price.fromJson(json);
}

/// @nodoc
mixin _$Price {
  int get amount => throw _privateConstructorUsedError;
  int? get discounted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PriceCopyWith<Price> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceCopyWith<$Res> {
  factory $PriceCopyWith(Price value, $Res Function(Price) then) =
      _$PriceCopyWithImpl<$Res, Price>;
  @useResult
  $Res call({int amount, int? discounted});
}

/// @nodoc
class _$PriceCopyWithImpl<$Res, $Val extends Price>
    implements $PriceCopyWith<$Res> {
  _$PriceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? discounted = freezed,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PriceImplCopyWith<$Res> implements $PriceCopyWith<$Res> {
  factory _$$PriceImplCopyWith(
          _$PriceImpl value, $Res Function(_$PriceImpl) then) =
      __$$PriceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int amount, int? discounted});
}

/// @nodoc
class __$$PriceImplCopyWithImpl<$Res>
    extends _$PriceCopyWithImpl<$Res, _$PriceImpl>
    implements _$$PriceImplCopyWith<$Res> {
  __$$PriceImplCopyWithImpl(
      _$PriceImpl _value, $Res Function(_$PriceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? discounted = freezed,
  }) {
    return _then(_$PriceImpl(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      discounted: freezed == discounted
          ? _value.discounted
          : discounted // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PriceImpl implements _Price {
  _$PriceImpl({required this.amount, this.discounted});

  factory _$PriceImpl.fromJson(Map<String, dynamic> json) =>
      _$$PriceImplFromJson(json);

  @override
  final int amount;
  @override
  final int? discounted;

  @override
  String toString() {
    return 'Price(amount: $amount, discounted: $discounted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PriceImpl &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.discounted, discounted) ||
                other.discounted == discounted));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, amount, discounted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PriceImplCopyWith<_$PriceImpl> get copyWith =>
      __$$PriceImplCopyWithImpl<_$PriceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PriceImplToJson(
      this,
    );
  }
}

abstract class _Price implements Price {
  factory _Price({required final int amount, final int? discounted}) =
      _$PriceImpl;

  factory _Price.fromJson(Map<String, dynamic> json) = _$PriceImpl.fromJson;

  @override
  int get amount;
  @override
  int? get discounted;
  @override
  @JsonKey(ignore: true)
  _$$PriceImplCopyWith<_$PriceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UnitPrice _$UnitPriceFromJson(Map<String, dynamic> json) {
  return _UnitPrice.fromJson(json);
}

/// @nodoc
mixin _$UnitPrice {
  int get amount => throw _privateConstructorUsedError;
  int? get discounted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnitPriceCopyWith<UnitPrice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnitPriceCopyWith<$Res> {
  factory $UnitPriceCopyWith(UnitPrice value, $Res Function(UnitPrice) then) =
      _$UnitPriceCopyWithImpl<$Res, UnitPrice>;
  @useResult
  $Res call({int amount, int? discounted});
}

/// @nodoc
class _$UnitPriceCopyWithImpl<$Res, $Val extends UnitPrice>
    implements $UnitPriceCopyWith<$Res> {
  _$UnitPriceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? discounted = freezed,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UnitPriceImplCopyWith<$Res>
    implements $UnitPriceCopyWith<$Res> {
  factory _$$UnitPriceImplCopyWith(
          _$UnitPriceImpl value, $Res Function(_$UnitPriceImpl) then) =
      __$$UnitPriceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int amount, int? discounted});
}

/// @nodoc
class __$$UnitPriceImplCopyWithImpl<$Res>
    extends _$UnitPriceCopyWithImpl<$Res, _$UnitPriceImpl>
    implements _$$UnitPriceImplCopyWith<$Res> {
  __$$UnitPriceImplCopyWithImpl(
      _$UnitPriceImpl _value, $Res Function(_$UnitPriceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? discounted = freezed,
  }) {
    return _then(_$UnitPriceImpl(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      discounted: freezed == discounted
          ? _value.discounted
          : discounted // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UnitPriceImpl implements _UnitPrice {
  _$UnitPriceImpl({required this.amount, this.discounted});

  factory _$UnitPriceImpl.fromJson(Map<String, dynamic> json) =>
      _$$UnitPriceImplFromJson(json);

  @override
  final int amount;
  @override
  final int? discounted;

  @override
  String toString() {
    return 'UnitPrice(amount: $amount, discounted: $discounted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnitPriceImpl &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.discounted, discounted) ||
                other.discounted == discounted));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, amount, discounted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UnitPriceImplCopyWith<_$UnitPriceImpl> get copyWith =>
      __$$UnitPriceImplCopyWithImpl<_$UnitPriceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UnitPriceImplToJson(
      this,
    );
  }
}

abstract class _UnitPrice implements UnitPrice {
  factory _UnitPrice({required final int amount, final int? discounted}) =
      _$UnitPriceImpl;

  factory _UnitPrice.fromJson(Map<String, dynamic> json) =
      _$UnitPriceImpl.fromJson;

  @override
  int get amount;
  @override
  int? get discounted;
  @override
  @JsonKey(ignore: true)
  _$$UnitPriceImplCopyWith<_$UnitPriceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Upgrade _$UpgradeFromJson(Map<String, dynamic> json) {
  return _Upgrade.fromJson(json);
}

/// @nodoc
mixin _$Upgrade {
  String get name => throw _privateConstructorUsedError;
  int get fromShipId => throw _privateConstructorUsedError;
  int get toShipId => throw _privateConstructorUsedError;
  int get toSkuId => throw _privateConstructorUsedError;
  String get thumbnail => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpgradeCopyWith<Upgrade> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpgradeCopyWith<$Res> {
  factory $UpgradeCopyWith(Upgrade value, $Res Function(Upgrade) then) =
      _$UpgradeCopyWithImpl<$Res, Upgrade>;
  @useResult
  $Res call(
      {String name,
      int fromShipId,
      int toShipId,
      int toSkuId,
      String thumbnail});
}

/// @nodoc
class _$UpgradeCopyWithImpl<$Res, $Val extends Upgrade>
    implements $UpgradeCopyWith<$Res> {
  _$UpgradeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? fromShipId = null,
    Object? toShipId = null,
    Object? toSkuId = null,
    Object? thumbnail = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      fromShipId: null == fromShipId
          ? _value.fromShipId
          : fromShipId // ignore: cast_nullable_to_non_nullable
              as int,
      toShipId: null == toShipId
          ? _value.toShipId
          : toShipId // ignore: cast_nullable_to_non_nullable
              as int,
      toSkuId: null == toSkuId
          ? _value.toSkuId
          : toSkuId // ignore: cast_nullable_to_non_nullable
              as int,
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpgradeImplCopyWith<$Res> implements $UpgradeCopyWith<$Res> {
  factory _$$UpgradeImplCopyWith(
          _$UpgradeImpl value, $Res Function(_$UpgradeImpl) then) =
      __$$UpgradeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      int fromShipId,
      int toShipId,
      int toSkuId,
      String thumbnail});
}

/// @nodoc
class __$$UpgradeImplCopyWithImpl<$Res>
    extends _$UpgradeCopyWithImpl<$Res, _$UpgradeImpl>
    implements _$$UpgradeImplCopyWith<$Res> {
  __$$UpgradeImplCopyWithImpl(
      _$UpgradeImpl _value, $Res Function(_$UpgradeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? fromShipId = null,
    Object? toShipId = null,
    Object? toSkuId = null,
    Object? thumbnail = null,
  }) {
    return _then(_$UpgradeImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      fromShipId: null == fromShipId
          ? _value.fromShipId
          : fromShipId // ignore: cast_nullable_to_non_nullable
              as int,
      toShipId: null == toShipId
          ? _value.toShipId
          : toShipId // ignore: cast_nullable_to_non_nullable
              as int,
      toSkuId: null == toSkuId
          ? _value.toSkuId
          : toSkuId // ignore: cast_nullable_to_non_nullable
              as int,
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpgradeImpl implements _Upgrade {
  _$UpgradeImpl(
      {required this.name,
      required this.fromShipId,
      required this.toShipId,
      required this.toSkuId,
      required this.thumbnail});

  factory _$UpgradeImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpgradeImplFromJson(json);

  @override
  final String name;
  @override
  final int fromShipId;
  @override
  final int toShipId;
  @override
  final int toSkuId;
  @override
  final String thumbnail;

  @override
  String toString() {
    return 'Upgrade(name: $name, fromShipId: $fromShipId, toShipId: $toShipId, toSkuId: $toSkuId, thumbnail: $thumbnail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpgradeImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.fromShipId, fromShipId) ||
                other.fromShipId == fromShipId) &&
            (identical(other.toShipId, toShipId) ||
                other.toShipId == toShipId) &&
            (identical(other.toSkuId, toSkuId) || other.toSkuId == toSkuId) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, fromShipId, toShipId, toSkuId, thumbnail);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpgradeImplCopyWith<_$UpgradeImpl> get copyWith =>
      __$$UpgradeImplCopyWithImpl<_$UpgradeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpgradeImplToJson(
      this,
    );
  }
}

abstract class _Upgrade implements Upgrade {
  factory _Upgrade(
      {required final String name,
      required final int fromShipId,
      required final int toShipId,
      required final int toSkuId,
      required final String thumbnail}) = _$UpgradeImpl;

  factory _Upgrade.fromJson(Map<String, dynamic> json) = _$UpgradeImpl.fromJson;

  @override
  String get name;
  @override
  int get fromShipId;
  @override
  int get toShipId;
  @override
  int get toSkuId;
  @override
  String get thumbnail;
  @override
  @JsonKey(ignore: true)
  _$$UpgradeImplCopyWith<_$UpgradeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
