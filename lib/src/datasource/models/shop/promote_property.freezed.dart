// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'promote_property.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PromoteProperty _$PromotePropertyFromJson(Map<String, dynamic> json) {
  return _PromoteProperty.fromJson(json);
}

/// @nodoc
mixin _$PromoteProperty {
  Data get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PromotePropertyCopyWith<PromoteProperty> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PromotePropertyCopyWith<$Res> {
  factory $PromotePropertyCopyWith(
          PromoteProperty value, $Res Function(PromoteProperty) then) =
      _$PromotePropertyCopyWithImpl<$Res, PromoteProperty>;
  @useResult
  $Res call({Data data});

  $DataCopyWith<$Res> get data;
}

/// @nodoc
class _$PromotePropertyCopyWithImpl<$Res, $Val extends PromoteProperty>
    implements $PromotePropertyCopyWith<$Res> {
  _$PromotePropertyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DataCopyWith<$Res> get data {
    return $DataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PromotePropertyImplCopyWith<$Res>
    implements $PromotePropertyCopyWith<$Res> {
  factory _$$PromotePropertyImplCopyWith(_$PromotePropertyImpl value,
          $Res Function(_$PromotePropertyImpl) then) =
      __$$PromotePropertyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Data data});

  @override
  $DataCopyWith<$Res> get data;
}

/// @nodoc
class __$$PromotePropertyImplCopyWithImpl<$Res>
    extends _$PromotePropertyCopyWithImpl<$Res, _$PromotePropertyImpl>
    implements _$$PromotePropertyImplCopyWith<$Res> {
  __$$PromotePropertyImplCopyWithImpl(
      _$PromotePropertyImpl _value, $Res Function(_$PromotePropertyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$PromotePropertyImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PromotePropertyImpl implements _PromoteProperty {
  const _$PromotePropertyImpl({required this.data});

  factory _$PromotePropertyImpl.fromJson(Map<String, dynamic> json) =>
      _$$PromotePropertyImplFromJson(json);

  @override
  final Data data;

  @override
  String toString() {
    return 'PromoteProperty(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PromotePropertyImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PromotePropertyImplCopyWith<_$PromotePropertyImpl> get copyWith =>
      __$$PromotePropertyImplCopyWithImpl<_$PromotePropertyImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PromotePropertyImplToJson(
      this,
    );
  }
}

abstract class _PromoteProperty implements PromoteProperty {
  const factory _PromoteProperty({required final Data data}) =
      _$PromotePropertyImpl;

  factory _PromoteProperty.fromJson(Map<String, dynamic> json) =
      _$PromotePropertyImpl.fromJson;

  @override
  Data get data;
  @override
  @JsonKey(ignore: true)
  _$$PromotePropertyImplCopyWith<_$PromotePropertyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Data _$DataFromJson(Map<String, dynamic> json) {
  return _Data.fromJson(json);
}

/// @nodoc
mixin _$Data {
  PromotionalCode get promotionalCode => throw _privateConstructorUsedError;
  Heap get heap => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataCopyWith<Data> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataCopyWith<$Res> {
  factory $DataCopyWith(Data value, $Res Function(Data) then) =
      _$DataCopyWithImpl<$Res, Data>;
  @useResult
  $Res call({PromotionalCode promotionalCode, Heap heap});

  $PromotionalCodeCopyWith<$Res> get promotionalCode;
  $HeapCopyWith<$Res> get heap;
}

/// @nodoc
class _$DataCopyWithImpl<$Res, $Val extends Data>
    implements $DataCopyWith<$Res> {
  _$DataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? promotionalCode = null,
    Object? heap = null,
  }) {
    return _then(_value.copyWith(
      promotionalCode: null == promotionalCode
          ? _value.promotionalCode
          : promotionalCode // ignore: cast_nullable_to_non_nullable
              as PromotionalCode,
      heap: null == heap
          ? _value.heap
          : heap // ignore: cast_nullable_to_non_nullable
              as Heap,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PromotionalCodeCopyWith<$Res> get promotionalCode {
    return $PromotionalCodeCopyWith<$Res>(_value.promotionalCode, (value) {
      return _then(_value.copyWith(promotionalCode: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $HeapCopyWith<$Res> get heap {
    return $HeapCopyWith<$Res>(_value.heap, (value) {
      return _then(_value.copyWith(heap: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DataImplCopyWith<$Res> implements $DataCopyWith<$Res> {
  factory _$$DataImplCopyWith(
          _$DataImpl value, $Res Function(_$DataImpl) then) =
      __$$DataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PromotionalCode promotionalCode, Heap heap});

  @override
  $PromotionalCodeCopyWith<$Res> get promotionalCode;
  @override
  $HeapCopyWith<$Res> get heap;
}

/// @nodoc
class __$$DataImplCopyWithImpl<$Res>
    extends _$DataCopyWithImpl<$Res, _$DataImpl>
    implements _$$DataImplCopyWith<$Res> {
  __$$DataImplCopyWithImpl(_$DataImpl _value, $Res Function(_$DataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? promotionalCode = null,
    Object? heap = null,
  }) {
    return _then(_$DataImpl(
      promotionalCode: null == promotionalCode
          ? _value.promotionalCode
          : promotionalCode // ignore: cast_nullable_to_non_nullable
              as PromotionalCode,
      heap: null == heap
          ? _value.heap
          : heap // ignore: cast_nullable_to_non_nullable
              as Heap,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataImpl implements _Data {
  const _$DataImpl({required this.promotionalCode, required this.heap});

  factory _$DataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataImplFromJson(json);

  @override
  final PromotionalCode promotionalCode;
  @override
  final Heap heap;

  @override
  String toString() {
    return 'Data(promotionalCode: $promotionalCode, heap: $heap)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataImpl &&
            (identical(other.promotionalCode, promotionalCode) ||
                other.promotionalCode == promotionalCode) &&
            (identical(other.heap, heap) || other.heap == heap));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, promotionalCode, heap);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      __$$DataImplCopyWithImpl<_$DataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataImplToJson(
      this,
    );
  }
}

abstract class _Data implements Data {
  const factory _Data(
      {required final PromotionalCode promotionalCode,
      required final Heap heap}) = _$DataImpl;

  factory _Data.fromJson(Map<String, dynamic> json) = _$DataImpl.fromJson;

  @override
  PromotionalCode get promotionalCode;
  @override
  Heap get heap;
  @override
  @JsonKey(ignore: true)
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PromotionalCode _$PromotionalCodeFromJson(Map<String, dynamic> json) {
  return _PromotionalCode.fromJson(json);
}

/// @nodoc
mixin _$PromotionalCode {
  PromotionalCodeValidation get validate => throw _privateConstructorUsedError;
  @JsonKey(name: '__typename')
  String get typename => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PromotionalCodeCopyWith<PromotionalCode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PromotionalCodeCopyWith<$Res> {
  factory $PromotionalCodeCopyWith(
          PromotionalCode value, $Res Function(PromotionalCode) then) =
      _$PromotionalCodeCopyWithImpl<$Res, PromotionalCode>;
  @useResult
  $Res call(
      {PromotionalCodeValidation validate,
      @JsonKey(name: '__typename') String typename});

  $PromotionalCodeValidationCopyWith<$Res> get validate;
}

/// @nodoc
class _$PromotionalCodeCopyWithImpl<$Res, $Val extends PromotionalCode>
    implements $PromotionalCodeCopyWith<$Res> {
  _$PromotionalCodeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? validate = null,
    Object? typename = null,
  }) {
    return _then(_value.copyWith(
      validate: null == validate
          ? _value.validate
          : validate // ignore: cast_nullable_to_non_nullable
              as PromotionalCodeValidation,
      typename: null == typename
          ? _value.typename
          : typename // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PromotionalCodeValidationCopyWith<$Res> get validate {
    return $PromotionalCodeValidationCopyWith<$Res>(_value.validate, (value) {
      return _then(_value.copyWith(validate: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PromotionalCodeImplCopyWith<$Res>
    implements $PromotionalCodeCopyWith<$Res> {
  factory _$$PromotionalCodeImplCopyWith(_$PromotionalCodeImpl value,
          $Res Function(_$PromotionalCodeImpl) then) =
      __$$PromotionalCodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PromotionalCodeValidation validate,
      @JsonKey(name: '__typename') String typename});

  @override
  $PromotionalCodeValidationCopyWith<$Res> get validate;
}

/// @nodoc
class __$$PromotionalCodeImplCopyWithImpl<$Res>
    extends _$PromotionalCodeCopyWithImpl<$Res, _$PromotionalCodeImpl>
    implements _$$PromotionalCodeImplCopyWith<$Res> {
  __$$PromotionalCodeImplCopyWithImpl(
      _$PromotionalCodeImpl _value, $Res Function(_$PromotionalCodeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? validate = null,
    Object? typename = null,
  }) {
    return _then(_$PromotionalCodeImpl(
      validate: null == validate
          ? _value.validate
          : validate // ignore: cast_nullable_to_non_nullable
              as PromotionalCodeValidation,
      typename: null == typename
          ? _value.typename
          : typename // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PromotionalCodeImpl implements _PromotionalCode {
  const _$PromotionalCodeImpl(
      {required this.validate,
      @JsonKey(name: '__typename') required this.typename});

  factory _$PromotionalCodeImpl.fromJson(Map<String, dynamic> json) =>
      _$$PromotionalCodeImplFromJson(json);

  @override
  final PromotionalCodeValidation validate;
  @override
  @JsonKey(name: '__typename')
  final String typename;

  @override
  String toString() {
    return 'PromotionalCode(validate: $validate, typename: $typename)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PromotionalCodeImpl &&
            (identical(other.validate, validate) ||
                other.validate == validate) &&
            (identical(other.typename, typename) ||
                other.typename == typename));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, validate, typename);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PromotionalCodeImplCopyWith<_$PromotionalCodeImpl> get copyWith =>
      __$$PromotionalCodeImplCopyWithImpl<_$PromotionalCodeImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PromotionalCodeImplToJson(
      this,
    );
  }
}

abstract class _PromotionalCode implements PromotionalCode {
  const factory _PromotionalCode(
          {required final PromotionalCodeValidation validate,
          @JsonKey(name: '__typename') required final String typename}) =
      _$PromotionalCodeImpl;

  factory _PromotionalCode.fromJson(Map<String, dynamic> json) =
      _$PromotionalCodeImpl.fromJson;

  @override
  PromotionalCodeValidation get validate;
  @override
  @JsonKey(name: '__typename')
  String get typename;
  @override
  @JsonKey(ignore: true)
  _$$PromotionalCodeImplCopyWith<_$PromotionalCodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PromotionalCodeValidation _$PromotionalCodeValidationFromJson(
    Map<String, dynamic> json) {
  return _PromotionalCodeValidation.fromJson(json);
}

/// @nodoc
mixin _$PromotionalCodeValidation {
  bool get isValid => throw _privateConstructorUsedError;
  String get error => throw _privateConstructorUsedError;
  @JsonKey(name: '__typename')
  String get typename => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PromotionalCodeValidationCopyWith<PromotionalCodeValidation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PromotionalCodeValidationCopyWith<$Res> {
  factory $PromotionalCodeValidationCopyWith(PromotionalCodeValidation value,
          $Res Function(PromotionalCodeValidation) then) =
      _$PromotionalCodeValidationCopyWithImpl<$Res, PromotionalCodeValidation>;
  @useResult
  $Res call(
      {bool isValid,
      String error,
      @JsonKey(name: '__typename') String typename});
}

/// @nodoc
class _$PromotionalCodeValidationCopyWithImpl<$Res,
        $Val extends PromotionalCodeValidation>
    implements $PromotionalCodeValidationCopyWith<$Res> {
  _$PromotionalCodeValidationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isValid = null,
    Object? error = null,
    Object? typename = null,
  }) {
    return _then(_value.copyWith(
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      typename: null == typename
          ? _value.typename
          : typename // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PromotionalCodeValidationImplCopyWith<$Res>
    implements $PromotionalCodeValidationCopyWith<$Res> {
  factory _$$PromotionalCodeValidationImplCopyWith(
          _$PromotionalCodeValidationImpl value,
          $Res Function(_$PromotionalCodeValidationImpl) then) =
      __$$PromotionalCodeValidationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isValid,
      String error,
      @JsonKey(name: '__typename') String typename});
}

/// @nodoc
class __$$PromotionalCodeValidationImplCopyWithImpl<$Res>
    extends _$PromotionalCodeValidationCopyWithImpl<$Res,
        _$PromotionalCodeValidationImpl>
    implements _$$PromotionalCodeValidationImplCopyWith<$Res> {
  __$$PromotionalCodeValidationImplCopyWithImpl(
      _$PromotionalCodeValidationImpl _value,
      $Res Function(_$PromotionalCodeValidationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isValid = null,
    Object? error = null,
    Object? typename = null,
  }) {
    return _then(_$PromotionalCodeValidationImpl(
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
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
class _$PromotionalCodeValidationImpl implements _PromotionalCodeValidation {
  const _$PromotionalCodeValidationImpl(
      {required this.isValid,
      required this.error,
      @JsonKey(name: '__typename') required this.typename});

  factory _$PromotionalCodeValidationImpl.fromJson(Map<String, dynamic> json) =>
      _$$PromotionalCodeValidationImplFromJson(json);

  @override
  final bool isValid;
  @override
  final String error;
  @override
  @JsonKey(name: '__typename')
  final String typename;

  @override
  String toString() {
    return 'PromotionalCodeValidation(isValid: $isValid, error: $error, typename: $typename)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PromotionalCodeValidationImpl &&
            (identical(other.isValid, isValid) || other.isValid == isValid) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.typename, typename) ||
                other.typename == typename));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isValid, error, typename);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PromotionalCodeValidationImplCopyWith<_$PromotionalCodeValidationImpl>
      get copyWith => __$$PromotionalCodeValidationImplCopyWithImpl<
          _$PromotionalCodeValidationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PromotionalCodeValidationImplToJson(
      this,
    );
  }
}

abstract class _PromotionalCodeValidation implements PromotionalCodeValidation {
  const factory _PromotionalCodeValidation(
          {required final bool isValid,
          required final String error,
          @JsonKey(name: '__typename') required final String typename}) =
      _$PromotionalCodeValidationImpl;

  factory _PromotionalCodeValidation.fromJson(Map<String, dynamic> json) =
      _$PromotionalCodeValidationImpl.fromJson;

  @override
  bool get isValid;
  @override
  String get error;
  @override
  @JsonKey(name: '__typename')
  String get typename;
  @override
  @JsonKey(ignore: true)
  _$$PromotionalCodeValidationImplCopyWith<_$PromotionalCodeValidationImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Heap _$HeapFromJson(Map<String, dynamic> json) {
  return _Heap.fromJson(json);
}

/// @nodoc
mixin _$Heap {
  HeapVariable get launcherDownloadLink => throw _privateConstructorUsedError;
  @JsonKey(name: '__typename')
  String get typename => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HeapCopyWith<Heap> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HeapCopyWith<$Res> {
  factory $HeapCopyWith(Heap value, $Res Function(Heap) then) =
      _$HeapCopyWithImpl<$Res, Heap>;
  @useResult
  $Res call(
      {HeapVariable launcherDownloadLink,
      @JsonKey(name: '__typename') String typename});

  $HeapVariableCopyWith<$Res> get launcherDownloadLink;
}

/// @nodoc
class _$HeapCopyWithImpl<$Res, $Val extends Heap>
    implements $HeapCopyWith<$Res> {
  _$HeapCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? launcherDownloadLink = null,
    Object? typename = null,
  }) {
    return _then(_value.copyWith(
      launcherDownloadLink: null == launcherDownloadLink
          ? _value.launcherDownloadLink
          : launcherDownloadLink // ignore: cast_nullable_to_non_nullable
              as HeapVariable,
      typename: null == typename
          ? _value.typename
          : typename // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $HeapVariableCopyWith<$Res> get launcherDownloadLink {
    return $HeapVariableCopyWith<$Res>(_value.launcherDownloadLink, (value) {
      return _then(_value.copyWith(launcherDownloadLink: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HeapImplCopyWith<$Res> implements $HeapCopyWith<$Res> {
  factory _$$HeapImplCopyWith(
          _$HeapImpl value, $Res Function(_$HeapImpl) then) =
      __$$HeapImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {HeapVariable launcherDownloadLink,
      @JsonKey(name: '__typename') String typename});

  @override
  $HeapVariableCopyWith<$Res> get launcherDownloadLink;
}

/// @nodoc
class __$$HeapImplCopyWithImpl<$Res>
    extends _$HeapCopyWithImpl<$Res, _$HeapImpl>
    implements _$$HeapImplCopyWith<$Res> {
  __$$HeapImplCopyWithImpl(_$HeapImpl _value, $Res Function(_$HeapImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? launcherDownloadLink = null,
    Object? typename = null,
  }) {
    return _then(_$HeapImpl(
      launcherDownloadLink: null == launcherDownloadLink
          ? _value.launcherDownloadLink
          : launcherDownloadLink // ignore: cast_nullable_to_non_nullable
              as HeapVariable,
      typename: null == typename
          ? _value.typename
          : typename // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HeapImpl implements _Heap {
  const _$HeapImpl(
      {required this.launcherDownloadLink,
      @JsonKey(name: '__typename') required this.typename});

  factory _$HeapImpl.fromJson(Map<String, dynamic> json) =>
      _$$HeapImplFromJson(json);

  @override
  final HeapVariable launcherDownloadLink;
  @override
  @JsonKey(name: '__typename')
  final String typename;

  @override
  String toString() {
    return 'Heap(launcherDownloadLink: $launcherDownloadLink, typename: $typename)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HeapImpl &&
            (identical(other.launcherDownloadLink, launcherDownloadLink) ||
                other.launcherDownloadLink == launcherDownloadLink) &&
            (identical(other.typename, typename) ||
                other.typename == typename));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, launcherDownloadLink, typename);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HeapImplCopyWith<_$HeapImpl> get copyWith =>
      __$$HeapImplCopyWithImpl<_$HeapImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HeapImplToJson(
      this,
    );
  }
}

abstract class _Heap implements Heap {
  const factory _Heap(
          {required final HeapVariable launcherDownloadLink,
          @JsonKey(name: '__typename') required final String typename}) =
      _$HeapImpl;

  factory _Heap.fromJson(Map<String, dynamic> json) = _$HeapImpl.fromJson;

  @override
  HeapVariable get launcherDownloadLink;
  @override
  @JsonKey(name: '__typename')
  String get typename;
  @override
  @JsonKey(ignore: true)
  _$$HeapImplCopyWith<_$HeapImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

HeapVariable _$HeapVariableFromJson(Map<String, dynamic> json) {
  return _HeapVariable.fromJson(json);
}

/// @nodoc
mixin _$HeapVariable {
  String get value => throw _privateConstructorUsedError;
  @JsonKey(name: '__typename')
  String get typename => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HeapVariableCopyWith<HeapVariable> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HeapVariableCopyWith<$Res> {
  factory $HeapVariableCopyWith(
          HeapVariable value, $Res Function(HeapVariable) then) =
      _$HeapVariableCopyWithImpl<$Res, HeapVariable>;
  @useResult
  $Res call({String value, @JsonKey(name: '__typename') String typename});
}

/// @nodoc
class _$HeapVariableCopyWithImpl<$Res, $Val extends HeapVariable>
    implements $HeapVariableCopyWith<$Res> {
  _$HeapVariableCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? typename = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      typename: null == typename
          ? _value.typename
          : typename // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HeapVariableImplCopyWith<$Res>
    implements $HeapVariableCopyWith<$Res> {
  factory _$$HeapVariableImplCopyWith(
          _$HeapVariableImpl value, $Res Function(_$HeapVariableImpl) then) =
      __$$HeapVariableImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String value, @JsonKey(name: '__typename') String typename});
}

/// @nodoc
class __$$HeapVariableImplCopyWithImpl<$Res>
    extends _$HeapVariableCopyWithImpl<$Res, _$HeapVariableImpl>
    implements _$$HeapVariableImplCopyWith<$Res> {
  __$$HeapVariableImplCopyWithImpl(
      _$HeapVariableImpl _value, $Res Function(_$HeapVariableImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? typename = null,
  }) {
    return _then(_$HeapVariableImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
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
class _$HeapVariableImpl implements _HeapVariable {
  const _$HeapVariableImpl(
      {required this.value,
      @JsonKey(name: '__typename') required this.typename});

  factory _$HeapVariableImpl.fromJson(Map<String, dynamic> json) =>
      _$$HeapVariableImplFromJson(json);

  @override
  final String value;
  @override
  @JsonKey(name: '__typename')
  final String typename;

  @override
  String toString() {
    return 'HeapVariable(value: $value, typename: $typename)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HeapVariableImpl &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.typename, typename) ||
                other.typename == typename));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, value, typename);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HeapVariableImplCopyWith<_$HeapVariableImpl> get copyWith =>
      __$$HeapVariableImplCopyWithImpl<_$HeapVariableImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HeapVariableImplToJson(
      this,
    );
  }
}

abstract class _HeapVariable implements HeapVariable {
  const factory _HeapVariable(
          {required final String value,
          @JsonKey(name: '__typename') required final String typename}) =
      _$HeapVariableImpl;

  factory _HeapVariable.fromJson(Map<String, dynamic> json) =
      _$HeapVariableImpl.fromJson;

  @override
  String get value;
  @override
  @JsonKey(name: '__typename')
  String get typename;
  @override
  @JsonKey(ignore: true)
  _$$HeapVariableImplCopyWith<_$HeapVariableImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
