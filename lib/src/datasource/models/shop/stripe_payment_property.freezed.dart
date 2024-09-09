// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stripe_payment_property.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StripePaymentProperty _$StripePaymentPropertyFromJson(
    Map<String, dynamic> json) {
  return _StripePaymentProperty.fromJson(json);
}

/// @nodoc
mixin _$StripePaymentProperty {
  String get id =>
      throw _privateConstructorUsedError; // required String object,
// required int amount,
// required AmountDetails amountDetails,
// dynamic automaticPaymentMethods,
// DateTime? canceledAt,
// String? cancellationReason,
// required String captureMethod,
// required String clientSecret,
// required String confirmationMethod,
// required int created,
// required String currency,
// String? description,
// dynamic lastPaymentError,
// required bool livemode,
  NextAction get next_action => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StripePaymentPropertyCopyWith<StripePaymentProperty> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StripePaymentPropertyCopyWith<$Res> {
  factory $StripePaymentPropertyCopyWith(StripePaymentProperty value,
          $Res Function(StripePaymentProperty) then) =
      _$StripePaymentPropertyCopyWithImpl<$Res, StripePaymentProperty>;
  @useResult
  $Res call({String id, NextAction next_action});

  $NextActionCopyWith<$Res> get next_action;
}

/// @nodoc
class _$StripePaymentPropertyCopyWithImpl<$Res,
        $Val extends StripePaymentProperty>
    implements $StripePaymentPropertyCopyWith<$Res> {
  _$StripePaymentPropertyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? next_action = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      next_action: null == next_action
          ? _value.next_action
          : next_action // ignore: cast_nullable_to_non_nullable
              as NextAction,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NextActionCopyWith<$Res> get next_action {
    return $NextActionCopyWith<$Res>(_value.next_action, (value) {
      return _then(_value.copyWith(next_action: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StripePaymentPropertyImplCopyWith<$Res>
    implements $StripePaymentPropertyCopyWith<$Res> {
  factory _$$StripePaymentPropertyImplCopyWith(
          _$StripePaymentPropertyImpl value,
          $Res Function(_$StripePaymentPropertyImpl) then) =
      __$$StripePaymentPropertyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, NextAction next_action});

  @override
  $NextActionCopyWith<$Res> get next_action;
}

/// @nodoc
class __$$StripePaymentPropertyImplCopyWithImpl<$Res>
    extends _$StripePaymentPropertyCopyWithImpl<$Res,
        _$StripePaymentPropertyImpl>
    implements _$$StripePaymentPropertyImplCopyWith<$Res> {
  __$$StripePaymentPropertyImplCopyWithImpl(_$StripePaymentPropertyImpl _value,
      $Res Function(_$StripePaymentPropertyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? next_action = null,
  }) {
    return _then(_$StripePaymentPropertyImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      next_action: null == next_action
          ? _value.next_action
          : next_action // ignore: cast_nullable_to_non_nullable
              as NextAction,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StripePaymentPropertyImpl implements _StripePaymentProperty {
  _$StripePaymentPropertyImpl({required this.id, required this.next_action});

  factory _$StripePaymentPropertyImpl.fromJson(Map<String, dynamic> json) =>
      _$$StripePaymentPropertyImplFromJson(json);

  @override
  final String id;
// required String object,
// required int amount,
// required AmountDetails amountDetails,
// dynamic automaticPaymentMethods,
// DateTime? canceledAt,
// String? cancellationReason,
// required String captureMethod,
// required String clientSecret,
// required String confirmationMethod,
// required int created,
// required String currency,
// String? description,
// dynamic lastPaymentError,
// required bool livemode,
  @override
  final NextAction next_action;

  @override
  String toString() {
    return 'StripePaymentProperty(id: $id, next_action: $next_action)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StripePaymentPropertyImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.next_action, next_action) ||
                other.next_action == next_action));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, next_action);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StripePaymentPropertyImplCopyWith<_$StripePaymentPropertyImpl>
      get copyWith => __$$StripePaymentPropertyImplCopyWithImpl<
          _$StripePaymentPropertyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StripePaymentPropertyImplToJson(
      this,
    );
  }
}

abstract class _StripePaymentProperty implements StripePaymentProperty {
  factory _StripePaymentProperty(
      {required final String id,
      required final NextAction next_action}) = _$StripePaymentPropertyImpl;

  factory _StripePaymentProperty.fromJson(Map<String, dynamic> json) =
      _$StripePaymentPropertyImpl.fromJson;

  @override
  String get id;
  @override // required String object,
// required int amount,
// required AmountDetails amountDetails,
// dynamic automaticPaymentMethods,
// DateTime? canceledAt,
// String? cancellationReason,
// required String captureMethod,
// required String clientSecret,
// required String confirmationMethod,
// required int created,
// required String currency,
// String? description,
// dynamic lastPaymentError,
// required bool livemode,
  NextAction get next_action;
  @override
  @JsonKey(ignore: true)
  _$$StripePaymentPropertyImplCopyWith<_$StripePaymentPropertyImpl>
      get copyWith => throw _privateConstructorUsedError;
}

AmountDetails _$AmountDetailsFromJson(Map<String, dynamic> json) {
  return _AmountDetails.fromJson(json);
}

/// @nodoc
mixin _$AmountDetails {
  Map<String, dynamic> get tip => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AmountDetailsCopyWith<AmountDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AmountDetailsCopyWith<$Res> {
  factory $AmountDetailsCopyWith(
          AmountDetails value, $Res Function(AmountDetails) then) =
      _$AmountDetailsCopyWithImpl<$Res, AmountDetails>;
  @useResult
  $Res call({Map<String, dynamic> tip});
}

/// @nodoc
class _$AmountDetailsCopyWithImpl<$Res, $Val extends AmountDetails>
    implements $AmountDetailsCopyWith<$Res> {
  _$AmountDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tip = null,
  }) {
    return _then(_value.copyWith(
      tip: null == tip
          ? _value.tip
          : tip // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AmountDetailsImplCopyWith<$Res>
    implements $AmountDetailsCopyWith<$Res> {
  factory _$$AmountDetailsImplCopyWith(
          _$AmountDetailsImpl value, $Res Function(_$AmountDetailsImpl) then) =
      __$$AmountDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, dynamic> tip});
}

/// @nodoc
class __$$AmountDetailsImplCopyWithImpl<$Res>
    extends _$AmountDetailsCopyWithImpl<$Res, _$AmountDetailsImpl>
    implements _$$AmountDetailsImplCopyWith<$Res> {
  __$$AmountDetailsImplCopyWithImpl(
      _$AmountDetailsImpl _value, $Res Function(_$AmountDetailsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tip = null,
  }) {
    return _then(_$AmountDetailsImpl(
      tip: null == tip
          ? _value._tip
          : tip // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AmountDetailsImpl implements _AmountDetails {
  _$AmountDetailsImpl({required final Map<String, dynamic> tip}) : _tip = tip;

  factory _$AmountDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$AmountDetailsImplFromJson(json);

  final Map<String, dynamic> _tip;
  @override
  Map<String, dynamic> get tip {
    if (_tip is EqualUnmodifiableMapView) return _tip;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_tip);
  }

  @override
  String toString() {
    return 'AmountDetails(tip: $tip)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AmountDetailsImpl &&
            const DeepCollectionEquality().equals(other._tip, _tip));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_tip));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AmountDetailsImplCopyWith<_$AmountDetailsImpl> get copyWith =>
      __$$AmountDetailsImplCopyWithImpl<_$AmountDetailsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AmountDetailsImplToJson(
      this,
    );
  }
}

abstract class _AmountDetails implements AmountDetails {
  factory _AmountDetails({required final Map<String, dynamic> tip}) =
      _$AmountDetailsImpl;

  factory _AmountDetails.fromJson(Map<String, dynamic> json) =
      _$AmountDetailsImpl.fromJson;

  @override
  Map<String, dynamic> get tip;
  @override
  @JsonKey(ignore: true)
  _$$AmountDetailsImplCopyWith<_$AmountDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NextAction _$NextActionFromJson(Map<String, dynamic> json) {
  return _NextAction.fromJson(json);
}

/// @nodoc
mixin _$NextAction {
  AlipayHandleRedirect get alipay_handle_redirect =>
      throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NextActionCopyWith<NextAction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NextActionCopyWith<$Res> {
  factory $NextActionCopyWith(
          NextAction value, $Res Function(NextAction) then) =
      _$NextActionCopyWithImpl<$Res, NextAction>;
  @useResult
  $Res call({AlipayHandleRedirect alipay_handle_redirect, String type});

  $AlipayHandleRedirectCopyWith<$Res> get alipay_handle_redirect;
}

/// @nodoc
class _$NextActionCopyWithImpl<$Res, $Val extends NextAction>
    implements $NextActionCopyWith<$Res> {
  _$NextActionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? alipay_handle_redirect = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      alipay_handle_redirect: null == alipay_handle_redirect
          ? _value.alipay_handle_redirect
          : alipay_handle_redirect // ignore: cast_nullable_to_non_nullable
              as AlipayHandleRedirect,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AlipayHandleRedirectCopyWith<$Res> get alipay_handle_redirect {
    return $AlipayHandleRedirectCopyWith<$Res>(_value.alipay_handle_redirect,
        (value) {
      return _then(_value.copyWith(alipay_handle_redirect: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NextActionImplCopyWith<$Res>
    implements $NextActionCopyWith<$Res> {
  factory _$$NextActionImplCopyWith(
          _$NextActionImpl value, $Res Function(_$NextActionImpl) then) =
      __$$NextActionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AlipayHandleRedirect alipay_handle_redirect, String type});

  @override
  $AlipayHandleRedirectCopyWith<$Res> get alipay_handle_redirect;
}

/// @nodoc
class __$$NextActionImplCopyWithImpl<$Res>
    extends _$NextActionCopyWithImpl<$Res, _$NextActionImpl>
    implements _$$NextActionImplCopyWith<$Res> {
  __$$NextActionImplCopyWithImpl(
      _$NextActionImpl _value, $Res Function(_$NextActionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? alipay_handle_redirect = null,
    Object? type = null,
  }) {
    return _then(_$NextActionImpl(
      alipay_handle_redirect: null == alipay_handle_redirect
          ? _value.alipay_handle_redirect
          : alipay_handle_redirect // ignore: cast_nullable_to_non_nullable
              as AlipayHandleRedirect,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NextActionImpl implements _NextAction {
  _$NextActionImpl({required this.alipay_handle_redirect, required this.type});

  factory _$NextActionImpl.fromJson(Map<String, dynamic> json) =>
      _$$NextActionImplFromJson(json);

  @override
  final AlipayHandleRedirect alipay_handle_redirect;
  @override
  final String type;

  @override
  String toString() {
    return 'NextAction(alipay_handle_redirect: $alipay_handle_redirect, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NextActionImpl &&
            (identical(other.alipay_handle_redirect, alipay_handle_redirect) ||
                other.alipay_handle_redirect == alipay_handle_redirect) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, alipay_handle_redirect, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NextActionImplCopyWith<_$NextActionImpl> get copyWith =>
      __$$NextActionImplCopyWithImpl<_$NextActionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NextActionImplToJson(
      this,
    );
  }
}

abstract class _NextAction implements NextAction {
  factory _NextAction(
      {required final AlipayHandleRedirect alipay_handle_redirect,
      required final String type}) = _$NextActionImpl;

  factory _NextAction.fromJson(Map<String, dynamic> json) =
      _$NextActionImpl.fromJson;

  @override
  AlipayHandleRedirect get alipay_handle_redirect;
  @override
  String get type;
  @override
  @JsonKey(ignore: true)
  _$$NextActionImplCopyWith<_$NextActionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AlipayHandleRedirect _$AlipayHandleRedirectFromJson(Map<String, dynamic> json) {
  return _AlipayHandleRedirect.fromJson(json);
}

/// @nodoc
mixin _$AlipayHandleRedirect {
  String get native_data => throw _privateConstructorUsedError;
  String? get native_url => throw _privateConstructorUsedError;
  String get return_url => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AlipayHandleRedirectCopyWith<AlipayHandleRedirect> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlipayHandleRedirectCopyWith<$Res> {
  factory $AlipayHandleRedirectCopyWith(AlipayHandleRedirect value,
          $Res Function(AlipayHandleRedirect) then) =
      _$AlipayHandleRedirectCopyWithImpl<$Res, AlipayHandleRedirect>;
  @useResult
  $Res call(
      {String native_data, String? native_url, String return_url, String url});
}

/// @nodoc
class _$AlipayHandleRedirectCopyWithImpl<$Res,
        $Val extends AlipayHandleRedirect>
    implements $AlipayHandleRedirectCopyWith<$Res> {
  _$AlipayHandleRedirectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? native_data = null,
    Object? native_url = freezed,
    Object? return_url = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      native_data: null == native_data
          ? _value.native_data
          : native_data // ignore: cast_nullable_to_non_nullable
              as String,
      native_url: freezed == native_url
          ? _value.native_url
          : native_url // ignore: cast_nullable_to_non_nullable
              as String?,
      return_url: null == return_url
          ? _value.return_url
          : return_url // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AlipayHandleRedirectImplCopyWith<$Res>
    implements $AlipayHandleRedirectCopyWith<$Res> {
  factory _$$AlipayHandleRedirectImplCopyWith(_$AlipayHandleRedirectImpl value,
          $Res Function(_$AlipayHandleRedirectImpl) then) =
      __$$AlipayHandleRedirectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String native_data, String? native_url, String return_url, String url});
}

/// @nodoc
class __$$AlipayHandleRedirectImplCopyWithImpl<$Res>
    extends _$AlipayHandleRedirectCopyWithImpl<$Res, _$AlipayHandleRedirectImpl>
    implements _$$AlipayHandleRedirectImplCopyWith<$Res> {
  __$$AlipayHandleRedirectImplCopyWithImpl(_$AlipayHandleRedirectImpl _value,
      $Res Function(_$AlipayHandleRedirectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? native_data = null,
    Object? native_url = freezed,
    Object? return_url = null,
    Object? url = null,
  }) {
    return _then(_$AlipayHandleRedirectImpl(
      native_data: null == native_data
          ? _value.native_data
          : native_data // ignore: cast_nullable_to_non_nullable
              as String,
      native_url: freezed == native_url
          ? _value.native_url
          : native_url // ignore: cast_nullable_to_non_nullable
              as String?,
      return_url: null == return_url
          ? _value.return_url
          : return_url // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AlipayHandleRedirectImpl implements _AlipayHandleRedirect {
  _$AlipayHandleRedirectImpl(
      {required this.native_data,
      this.native_url,
      required this.return_url,
      required this.url});

  factory _$AlipayHandleRedirectImpl.fromJson(Map<String, dynamic> json) =>
      _$$AlipayHandleRedirectImplFromJson(json);

  @override
  final String native_data;
  @override
  final String? native_url;
  @override
  final String return_url;
  @override
  final String url;

  @override
  String toString() {
    return 'AlipayHandleRedirect(native_data: $native_data, native_url: $native_url, return_url: $return_url, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AlipayHandleRedirectImpl &&
            (identical(other.native_data, native_data) ||
                other.native_data == native_data) &&
            (identical(other.native_url, native_url) ||
                other.native_url == native_url) &&
            (identical(other.return_url, return_url) ||
                other.return_url == return_url) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, native_data, native_url, return_url, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AlipayHandleRedirectImplCopyWith<_$AlipayHandleRedirectImpl>
      get copyWith =>
          __$$AlipayHandleRedirectImplCopyWithImpl<_$AlipayHandleRedirectImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AlipayHandleRedirectImplToJson(
      this,
    );
  }
}

abstract class _AlipayHandleRedirect implements AlipayHandleRedirect {
  factory _AlipayHandleRedirect(
      {required final String native_data,
      final String? native_url,
      required final String return_url,
      required final String url}) = _$AlipayHandleRedirectImpl;

  factory _AlipayHandleRedirect.fromJson(Map<String, dynamic> json) =
      _$AlipayHandleRedirectImpl.fromJson;

  @override
  String get native_data;
  @override
  String? get native_url;
  @override
  String get return_url;
  @override
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$AlipayHandleRedirectImplCopyWith<_$AlipayHandleRedirectImpl>
      get copyWith => throw _privateConstructorUsedError;
}
