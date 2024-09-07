// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_summary_property.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CartSummaryProperty _$CartSummaryPropertyFromJson(Map<String, dynamic> json) {
  return _CartSummaryProperty.fromJson(json);
}

/// @nodoc
mixin _$CartSummaryProperty {
  Account get account => throw _privateConstructorUsedError;
  Store get store => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CartSummaryPropertyCopyWith<CartSummaryProperty> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartSummaryPropertyCopyWith<$Res> {
  factory $CartSummaryPropertyCopyWith(
          CartSummaryProperty value, $Res Function(CartSummaryProperty) then) =
      _$CartSummaryPropertyCopyWithImpl<$Res, CartSummaryProperty>;
  @useResult
  $Res call({Account account, Store store});

  $AccountCopyWith<$Res> get account;
  $StoreCopyWith<$Res> get store;
}

/// @nodoc
class _$CartSummaryPropertyCopyWithImpl<$Res, $Val extends CartSummaryProperty>
    implements $CartSummaryPropertyCopyWith<$Res> {
  _$CartSummaryPropertyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? account = null,
    Object? store = null,
  }) {
    return _then(_value.copyWith(
      account: null == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as Account,
      store: null == store
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as Store,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AccountCopyWith<$Res> get account {
    return $AccountCopyWith<$Res>(_value.account, (value) {
      return _then(_value.copyWith(account: value) as $Val);
    });
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
abstract class _$$CartSummaryPropertyImplCopyWith<$Res>
    implements $CartSummaryPropertyCopyWith<$Res> {
  factory _$$CartSummaryPropertyImplCopyWith(_$CartSummaryPropertyImpl value,
          $Res Function(_$CartSummaryPropertyImpl) then) =
      __$$CartSummaryPropertyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Account account, Store store});

  @override
  $AccountCopyWith<$Res> get account;
  @override
  $StoreCopyWith<$Res> get store;
}

/// @nodoc
class __$$CartSummaryPropertyImplCopyWithImpl<$Res>
    extends _$CartSummaryPropertyCopyWithImpl<$Res, _$CartSummaryPropertyImpl>
    implements _$$CartSummaryPropertyImplCopyWith<$Res> {
  __$$CartSummaryPropertyImplCopyWithImpl(_$CartSummaryPropertyImpl _value,
      $Res Function(_$CartSummaryPropertyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? account = null,
    Object? store = null,
  }) {
    return _then(_$CartSummaryPropertyImpl(
      account: null == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as Account,
      store: null == store
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as Store,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CartSummaryPropertyImpl implements _CartSummaryProperty {
  _$CartSummaryPropertyImpl({required this.account, required this.store});

  factory _$CartSummaryPropertyImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartSummaryPropertyImplFromJson(json);

  @override
  final Account account;
  @override
  final Store store;

  @override
  String toString() {
    return 'CartSummaryProperty(account: $account, store: $store)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartSummaryPropertyImpl &&
            (identical(other.account, account) || other.account == account) &&
            (identical(other.store, store) || other.store == store));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, account, store);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CartSummaryPropertyImplCopyWith<_$CartSummaryPropertyImpl> get copyWith =>
      __$$CartSummaryPropertyImplCopyWithImpl<_$CartSummaryPropertyImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CartSummaryPropertyImplToJson(
      this,
    );
  }
}

abstract class _CartSummaryProperty implements CartSummaryProperty {
  factory _CartSummaryProperty(
      {required final Account account,
      required final Store store}) = _$CartSummaryPropertyImpl;

  factory _CartSummaryProperty.fromJson(Map<String, dynamic> json) =
      _$CartSummaryPropertyImpl.fromJson;

  @override
  Account get account;
  @override
  Store get store;
  @override
  @JsonKey(ignore: true)
  _$$CartSummaryPropertyImplCopyWith<_$CartSummaryPropertyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Account _$AccountFromJson(Map<String, dynamic> json) {
  return _Account.fromJson(json);
}

/// @nodoc
mixin _$Account {
  bool get isAnonymous => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountCopyWith<Account> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountCopyWith<$Res> {
  factory $AccountCopyWith(Account value, $Res Function(Account) then) =
      _$AccountCopyWithImpl<$Res, Account>;
  @useResult
  $Res call({bool isAnonymous});
}

/// @nodoc
class _$AccountCopyWithImpl<$Res, $Val extends Account>
    implements $AccountCopyWith<$Res> {
  _$AccountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAnonymous = null,
  }) {
    return _then(_value.copyWith(
      isAnonymous: null == isAnonymous
          ? _value.isAnonymous
          : isAnonymous // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AccountImplCopyWith<$Res> implements $AccountCopyWith<$Res> {
  factory _$$AccountImplCopyWith(
          _$AccountImpl value, $Res Function(_$AccountImpl) then) =
      __$$AccountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isAnonymous});
}

/// @nodoc
class __$$AccountImplCopyWithImpl<$Res>
    extends _$AccountCopyWithImpl<$Res, _$AccountImpl>
    implements _$$AccountImplCopyWith<$Res> {
  __$$AccountImplCopyWithImpl(
      _$AccountImpl _value, $Res Function(_$AccountImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAnonymous = null,
  }) {
    return _then(_$AccountImpl(
      isAnonymous: null == isAnonymous
          ? _value.isAnonymous
          : isAnonymous // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AccountImpl implements _Account {
  _$AccountImpl({required this.isAnonymous});

  factory _$AccountImpl.fromJson(Map<String, dynamic> json) =>
      _$$AccountImplFromJson(json);

  @override
  final bool isAnonymous;

  @override
  String toString() {
    return 'Account(isAnonymous: $isAnonymous)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountImpl &&
            (identical(other.isAnonymous, isAnonymous) ||
                other.isAnonymous == isAnonymous));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isAnonymous);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountImplCopyWith<_$AccountImpl> get copyWith =>
      __$$AccountImplCopyWithImpl<_$AccountImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AccountImplToJson(
      this,
    );
  }
}

abstract class _Account implements Account {
  factory _Account({required final bool isAnonymous}) = _$AccountImpl;

  factory _Account.fromJson(Map<String, dynamic> json) = _$AccountImpl.fromJson;

  @override
  bool get isAnonymous;
  @override
  @JsonKey(ignore: true)
  _$$AccountImplCopyWith<_$AccountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Store _$StoreFromJson(Map<String, dynamic> json) {
  return _Store.fromJson(json);
}

/// @nodoc
mixin _$Store {
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
  $Res call({Cart cart});

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
    Object? cart = null,
  }) {
    return _then(_value.copyWith(
      cart: null == cart
          ? _value.cart
          : cart // ignore: cast_nullable_to_non_nullable
              as Cart,
    ) as $Val);
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
  $Res call({Cart cart});

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
    Object? cart = null,
  }) {
    return _then(_$StoreImpl(
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
  _$StoreImpl({required this.cart});

  factory _$StoreImpl.fromJson(Map<String, dynamic> json) =>
      _$$StoreImplFromJson(json);

  @override
  final Cart cart;

  @override
  String toString() {
    return 'Store(cart: $cart)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoreImpl &&
            (identical(other.cart, cart) || other.cart == cart));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, cart);

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
  factory _Store({required final Cart cart}) = _$StoreImpl;

  factory _Store.fromJson(Map<String, dynamic> json) = _$StoreImpl.fromJson;

  @override
  Cart get cart;
  @override
  @JsonKey(ignore: true)
  _$$StoreImplCopyWith<_$StoreImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Cart _$CartFromJson(Map<String, dynamic> json) {
  return _Cart.fromJson(json);
}

/// @nodoc
mixin _$Cart {
  Totals get totals => throw _privateConstructorUsedError;
  Flow get flow => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CartCopyWith<Cart> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartCopyWith<$Res> {
  factory $CartCopyWith(Cart value, $Res Function(Cart) then) =
      _$CartCopyWithImpl<$Res, Cart>;
  @useResult
  $Res call({Totals totals, Flow flow});

  $TotalsCopyWith<$Res> get totals;
  $FlowCopyWith<$Res> get flow;
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
    Object? totals = null,
    Object? flow = null,
  }) {
    return _then(_value.copyWith(
      totals: null == totals
          ? _value.totals
          : totals // ignore: cast_nullable_to_non_nullable
              as Totals,
      flow: null == flow
          ? _value.flow
          : flow // ignore: cast_nullable_to_non_nullable
              as Flow,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TotalsCopyWith<$Res> get totals {
    return $TotalsCopyWith<$Res>(_value.totals, (value) {
      return _then(_value.copyWith(totals: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $FlowCopyWith<$Res> get flow {
    return $FlowCopyWith<$Res>(_value.flow, (value) {
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
  $Res call({Totals totals, Flow flow});

  @override
  $TotalsCopyWith<$Res> get totals;
  @override
  $FlowCopyWith<$Res> get flow;
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
    Object? totals = null,
    Object? flow = null,
  }) {
    return _then(_$CartImpl(
      totals: null == totals
          ? _value.totals
          : totals // ignore: cast_nullable_to_non_nullable
              as Totals,
      flow: null == flow
          ? _value.flow
          : flow // ignore: cast_nullable_to_non_nullable
              as Flow,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CartImpl implements _Cart {
  _$CartImpl({required this.totals, required this.flow});

  factory _$CartImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartImplFromJson(json);

  @override
  final Totals totals;
  @override
  final Flow flow;

  @override
  String toString() {
    return 'Cart(totals: $totals, flow: $flow)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartImpl &&
            (identical(other.totals, totals) || other.totals == totals) &&
            (identical(other.flow, flow) || other.flow == flow));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, totals, flow);

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
  factory _Cart({required final Totals totals, required final Flow flow}) =
      _$CartImpl;

  factory _Cart.fromJson(Map<String, dynamic> json) = _$CartImpl.fromJson;

  @override
  Totals get totals;
  @override
  Flow get flow;
  @override
  @JsonKey(ignore: true)
  _$$CartImplCopyWith<_$CartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Totals _$TotalsFromJson(Map<String, dynamic> json) {
  return _Totals.fromJson(json);
}

/// @nodoc
mixin _$Totals {
  int get discount => throw _privateConstructorUsedError;
  int get shipping => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  int get subTotal => throw _privateConstructorUsedError;
  Tax get tax1 => throw _privateConstructorUsedError;
  Tax get tax2 => throw _privateConstructorUsedError;
  Coupon get coupon => throw _privateConstructorUsedError;
  Credits get credits => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TotalsCopyWith<Totals> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TotalsCopyWith<$Res> {
  factory $TotalsCopyWith(Totals value, $Res Function(Totals) then) =
      _$TotalsCopyWithImpl<$Res, Totals>;
  @useResult
  $Res call(
      {int discount,
      int shipping,
      int total,
      int subTotal,
      Tax tax1,
      Tax tax2,
      Coupon coupon,
      Credits credits});

  $TaxCopyWith<$Res> get tax1;
  $TaxCopyWith<$Res> get tax2;
  $CouponCopyWith<$Res> get coupon;
  $CreditsCopyWith<$Res> get credits;
}

/// @nodoc
class _$TotalsCopyWithImpl<$Res, $Val extends Totals>
    implements $TotalsCopyWith<$Res> {
  _$TotalsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? discount = null,
    Object? shipping = null,
    Object? total = null,
    Object? subTotal = null,
    Object? tax1 = null,
    Object? tax2 = null,
    Object? coupon = null,
    Object? credits = null,
  }) {
    return _then(_value.copyWith(
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as int,
      shipping: null == shipping
          ? _value.shipping
          : shipping // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      subTotal: null == subTotal
          ? _value.subTotal
          : subTotal // ignore: cast_nullable_to_non_nullable
              as int,
      tax1: null == tax1
          ? _value.tax1
          : tax1 // ignore: cast_nullable_to_non_nullable
              as Tax,
      tax2: null == tax2
          ? _value.tax2
          : tax2 // ignore: cast_nullable_to_non_nullable
              as Tax,
      coupon: null == coupon
          ? _value.coupon
          : coupon // ignore: cast_nullable_to_non_nullable
              as Coupon,
      credits: null == credits
          ? _value.credits
          : credits // ignore: cast_nullable_to_non_nullable
              as Credits,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TaxCopyWith<$Res> get tax1 {
    return $TaxCopyWith<$Res>(_value.tax1, (value) {
      return _then(_value.copyWith(tax1: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TaxCopyWith<$Res> get tax2 {
    return $TaxCopyWith<$Res>(_value.tax2, (value) {
      return _then(_value.copyWith(tax2: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CouponCopyWith<$Res> get coupon {
    return $CouponCopyWith<$Res>(_value.coupon, (value) {
      return _then(_value.copyWith(coupon: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CreditsCopyWith<$Res> get credits {
    return $CreditsCopyWith<$Res>(_value.credits, (value) {
      return _then(_value.copyWith(credits: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TotalsImplCopyWith<$Res> implements $TotalsCopyWith<$Res> {
  factory _$$TotalsImplCopyWith(
          _$TotalsImpl value, $Res Function(_$TotalsImpl) then) =
      __$$TotalsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int discount,
      int shipping,
      int total,
      int subTotal,
      Tax tax1,
      Tax tax2,
      Coupon coupon,
      Credits credits});

  @override
  $TaxCopyWith<$Res> get tax1;
  @override
  $TaxCopyWith<$Res> get tax2;
  @override
  $CouponCopyWith<$Res> get coupon;
  @override
  $CreditsCopyWith<$Res> get credits;
}

/// @nodoc
class __$$TotalsImplCopyWithImpl<$Res>
    extends _$TotalsCopyWithImpl<$Res, _$TotalsImpl>
    implements _$$TotalsImplCopyWith<$Res> {
  __$$TotalsImplCopyWithImpl(
      _$TotalsImpl _value, $Res Function(_$TotalsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? discount = null,
    Object? shipping = null,
    Object? total = null,
    Object? subTotal = null,
    Object? tax1 = null,
    Object? tax2 = null,
    Object? coupon = null,
    Object? credits = null,
  }) {
    return _then(_$TotalsImpl(
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as int,
      shipping: null == shipping
          ? _value.shipping
          : shipping // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      subTotal: null == subTotal
          ? _value.subTotal
          : subTotal // ignore: cast_nullable_to_non_nullable
              as int,
      tax1: null == tax1
          ? _value.tax1
          : tax1 // ignore: cast_nullable_to_non_nullable
              as Tax,
      tax2: null == tax2
          ? _value.tax2
          : tax2 // ignore: cast_nullable_to_non_nullable
              as Tax,
      coupon: null == coupon
          ? _value.coupon
          : coupon // ignore: cast_nullable_to_non_nullable
              as Coupon,
      credits: null == credits
          ? _value.credits
          : credits // ignore: cast_nullable_to_non_nullable
              as Credits,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TotalsImpl implements _Totals {
  _$TotalsImpl(
      {required this.discount,
      required this.shipping,
      required this.total,
      required this.subTotal,
      required this.tax1,
      required this.tax2,
      required this.coupon,
      required this.credits});

  factory _$TotalsImpl.fromJson(Map<String, dynamic> json) =>
      _$$TotalsImplFromJson(json);

  @override
  final int discount;
  @override
  final int shipping;
  @override
  final int total;
  @override
  final int subTotal;
  @override
  final Tax tax1;
  @override
  final Tax tax2;
  @override
  final Coupon coupon;
  @override
  final Credits credits;

  @override
  String toString() {
    return 'Totals(discount: $discount, shipping: $shipping, total: $total, subTotal: $subTotal, tax1: $tax1, tax2: $tax2, coupon: $coupon, credits: $credits)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TotalsImpl &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.shipping, shipping) ||
                other.shipping == shipping) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.subTotal, subTotal) ||
                other.subTotal == subTotal) &&
            (identical(other.tax1, tax1) || other.tax1 == tax1) &&
            (identical(other.tax2, tax2) || other.tax2 == tax2) &&
            (identical(other.coupon, coupon) || other.coupon == coupon) &&
            (identical(other.credits, credits) || other.credits == credits));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, discount, shipping, total,
      subTotal, tax1, tax2, coupon, credits);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TotalsImplCopyWith<_$TotalsImpl> get copyWith =>
      __$$TotalsImplCopyWithImpl<_$TotalsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TotalsImplToJson(
      this,
    );
  }
}

abstract class _Totals implements Totals {
  factory _Totals(
      {required final int discount,
      required final int shipping,
      required final int total,
      required final int subTotal,
      required final Tax tax1,
      required final Tax tax2,
      required final Coupon coupon,
      required final Credits credits}) = _$TotalsImpl;

  factory _Totals.fromJson(Map<String, dynamic> json) = _$TotalsImpl.fromJson;

  @override
  int get discount;
  @override
  int get shipping;
  @override
  int get total;
  @override
  int get subTotal;
  @override
  Tax get tax1;
  @override
  Tax get tax2;
  @override
  Coupon get coupon;
  @override
  Credits get credits;
  @override
  @JsonKey(ignore: true)
  _$$TotalsImplCopyWith<_$TotalsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Tax _$TaxFromJson(Map<String, dynamic> json) {
  return _Tax.fromJson(json);
}

/// @nodoc
mixin _$Tax {
  String? get name => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaxCopyWith<Tax> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaxCopyWith<$Res> {
  factory $TaxCopyWith(Tax value, $Res Function(Tax) then) =
      _$TaxCopyWithImpl<$Res, Tax>;
  @useResult
  $Res call({String? name, int amount});
}

/// @nodoc
class _$TaxCopyWithImpl<$Res, $Val extends Tax> implements $TaxCopyWith<$Res> {
  _$TaxCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? amount = null,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaxImplCopyWith<$Res> implements $TaxCopyWith<$Res> {
  factory _$$TaxImplCopyWith(_$TaxImpl value, $Res Function(_$TaxImpl) then) =
      __$$TaxImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, int amount});
}

/// @nodoc
class __$$TaxImplCopyWithImpl<$Res> extends _$TaxCopyWithImpl<$Res, _$TaxImpl>
    implements _$$TaxImplCopyWith<$Res> {
  __$$TaxImplCopyWithImpl(_$TaxImpl _value, $Res Function(_$TaxImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? amount = null,
  }) {
    return _then(_$TaxImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaxImpl implements _Tax {
  _$TaxImpl({this.name, required this.amount});

  factory _$TaxImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaxImplFromJson(json);

  @override
  final String? name;
  @override
  final int amount;

  @override
  String toString() {
    return 'Tax(name: $name, amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaxImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, amount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaxImplCopyWith<_$TaxImpl> get copyWith =>
      __$$TaxImplCopyWithImpl<_$TaxImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaxImplToJson(
      this,
    );
  }
}

abstract class _Tax implements Tax {
  factory _Tax({final String? name, required final int amount}) = _$TaxImpl;

  factory _Tax.fromJson(Map<String, dynamic> json) = _$TaxImpl.fromJson;

  @override
  String? get name;
  @override
  int get amount;
  @override
  @JsonKey(ignore: true)
  _$$TaxImplCopyWith<_$TaxImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Coupon _$CouponFromJson(Map<String, dynamic> json) {
  return _Coupon.fromJson(json);
}

/// @nodoc
mixin _$Coupon {
  int get amount => throw _privateConstructorUsedError;
  bool get allowed => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CouponCopyWith<Coupon> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CouponCopyWith<$Res> {
  factory $CouponCopyWith(Coupon value, $Res Function(Coupon) then) =
      _$CouponCopyWithImpl<$Res, Coupon>;
  @useResult
  $Res call({int amount, bool allowed, String? code});
}

/// @nodoc
class _$CouponCopyWithImpl<$Res, $Val extends Coupon>
    implements $CouponCopyWith<$Res> {
  _$CouponCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? allowed = null,
    Object? code = freezed,
  }) {
    return _then(_value.copyWith(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      allowed: null == allowed
          ? _value.allowed
          : allowed // ignore: cast_nullable_to_non_nullable
              as bool,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CouponImplCopyWith<$Res> implements $CouponCopyWith<$Res> {
  factory _$$CouponImplCopyWith(
          _$CouponImpl value, $Res Function(_$CouponImpl) then) =
      __$$CouponImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int amount, bool allowed, String? code});
}

/// @nodoc
class __$$CouponImplCopyWithImpl<$Res>
    extends _$CouponCopyWithImpl<$Res, _$CouponImpl>
    implements _$$CouponImplCopyWith<$Res> {
  __$$CouponImplCopyWithImpl(
      _$CouponImpl _value, $Res Function(_$CouponImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? allowed = null,
    Object? code = freezed,
  }) {
    return _then(_$CouponImpl(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      allowed: null == allowed
          ? _value.allowed
          : allowed // ignore: cast_nullable_to_non_nullable
              as bool,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CouponImpl implements _Coupon {
  _$CouponImpl({required this.amount, required this.allowed, this.code});

  factory _$CouponImpl.fromJson(Map<String, dynamic> json) =>
      _$$CouponImplFromJson(json);

  @override
  final int amount;
  @override
  final bool allowed;
  @override
  final String? code;

  @override
  String toString() {
    return 'Coupon(amount: $amount, allowed: $allowed, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CouponImpl &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.allowed, allowed) || other.allowed == allowed) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, amount, allowed, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CouponImplCopyWith<_$CouponImpl> get copyWith =>
      __$$CouponImplCopyWithImpl<_$CouponImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CouponImplToJson(
      this,
    );
  }
}

abstract class _Coupon implements Coupon {
  factory _Coupon(
      {required final int amount,
      required final bool allowed,
      final String? code}) = _$CouponImpl;

  factory _Coupon.fromJson(Map<String, dynamic> json) = _$CouponImpl.fromJson;

  @override
  int get amount;
  @override
  bool get allowed;
  @override
  String? get code;
  @override
  @JsonKey(ignore: true)
  _$$CouponImplCopyWith<_$CouponImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Credits _$CreditsFromJson(Map<String, dynamic> json) {
  return _Credits.fromJson(json);
}

/// @nodoc
mixin _$Credits {
  int get amount => throw _privateConstructorUsedError;
  int? get nativeAmount => throw _privateConstructorUsedError;
  bool get applicable => throw _privateConstructorUsedError;
  int get maxApplicable => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreditsCopyWith<Credits> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreditsCopyWith<$Res> {
  factory $CreditsCopyWith(Credits value, $Res Function(Credits) then) =
      _$CreditsCopyWithImpl<$Res, Credits>;
  @useResult
  $Res call(
      {int amount, int? nativeAmount, bool applicable, int maxApplicable});
}

/// @nodoc
class _$CreditsCopyWithImpl<$Res, $Val extends Credits>
    implements $CreditsCopyWith<$Res> {
  _$CreditsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? nativeAmount = freezed,
    Object? applicable = null,
    Object? maxApplicable = null,
  }) {
    return _then(_value.copyWith(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      nativeAmount: freezed == nativeAmount
          ? _value.nativeAmount
          : nativeAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      applicable: null == applicable
          ? _value.applicable
          : applicable // ignore: cast_nullable_to_non_nullable
              as bool,
      maxApplicable: null == maxApplicable
          ? _value.maxApplicable
          : maxApplicable // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreditsImplCopyWith<$Res> implements $CreditsCopyWith<$Res> {
  factory _$$CreditsImplCopyWith(
          _$CreditsImpl value, $Res Function(_$CreditsImpl) then) =
      __$$CreditsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int amount, int? nativeAmount, bool applicable, int maxApplicable});
}

/// @nodoc
class __$$CreditsImplCopyWithImpl<$Res>
    extends _$CreditsCopyWithImpl<$Res, _$CreditsImpl>
    implements _$$CreditsImplCopyWith<$Res> {
  __$$CreditsImplCopyWithImpl(
      _$CreditsImpl _value, $Res Function(_$CreditsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? nativeAmount = freezed,
    Object? applicable = null,
    Object? maxApplicable = null,
  }) {
    return _then(_$CreditsImpl(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      nativeAmount: freezed == nativeAmount
          ? _value.nativeAmount
          : nativeAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      applicable: null == applicable
          ? _value.applicable
          : applicable // ignore: cast_nullable_to_non_nullable
              as bool,
      maxApplicable: null == maxApplicable
          ? _value.maxApplicable
          : maxApplicable // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreditsImpl implements _Credits {
  _$CreditsImpl(
      {required this.amount,
      this.nativeAmount,
      required this.applicable,
      required this.maxApplicable});

  factory _$CreditsImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreditsImplFromJson(json);

  @override
  final int amount;
  @override
  final int? nativeAmount;
  @override
  final bool applicable;
  @override
  final int maxApplicable;

  @override
  String toString() {
    return 'Credits(amount: $amount, nativeAmount: $nativeAmount, applicable: $applicable, maxApplicable: $maxApplicable)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreditsImpl &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.nativeAmount, nativeAmount) ||
                other.nativeAmount == nativeAmount) &&
            (identical(other.applicable, applicable) ||
                other.applicable == applicable) &&
            (identical(other.maxApplicable, maxApplicable) ||
                other.maxApplicable == maxApplicable));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, amount, nativeAmount, applicable, maxApplicable);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreditsImplCopyWith<_$CreditsImpl> get copyWith =>
      __$$CreditsImplCopyWithImpl<_$CreditsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreditsImplToJson(
      this,
    );
  }
}

abstract class _Credits implements Credits {
  factory _Credits(
      {required final int amount,
      final int? nativeAmount,
      required final bool applicable,
      required final int maxApplicable}) = _$CreditsImpl;

  factory _Credits.fromJson(Map<String, dynamic> json) = _$CreditsImpl.fromJson;

  @override
  int get amount;
  @override
  int? get nativeAmount;
  @override
  bool get applicable;
  @override
  int get maxApplicable;
  @override
  @JsonKey(ignore: true)
  _$$CreditsImplCopyWith<_$CreditsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Flow _$FlowFromJson(Map<String, dynamic> json) {
  return _Flow.fromJson(json);
}

/// @nodoc
mixin _$Flow {
  List<CartStep> get steps => throw _privateConstructorUsedError;
  Current get current => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FlowCopyWith<Flow> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlowCopyWith<$Res> {
  factory $FlowCopyWith(Flow value, $Res Function(Flow) then) =
      _$FlowCopyWithImpl<$Res, Flow>;
  @useResult
  $Res call({List<CartStep> steps, Current current});

  $CurrentCopyWith<$Res> get current;
}

/// @nodoc
class _$FlowCopyWithImpl<$Res, $Val extends Flow>
    implements $FlowCopyWith<$Res> {
  _$FlowCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? steps = null,
    Object? current = null,
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
abstract class _$$FlowImplCopyWith<$Res> implements $FlowCopyWith<$Res> {
  factory _$$FlowImplCopyWith(
          _$FlowImpl value, $Res Function(_$FlowImpl) then) =
      __$$FlowImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CartStep> steps, Current current});

  @override
  $CurrentCopyWith<$Res> get current;
}

/// @nodoc
class __$$FlowImplCopyWithImpl<$Res>
    extends _$FlowCopyWithImpl<$Res, _$FlowImpl>
    implements _$$FlowImplCopyWith<$Res> {
  __$$FlowImplCopyWithImpl(_$FlowImpl _value, $Res Function(_$FlowImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? steps = null,
    Object? current = null,
  }) {
    return _then(_$FlowImpl(
      steps: null == steps
          ? _value._steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<CartStep>,
      current: null == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as Current,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FlowImpl implements _Flow {
  _$FlowImpl({required final List<CartStep> steps, required this.current})
      : _steps = steps;

  factory _$FlowImpl.fromJson(Map<String, dynamic> json) =>
      _$$FlowImplFromJson(json);

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
  String toString() {
    return 'Flow(steps: $steps, current: $current)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlowImpl &&
            const DeepCollectionEquality().equals(other._steps, _steps) &&
            (identical(other.current, current) || other.current == current));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_steps), current);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FlowImplCopyWith<_$FlowImpl> get copyWith =>
      __$$FlowImplCopyWithImpl<_$FlowImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FlowImplToJson(
      this,
    );
  }
}

abstract class _Flow implements Flow {
  factory _Flow(
      {required final List<CartStep> steps,
      required final Current current}) = _$FlowImpl;

  factory _Flow.fromJson(Map<String, dynamic> json) = _$FlowImpl.fromJson;

  @override
  List<CartStep> get steps;
  @override
  Current get current;
  @override
  @JsonKey(ignore: true)
  _$$FlowImplCopyWith<_$FlowImpl> get copyWith =>
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
  @JsonKey(name: '__typename')
  String? get typeName => throw _privateConstructorUsedError;

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
      @JsonKey(name: '__typename') String? typeName});
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
    Object? typeName = freezed,
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
      typeName: freezed == typeName
          ? _value.typeName
          : typeName // ignore: cast_nullable_to_non_nullable
              as String?,
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
      @JsonKey(name: '__typename') String? typeName});
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
    Object? typeName = freezed,
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
      typeName: freezed == typeName
          ? _value.typeName
          : typeName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CartStepImpl implements _CartStep {
  _$CartStepImpl(
      {required this.step,
      this.action,
      required this.finalStep,
      required this.active,
      @JsonKey(name: '__typename') this.typeName});

  factory _$CartStepImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartStepImplFromJson(json);

  @override
  final String step;
  @override
  final String? action;
  @override
  final bool finalStep;
  @override
  final bool active;
  @override
  @JsonKey(name: '__typename')
  final String? typeName;

  @override
  String toString() {
    return 'CartStep(step: $step, action: $action, finalStep: $finalStep, active: $active, typeName: $typeName)';
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
            (identical(other.typeName, typeName) ||
                other.typeName == typeName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, step, action, finalStep, active, typeName);

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
      required final bool finalStep,
      required final bool active,
      @JsonKey(name: '__typename') final String? typeName}) = _$CartStepImpl;

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
  @JsonKey(name: '__typename')
  String? get typeName;
  @override
  @JsonKey(ignore: true)
  _$$CartStepImplCopyWith<_$CartStepImpl> get copyWith =>
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
