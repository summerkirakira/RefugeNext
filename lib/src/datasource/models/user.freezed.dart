// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$User {
  String get handle;
  set handle(String value);
  String get name;
  set name(String value);
  String get email;
  set email(String value);
  String get password;
  set password(String value);
  String get rsiToken;
  set rsiToken(String value);
  String get rsiDevice;
  set rsiDevice(String value);
  String get profileImage;
  set profileImage(String value);
  String get referralCode;
  set referralCode(String value);
  int get referralCount;
  set referralCount(int value);
  int get referralProspectCount;
  set referralProspectCount(int value);
  int get usd;
  set usd(int value);
  int get uec;
  set uec(int value);
  int get rec;
  set rec(int value);
  int get hangarValue;
  set hangarValue(int value);
  int get currentHangarValue;
  set currentHangarValue(int value);
  int get totalSpent;
  set totalSpent(int value);
  String? get organization;
  set organization(String? value);
  String? get organizationName;
  set organizationName(String? value);
  String? get organizationImage;
  set organizationImage(String? value);
  String? get orgRank;
  set orgRank(String? value);
  int get orgLevel;
  set orgLevel(int value);
  DateTime get registerTime;
  set registerTime(DateTime value);
  String get registerTimeString;
  set registerTimeString(String value);
  String get extra;
  set extra(String value);
  String get referrerReferralCode;
  set referrerReferralCode(String value);
  bool get hasGamePackage;
  set hasGamePackage(bool value);
  bool get hasBeenReferred;
  set hasBeenReferred(bool value);
  String get referrerReferralHandle;
  set referrerReferralHandle(String value);
  String get username;
  set username(String value);
  int get newReferralsCount;
  set newReferralsCount(int value);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserCopyWith<User> get copyWith =>
      _$UserCopyWithImpl<User>(this as User, _$identity);

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson();

  @override
  String toString() {
    return 'User(handle: $handle, name: $name, email: $email, password: $password, rsiToken: $rsiToken, rsiDevice: $rsiDevice, profileImage: $profileImage, referralCode: $referralCode, referralCount: $referralCount, referralProspectCount: $referralProspectCount, usd: $usd, uec: $uec, rec: $rec, hangarValue: $hangarValue, currentHangarValue: $currentHangarValue, totalSpent: $totalSpent, organization: $organization, organizationName: $organizationName, organizationImage: $organizationImage, orgRank: $orgRank, orgLevel: $orgLevel, registerTime: $registerTime, registerTimeString: $registerTimeString, extra: $extra, referrerReferralCode: $referrerReferralCode, hasGamePackage: $hasGamePackage, hasBeenReferred: $hasBeenReferred, referrerReferralHandle: $referrerReferralHandle, username: $username, newReferralsCount: $newReferralsCount)';
  }
}

/// @nodoc
abstract mixin class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) _then) =
      _$UserCopyWithImpl;
  @useResult
  $Res call(
      {String handle,
      String name,
      String email,
      String password,
      String rsiToken,
      String rsiDevice,
      String profileImage,
      String referralCode,
      int referralCount,
      int referralProspectCount,
      int usd,
      int uec,
      int rec,
      int hangarValue,
      int currentHangarValue,
      int totalSpent,
      String? organization,
      String? organizationName,
      String? organizationImage,
      String? orgRank,
      int orgLevel,
      DateTime registerTime,
      String registerTimeString,
      String extra,
      String referrerReferralCode,
      bool hasGamePackage,
      bool hasBeenReferred,
      String referrerReferralHandle,
      String username,
      int newReferralsCount});
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._self, this._then);

  final User _self;
  final $Res Function(User) _then;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? handle = null,
    Object? name = null,
    Object? email = null,
    Object? password = null,
    Object? rsiToken = null,
    Object? rsiDevice = null,
    Object? profileImage = null,
    Object? referralCode = null,
    Object? referralCount = null,
    Object? referralProspectCount = null,
    Object? usd = null,
    Object? uec = null,
    Object? rec = null,
    Object? hangarValue = null,
    Object? currentHangarValue = null,
    Object? totalSpent = null,
    Object? organization = freezed,
    Object? organizationName = freezed,
    Object? organizationImage = freezed,
    Object? orgRank = freezed,
    Object? orgLevel = null,
    Object? registerTime = null,
    Object? registerTimeString = null,
    Object? extra = null,
    Object? referrerReferralCode = null,
    Object? hasGamePackage = null,
    Object? hasBeenReferred = null,
    Object? referrerReferralHandle = null,
    Object? username = null,
    Object? newReferralsCount = null,
  }) {
    return _then(_self.copyWith(
      handle: null == handle
          ? _self.handle
          : handle // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      rsiToken: null == rsiToken
          ? _self.rsiToken
          : rsiToken // ignore: cast_nullable_to_non_nullable
              as String,
      rsiDevice: null == rsiDevice
          ? _self.rsiDevice
          : rsiDevice // ignore: cast_nullable_to_non_nullable
              as String,
      profileImage: null == profileImage
          ? _self.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String,
      referralCode: null == referralCode
          ? _self.referralCode
          : referralCode // ignore: cast_nullable_to_non_nullable
              as String,
      referralCount: null == referralCount
          ? _self.referralCount
          : referralCount // ignore: cast_nullable_to_non_nullable
              as int,
      referralProspectCount: null == referralProspectCount
          ? _self.referralProspectCount
          : referralProspectCount // ignore: cast_nullable_to_non_nullable
              as int,
      usd: null == usd
          ? _self.usd
          : usd // ignore: cast_nullable_to_non_nullable
              as int,
      uec: null == uec
          ? _self.uec
          : uec // ignore: cast_nullable_to_non_nullable
              as int,
      rec: null == rec
          ? _self.rec
          : rec // ignore: cast_nullable_to_non_nullable
              as int,
      hangarValue: null == hangarValue
          ? _self.hangarValue
          : hangarValue // ignore: cast_nullable_to_non_nullable
              as int,
      currentHangarValue: null == currentHangarValue
          ? _self.currentHangarValue
          : currentHangarValue // ignore: cast_nullable_to_non_nullable
              as int,
      totalSpent: null == totalSpent
          ? _self.totalSpent
          : totalSpent // ignore: cast_nullable_to_non_nullable
              as int,
      organization: freezed == organization
          ? _self.organization
          : organization // ignore: cast_nullable_to_non_nullable
              as String?,
      organizationName: freezed == organizationName
          ? _self.organizationName
          : organizationName // ignore: cast_nullable_to_non_nullable
              as String?,
      organizationImage: freezed == organizationImage
          ? _self.organizationImage
          : organizationImage // ignore: cast_nullable_to_non_nullable
              as String?,
      orgRank: freezed == orgRank
          ? _self.orgRank
          : orgRank // ignore: cast_nullable_to_non_nullable
              as String?,
      orgLevel: null == orgLevel
          ? _self.orgLevel
          : orgLevel // ignore: cast_nullable_to_non_nullable
              as int,
      registerTime: null == registerTime
          ? _self.registerTime
          : registerTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      registerTimeString: null == registerTimeString
          ? _self.registerTimeString
          : registerTimeString // ignore: cast_nullable_to_non_nullable
              as String,
      extra: null == extra
          ? _self.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as String,
      referrerReferralCode: null == referrerReferralCode
          ? _self.referrerReferralCode
          : referrerReferralCode // ignore: cast_nullable_to_non_nullable
              as String,
      hasGamePackage: null == hasGamePackage
          ? _self.hasGamePackage
          : hasGamePackage // ignore: cast_nullable_to_non_nullable
              as bool,
      hasBeenReferred: null == hasBeenReferred
          ? _self.hasBeenReferred
          : hasBeenReferred // ignore: cast_nullable_to_non_nullable
              as bool,
      referrerReferralHandle: null == referrerReferralHandle
          ? _self.referrerReferralHandle
          : referrerReferralHandle // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _self.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      newReferralsCount: null == newReferralsCount
          ? _self.newReferralsCount
          : newReferralsCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [User].
extension UserPatterns on User {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_User value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _User() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_User value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _User():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_User value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _User() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String handle,
            String name,
            String email,
            String password,
            String rsiToken,
            String rsiDevice,
            String profileImage,
            String referralCode,
            int referralCount,
            int referralProspectCount,
            int usd,
            int uec,
            int rec,
            int hangarValue,
            int currentHangarValue,
            int totalSpent,
            String? organization,
            String? organizationName,
            String? organizationImage,
            String? orgRank,
            int orgLevel,
            DateTime registerTime,
            String registerTimeString,
            String extra,
            String referrerReferralCode,
            bool hasGamePackage,
            bool hasBeenReferred,
            String referrerReferralHandle,
            String username,
            int newReferralsCount)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _User() when $default != null:
        return $default(
            _that.handle,
            _that.name,
            _that.email,
            _that.password,
            _that.rsiToken,
            _that.rsiDevice,
            _that.profileImage,
            _that.referralCode,
            _that.referralCount,
            _that.referralProspectCount,
            _that.usd,
            _that.uec,
            _that.rec,
            _that.hangarValue,
            _that.currentHangarValue,
            _that.totalSpent,
            _that.organization,
            _that.organizationName,
            _that.organizationImage,
            _that.orgRank,
            _that.orgLevel,
            _that.registerTime,
            _that.registerTimeString,
            _that.extra,
            _that.referrerReferralCode,
            _that.hasGamePackage,
            _that.hasBeenReferred,
            _that.referrerReferralHandle,
            _that.username,
            _that.newReferralsCount);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String handle,
            String name,
            String email,
            String password,
            String rsiToken,
            String rsiDevice,
            String profileImage,
            String referralCode,
            int referralCount,
            int referralProspectCount,
            int usd,
            int uec,
            int rec,
            int hangarValue,
            int currentHangarValue,
            int totalSpent,
            String? organization,
            String? organizationName,
            String? organizationImage,
            String? orgRank,
            int orgLevel,
            DateTime registerTime,
            String registerTimeString,
            String extra,
            String referrerReferralCode,
            bool hasGamePackage,
            bool hasBeenReferred,
            String referrerReferralHandle,
            String username,
            int newReferralsCount)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _User():
        return $default(
            _that.handle,
            _that.name,
            _that.email,
            _that.password,
            _that.rsiToken,
            _that.rsiDevice,
            _that.profileImage,
            _that.referralCode,
            _that.referralCount,
            _that.referralProspectCount,
            _that.usd,
            _that.uec,
            _that.rec,
            _that.hangarValue,
            _that.currentHangarValue,
            _that.totalSpent,
            _that.organization,
            _that.organizationName,
            _that.organizationImage,
            _that.orgRank,
            _that.orgLevel,
            _that.registerTime,
            _that.registerTimeString,
            _that.extra,
            _that.referrerReferralCode,
            _that.hasGamePackage,
            _that.hasBeenReferred,
            _that.referrerReferralHandle,
            _that.username,
            _that.newReferralsCount);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String handle,
            String name,
            String email,
            String password,
            String rsiToken,
            String rsiDevice,
            String profileImage,
            String referralCode,
            int referralCount,
            int referralProspectCount,
            int usd,
            int uec,
            int rec,
            int hangarValue,
            int currentHangarValue,
            int totalSpent,
            String? organization,
            String? organizationName,
            String? organizationImage,
            String? orgRank,
            int orgLevel,
            DateTime registerTime,
            String registerTimeString,
            String extra,
            String referrerReferralCode,
            bool hasGamePackage,
            bool hasBeenReferred,
            String referrerReferralHandle,
            String username,
            int newReferralsCount)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _User() when $default != null:
        return $default(
            _that.handle,
            _that.name,
            _that.email,
            _that.password,
            _that.rsiToken,
            _that.rsiDevice,
            _that.profileImage,
            _that.referralCode,
            _that.referralCount,
            _that.referralProspectCount,
            _that.usd,
            _that.uec,
            _that.rec,
            _that.hangarValue,
            _that.currentHangarValue,
            _that.totalSpent,
            _that.organization,
            _that.organizationName,
            _that.organizationImage,
            _that.orgRank,
            _that.orgLevel,
            _that.registerTime,
            _that.registerTimeString,
            _that.extra,
            _that.referrerReferralCode,
            _that.hasGamePackage,
            _that.hasBeenReferred,
            _that.referrerReferralHandle,
            _that.username,
            _that.newReferralsCount);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _User implements User {
  _User(
      {required this.handle,
      required this.name,
      required this.email,
      required this.password,
      required this.rsiToken,
      this.rsiDevice = '',
      required this.profileImage,
      required this.referralCode,
      required this.referralCount,
      required this.referralProspectCount,
      required this.usd,
      required this.uec,
      required this.rec,
      required this.hangarValue,
      required this.currentHangarValue,
      required this.totalSpent,
      this.organization,
      this.organizationName,
      this.organizationImage,
      this.orgRank,
      required this.orgLevel,
      required this.registerTime,
      required this.registerTimeString,
      this.extra = '',
      this.referrerReferralCode = '',
      this.hasGamePackage = false,
      this.hasBeenReferred = false,
      this.referrerReferralHandle = "",
      this.username = "",
      this.newReferralsCount = 0});
  factory _User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  @override
  String handle;
  @override
  String name;
  @override
  String email;
  @override
  String password;
  @override
  String rsiToken;
  @override
  @JsonKey()
  String rsiDevice;
  @override
  String profileImage;
  @override
  String referralCode;
  @override
  int referralCount;
  @override
  int referralProspectCount;
  @override
  int usd;
  @override
  int uec;
  @override
  int rec;
  @override
  int hangarValue;
  @override
  int currentHangarValue;
  @override
  int totalSpent;
  @override
  String? organization;
  @override
  String? organizationName;
  @override
  String? organizationImage;
  @override
  String? orgRank;
  @override
  int orgLevel;
  @override
  DateTime registerTime;
  @override
  String registerTimeString;
  @override
  @JsonKey()
  String extra;
  @override
  @JsonKey()
  String referrerReferralCode;
  @override
  @JsonKey()
  bool hasGamePackage;
  @override
  @JsonKey()
  bool hasBeenReferred;
  @override
  @JsonKey()
  String referrerReferralHandle;
  @override
  @JsonKey()
  String username;
  @override
  @JsonKey()
  int newReferralsCount;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserCopyWith<_User> get copyWith =>
      __$UserCopyWithImpl<_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserToJson(
      this,
    );
  }

  @override
  String toString() {
    return 'User(handle: $handle, name: $name, email: $email, password: $password, rsiToken: $rsiToken, rsiDevice: $rsiDevice, profileImage: $profileImage, referralCode: $referralCode, referralCount: $referralCount, referralProspectCount: $referralProspectCount, usd: $usd, uec: $uec, rec: $rec, hangarValue: $hangarValue, currentHangarValue: $currentHangarValue, totalSpent: $totalSpent, organization: $organization, organizationName: $organizationName, organizationImage: $organizationImage, orgRank: $orgRank, orgLevel: $orgLevel, registerTime: $registerTime, registerTimeString: $registerTimeString, extra: $extra, referrerReferralCode: $referrerReferralCode, hasGamePackage: $hasGamePackage, hasBeenReferred: $hasBeenReferred, referrerReferralHandle: $referrerReferralHandle, username: $username, newReferralsCount: $newReferralsCount)';
  }
}

/// @nodoc
abstract mixin class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) _then) =
      __$UserCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String handle,
      String name,
      String email,
      String password,
      String rsiToken,
      String rsiDevice,
      String profileImage,
      String referralCode,
      int referralCount,
      int referralProspectCount,
      int usd,
      int uec,
      int rec,
      int hangarValue,
      int currentHangarValue,
      int totalSpent,
      String? organization,
      String? organizationName,
      String? organizationImage,
      String? orgRank,
      int orgLevel,
      DateTime registerTime,
      String registerTimeString,
      String extra,
      String referrerReferralCode,
      bool hasGamePackage,
      bool hasBeenReferred,
      String referrerReferralHandle,
      String username,
      int newReferralsCount});
}

/// @nodoc
class __$UserCopyWithImpl<$Res> implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(this._self, this._then);

  final _User _self;
  final $Res Function(_User) _then;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? handle = null,
    Object? name = null,
    Object? email = null,
    Object? password = null,
    Object? rsiToken = null,
    Object? rsiDevice = null,
    Object? profileImage = null,
    Object? referralCode = null,
    Object? referralCount = null,
    Object? referralProspectCount = null,
    Object? usd = null,
    Object? uec = null,
    Object? rec = null,
    Object? hangarValue = null,
    Object? currentHangarValue = null,
    Object? totalSpent = null,
    Object? organization = freezed,
    Object? organizationName = freezed,
    Object? organizationImage = freezed,
    Object? orgRank = freezed,
    Object? orgLevel = null,
    Object? registerTime = null,
    Object? registerTimeString = null,
    Object? extra = null,
    Object? referrerReferralCode = null,
    Object? hasGamePackage = null,
    Object? hasBeenReferred = null,
    Object? referrerReferralHandle = null,
    Object? username = null,
    Object? newReferralsCount = null,
  }) {
    return _then(_User(
      handle: null == handle
          ? _self.handle
          : handle // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      rsiToken: null == rsiToken
          ? _self.rsiToken
          : rsiToken // ignore: cast_nullable_to_non_nullable
              as String,
      rsiDevice: null == rsiDevice
          ? _self.rsiDevice
          : rsiDevice // ignore: cast_nullable_to_non_nullable
              as String,
      profileImage: null == profileImage
          ? _self.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String,
      referralCode: null == referralCode
          ? _self.referralCode
          : referralCode // ignore: cast_nullable_to_non_nullable
              as String,
      referralCount: null == referralCount
          ? _self.referralCount
          : referralCount // ignore: cast_nullable_to_non_nullable
              as int,
      referralProspectCount: null == referralProspectCount
          ? _self.referralProspectCount
          : referralProspectCount // ignore: cast_nullable_to_non_nullable
              as int,
      usd: null == usd
          ? _self.usd
          : usd // ignore: cast_nullable_to_non_nullable
              as int,
      uec: null == uec
          ? _self.uec
          : uec // ignore: cast_nullable_to_non_nullable
              as int,
      rec: null == rec
          ? _self.rec
          : rec // ignore: cast_nullable_to_non_nullable
              as int,
      hangarValue: null == hangarValue
          ? _self.hangarValue
          : hangarValue // ignore: cast_nullable_to_non_nullable
              as int,
      currentHangarValue: null == currentHangarValue
          ? _self.currentHangarValue
          : currentHangarValue // ignore: cast_nullable_to_non_nullable
              as int,
      totalSpent: null == totalSpent
          ? _self.totalSpent
          : totalSpent // ignore: cast_nullable_to_non_nullable
              as int,
      organization: freezed == organization
          ? _self.organization
          : organization // ignore: cast_nullable_to_non_nullable
              as String?,
      organizationName: freezed == organizationName
          ? _self.organizationName
          : organizationName // ignore: cast_nullable_to_non_nullable
              as String?,
      organizationImage: freezed == organizationImage
          ? _self.organizationImage
          : organizationImage // ignore: cast_nullable_to_non_nullable
              as String?,
      orgRank: freezed == orgRank
          ? _self.orgRank
          : orgRank // ignore: cast_nullable_to_non_nullable
              as String?,
      orgLevel: null == orgLevel
          ? _self.orgLevel
          : orgLevel // ignore: cast_nullable_to_non_nullable
              as int,
      registerTime: null == registerTime
          ? _self.registerTime
          : registerTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      registerTimeString: null == registerTimeString
          ? _self.registerTimeString
          : registerTimeString // ignore: cast_nullable_to_non_nullable
              as String,
      extra: null == extra
          ? _self.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as String,
      referrerReferralCode: null == referrerReferralCode
          ? _self.referrerReferralCode
          : referrerReferralCode // ignore: cast_nullable_to_non_nullable
              as String,
      hasGamePackage: null == hasGamePackage
          ? _self.hasGamePackage
          : hasGamePackage // ignore: cast_nullable_to_non_nullable
              as bool,
      hasBeenReferred: null == hasBeenReferred
          ? _self.hasBeenReferred
          : hasBeenReferred // ignore: cast_nullable_to_non_nullable
              as bool,
      referrerReferralHandle: null == referrerReferralHandle
          ? _self.referrerReferralHandle
          : referrerReferralHandle // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _self.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      newReferralsCount: null == newReferralsCount
          ? _self.newReferralsCount
          : newReferralsCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
