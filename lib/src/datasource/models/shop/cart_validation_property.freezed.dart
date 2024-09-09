// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_validation_property.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CartValidationProperty _$CartValidationPropertyFromJson(
    Map<String, dynamic> json) {
  return _CartValidationProperty.fromJson(json);
}

/// @nodoc
mixin _$CartValidationProperty {
  Cart get cart => throw _privateConstructorUsedError;
  Order get order => throw _privateConstructorUsedError;
  String get typeName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CartValidationPropertyCopyWith<CartValidationProperty> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartValidationPropertyCopyWith<$Res> {
  factory $CartValidationPropertyCopyWith(CartValidationProperty value,
          $Res Function(CartValidationProperty) then) =
      _$CartValidationPropertyCopyWithImpl<$Res, CartValidationProperty>;
  @useResult
  $Res call({Cart cart, Order order, String typeName});

  $CartCopyWith<$Res> get cart;
  $OrderCopyWith<$Res> get order;
}

/// @nodoc
class _$CartValidationPropertyCopyWithImpl<$Res,
        $Val extends CartValidationProperty>
    implements $CartValidationPropertyCopyWith<$Res> {
  _$CartValidationPropertyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cart = null,
    Object? order = null,
    Object? typeName = null,
  }) {
    return _then(_value.copyWith(
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
abstract class _$$CartValidationPropertyImplCopyWith<$Res>
    implements $CartValidationPropertyCopyWith<$Res> {
  factory _$$CartValidationPropertyImplCopyWith(
          _$CartValidationPropertyImpl value,
          $Res Function(_$CartValidationPropertyImpl) then) =
      __$$CartValidationPropertyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Cart cart, Order order, String typeName});

  @override
  $CartCopyWith<$Res> get cart;
  @override
  $OrderCopyWith<$Res> get order;
}

/// @nodoc
class __$$CartValidationPropertyImplCopyWithImpl<$Res>
    extends _$CartValidationPropertyCopyWithImpl<$Res,
        _$CartValidationPropertyImpl>
    implements _$$CartValidationPropertyImplCopyWith<$Res> {
  __$$CartValidationPropertyImplCopyWithImpl(
      _$CartValidationPropertyImpl _value,
      $Res Function(_$CartValidationPropertyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cart = null,
    Object? order = null,
    Object? typeName = null,
  }) {
    return _then(_$CartValidationPropertyImpl(
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
class _$CartValidationPropertyImpl implements _CartValidationProperty {
  _$CartValidationPropertyImpl(
      {required this.cart, required this.order, this.typeName = 'TyStore'});

  factory _$CartValidationPropertyImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartValidationPropertyImplFromJson(json);

  @override
  final Cart cart;
  @override
  final Order order;
  @override
  @JsonKey()
  final String typeName;

  @override
  String toString() {
    return 'CartValidationProperty(cart: $cart, order: $order, typeName: $typeName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartValidationPropertyImpl &&
            (identical(other.cart, cart) || other.cart == cart) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.typeName, typeName) ||
                other.typeName == typeName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, cart, order, typeName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CartValidationPropertyImplCopyWith<_$CartValidationPropertyImpl>
      get copyWith => __$$CartValidationPropertyImplCopyWithImpl<
          _$CartValidationPropertyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CartValidationPropertyImplToJson(
      this,
    );
  }
}

abstract class _CartValidationProperty implements CartValidationProperty {
  factory _CartValidationProperty(
      {required final Cart cart,
      required final Order order,
      final String typeName}) = _$CartValidationPropertyImpl;

  factory _CartValidationProperty.fromJson(Map<String, dynamic> json) =
      _$CartValidationPropertyImpl.fromJson;

  @override
  Cart get cart;
  @override
  Order get order;
  @override
  String get typeName;
  @override
  @JsonKey(ignore: true)
  _$$CartValidationPropertyImplCopyWith<_$CartValidationPropertyImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Cart _$CartFromJson(Map<String, dynamic> json) {
  return _Cart.fromJson(json);
}

/// @nodoc
mixin _$Cart {
  CartMutations get mutations => throw _privateConstructorUsedError;
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
  $Res call({CartMutations mutations, CheckoutFlow flow, String typeName});

  $CartMutationsCopyWith<$Res> get mutations;
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
    Object? mutations = null,
    Object? flow = null,
    Object? typeName = null,
  }) {
    return _then(_value.copyWith(
      mutations: null == mutations
          ? _value.mutations
          : mutations // ignore: cast_nullable_to_non_nullable
              as CartMutations,
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
  $CartMutationsCopyWith<$Res> get mutations {
    return $CartMutationsCopyWith<$Res>(_value.mutations, (value) {
      return _then(_value.copyWith(mutations: value) as $Val);
    });
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
  $Res call({CartMutations mutations, CheckoutFlow flow, String typeName});

  @override
  $CartMutationsCopyWith<$Res> get mutations;
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
    Object? mutations = null,
    Object? flow = null,
    Object? typeName = null,
  }) {
    return _then(_$CartImpl(
      mutations: null == mutations
          ? _value.mutations
          : mutations // ignore: cast_nullable_to_non_nullable
              as CartMutations,
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
      {required this.mutations,
      required this.flow,
      this.typeName = 'TyShoppingCart'});

  factory _$CartImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartImplFromJson(json);

  @override
  final CartMutations mutations;
  @override
  final CheckoutFlow flow;
  @override
  @JsonKey()
  final String typeName;

  @override
  String toString() {
    return 'Cart(mutations: $mutations, flow: $flow, typeName: $typeName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartImpl &&
            (identical(other.mutations, mutations) ||
                other.mutations == mutations) &&
            (identical(other.flow, flow) || other.flow == flow) &&
            (identical(other.typeName, typeName) ||
                other.typeName == typeName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, mutations, flow, typeName);

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
      {required final CartMutations mutations,
      required final CheckoutFlow flow,
      final String typeName}) = _$CartImpl;

  factory _Cart.fromJson(Map<String, dynamic> json) = _$CartImpl.fromJson;

  @override
  CartMutations get mutations;
  @override
  CheckoutFlow get flow;
  @override
  String get typeName;
  @override
  @JsonKey(ignore: true)
  _$$CartImplCopyWith<_$CartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CartMutations _$CartMutationsFromJson(Map<String, dynamic> json) {
  return _CartMutations.fromJson(json);
}

/// @nodoc
mixin _$CartMutations {
  String get validate => throw _privateConstructorUsedError;
  String get typeName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CartMutationsCopyWith<CartMutations> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartMutationsCopyWith<$Res> {
  factory $CartMutationsCopyWith(
          CartMutations value, $Res Function(CartMutations) then) =
      _$CartMutationsCopyWithImpl<$Res, CartMutations>;
  @useResult
  $Res call({String validate, String typeName});
}

/// @nodoc
class _$CartMutationsCopyWithImpl<$Res, $Val extends CartMutations>
    implements $CartMutationsCopyWith<$Res> {
  _$CartMutationsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? validate = null,
    Object? typeName = null,
  }) {
    return _then(_value.copyWith(
      validate: null == validate
          ? _value.validate
          : validate // ignore: cast_nullable_to_non_nullable
              as String,
      typeName: null == typeName
          ? _value.typeName
          : typeName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CartMutationsImplCopyWith<$Res>
    implements $CartMutationsCopyWith<$Res> {
  factory _$$CartMutationsImplCopyWith(
          _$CartMutationsImpl value, $Res Function(_$CartMutationsImpl) then) =
      __$$CartMutationsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String validate, String typeName});
}

/// @nodoc
class __$$CartMutationsImplCopyWithImpl<$Res>
    extends _$CartMutationsCopyWithImpl<$Res, _$CartMutationsImpl>
    implements _$$CartMutationsImplCopyWith<$Res> {
  __$$CartMutationsImplCopyWithImpl(
      _$CartMutationsImpl _value, $Res Function(_$CartMutationsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? validate = null,
    Object? typeName = null,
  }) {
    return _then(_$CartMutationsImpl(
      validate: null == validate
          ? _value.validate
          : validate // ignore: cast_nullable_to_non_nullable
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
class _$CartMutationsImpl implements _CartMutations {
  _$CartMutationsImpl(
      {required this.validate, this.typeName = 'CartMutations'});

  factory _$CartMutationsImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartMutationsImplFromJson(json);

  @override
  final String validate;
  @override
  @JsonKey()
  final String typeName;

  @override
  String toString() {
    return 'CartMutations(validate: $validate, typeName: $typeName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartMutationsImpl &&
            (identical(other.validate, validate) ||
                other.validate == validate) &&
            (identical(other.typeName, typeName) ||
                other.typeName == typeName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, validate, typeName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CartMutationsImplCopyWith<_$CartMutationsImpl> get copyWith =>
      __$$CartMutationsImplCopyWithImpl<_$CartMutationsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CartMutationsImplToJson(
      this,
    );
  }
}

abstract class _CartMutations implements CartMutations {
  factory _CartMutations(
      {required final String validate,
      final String typeName}) = _$CartMutationsImpl;

  factory _CartMutations.fromJson(Map<String, dynamic> json) =
      _$CartMutationsImpl.fromJson;

  @override
  String get validate;
  @override
  String get typeName;
  @override
  @JsonKey(ignore: true)
  _$$CartMutationsImplCopyWith<_$CartMutationsImpl> get copyWith =>
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
