// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_property.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LoginProperty _$LoginPropertyFromJson(Map<String, dynamic> json) {
  return _LoginProperty.fromJson(json);
}

/// @nodoc
mixin _$LoginProperty {
  List<Error>? get errors => throw _privateConstructorUsedError;
  Data? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginPropertyCopyWith<LoginProperty> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginPropertyCopyWith<$Res> {
  factory $LoginPropertyCopyWith(
          LoginProperty value, $Res Function(LoginProperty) then) =
      _$LoginPropertyCopyWithImpl<$Res, LoginProperty>;
  @useResult
  $Res call({List<Error>? errors, Data? data});

  $DataCopyWith<$Res>? get data;
}

/// @nodoc
class _$LoginPropertyCopyWithImpl<$Res, $Val extends LoginProperty>
    implements $LoginPropertyCopyWith<$Res> {
  _$LoginPropertyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errors = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      errors: freezed == errors
          ? _value.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<Error>?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $DataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LoginPropertyImplCopyWith<$Res>
    implements $LoginPropertyCopyWith<$Res> {
  factory _$$LoginPropertyImplCopyWith(
          _$LoginPropertyImpl value, $Res Function(_$LoginPropertyImpl) then) =
      __$$LoginPropertyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Error>? errors, Data? data});

  @override
  $DataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$LoginPropertyImplCopyWithImpl<$Res>
    extends _$LoginPropertyCopyWithImpl<$Res, _$LoginPropertyImpl>
    implements _$$LoginPropertyImplCopyWith<$Res> {
  __$$LoginPropertyImplCopyWithImpl(
      _$LoginPropertyImpl _value, $Res Function(_$LoginPropertyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errors = freezed,
    Object? data = freezed,
  }) {
    return _then(_$LoginPropertyImpl(
      errors: freezed == errors
          ? _value._errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<Error>?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginPropertyImpl implements _LoginProperty {
  const _$LoginPropertyImpl({final List<Error>? errors, this.data})
      : _errors = errors;

  factory _$LoginPropertyImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginPropertyImplFromJson(json);

  final List<Error>? _errors;
  @override
  List<Error>? get errors {
    final value = _errors;
    if (value == null) return null;
    if (_errors is EqualUnmodifiableListView) return _errors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Data? data;

  @override
  String toString() {
    return 'LoginProperty(errors: $errors, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginPropertyImpl &&
            const DeepCollectionEquality().equals(other._errors, _errors) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_errors), data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginPropertyImplCopyWith<_$LoginPropertyImpl> get copyWith =>
      __$$LoginPropertyImplCopyWithImpl<_$LoginPropertyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginPropertyImplToJson(
      this,
    );
  }
}

abstract class _LoginProperty implements LoginProperty {
  const factory _LoginProperty({final List<Error>? errors, final Data? data}) =
      _$LoginPropertyImpl;

  factory _LoginProperty.fromJson(Map<String, dynamic> json) =
      _$LoginPropertyImpl.fromJson;

  @override
  List<Error>? get errors;
  @override
  Data? get data;
  @override
  @JsonKey(ignore: true)
  _$$LoginPropertyImplCopyWith<_$LoginPropertyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Data _$DataFromJson(Map<String, dynamic> json) {
  return _Data.fromJson(json);
}

/// @nodoc
mixin _$Data {
  Login? get accountSignin => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataCopyWith<Data> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataCopyWith<$Res> {
  factory $DataCopyWith(Data value, $Res Function(Data) then) =
      _$DataCopyWithImpl<$Res, Data>;
  @useResult
  $Res call({Login? accountSignin});

  $LoginCopyWith<$Res>? get accountSignin;
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
    Object? accountSignin = freezed,
  }) {
    return _then(_value.copyWith(
      accountSignin: freezed == accountSignin
          ? _value.accountSignin
          : accountSignin // ignore: cast_nullable_to_non_nullable
              as Login?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LoginCopyWith<$Res>? get accountSignin {
    if (_value.accountSignin == null) {
      return null;
    }

    return $LoginCopyWith<$Res>(_value.accountSignin!, (value) {
      return _then(_value.copyWith(accountSignin: value) as $Val);
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
  $Res call({Login? accountSignin});

  @override
  $LoginCopyWith<$Res>? get accountSignin;
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
    Object? accountSignin = freezed,
  }) {
    return _then(_$DataImpl(
      accountSignin: freezed == accountSignin
          ? _value.accountSignin
          : accountSignin // ignore: cast_nullable_to_non_nullable
              as Login?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataImpl implements _Data {
  const _$DataImpl({this.accountSignin});

  factory _$DataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataImplFromJson(json);

  @override
  final Login? accountSignin;

  @override
  String toString() {
    return 'Data(accountSignin: $accountSignin)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataImpl &&
            (identical(other.accountSignin, accountSignin) ||
                other.accountSignin == accountSignin));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, accountSignin);

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
  const factory _Data({final Login? accountSignin}) = _$DataImpl;

  factory _Data.fromJson(Map<String, dynamic> json) = _$DataImpl.fromJson;

  @override
  Login? get accountSignin;
  @override
  @JsonKey(ignore: true)
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Login _$LoginFromJson(Map<String, dynamic> json) {
  return _Login.fromJson(json);
}

/// @nodoc
mixin _$Login {
  String get displayname => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginCopyWith<Login> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginCopyWith<$Res> {
  factory $LoginCopyWith(Login value, $Res Function(Login) then) =
      _$LoginCopyWithImpl<$Res, Login>;
  @useResult
  $Res call({String displayname, int id});
}

/// @nodoc
class _$LoginCopyWithImpl<$Res, $Val extends Login>
    implements $LoginCopyWith<$Res> {
  _$LoginCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayname = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      displayname: null == displayname
          ? _value.displayname
          : displayname // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginImplCopyWith<$Res> implements $LoginCopyWith<$Res> {
  factory _$$LoginImplCopyWith(
          _$LoginImpl value, $Res Function(_$LoginImpl) then) =
      __$$LoginImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String displayname, int id});
}

/// @nodoc
class __$$LoginImplCopyWithImpl<$Res>
    extends _$LoginCopyWithImpl<$Res, _$LoginImpl>
    implements _$$LoginImplCopyWith<$Res> {
  __$$LoginImplCopyWithImpl(
      _$LoginImpl _value, $Res Function(_$LoginImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayname = null,
    Object? id = null,
  }) {
    return _then(_$LoginImpl(
      displayname: null == displayname
          ? _value.displayname
          : displayname // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginImpl implements _Login {
  const _$LoginImpl({required this.displayname, required this.id});

  factory _$LoginImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginImplFromJson(json);

  @override
  final String displayname;
  @override
  final int id;

  @override
  String toString() {
    return 'Login(displayname: $displayname, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginImpl &&
            (identical(other.displayname, displayname) ||
                other.displayname == displayname) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, displayname, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginImplCopyWith<_$LoginImpl> get copyWith =>
      __$$LoginImplCopyWithImpl<_$LoginImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginImplToJson(
      this,
    );
  }
}

abstract class _Login implements Login {
  const factory _Login(
      {required final String displayname, required final int id}) = _$LoginImpl;

  factory _Login.fromJson(Map<String, dynamic> json) = _$LoginImpl.fromJson;

  @override
  String get displayname;
  @override
  int get id;
  @override
  @JsonKey(ignore: true)
  _$$LoginImplCopyWith<_$LoginImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Error _$ErrorFromJson(Map<String, dynamic> json) {
  return _Error.fromJson(json);
}

/// @nodoc
mixin _$Error {
  String get message => throw _privateConstructorUsedError;
  Extensions get extensions => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ErrorCopyWith<Error> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorCopyWith<$Res> {
  factory $ErrorCopyWith(Error value, $Res Function(Error) then) =
      _$ErrorCopyWithImpl<$Res, Error>;
  @useResult
  $Res call({String message, Extensions extensions, String code});

  $ExtensionsCopyWith<$Res> get extensions;
}

/// @nodoc
class _$ErrorCopyWithImpl<$Res, $Val extends Error>
    implements $ErrorCopyWith<$Res> {
  _$ErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? extensions = null,
    Object? code = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      extensions: null == extensions
          ? _value.extensions
          : extensions // ignore: cast_nullable_to_non_nullable
              as Extensions,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ExtensionsCopyWith<$Res> get extensions {
    return $ExtensionsCopyWith<$Res>(_value.extensions, (value) {
      return _then(_value.copyWith(extensions: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> implements $ErrorCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, Extensions extensions, String code});

  @override
  $ExtensionsCopyWith<$Res> get extensions;
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$ErrorCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? extensions = null,
    Object? code = null,
  }) {
    return _then(_$ErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      extensions: null == extensions
          ? _value.extensions
          : extensions // ignore: cast_nullable_to_non_nullable
              as Extensions,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ErrorImpl implements _Error {
  const _$ErrorImpl(
      {required this.message, required this.extensions, required this.code});

  factory _$ErrorImpl.fromJson(Map<String, dynamic> json) =>
      _$$ErrorImplFromJson(json);

  @override
  final String message;
  @override
  final Extensions extensions;
  @override
  final String code;

  @override
  String toString() {
    return 'Error(message: $message, extensions: $extensions, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.extensions, extensions) ||
                other.extensions == extensions) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message, extensions, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ErrorImplToJson(
      this,
    );
  }
}

abstract class _Error implements Error {
  const factory _Error(
      {required final String message,
      required final Extensions extensions,
      required final String code}) = _$ErrorImpl;

  factory _Error.fromJson(Map<String, dynamic> json) = _$ErrorImpl.fromJson;

  @override
  String get message;
  @override
  Extensions get extensions;
  @override
  String get code;
  @override
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Extensions _$ExtensionsFromJson(Map<String, dynamic> json) {
  return _Extensions.fromJson(json);
}

/// @nodoc
mixin _$Extensions {
  Details get details => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExtensionsCopyWith<Extensions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExtensionsCopyWith<$Res> {
  factory $ExtensionsCopyWith(
          Extensions value, $Res Function(Extensions) then) =
      _$ExtensionsCopyWithImpl<$Res, Extensions>;
  @useResult
  $Res call({Details details});

  $DetailsCopyWith<$Res> get details;
}

/// @nodoc
class _$ExtensionsCopyWithImpl<$Res, $Val extends Extensions>
    implements $ExtensionsCopyWith<$Res> {
  _$ExtensionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? details = null,
  }) {
    return _then(_value.copyWith(
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as Details,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DetailsCopyWith<$Res> get details {
    return $DetailsCopyWith<$Res>(_value.details, (value) {
      return _then(_value.copyWith(details: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ExtensionsImplCopyWith<$Res>
    implements $ExtensionsCopyWith<$Res> {
  factory _$$ExtensionsImplCopyWith(
          _$ExtensionsImpl value, $Res Function(_$ExtensionsImpl) then) =
      __$$ExtensionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Details details});

  @override
  $DetailsCopyWith<$Res> get details;
}

/// @nodoc
class __$$ExtensionsImplCopyWithImpl<$Res>
    extends _$ExtensionsCopyWithImpl<$Res, _$ExtensionsImpl>
    implements _$$ExtensionsImplCopyWith<$Res> {
  __$$ExtensionsImplCopyWithImpl(
      _$ExtensionsImpl _value, $Res Function(_$ExtensionsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? details = null,
  }) {
    return _then(_$ExtensionsImpl(
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as Details,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExtensionsImpl implements _Extensions {
  const _$ExtensionsImpl({required this.details});

  factory _$ExtensionsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExtensionsImplFromJson(json);

  @override
  final Details details;

  @override
  String toString() {
    return 'Extensions(details: $details)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExtensionsImpl &&
            (identical(other.details, details) || other.details == details));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, details);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExtensionsImplCopyWith<_$ExtensionsImpl> get copyWith =>
      __$$ExtensionsImplCopyWithImpl<_$ExtensionsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExtensionsImplToJson(
      this,
    );
  }
}

abstract class _Extensions implements Extensions {
  const factory _Extensions({required final Details details}) =
      _$ExtensionsImpl;

  factory _Extensions.fromJson(Map<String, dynamic> json) =
      _$ExtensionsImpl.fromJson;

  @override
  Details get details;
  @override
  @JsonKey(ignore: true)
  _$$ExtensionsImplCopyWith<_$ExtensionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Details _$DetailsFromJson(Map<String, dynamic> json) {
  return _Details.fromJson(json);
}

/// @nodoc
mixin _$Details {
  String? get sessionId => throw _privateConstructorUsedError;
  String? get deviceId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DetailsCopyWith<Details> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailsCopyWith<$Res> {
  factory $DetailsCopyWith(Details value, $Res Function(Details) then) =
      _$DetailsCopyWithImpl<$Res, Details>;
  @useResult
  $Res call({String? sessionId, String? deviceId});
}

/// @nodoc
class _$DetailsCopyWithImpl<$Res, $Val extends Details>
    implements $DetailsCopyWith<$Res> {
  _$DetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = freezed,
    Object? deviceId = freezed,
  }) {
    return _then(_value.copyWith(
      sessionId: freezed == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceId: freezed == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DetailsImplCopyWith<$Res> implements $DetailsCopyWith<$Res> {
  factory _$$DetailsImplCopyWith(
          _$DetailsImpl value, $Res Function(_$DetailsImpl) then) =
      __$$DetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? sessionId, String? deviceId});
}

/// @nodoc
class __$$DetailsImplCopyWithImpl<$Res>
    extends _$DetailsCopyWithImpl<$Res, _$DetailsImpl>
    implements _$$DetailsImplCopyWith<$Res> {
  __$$DetailsImplCopyWithImpl(
      _$DetailsImpl _value, $Res Function(_$DetailsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = freezed,
    Object? deviceId = freezed,
  }) {
    return _then(_$DetailsImpl(
      sessionId: freezed == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceId: freezed == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailsImpl implements _Details {
  const _$DetailsImpl({this.sessionId, this.deviceId});

  factory _$DetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailsImplFromJson(json);

  @override
  final String? sessionId;
  @override
  final String? deviceId;

  @override
  String toString() {
    return 'Details(sessionId: $sessionId, deviceId: $deviceId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailsImpl &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, sessionId, deviceId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailsImplCopyWith<_$DetailsImpl> get copyWith =>
      __$$DetailsImplCopyWithImpl<_$DetailsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailsImplToJson(
      this,
    );
  }
}

abstract class _Details implements Details {
  const factory _Details({final String? sessionId, final String? deviceId}) =
      _$DetailsImpl;

  factory _Details.fromJson(Map<String, dynamic> json) = _$DetailsImpl.fromJson;

  @override
  String? get sessionId;
  @override
  String? get deviceId;
  @override
  @JsonKey(ignore: true)
  _$$DetailsImplCopyWith<_$DetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LauncherLoginProperty _$LauncherLoginPropertyFromJson(
    Map<String, dynamic> json) {
  return _LauncherLoginProperty.fromJson(json);
}

/// @nodoc
mixin _$LauncherLoginProperty {
  int get success => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  String get msg => throw _privateConstructorUsedError;
  DataDetails? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LauncherLoginPropertyCopyWith<LauncherLoginProperty> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LauncherLoginPropertyCopyWith<$Res> {
  factory $LauncherLoginPropertyCopyWith(LauncherLoginProperty value,
          $Res Function(LauncherLoginProperty) then) =
      _$LauncherLoginPropertyCopyWithImpl<$Res, LauncherLoginProperty>;
  @useResult
  $Res call({int success, String code, String msg, DataDetails? data});

  $DataDetailsCopyWith<$Res>? get data;
}

/// @nodoc
class _$LauncherLoginPropertyCopyWithImpl<$Res,
        $Val extends LauncherLoginProperty>
    implements $LauncherLoginPropertyCopyWith<$Res> {
  _$LauncherLoginPropertyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? code = null,
    Object? msg = null,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as int,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      msg: null == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as DataDetails?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DataDetailsCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $DataDetailsCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LauncherLoginPropertyImplCopyWith<$Res>
    implements $LauncherLoginPropertyCopyWith<$Res> {
  factory _$$LauncherLoginPropertyImplCopyWith(
          _$LauncherLoginPropertyImpl value,
          $Res Function(_$LauncherLoginPropertyImpl) then) =
      __$$LauncherLoginPropertyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int success, String code, String msg, DataDetails? data});

  @override
  $DataDetailsCopyWith<$Res>? get data;
}

/// @nodoc
class __$$LauncherLoginPropertyImplCopyWithImpl<$Res>
    extends _$LauncherLoginPropertyCopyWithImpl<$Res,
        _$LauncherLoginPropertyImpl>
    implements _$$LauncherLoginPropertyImplCopyWith<$Res> {
  __$$LauncherLoginPropertyImplCopyWithImpl(_$LauncherLoginPropertyImpl _value,
      $Res Function(_$LauncherLoginPropertyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? code = null,
    Object? msg = null,
    Object? data = freezed,
  }) {
    return _then(_$LauncherLoginPropertyImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as int,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      msg: null == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as DataDetails?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LauncherLoginPropertyImpl implements _LauncherLoginProperty {
  const _$LauncherLoginPropertyImpl(
      {required this.success,
      required this.code,
      required this.msg,
      required this.data});

  factory _$LauncherLoginPropertyImpl.fromJson(Map<String, dynamic> json) =>
      _$$LauncherLoginPropertyImplFromJson(json);

  @override
  final int success;
  @override
  final String code;
  @override
  final String msg;
  @override
  final DataDetails? data;

  @override
  String toString() {
    return 'LauncherLoginProperty(success: $success, code: $code, msg: $msg, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LauncherLoginPropertyImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.msg, msg) || other.msg == msg) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, success, code, msg, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LauncherLoginPropertyImplCopyWith<_$LauncherLoginPropertyImpl>
      get copyWith => __$$LauncherLoginPropertyImplCopyWithImpl<
          _$LauncherLoginPropertyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LauncherLoginPropertyImplToJson(
      this,
    );
  }
}

abstract class _LauncherLoginProperty implements LauncherLoginProperty {
  const factory _LauncherLoginProperty(
      {required final int success,
      required final String code,
      required final String msg,
      required final DataDetails? data}) = _$LauncherLoginPropertyImpl;

  factory _LauncherLoginProperty.fromJson(Map<String, dynamic> json) =
      _$LauncherLoginPropertyImpl.fromJson;

  @override
  int get success;
  @override
  String get code;
  @override
  String get msg;
  @override
  DataDetails? get data;
  @override
  @JsonKey(ignore: true)
  _$$LauncherLoginPropertyImplCopyWith<_$LauncherLoginPropertyImpl>
      get copyWith => throw _privateConstructorUsedError;
}

DataDetails _$DataDetailsFromJson(Map<String, dynamic> json) {
  return _DataDetails.fromJson(json);
}

/// @nodoc
mixin _$DataDetails {
  String get session_id => throw _privateConstructorUsedError;
  String? get device_id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataDetailsCopyWith<DataDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataDetailsCopyWith<$Res> {
  factory $DataDetailsCopyWith(
          DataDetails value, $Res Function(DataDetails) then) =
      _$DataDetailsCopyWithImpl<$Res, DataDetails>;
  @useResult
  $Res call({String session_id, String? device_id});
}

/// @nodoc
class _$DataDetailsCopyWithImpl<$Res, $Val extends DataDetails>
    implements $DataDetailsCopyWith<$Res> {
  _$DataDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? session_id = null,
    Object? device_id = freezed,
  }) {
    return _then(_value.copyWith(
      session_id: null == session_id
          ? _value.session_id
          : session_id // ignore: cast_nullable_to_non_nullable
              as String,
      device_id: freezed == device_id
          ? _value.device_id
          : device_id // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DataDetailsImplCopyWith<$Res>
    implements $DataDetailsCopyWith<$Res> {
  factory _$$DataDetailsImplCopyWith(
          _$DataDetailsImpl value, $Res Function(_$DataDetailsImpl) then) =
      __$$DataDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String session_id, String? device_id});
}

/// @nodoc
class __$$DataDetailsImplCopyWithImpl<$Res>
    extends _$DataDetailsCopyWithImpl<$Res, _$DataDetailsImpl>
    implements _$$DataDetailsImplCopyWith<$Res> {
  __$$DataDetailsImplCopyWithImpl(
      _$DataDetailsImpl _value, $Res Function(_$DataDetailsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? session_id = null,
    Object? device_id = freezed,
  }) {
    return _then(_$DataDetailsImpl(
      session_id: null == session_id
          ? _value.session_id
          : session_id // ignore: cast_nullable_to_non_nullable
              as String,
      device_id: freezed == device_id
          ? _value.device_id
          : device_id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataDetailsImpl implements _DataDetails {
  const _$DataDetailsImpl({required this.session_id, this.device_id});

  factory _$DataDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataDetailsImplFromJson(json);

  @override
  final String session_id;
  @override
  final String? device_id;

  @override
  String toString() {
    return 'DataDetails(session_id: $session_id, device_id: $device_id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataDetailsImpl &&
            (identical(other.session_id, session_id) ||
                other.session_id == session_id) &&
            (identical(other.device_id, device_id) ||
                other.device_id == device_id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, session_id, device_id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataDetailsImplCopyWith<_$DataDetailsImpl> get copyWith =>
      __$$DataDetailsImplCopyWithImpl<_$DataDetailsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataDetailsImplToJson(
      this,
    );
  }
}

abstract class _DataDetails implements DataDetails {
  const factory _DataDetails(
      {required final String session_id,
      final String? device_id}) = _$DataDetailsImpl;

  factory _DataDetails.fromJson(Map<String, dynamic> json) =
      _$DataDetailsImpl.fromJson;

  @override
  String get session_id;
  @override
  String? get device_id;
  @override
  @JsonKey(ignore: true)
  _$$DataDetailsImplCopyWith<_$DataDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LoginBody _$LoginBodyFromJson(Map<String, dynamic> json) {
  return _LoginBody.fromJson(json);
}

/// @nodoc
mixin _$LoginBody {
  String get captcha => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  bool get remember => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginBodyCopyWith<LoginBody> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginBodyCopyWith<$Res> {
  factory $LoginBodyCopyWith(LoginBody value, $Res Function(LoginBody) then) =
      _$LoginBodyCopyWithImpl<$Res, LoginBody>;
  @useResult
  $Res call({String captcha, String email, String password, bool remember});
}

/// @nodoc
class _$LoginBodyCopyWithImpl<$Res, $Val extends LoginBody>
    implements $LoginBodyCopyWith<$Res> {
  _$LoginBodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? captcha = null,
    Object? email = null,
    Object? password = null,
    Object? remember = null,
  }) {
    return _then(_value.copyWith(
      captcha: null == captcha
          ? _value.captcha
          : captcha // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      remember: null == remember
          ? _value.remember
          : remember // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginBodyImplCopyWith<$Res>
    implements $LoginBodyCopyWith<$Res> {
  factory _$$LoginBodyImplCopyWith(
          _$LoginBodyImpl value, $Res Function(_$LoginBodyImpl) then) =
      __$$LoginBodyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String captcha, String email, String password, bool remember});
}

/// @nodoc
class __$$LoginBodyImplCopyWithImpl<$Res>
    extends _$LoginBodyCopyWithImpl<$Res, _$LoginBodyImpl>
    implements _$$LoginBodyImplCopyWith<$Res> {
  __$$LoginBodyImplCopyWithImpl(
      _$LoginBodyImpl _value, $Res Function(_$LoginBodyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? captcha = null,
    Object? email = null,
    Object? password = null,
    Object? remember = null,
  }) {
    return _then(_$LoginBodyImpl(
      captcha: null == captcha
          ? _value.captcha
          : captcha // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      remember: null == remember
          ? _value.remember
          : remember // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginBodyImpl implements _LoginBody {
  const _$LoginBodyImpl(
      {required this.captcha,
      required this.email,
      required this.password,
      this.remember = true});

  factory _$LoginBodyImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginBodyImplFromJson(json);

  @override
  final String captcha;
  @override
  final String email;
  @override
  final String password;
  @override
  @JsonKey()
  final bool remember;

  @override
  String toString() {
    return 'LoginBody(captcha: $captcha, email: $email, password: $password, remember: $remember)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginBodyImpl &&
            (identical(other.captcha, captcha) || other.captcha == captcha) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.remember, remember) ||
                other.remember == remember));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, captcha, email, password, remember);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginBodyImplCopyWith<_$LoginBodyImpl> get copyWith =>
      __$$LoginBodyImplCopyWithImpl<_$LoginBodyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginBodyImplToJson(
      this,
    );
  }
}

abstract class _LoginBody implements LoginBody {
  const factory _LoginBody(
      {required final String captcha,
      required final String email,
      required final String password,
      final bool remember}) = _$LoginBodyImpl;

  factory _LoginBody.fromJson(Map<String, dynamic> json) =
      _$LoginBodyImpl.fromJson;

  @override
  String get captcha;
  @override
  String get email;
  @override
  String get password;
  @override
  bool get remember;
  @override
  @JsonKey(ignore: true)
  _$$LoginBodyImplCopyWith<_$LoginBodyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LauncherLoginBody _$LauncherLoginBodyFromJson(Map<String, dynamic> json) {
  return _LauncherLoginBody.fromJson(json);
}

/// @nodoc
mixin _$LauncherLoginBody {
  String get username => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  bool get remember => throw _privateConstructorUsedError;
  String? get captcha => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LauncherLoginBodyCopyWith<LauncherLoginBody> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LauncherLoginBodyCopyWith<$Res> {
  factory $LauncherLoginBodyCopyWith(
          LauncherLoginBody value, $Res Function(LauncherLoginBody) then) =
      _$LauncherLoginBodyCopyWithImpl<$Res, LauncherLoginBody>;
  @useResult
  $Res call({String username, String password, bool remember, String? captcha});
}

/// @nodoc
class _$LauncherLoginBodyCopyWithImpl<$Res, $Val extends LauncherLoginBody>
    implements $LauncherLoginBodyCopyWith<$Res> {
  _$LauncherLoginBodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? password = null,
    Object? remember = null,
    Object? captcha = freezed,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      remember: null == remember
          ? _value.remember
          : remember // ignore: cast_nullable_to_non_nullable
              as bool,
      captcha: freezed == captcha
          ? _value.captcha
          : captcha // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LauncherLoginBodyImplCopyWith<$Res>
    implements $LauncherLoginBodyCopyWith<$Res> {
  factory _$$LauncherLoginBodyImplCopyWith(_$LauncherLoginBodyImpl value,
          $Res Function(_$LauncherLoginBodyImpl) then) =
      __$$LauncherLoginBodyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String username, String password, bool remember, String? captcha});
}

/// @nodoc
class __$$LauncherLoginBodyImplCopyWithImpl<$Res>
    extends _$LauncherLoginBodyCopyWithImpl<$Res, _$LauncherLoginBodyImpl>
    implements _$$LauncherLoginBodyImplCopyWith<$Res> {
  __$$LauncherLoginBodyImplCopyWithImpl(_$LauncherLoginBodyImpl _value,
      $Res Function(_$LauncherLoginBodyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? password = null,
    Object? remember = null,
    Object? captcha = freezed,
  }) {
    return _then(_$LauncherLoginBodyImpl(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      remember: null == remember
          ? _value.remember
          : remember // ignore: cast_nullable_to_non_nullable
              as bool,
      captcha: freezed == captcha
          ? _value.captcha
          : captcha // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LauncherLoginBodyImpl implements _LauncherLoginBody {
  const _$LauncherLoginBodyImpl(
      {required this.username,
      required this.password,
      this.remember = true,
      this.captcha});

  factory _$LauncherLoginBodyImpl.fromJson(Map<String, dynamic> json) =>
      _$$LauncherLoginBodyImplFromJson(json);

  @override
  final String username;
  @override
  final String password;
  @override
  @JsonKey()
  final bool remember;
  @override
  final String? captcha;

  @override
  String toString() {
    return 'LauncherLoginBody(username: $username, password: $password, remember: $remember, captcha: $captcha)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LauncherLoginBodyImpl &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.remember, remember) ||
                other.remember == remember) &&
            (identical(other.captcha, captcha) || other.captcha == captcha));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, username, password, remember, captcha);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LauncherLoginBodyImplCopyWith<_$LauncherLoginBodyImpl> get copyWith =>
      __$$LauncherLoginBodyImplCopyWithImpl<_$LauncherLoginBodyImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LauncherLoginBodyImplToJson(
      this,
    );
  }
}

abstract class _LauncherLoginBody implements LauncherLoginBody {
  const factory _LauncherLoginBody(
      {required final String username,
      required final String password,
      final bool remember,
      final String? captcha}) = _$LauncherLoginBodyImpl;

  factory _LauncherLoginBody.fromJson(Map<String, dynamic> json) =
      _$LauncherLoginBodyImpl.fromJson;

  @override
  String get username;
  @override
  String get password;
  @override
  bool get remember;
  @override
  String? get captcha;
  @override
  @JsonKey(ignore: true)
  _$$LauncherLoginBodyImplCopyWith<_$LauncherLoginBodyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MultiStepLoginBody _$MultiStepLoginBodyFromJson(Map<String, dynamic> json) {
  return _MultiStepLoginBody.fromJson(json);
}

/// @nodoc
mixin _$MultiStepLoginBody {
  String get code => throw _privateConstructorUsedError;
  String get deviceName => throw _privateConstructorUsedError;
  String get deviceType => throw _privateConstructorUsedError;
  String get duration => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MultiStepLoginBodyCopyWith<MultiStepLoginBody> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MultiStepLoginBodyCopyWith<$Res> {
  factory $MultiStepLoginBodyCopyWith(
          MultiStepLoginBody value, $Res Function(MultiStepLoginBody) then) =
      _$MultiStepLoginBodyCopyWithImpl<$Res, MultiStepLoginBody>;
  @useResult
  $Res call(
      {String code, String deviceName, String deviceType, String duration});
}

/// @nodoc
class _$MultiStepLoginBodyCopyWithImpl<$Res, $Val extends MultiStepLoginBody>
    implements $MultiStepLoginBodyCopyWith<$Res> {
  _$MultiStepLoginBodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? deviceName = null,
    Object? deviceType = null,
    Object? duration = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      deviceName: null == deviceName
          ? _value.deviceName
          : deviceName // ignore: cast_nullable_to_non_nullable
              as String,
      deviceType: null == deviceType
          ? _value.deviceType
          : deviceType // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MultiStepLoginBodyImplCopyWith<$Res>
    implements $MultiStepLoginBodyCopyWith<$Res> {
  factory _$$MultiStepLoginBodyImplCopyWith(_$MultiStepLoginBodyImpl value,
          $Res Function(_$MultiStepLoginBodyImpl) then) =
      __$$MultiStepLoginBodyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String code, String deviceName, String deviceType, String duration});
}

/// @nodoc
class __$$MultiStepLoginBodyImplCopyWithImpl<$Res>
    extends _$MultiStepLoginBodyCopyWithImpl<$Res, _$MultiStepLoginBodyImpl>
    implements _$$MultiStepLoginBodyImplCopyWith<$Res> {
  __$$MultiStepLoginBodyImplCopyWithImpl(_$MultiStepLoginBodyImpl _value,
      $Res Function(_$MultiStepLoginBodyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? deviceName = null,
    Object? deviceType = null,
    Object? duration = null,
  }) {
    return _then(_$MultiStepLoginBodyImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      deviceName: null == deviceName
          ? _value.deviceName
          : deviceName // ignore: cast_nullable_to_non_nullable
              as String,
      deviceType: null == deviceType
          ? _value.deviceType
          : deviceType // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MultiStepLoginBodyImpl implements _MultiStepLoginBody {
  const _$MultiStepLoginBodyImpl(
      {required this.code,
      this.deviceName = "StarRefuge",
      this.deviceType = "computer",
      this.duration = "year"});

  factory _$MultiStepLoginBodyImpl.fromJson(Map<String, dynamic> json) =>
      _$$MultiStepLoginBodyImplFromJson(json);

  @override
  final String code;
  @override
  @JsonKey()
  final String deviceName;
  @override
  @JsonKey()
  final String deviceType;
  @override
  @JsonKey()
  final String duration;

  @override
  String toString() {
    return 'MultiStepLoginBody(code: $code, deviceName: $deviceName, deviceType: $deviceType, duration: $duration)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MultiStepLoginBodyImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.deviceName, deviceName) ||
                other.deviceName == deviceName) &&
            (identical(other.deviceType, deviceType) ||
                other.deviceType == deviceType) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, code, deviceName, deviceType, duration);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MultiStepLoginBodyImplCopyWith<_$MultiStepLoginBodyImpl> get copyWith =>
      __$$MultiStepLoginBodyImplCopyWithImpl<_$MultiStepLoginBodyImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MultiStepLoginBodyImplToJson(
      this,
    );
  }
}

abstract class _MultiStepLoginBody implements MultiStepLoginBody {
  const factory _MultiStepLoginBody(
      {required final String code,
      final String deviceName,
      final String deviceType,
      final String duration}) = _$MultiStepLoginBodyImpl;

  factory _MultiStepLoginBody.fromJson(Map<String, dynamic> json) =
      _$MultiStepLoginBodyImpl.fromJson;

  @override
  String get code;
  @override
  String get deviceName;
  @override
  String get deviceType;
  @override
  String get duration;
  @override
  @JsonKey(ignore: true)
  _$$MultiStepLoginBodyImplCopyWith<_$MultiStepLoginBodyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LauncherMultiStepLoginBody _$LauncherMultiStepLoginBodyFromJson(
    Map<String, dynamic> json) {
  return _LauncherMultiStepLoginBody.fromJson(json);
}

/// @nodoc
mixin _$LauncherMultiStepLoginBody {
  String get code => throw _privateConstructorUsedError;
  String get deviceName => throw _privateConstructorUsedError;
  String get deviceType => throw _privateConstructorUsedError;
  String get duration => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LauncherMultiStepLoginBodyCopyWith<LauncherMultiStepLoginBody>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LauncherMultiStepLoginBodyCopyWith<$Res> {
  factory $LauncherMultiStepLoginBodyCopyWith(LauncherMultiStepLoginBody value,
          $Res Function(LauncherMultiStepLoginBody) then) =
      _$LauncherMultiStepLoginBodyCopyWithImpl<$Res,
          LauncherMultiStepLoginBody>;
  @useResult
  $Res call(
      {String code, String deviceName, String deviceType, String duration});
}

/// @nodoc
class _$LauncherMultiStepLoginBodyCopyWithImpl<$Res,
        $Val extends LauncherMultiStepLoginBody>
    implements $LauncherMultiStepLoginBodyCopyWith<$Res> {
  _$LauncherMultiStepLoginBodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? deviceName = null,
    Object? deviceType = null,
    Object? duration = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      deviceName: null == deviceName
          ? _value.deviceName
          : deviceName // ignore: cast_nullable_to_non_nullable
              as String,
      deviceType: null == deviceType
          ? _value.deviceType
          : deviceType // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LauncherMultiStepLoginBodyImplCopyWith<$Res>
    implements $LauncherMultiStepLoginBodyCopyWith<$Res> {
  factory _$$LauncherMultiStepLoginBodyImplCopyWith(
          _$LauncherMultiStepLoginBodyImpl value,
          $Res Function(_$LauncherMultiStepLoginBodyImpl) then) =
      __$$LauncherMultiStepLoginBodyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String code, String deviceName, String deviceType, String duration});
}

/// @nodoc
class __$$LauncherMultiStepLoginBodyImplCopyWithImpl<$Res>
    extends _$LauncherMultiStepLoginBodyCopyWithImpl<$Res,
        _$LauncherMultiStepLoginBodyImpl>
    implements _$$LauncherMultiStepLoginBodyImplCopyWith<$Res> {
  __$$LauncherMultiStepLoginBodyImplCopyWithImpl(
      _$LauncherMultiStepLoginBodyImpl _value,
      $Res Function(_$LauncherMultiStepLoginBodyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? deviceName = null,
    Object? deviceType = null,
    Object? duration = null,
  }) {
    return _then(_$LauncherMultiStepLoginBodyImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      deviceName: null == deviceName
          ? _value.deviceName
          : deviceName // ignore: cast_nullable_to_non_nullable
              as String,
      deviceType: null == deviceType
          ? _value.deviceType
          : deviceType // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LauncherMultiStepLoginBodyImpl implements _LauncherMultiStepLoginBody {
  const _$LauncherMultiStepLoginBodyImpl(
      {required this.code,
      this.deviceName = "StarRefuge",
      this.deviceType = "computer",
      this.duration = "year"});

  factory _$LauncherMultiStepLoginBodyImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$LauncherMultiStepLoginBodyImplFromJson(json);

  @override
  final String code;
  @override
  @JsonKey()
  final String deviceName;
  @override
  @JsonKey()
  final String deviceType;
  @override
  @JsonKey()
  final String duration;

  @override
  String toString() {
    return 'LauncherMultiStepLoginBody(code: $code, deviceName: $deviceName, deviceType: $deviceType, duration: $duration)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LauncherMultiStepLoginBodyImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.deviceName, deviceName) ||
                other.deviceName == deviceName) &&
            (identical(other.deviceType, deviceType) ||
                other.deviceType == deviceType) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, code, deviceName, deviceType, duration);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LauncherMultiStepLoginBodyImplCopyWith<_$LauncherMultiStepLoginBodyImpl>
      get copyWith => __$$LauncherMultiStepLoginBodyImplCopyWithImpl<
          _$LauncherMultiStepLoginBodyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LauncherMultiStepLoginBodyImplToJson(
      this,
    );
  }
}

abstract class _LauncherMultiStepLoginBody
    implements LauncherMultiStepLoginBody {
  const factory _LauncherMultiStepLoginBody(
      {required final String code,
      final String deviceName,
      final String deviceType,
      final String duration}) = _$LauncherMultiStepLoginBodyImpl;

  factory _LauncherMultiStepLoginBody.fromJson(Map<String, dynamic> json) =
      _$LauncherMultiStepLoginBodyImpl.fromJson;

  @override
  String get code;
  @override
  String get deviceName;
  @override
  String get deviceType;
  @override
  String get duration;
  @override
  @JsonKey(ignore: true)
  _$$LauncherMultiStepLoginBodyImplCopyWith<_$LauncherMultiStepLoginBodyImpl>
      get copyWith => throw _privateConstructorUsedError;
}

MultiStepLoginProperty _$MultiStepLoginPropertyFromJson(
    Map<String, dynamic> json) {
  return _MultiStepLoginProperty.fromJson(json);
}

/// @nodoc
mixin _$MultiStepLoginProperty {
  List<Error>? get errors => throw _privateConstructorUsedError;
  Data get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MultiStepLoginPropertyCopyWith<MultiStepLoginProperty> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MultiStepLoginPropertyCopyWith<$Res> {
  factory $MultiStepLoginPropertyCopyWith(MultiStepLoginProperty value,
          $Res Function(MultiStepLoginProperty) then) =
      _$MultiStepLoginPropertyCopyWithImpl<$Res, MultiStepLoginProperty>;
  @useResult
  $Res call({List<Error>? errors, Data data});

  $DataCopyWith<$Res> get data;
}

/// @nodoc
class _$MultiStepLoginPropertyCopyWithImpl<$Res,
        $Val extends MultiStepLoginProperty>
    implements $MultiStepLoginPropertyCopyWith<$Res> {
  _$MultiStepLoginPropertyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errors = freezed,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      errors: freezed == errors
          ? _value.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<Error>?,
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
abstract class _$$MultiStepLoginPropertyImplCopyWith<$Res>
    implements $MultiStepLoginPropertyCopyWith<$Res> {
  factory _$$MultiStepLoginPropertyImplCopyWith(
          _$MultiStepLoginPropertyImpl value,
          $Res Function(_$MultiStepLoginPropertyImpl) then) =
      __$$MultiStepLoginPropertyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Error>? errors, Data data});

  @override
  $DataCopyWith<$Res> get data;
}

/// @nodoc
class __$$MultiStepLoginPropertyImplCopyWithImpl<$Res>
    extends _$MultiStepLoginPropertyCopyWithImpl<$Res,
        _$MultiStepLoginPropertyImpl>
    implements _$$MultiStepLoginPropertyImplCopyWith<$Res> {
  __$$MultiStepLoginPropertyImplCopyWithImpl(
      _$MultiStepLoginPropertyImpl _value,
      $Res Function(_$MultiStepLoginPropertyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errors = freezed,
    Object? data = null,
  }) {
    return _then(_$MultiStepLoginPropertyImpl(
      errors: freezed == errors
          ? _value._errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<Error>?,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MultiStepLoginPropertyImpl implements _MultiStepLoginProperty {
  const _$MultiStepLoginPropertyImpl(
      {final List<Error>? errors, required this.data})
      : _errors = errors;

  factory _$MultiStepLoginPropertyImpl.fromJson(Map<String, dynamic> json) =>
      _$$MultiStepLoginPropertyImplFromJson(json);

  final List<Error>? _errors;
  @override
  List<Error>? get errors {
    final value = _errors;
    if (value == null) return null;
    if (_errors is EqualUnmodifiableListView) return _errors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Data data;

  @override
  String toString() {
    return 'MultiStepLoginProperty(errors: $errors, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MultiStepLoginPropertyImpl &&
            const DeepCollectionEquality().equals(other._errors, _errors) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_errors), data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MultiStepLoginPropertyImplCopyWith<_$MultiStepLoginPropertyImpl>
      get copyWith => __$$MultiStepLoginPropertyImplCopyWithImpl<
          _$MultiStepLoginPropertyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MultiStepLoginPropertyImplToJson(
      this,
    );
  }
}

abstract class _MultiStepLoginProperty implements MultiStepLoginProperty {
  const factory _MultiStepLoginProperty(
      {final List<Error>? errors,
      required final Data data}) = _$MultiStepLoginPropertyImpl;

  factory _MultiStepLoginProperty.fromJson(Map<String, dynamic> json) =
      _$MultiStepLoginPropertyImpl.fromJson;

  @override
  List<Error>? get errors;
  @override
  Data get data;
  @override
  @JsonKey(ignore: true)
  _$$MultiStepLoginPropertyImplCopyWith<_$MultiStepLoginPropertyImpl>
      get copyWith => throw _privateConstructorUsedError;
}

RecaptchaPostBody _$RecaptchaPostBodyFromJson(Map<String, dynamic> json) {
  return _RecaptchaPostBody.fromJson(json);
}

/// @nodoc
mixin _$RecaptchaPostBody {
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecaptchaPostBodyCopyWith<$Res> {
  factory $RecaptchaPostBodyCopyWith(
          RecaptchaPostBody value, $Res Function(RecaptchaPostBody) then) =
      _$RecaptchaPostBodyCopyWithImpl<$Res, RecaptchaPostBody>;
}

/// @nodoc
class _$RecaptchaPostBodyCopyWithImpl<$Res, $Val extends RecaptchaPostBody>
    implements $RecaptchaPostBodyCopyWith<$Res> {
  _$RecaptchaPostBodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$RecaptchaPostBodyImplCopyWith<$Res> {
  factory _$$RecaptchaPostBodyImplCopyWith(_$RecaptchaPostBodyImpl value,
          $Res Function(_$RecaptchaPostBodyImpl) then) =
      __$$RecaptchaPostBodyImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RecaptchaPostBodyImplCopyWithImpl<$Res>
    extends _$RecaptchaPostBodyCopyWithImpl<$Res, _$RecaptchaPostBodyImpl>
    implements _$$RecaptchaPostBodyImplCopyWith<$Res> {
  __$$RecaptchaPostBodyImplCopyWithImpl(_$RecaptchaPostBodyImpl _value,
      $Res Function(_$RecaptchaPostBodyImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$RecaptchaPostBodyImpl implements _RecaptchaPostBody {
  const _$RecaptchaPostBodyImpl();

  factory _$RecaptchaPostBodyImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecaptchaPostBodyImplFromJson(json);

  @override
  String toString() {
    return 'RecaptchaPostBody()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RecaptchaPostBodyImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  Map<String, dynamic> toJson() {
    return _$$RecaptchaPostBodyImplToJson(
      this,
    );
  }
}

abstract class _RecaptchaPostBody implements RecaptchaPostBody {
  const factory _RecaptchaPostBody() = _$RecaptchaPostBodyImpl;

  factory _RecaptchaPostBody.fromJson(Map<String, dynamic> json) =
      _$RecaptchaPostBodyImpl.fromJson;
}
