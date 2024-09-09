// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'billing_address_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BillingAddress _$BillingAddressFromJson(Map<String, dynamic> json) {
  return _BillingAddress.fromJson(json);
}

/// @nodoc
mixin _$BillingAddress {
  Store get store => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BillingAddressCopyWith<BillingAddress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BillingAddressCopyWith<$Res> {
  factory $BillingAddressCopyWith(
          BillingAddress value, $Res Function(BillingAddress) then) =
      _$BillingAddressCopyWithImpl<$Res, BillingAddress>;
  @useResult
  $Res call({Store store});

  $StoreCopyWith<$Res> get store;
}

/// @nodoc
class _$BillingAddressCopyWithImpl<$Res, $Val extends BillingAddress>
    implements $BillingAddressCopyWith<$Res> {
  _$BillingAddressCopyWithImpl(this._value, this._then);

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
abstract class _$$BillingAddressImplCopyWith<$Res>
    implements $BillingAddressCopyWith<$Res> {
  factory _$$BillingAddressImplCopyWith(_$BillingAddressImpl value,
          $Res Function(_$BillingAddressImpl) then) =
      __$$BillingAddressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Store store});

  @override
  $StoreCopyWith<$Res> get store;
}

/// @nodoc
class __$$BillingAddressImplCopyWithImpl<$Res>
    extends _$BillingAddressCopyWithImpl<$Res, _$BillingAddressImpl>
    implements _$$BillingAddressImplCopyWith<$Res> {
  __$$BillingAddressImplCopyWithImpl(
      _$BillingAddressImpl _value, $Res Function(_$BillingAddressImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? store = null,
  }) {
    return _then(_$BillingAddressImpl(
      store: null == store
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as Store,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BillingAddressImpl implements _BillingAddress {
  _$BillingAddressImpl({required this.store});

  factory _$BillingAddressImpl.fromJson(Map<String, dynamic> json) =>
      _$$BillingAddressImplFromJson(json);

  @override
  final Store store;

  @override
  String toString() {
    return 'BillingAddress(store: $store)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BillingAddressImpl &&
            (identical(other.store, store) || other.store == store));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, store);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BillingAddressImplCopyWith<_$BillingAddressImpl> get copyWith =>
      __$$BillingAddressImplCopyWithImpl<_$BillingAddressImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BillingAddressImplToJson(
      this,
    );
  }
}

abstract class _BillingAddress implements BillingAddress {
  factory _BillingAddress({required final Store store}) = _$BillingAddressImpl;

  factory _BillingAddress.fromJson(Map<String, dynamic> json) =
      _$BillingAddressImpl.fromJson;

  @override
  Store get store;
  @override
  @JsonKey(ignore: true)
  _$$BillingAddressImplCopyWith<_$BillingAddressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Store _$StoreFromJson(Map<String, dynamic> json) {
  return _Store.fromJson(json);
}

/// @nodoc
mixin _$Store {
  List<Address> get addressBook => throw _privateConstructorUsedError;
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
  $Res call({List<Address> addressBook, Cart cart});

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
    Object? addressBook = null,
    Object? cart = null,
  }) {
    return _then(_value.copyWith(
      addressBook: null == addressBook
          ? _value.addressBook
          : addressBook // ignore: cast_nullable_to_non_nullable
              as List<Address>,
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
  $Res call({List<Address> addressBook, Cart cart});

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
    Object? addressBook = null,
    Object? cart = null,
  }) {
    return _then(_$StoreImpl(
      addressBook: null == addressBook
          ? _value._addressBook
          : addressBook // ignore: cast_nullable_to_non_nullable
              as List<Address>,
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
  _$StoreImpl({required final List<Address> addressBook, required this.cart})
      : _addressBook = addressBook;

  factory _$StoreImpl.fromJson(Map<String, dynamic> json) =>
      _$$StoreImplFromJson(json);

  final List<Address> _addressBook;
  @override
  List<Address> get addressBook {
    if (_addressBook is EqualUnmodifiableListView) return _addressBook;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_addressBook);
  }

  @override
  final Cart cart;

  @override
  String toString() {
    return 'Store(addressBook: $addressBook, cart: $cart)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoreImpl &&
            const DeepCollectionEquality()
                .equals(other._addressBook, _addressBook) &&
            (identical(other.cart, cart) || other.cart == cart));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_addressBook), cart);

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
      {required final List<Address> addressBook,
      required final Cart cart}) = _$StoreImpl;

  factory _Store.fromJson(Map<String, dynamic> json) = _$StoreImpl.fromJson;

  @override
  List<Address> get addressBook;
  @override
  Cart get cart;
  @override
  @JsonKey(ignore: true)
  _$$StoreImplCopyWith<_$StoreImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Address _$AddressFromJson(Map<String, dynamic> json) {
  return _Address.fromJson(json);
}

/// @nodoc
mixin _$Address {
  String get id => throw _privateConstructorUsedError;
  bool get defaultBilling => throw _privateConstructorUsedError;
  bool get defaultShipping => throw _privateConstructorUsedError;
  String get company => throw _privateConstructorUsedError;
  String get firstname => throw _privateConstructorUsedError;
  String get lastname => throw _privateConstructorUsedError;
  String get addressLine => throw _privateConstructorUsedError;
  String get postalCode => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  Destination get country => throw _privateConstructorUsedError;
  Destination get region => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddressCopyWith<Address> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressCopyWith<$Res> {
  factory $AddressCopyWith(Address value, $Res Function(Address) then) =
      _$AddressCopyWithImpl<$Res, Address>;
  @useResult
  $Res call(
      {String id,
      bool defaultBilling,
      bool defaultShipping,
      String company,
      String firstname,
      String lastname,
      String addressLine,
      String postalCode,
      String phone,
      String city,
      Destination country,
      Destination region});

  $DestinationCopyWith<$Res> get country;
  $DestinationCopyWith<$Res> get region;
}

/// @nodoc
class _$AddressCopyWithImpl<$Res, $Val extends Address>
    implements $AddressCopyWith<$Res> {
  _$AddressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? defaultBilling = null,
    Object? defaultShipping = null,
    Object? company = null,
    Object? firstname = null,
    Object? lastname = null,
    Object? addressLine = null,
    Object? postalCode = null,
    Object? phone = null,
    Object? city = null,
    Object? country = null,
    Object? region = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      defaultBilling: null == defaultBilling
          ? _value.defaultBilling
          : defaultBilling // ignore: cast_nullable_to_non_nullable
              as bool,
      defaultShipping: null == defaultShipping
          ? _value.defaultShipping
          : defaultShipping // ignore: cast_nullable_to_non_nullable
              as bool,
      company: null == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as String,
      firstname: null == firstname
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String,
      lastname: null == lastname
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String,
      addressLine: null == addressLine
          ? _value.addressLine
          : addressLine // ignore: cast_nullable_to_non_nullable
              as String,
      postalCode: null == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as Destination,
      region: null == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as Destination,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DestinationCopyWith<$Res> get country {
    return $DestinationCopyWith<$Res>(_value.country, (value) {
      return _then(_value.copyWith(country: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DestinationCopyWith<$Res> get region {
    return $DestinationCopyWith<$Res>(_value.region, (value) {
      return _then(_value.copyWith(region: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AddressImplCopyWith<$Res> implements $AddressCopyWith<$Res> {
  factory _$$AddressImplCopyWith(
          _$AddressImpl value, $Res Function(_$AddressImpl) then) =
      __$$AddressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      bool defaultBilling,
      bool defaultShipping,
      String company,
      String firstname,
      String lastname,
      String addressLine,
      String postalCode,
      String phone,
      String city,
      Destination country,
      Destination region});

  @override
  $DestinationCopyWith<$Res> get country;
  @override
  $DestinationCopyWith<$Res> get region;
}

/// @nodoc
class __$$AddressImplCopyWithImpl<$Res>
    extends _$AddressCopyWithImpl<$Res, _$AddressImpl>
    implements _$$AddressImplCopyWith<$Res> {
  __$$AddressImplCopyWithImpl(
      _$AddressImpl _value, $Res Function(_$AddressImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? defaultBilling = null,
    Object? defaultShipping = null,
    Object? company = null,
    Object? firstname = null,
    Object? lastname = null,
    Object? addressLine = null,
    Object? postalCode = null,
    Object? phone = null,
    Object? city = null,
    Object? country = null,
    Object? region = null,
  }) {
    return _then(_$AddressImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      defaultBilling: null == defaultBilling
          ? _value.defaultBilling
          : defaultBilling // ignore: cast_nullable_to_non_nullable
              as bool,
      defaultShipping: null == defaultShipping
          ? _value.defaultShipping
          : defaultShipping // ignore: cast_nullable_to_non_nullable
              as bool,
      company: null == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as String,
      firstname: null == firstname
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String,
      lastname: null == lastname
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String,
      addressLine: null == addressLine
          ? _value.addressLine
          : addressLine // ignore: cast_nullable_to_non_nullable
              as String,
      postalCode: null == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as Destination,
      region: null == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as Destination,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddressImpl implements _Address {
  _$AddressImpl(
      {required this.id,
      required this.defaultBilling,
      required this.defaultShipping,
      required this.company,
      required this.firstname,
      required this.lastname,
      required this.addressLine,
      required this.postalCode,
      required this.phone,
      required this.city,
      required this.country,
      required this.region});

  factory _$AddressImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddressImplFromJson(json);

  @override
  final String id;
  @override
  final bool defaultBilling;
  @override
  final bool defaultShipping;
  @override
  final String company;
  @override
  final String firstname;
  @override
  final String lastname;
  @override
  final String addressLine;
  @override
  final String postalCode;
  @override
  final String phone;
  @override
  final String city;
  @override
  final Destination country;
  @override
  final Destination region;

  @override
  String toString() {
    return 'Address(id: $id, defaultBilling: $defaultBilling, defaultShipping: $defaultShipping, company: $company, firstname: $firstname, lastname: $lastname, addressLine: $addressLine, postalCode: $postalCode, phone: $phone, city: $city, country: $country, region: $region)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddressImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.defaultBilling, defaultBilling) ||
                other.defaultBilling == defaultBilling) &&
            (identical(other.defaultShipping, defaultShipping) ||
                other.defaultShipping == defaultShipping) &&
            (identical(other.company, company) || other.company == company) &&
            (identical(other.firstname, firstname) ||
                other.firstname == firstname) &&
            (identical(other.lastname, lastname) ||
                other.lastname == lastname) &&
            (identical(other.addressLine, addressLine) ||
                other.addressLine == addressLine) &&
            (identical(other.postalCode, postalCode) ||
                other.postalCode == postalCode) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.region, region) || other.region == region));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      defaultBilling,
      defaultShipping,
      company,
      firstname,
      lastname,
      addressLine,
      postalCode,
      phone,
      city,
      country,
      region);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddressImplCopyWith<_$AddressImpl> get copyWith =>
      __$$AddressImplCopyWithImpl<_$AddressImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddressImplToJson(
      this,
    );
  }
}

abstract class _Address implements Address {
  factory _Address(
      {required final String id,
      required final bool defaultBilling,
      required final bool defaultShipping,
      required final String company,
      required final String firstname,
      required final String lastname,
      required final String addressLine,
      required final String postalCode,
      required final String phone,
      required final String city,
      required final Destination country,
      required final Destination region}) = _$AddressImpl;

  factory _Address.fromJson(Map<String, dynamic> json) = _$AddressImpl.fromJson;

  @override
  String get id;
  @override
  bool get defaultBilling;
  @override
  bool get defaultShipping;
  @override
  String get company;
  @override
  String get firstname;
  @override
  String get lastname;
  @override
  String get addressLine;
  @override
  String get postalCode;
  @override
  String get phone;
  @override
  String get city;
  @override
  Destination get country;
  @override
  Destination get region;
  @override
  @JsonKey(ignore: true)
  _$$AddressImplCopyWith<_$AddressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Cart _$CartFromJson(Map<String, dynamic> json) {
  return _Cart.fromJson(json);
}

/// @nodoc
mixin _$Cart {
  CartTotal get totals => throw _privateConstructorUsedError;
  Address? get shippingAddress => throw _privateConstructorUsedError;
  Address? get billingAddress => throw _privateConstructorUsedError;
  bool get shippingRequired => throw _privateConstructorUsedError;
  bool get billingRequired => throw _privateConstructorUsedError;

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
      {CartTotal totals,
      Address? shippingAddress,
      Address? billingAddress,
      bool shippingRequired,
      bool billingRequired});

  $CartTotalCopyWith<$Res> get totals;
  $AddressCopyWith<$Res>? get shippingAddress;
  $AddressCopyWith<$Res>? get billingAddress;
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
    Object? shippingAddress = freezed,
    Object? billingAddress = freezed,
    Object? shippingRequired = null,
    Object? billingRequired = null,
  }) {
    return _then(_value.copyWith(
      totals: null == totals
          ? _value.totals
          : totals // ignore: cast_nullable_to_non_nullable
              as CartTotal,
      shippingAddress: freezed == shippingAddress
          ? _value.shippingAddress
          : shippingAddress // ignore: cast_nullable_to_non_nullable
              as Address?,
      billingAddress: freezed == billingAddress
          ? _value.billingAddress
          : billingAddress // ignore: cast_nullable_to_non_nullable
              as Address?,
      shippingRequired: null == shippingRequired
          ? _value.shippingRequired
          : shippingRequired // ignore: cast_nullable_to_non_nullable
              as bool,
      billingRequired: null == billingRequired
          ? _value.billingRequired
          : billingRequired // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CartTotalCopyWith<$Res> get totals {
    return $CartTotalCopyWith<$Res>(_value.totals, (value) {
      return _then(_value.copyWith(totals: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res>? get shippingAddress {
    if (_value.shippingAddress == null) {
      return null;
    }

    return $AddressCopyWith<$Res>(_value.shippingAddress!, (value) {
      return _then(_value.copyWith(shippingAddress: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res>? get billingAddress {
    if (_value.billingAddress == null) {
      return null;
    }

    return $AddressCopyWith<$Res>(_value.billingAddress!, (value) {
      return _then(_value.copyWith(billingAddress: value) as $Val);
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
      {CartTotal totals,
      Address? shippingAddress,
      Address? billingAddress,
      bool shippingRequired,
      bool billingRequired});

  @override
  $CartTotalCopyWith<$Res> get totals;
  @override
  $AddressCopyWith<$Res>? get shippingAddress;
  @override
  $AddressCopyWith<$Res>? get billingAddress;
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
    Object? shippingAddress = freezed,
    Object? billingAddress = freezed,
    Object? shippingRequired = null,
    Object? billingRequired = null,
  }) {
    return _then(_$CartImpl(
      totals: null == totals
          ? _value.totals
          : totals // ignore: cast_nullable_to_non_nullable
              as CartTotal,
      shippingAddress: freezed == shippingAddress
          ? _value.shippingAddress
          : shippingAddress // ignore: cast_nullable_to_non_nullable
              as Address?,
      billingAddress: freezed == billingAddress
          ? _value.billingAddress
          : billingAddress // ignore: cast_nullable_to_non_nullable
              as Address?,
      shippingRequired: null == shippingRequired
          ? _value.shippingRequired
          : shippingRequired // ignore: cast_nullable_to_non_nullable
              as bool,
      billingRequired: null == billingRequired
          ? _value.billingRequired
          : billingRequired // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CartImpl implements _Cart {
  _$CartImpl(
      {required this.totals,
      this.shippingAddress,
      this.billingAddress,
      required this.shippingRequired,
      required this.billingRequired});

  factory _$CartImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartImplFromJson(json);

  @override
  final CartTotal totals;
  @override
  final Address? shippingAddress;
  @override
  final Address? billingAddress;
  @override
  final bool shippingRequired;
  @override
  final bool billingRequired;

  @override
  String toString() {
    return 'Cart(totals: $totals, shippingAddress: $shippingAddress, billingAddress: $billingAddress, shippingRequired: $shippingRequired, billingRequired: $billingRequired)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartImpl &&
            (identical(other.totals, totals) || other.totals == totals) &&
            (identical(other.shippingAddress, shippingAddress) ||
                other.shippingAddress == shippingAddress) &&
            (identical(other.billingAddress, billingAddress) ||
                other.billingAddress == billingAddress) &&
            (identical(other.shippingRequired, shippingRequired) ||
                other.shippingRequired == shippingRequired) &&
            (identical(other.billingRequired, billingRequired) ||
                other.billingRequired == billingRequired));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, totals, shippingAddress,
      billingAddress, shippingRequired, billingRequired);

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
      {required final CartTotal totals,
      final Address? shippingAddress,
      final Address? billingAddress,
      required final bool shippingRequired,
      required final bool billingRequired}) = _$CartImpl;

  factory _Cart.fromJson(Map<String, dynamic> json) = _$CartImpl.fromJson;

  @override
  CartTotal get totals;
  @override
  Address? get shippingAddress;
  @override
  Address? get billingAddress;
  @override
  bool get shippingRequired;
  @override
  bool get billingRequired;
  @override
  @JsonKey(ignore: true)
  _$$CartImplCopyWith<_$CartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CartTotal _$CartTotalFromJson(Map<String, dynamic> json) {
  return _CartTotal.fromJson(json);
}

/// @nodoc
mixin _$CartTotal {
  double get discount => throw _privateConstructorUsedError;
  double get shipping => throw _privateConstructorUsedError;
  double get total => throw _privateConstructorUsedError;
  double get subTotal => throw _privateConstructorUsedError;
  CartTax get tax1 => throw _privateConstructorUsedError;
  CartTax get tax2 => throw _privateConstructorUsedError;
  CartCoupon get coupon => throw _privateConstructorUsedError;
  Credits get credits => throw _privateConstructorUsedError;

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
  $Res call(
      {double discount,
      double shipping,
      double total,
      double subTotal,
      CartTax tax1,
      CartTax tax2,
      CartCoupon coupon,
      Credits credits});

  $CartTaxCopyWith<$Res> get tax1;
  $CartTaxCopyWith<$Res> get tax2;
  $CartCouponCopyWith<$Res> get coupon;
  $CreditsCopyWith<$Res> get credits;
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
              as double,
      shipping: null == shipping
          ? _value.shipping
          : shipping // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      subTotal: null == subTotal
          ? _value.subTotal
          : subTotal // ignore: cast_nullable_to_non_nullable
              as double,
      tax1: null == tax1
          ? _value.tax1
          : tax1 // ignore: cast_nullable_to_non_nullable
              as CartTax,
      tax2: null == tax2
          ? _value.tax2
          : tax2 // ignore: cast_nullable_to_non_nullable
              as CartTax,
      coupon: null == coupon
          ? _value.coupon
          : coupon // ignore: cast_nullable_to_non_nullable
              as CartCoupon,
      credits: null == credits
          ? _value.credits
          : credits // ignore: cast_nullable_to_non_nullable
              as Credits,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CartTaxCopyWith<$Res> get tax1 {
    return $CartTaxCopyWith<$Res>(_value.tax1, (value) {
      return _then(_value.copyWith(tax1: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CartTaxCopyWith<$Res> get tax2 {
    return $CartTaxCopyWith<$Res>(_value.tax2, (value) {
      return _then(_value.copyWith(tax2: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CartCouponCopyWith<$Res> get coupon {
    return $CartCouponCopyWith<$Res>(_value.coupon, (value) {
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
abstract class _$$CartTotalImplCopyWith<$Res>
    implements $CartTotalCopyWith<$Res> {
  factory _$$CartTotalImplCopyWith(
          _$CartTotalImpl value, $Res Function(_$CartTotalImpl) then) =
      __$$CartTotalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double discount,
      double shipping,
      double total,
      double subTotal,
      CartTax tax1,
      CartTax tax2,
      CartCoupon coupon,
      Credits credits});

  @override
  $CartTaxCopyWith<$Res> get tax1;
  @override
  $CartTaxCopyWith<$Res> get tax2;
  @override
  $CartCouponCopyWith<$Res> get coupon;
  @override
  $CreditsCopyWith<$Res> get credits;
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
    Object? discount = null,
    Object? shipping = null,
    Object? total = null,
    Object? subTotal = null,
    Object? tax1 = null,
    Object? tax2 = null,
    Object? coupon = null,
    Object? credits = null,
  }) {
    return _then(_$CartTotalImpl(
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
      shipping: null == shipping
          ? _value.shipping
          : shipping // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      subTotal: null == subTotal
          ? _value.subTotal
          : subTotal // ignore: cast_nullable_to_non_nullable
              as double,
      tax1: null == tax1
          ? _value.tax1
          : tax1 // ignore: cast_nullable_to_non_nullable
              as CartTax,
      tax2: null == tax2
          ? _value.tax2
          : tax2 // ignore: cast_nullable_to_non_nullable
              as CartTax,
      coupon: null == coupon
          ? _value.coupon
          : coupon // ignore: cast_nullable_to_non_nullable
              as CartCoupon,
      credits: null == credits
          ? _value.credits
          : credits // ignore: cast_nullable_to_non_nullable
              as Credits,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CartTotalImpl implements _CartTotal {
  _$CartTotalImpl(
      {required this.discount,
      required this.shipping,
      required this.total,
      required this.subTotal,
      required this.tax1,
      required this.tax2,
      required this.coupon,
      required this.credits});

  factory _$CartTotalImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartTotalImplFromJson(json);

  @override
  final double discount;
  @override
  final double shipping;
  @override
  final double total;
  @override
  final double subTotal;
  @override
  final CartTax tax1;
  @override
  final CartTax tax2;
  @override
  final CartCoupon coupon;
  @override
  final Credits credits;

  @override
  String toString() {
    return 'CartTotal(discount: $discount, shipping: $shipping, total: $total, subTotal: $subTotal, tax1: $tax1, tax2: $tax2, coupon: $coupon, credits: $credits)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartTotalImpl &&
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
  factory _CartTotal(
      {required final double discount,
      required final double shipping,
      required final double total,
      required final double subTotal,
      required final CartTax tax1,
      required final CartTax tax2,
      required final CartCoupon coupon,
      required final Credits credits}) = _$CartTotalImpl;

  factory _CartTotal.fromJson(Map<String, dynamic> json) =
      _$CartTotalImpl.fromJson;

  @override
  double get discount;
  @override
  double get shipping;
  @override
  double get total;
  @override
  double get subTotal;
  @override
  CartTax get tax1;
  @override
  CartTax get tax2;
  @override
  CartCoupon get coupon;
  @override
  Credits get credits;
  @override
  @JsonKey(ignore: true)
  _$$CartTotalImplCopyWith<_$CartTotalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CartTax _$CartTaxFromJson(Map<String, dynamic> json) {
  return _CartTax.fromJson(json);
}

/// @nodoc
mixin _$CartTax {
  String? get name => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CartTaxCopyWith<CartTax> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartTaxCopyWith<$Res> {
  factory $CartTaxCopyWith(CartTax value, $Res Function(CartTax) then) =
      _$CartTaxCopyWithImpl<$Res, CartTax>;
  @useResult
  $Res call({String? name, double amount});
}

/// @nodoc
class _$CartTaxCopyWithImpl<$Res, $Val extends CartTax>
    implements $CartTaxCopyWith<$Res> {
  _$CartTaxCopyWithImpl(this._value, this._then);

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
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CartTaxImplCopyWith<$Res> implements $CartTaxCopyWith<$Res> {
  factory _$$CartTaxImplCopyWith(
          _$CartTaxImpl value, $Res Function(_$CartTaxImpl) then) =
      __$$CartTaxImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, double amount});
}

/// @nodoc
class __$$CartTaxImplCopyWithImpl<$Res>
    extends _$CartTaxCopyWithImpl<$Res, _$CartTaxImpl>
    implements _$$CartTaxImplCopyWith<$Res> {
  __$$CartTaxImplCopyWithImpl(
      _$CartTaxImpl _value, $Res Function(_$CartTaxImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? amount = null,
  }) {
    return _then(_$CartTaxImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CartTaxImpl implements _CartTax {
  _$CartTaxImpl({this.name, required this.amount});

  factory _$CartTaxImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartTaxImplFromJson(json);

  @override
  final String? name;
  @override
  final double amount;

  @override
  String toString() {
    return 'CartTax(name: $name, amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartTaxImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, amount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CartTaxImplCopyWith<_$CartTaxImpl> get copyWith =>
      __$$CartTaxImplCopyWithImpl<_$CartTaxImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CartTaxImplToJson(
      this,
    );
  }
}

abstract class _CartTax implements CartTax {
  factory _CartTax({final String? name, required final double amount}) =
      _$CartTaxImpl;

  factory _CartTax.fromJson(Map<String, dynamic> json) = _$CartTaxImpl.fromJson;

  @override
  String? get name;
  @override
  double get amount;
  @override
  @JsonKey(ignore: true)
  _$$CartTaxImplCopyWith<_$CartTaxImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CartCoupon _$CartCouponFromJson(Map<String, dynamic> json) {
  return _CartCoupon.fromJson(json);
}

/// @nodoc
mixin _$CartCoupon {
  double get amount => throw _privateConstructorUsedError;
  bool get allowed => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CartCouponCopyWith<CartCoupon> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartCouponCopyWith<$Res> {
  factory $CartCouponCopyWith(
          CartCoupon value, $Res Function(CartCoupon) then) =
      _$CartCouponCopyWithImpl<$Res, CartCoupon>;
  @useResult
  $Res call({double amount, bool allowed, String? code});
}

/// @nodoc
class _$CartCouponCopyWithImpl<$Res, $Val extends CartCoupon>
    implements $CartCouponCopyWith<$Res> {
  _$CartCouponCopyWithImpl(this._value, this._then);

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
              as double,
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
abstract class _$$CartCouponImplCopyWith<$Res>
    implements $CartCouponCopyWith<$Res> {
  factory _$$CartCouponImplCopyWith(
          _$CartCouponImpl value, $Res Function(_$CartCouponImpl) then) =
      __$$CartCouponImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double amount, bool allowed, String? code});
}

/// @nodoc
class __$$CartCouponImplCopyWithImpl<$Res>
    extends _$CartCouponCopyWithImpl<$Res, _$CartCouponImpl>
    implements _$$CartCouponImplCopyWith<$Res> {
  __$$CartCouponImplCopyWithImpl(
      _$CartCouponImpl _value, $Res Function(_$CartCouponImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? allowed = null,
    Object? code = freezed,
  }) {
    return _then(_$CartCouponImpl(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
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
class _$CartCouponImpl implements _CartCoupon {
  _$CartCouponImpl({required this.amount, required this.allowed, this.code});

  factory _$CartCouponImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartCouponImplFromJson(json);

  @override
  final double amount;
  @override
  final bool allowed;
  @override
  final String? code;

  @override
  String toString() {
    return 'CartCoupon(amount: $amount, allowed: $allowed, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartCouponImpl &&
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
  _$$CartCouponImplCopyWith<_$CartCouponImpl> get copyWith =>
      __$$CartCouponImplCopyWithImpl<_$CartCouponImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CartCouponImplToJson(
      this,
    );
  }
}

abstract class _CartCoupon implements CartCoupon {
  factory _CartCoupon(
      {required final double amount,
      required final bool allowed,
      final String? code}) = _$CartCouponImpl;

  factory _CartCoupon.fromJson(Map<String, dynamic> json) =
      _$CartCouponImpl.fromJson;

  @override
  double get amount;
  @override
  bool get allowed;
  @override
  String? get code;
  @override
  @JsonKey(ignore: true)
  _$$CartCouponImplCopyWith<_$CartCouponImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Credits _$CreditsFromJson(Map<String, dynamic> json) {
  return _Credits.fromJson(json);
}

/// @nodoc
mixin _$Credits {
  double get amount => throw _privateConstructorUsedError;
  Money get nativeAmount => throw _privateConstructorUsedError;
  bool get applicable => throw _privateConstructorUsedError;
  double get maxApplicable => throw _privateConstructorUsedError;

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
      {double amount,
      Money nativeAmount,
      bool applicable,
      double maxApplicable});

  $MoneyCopyWith<$Res> get nativeAmount;
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
    Object? nativeAmount = null,
    Object? applicable = null,
    Object? maxApplicable = null,
  }) {
    return _then(_value.copyWith(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      nativeAmount: null == nativeAmount
          ? _value.nativeAmount
          : nativeAmount // ignore: cast_nullable_to_non_nullable
              as Money,
      applicable: null == applicable
          ? _value.applicable
          : applicable // ignore: cast_nullable_to_non_nullable
              as bool,
      maxApplicable: null == maxApplicable
          ? _value.maxApplicable
          : maxApplicable // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MoneyCopyWith<$Res> get nativeAmount {
    return $MoneyCopyWith<$Res>(_value.nativeAmount, (value) {
      return _then(_value.copyWith(nativeAmount: value) as $Val);
    });
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
      {double amount,
      Money nativeAmount,
      bool applicable,
      double maxApplicable});

  @override
  $MoneyCopyWith<$Res> get nativeAmount;
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
    Object? nativeAmount = null,
    Object? applicable = null,
    Object? maxApplicable = null,
  }) {
    return _then(_$CreditsImpl(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      nativeAmount: null == nativeAmount
          ? _value.nativeAmount
          : nativeAmount // ignore: cast_nullable_to_non_nullable
              as Money,
      applicable: null == applicable
          ? _value.applicable
          : applicable // ignore: cast_nullable_to_non_nullable
              as bool,
      maxApplicable: null == maxApplicable
          ? _value.maxApplicable
          : maxApplicable // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreditsImpl implements _Credits {
  _$CreditsImpl(
      {required this.amount,
      required this.nativeAmount,
      required this.applicable,
      required this.maxApplicable});

  factory _$CreditsImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreditsImplFromJson(json);

  @override
  final double amount;
  @override
  final Money nativeAmount;
  @override
  final bool applicable;
  @override
  final double maxApplicable;

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
      {required final double amount,
      required final Money nativeAmount,
      required final bool applicable,
      required final double maxApplicable}) = _$CreditsImpl;

  factory _Credits.fromJson(Map<String, dynamic> json) = _$CreditsImpl.fromJson;

  @override
  double get amount;
  @override
  Money get nativeAmount;
  @override
  bool get applicable;
  @override
  double get maxApplicable;
  @override
  @JsonKey(ignore: true)
  _$$CreditsImplCopyWith<_$CreditsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Money _$MoneyFromJson(Map<String, dynamic> json) {
  return _Money.fromJson(json);
}

/// @nodoc
mixin _$Money {
  double get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MoneyCopyWith<Money> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoneyCopyWith<$Res> {
  factory $MoneyCopyWith(Money value, $Res Function(Money) then) =
      _$MoneyCopyWithImpl<$Res, Money>;
  @useResult
  $Res call({double value});
}

/// @nodoc
class _$MoneyCopyWithImpl<$Res, $Val extends Money>
    implements $MoneyCopyWith<$Res> {
  _$MoneyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MoneyImplCopyWith<$Res> implements $MoneyCopyWith<$Res> {
  factory _$$MoneyImplCopyWith(
          _$MoneyImpl value, $Res Function(_$MoneyImpl) then) =
      __$$MoneyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double value});
}

/// @nodoc
class __$$MoneyImplCopyWithImpl<$Res>
    extends _$MoneyCopyWithImpl<$Res, _$MoneyImpl>
    implements _$$MoneyImplCopyWith<$Res> {
  __$$MoneyImplCopyWithImpl(
      _$MoneyImpl _value, $Res Function(_$MoneyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$MoneyImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MoneyImpl implements _Money {
  _$MoneyImpl({required this.value});

  factory _$MoneyImpl.fromJson(Map<String, dynamic> json) =>
      _$$MoneyImplFromJson(json);

  @override
  final double value;

  @override
  String toString() {
    return 'Money(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MoneyImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MoneyImplCopyWith<_$MoneyImpl> get copyWith =>
      __$$MoneyImplCopyWithImpl<_$MoneyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MoneyImplToJson(
      this,
    );
  }
}

abstract class _Money implements Money {
  factory _Money({required final double value}) = _$MoneyImpl;

  factory _Money.fromJson(Map<String, dynamic> json) = _$MoneyImpl.fromJson;

  @override
  double get value;
  @override
  @JsonKey(ignore: true)
  _$$MoneyImplCopyWith<_$MoneyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Destination _$DestinationFromJson(Map<String, dynamic> json) {
  return _Destination.fromJson(json);
}

/// @nodoc
mixin _$Destination {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  bool? get requireRegion => throw _privateConstructorUsedError;
  bool? get hasRegion => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DestinationCopyWith<Destination> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DestinationCopyWith<$Res> {
  factory $DestinationCopyWith(
          Destination value, $Res Function(Destination) then) =
      _$DestinationCopyWithImpl<$Res, Destination>;
  @useResult
  $Res call(
      {String id,
      String name,
      bool? requireRegion,
      bool? hasRegion,
      String? code});
}

/// @nodoc
class _$DestinationCopyWithImpl<$Res, $Val extends Destination>
    implements $DestinationCopyWith<$Res> {
  _$DestinationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? requireRegion = freezed,
    Object? hasRegion = freezed,
    Object? code = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      requireRegion: freezed == requireRegion
          ? _value.requireRegion
          : requireRegion // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasRegion: freezed == hasRegion
          ? _value.hasRegion
          : hasRegion // ignore: cast_nullable_to_non_nullable
              as bool?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DestinationImplCopyWith<$Res>
    implements $DestinationCopyWith<$Res> {
  factory _$$DestinationImplCopyWith(
          _$DestinationImpl value, $Res Function(_$DestinationImpl) then) =
      __$$DestinationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      bool? requireRegion,
      bool? hasRegion,
      String? code});
}

/// @nodoc
class __$$DestinationImplCopyWithImpl<$Res>
    extends _$DestinationCopyWithImpl<$Res, _$DestinationImpl>
    implements _$$DestinationImplCopyWith<$Res> {
  __$$DestinationImplCopyWithImpl(
      _$DestinationImpl _value, $Res Function(_$DestinationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? requireRegion = freezed,
    Object? hasRegion = freezed,
    Object? code = freezed,
  }) {
    return _then(_$DestinationImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      requireRegion: freezed == requireRegion
          ? _value.requireRegion
          : requireRegion // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasRegion: freezed == hasRegion
          ? _value.hasRegion
          : hasRegion // ignore: cast_nullable_to_non_nullable
              as bool?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DestinationImpl implements _Destination {
  _$DestinationImpl(
      {required this.id,
      required this.name,
      this.requireRegion,
      this.hasRegion,
      this.code});

  factory _$DestinationImpl.fromJson(Map<String, dynamic> json) =>
      _$$DestinationImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final bool? requireRegion;
  @override
  final bool? hasRegion;
  @override
  final String? code;

  @override
  String toString() {
    return 'Destination(id: $id, name: $name, requireRegion: $requireRegion, hasRegion: $hasRegion, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DestinationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.requireRegion, requireRegion) ||
                other.requireRegion == requireRegion) &&
            (identical(other.hasRegion, hasRegion) ||
                other.hasRegion == hasRegion) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, requireRegion, hasRegion, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DestinationImplCopyWith<_$DestinationImpl> get copyWith =>
      __$$DestinationImplCopyWithImpl<_$DestinationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DestinationImplToJson(
      this,
    );
  }
}

abstract class _Destination implements Destination {
  factory _Destination(
      {required final String id,
      required final String name,
      final bool? requireRegion,
      final bool? hasRegion,
      final String? code}) = _$DestinationImpl;

  factory _Destination.fromJson(Map<String, dynamic> json) =
      _$DestinationImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  bool? get requireRegion;
  @override
  bool? get hasRegion;
  @override
  String? get code;
  @override
  @JsonKey(ignore: true)
  _$$DestinationImplCopyWith<_$DestinationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
