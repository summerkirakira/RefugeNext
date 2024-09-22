// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'catalog_property.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CatalogProperty _$CatalogPropertyFromJson(Map<String, dynamic> json) {
  return _CatalogProperty.fromJson(json);
}

/// @nodoc
mixin _$CatalogProperty {
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  set name(String value) => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  set title(String value) => throw _privateConstructorUsedError;
  String get subtitle => throw _privateConstructorUsedError;
  set subtitle(String value) => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  set url(String value) => throw _privateConstructorUsedError;
  String? get excerpt => throw _privateConstructorUsedError;
  set excerpt(String? value) => throw _privateConstructorUsedError;
  String? get chineseExcerpt => throw _privateConstructorUsedError;
  set chineseExcerpt(String? value) => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  set type(String value) => throw _privateConstructorUsedError;
  Media get media => throw _privateConstructorUsedError;
  set media(Media value) => throw _privateConstructorUsedError;
  Price get price => throw _privateConstructorUsedError;
  set price(Price value) => throw _privateConstructorUsedError;
  Stock get stock => throw _privateConstructorUsedError;
  set stock(Stock value) => throw _privateConstructorUsedError;
  NativePrice get nativePrice => throw _privateConstructorUsedError;
  set nativePrice(NativePrice value) => throw _privateConstructorUsedError;
  bool get isWarbond => throw _privateConstructorUsedError;
  set isWarbond(bool value) => throw _privateConstructorUsedError;
  bool get isPackage => throw _privateConstructorUsedError;
  set isPackage(bool value) => throw _privateConstructorUsedError;
  bool get isVip => throw _privateConstructorUsedError;
  set isVip(bool value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CatalogPropertyCopyWith<CatalogProperty> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CatalogPropertyCopyWith<$Res> {
  factory $CatalogPropertyCopyWith(
          CatalogProperty value, $Res Function(CatalogProperty) then) =
      _$CatalogPropertyCopyWithImpl<$Res, CatalogProperty>;
  @useResult
  $Res call(
      {String id,
      String name,
      String title,
      String subtitle,
      String url,
      String? excerpt,
      String? chineseExcerpt,
      String type,
      Media media,
      Price price,
      Stock stock,
      NativePrice nativePrice,
      bool isWarbond,
      bool isPackage,
      bool isVip});

  $MediaCopyWith<$Res> get media;
  $PriceCopyWith<$Res> get price;
  $StockCopyWith<$Res> get stock;
  $NativePriceCopyWith<$Res> get nativePrice;
}

/// @nodoc
class _$CatalogPropertyCopyWithImpl<$Res, $Val extends CatalogProperty>
    implements $CatalogPropertyCopyWith<$Res> {
  _$CatalogPropertyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? title = null,
    Object? subtitle = null,
    Object? url = null,
    Object? excerpt = freezed,
    Object? chineseExcerpt = freezed,
    Object? type = null,
    Object? media = null,
    Object? price = null,
    Object? stock = null,
    Object? nativePrice = null,
    Object? isWarbond = null,
    Object? isPackage = null,
    Object? isVip = null,
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
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subtitle: null == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      excerpt: freezed == excerpt
          ? _value.excerpt
          : excerpt // ignore: cast_nullable_to_non_nullable
              as String?,
      chineseExcerpt: freezed == chineseExcerpt
          ? _value.chineseExcerpt
          : chineseExcerpt // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      media: null == media
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as Media,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as Price,
      stock: null == stock
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as Stock,
      nativePrice: null == nativePrice
          ? _value.nativePrice
          : nativePrice // ignore: cast_nullable_to_non_nullable
              as NativePrice,
      isWarbond: null == isWarbond
          ? _value.isWarbond
          : isWarbond // ignore: cast_nullable_to_non_nullable
              as bool,
      isPackage: null == isPackage
          ? _value.isPackage
          : isPackage // ignore: cast_nullable_to_non_nullable
              as bool,
      isVip: null == isVip
          ? _value.isVip
          : isVip // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
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
  $PriceCopyWith<$Res> get price {
    return $PriceCopyWith<$Res>(_value.price, (value) {
      return _then(_value.copyWith(price: value) as $Val);
    });
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
  $NativePriceCopyWith<$Res> get nativePrice {
    return $NativePriceCopyWith<$Res>(_value.nativePrice, (value) {
      return _then(_value.copyWith(nativePrice: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CatalogPropertyImplCopyWith<$Res>
    implements $CatalogPropertyCopyWith<$Res> {
  factory _$$CatalogPropertyImplCopyWith(_$CatalogPropertyImpl value,
          $Res Function(_$CatalogPropertyImpl) then) =
      __$$CatalogPropertyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String title,
      String subtitle,
      String url,
      String? excerpt,
      String? chineseExcerpt,
      String type,
      Media media,
      Price price,
      Stock stock,
      NativePrice nativePrice,
      bool isWarbond,
      bool isPackage,
      bool isVip});

  @override
  $MediaCopyWith<$Res> get media;
  @override
  $PriceCopyWith<$Res> get price;
  @override
  $StockCopyWith<$Res> get stock;
  @override
  $NativePriceCopyWith<$Res> get nativePrice;
}

/// @nodoc
class __$$CatalogPropertyImplCopyWithImpl<$Res>
    extends _$CatalogPropertyCopyWithImpl<$Res, _$CatalogPropertyImpl>
    implements _$$CatalogPropertyImplCopyWith<$Res> {
  __$$CatalogPropertyImplCopyWithImpl(
      _$CatalogPropertyImpl _value, $Res Function(_$CatalogPropertyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? title = null,
    Object? subtitle = null,
    Object? url = null,
    Object? excerpt = freezed,
    Object? chineseExcerpt = freezed,
    Object? type = null,
    Object? media = null,
    Object? price = null,
    Object? stock = null,
    Object? nativePrice = null,
    Object? isWarbond = null,
    Object? isPackage = null,
    Object? isVip = null,
  }) {
    return _then(_$CatalogPropertyImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subtitle: null == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      excerpt: freezed == excerpt
          ? _value.excerpt
          : excerpt // ignore: cast_nullable_to_non_nullable
              as String?,
      chineseExcerpt: freezed == chineseExcerpt
          ? _value.chineseExcerpt
          : chineseExcerpt // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      media: null == media
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as Media,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as Price,
      stock: null == stock
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as Stock,
      nativePrice: null == nativePrice
          ? _value.nativePrice
          : nativePrice // ignore: cast_nullable_to_non_nullable
              as NativePrice,
      isWarbond: null == isWarbond
          ? _value.isWarbond
          : isWarbond // ignore: cast_nullable_to_non_nullable
              as bool,
      isPackage: null == isPackage
          ? _value.isPackage
          : isPackage // ignore: cast_nullable_to_non_nullable
              as bool,
      isVip: null == isVip
          ? _value.isVip
          : isVip // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CatalogPropertyImpl implements _CatalogProperty {
  _$CatalogPropertyImpl(
      {required this.id,
      required this.name,
      required this.title,
      required this.subtitle,
      required this.url,
      this.excerpt,
      this.chineseExcerpt,
      required this.type,
      required this.media,
      required this.price,
      required this.stock,
      required this.nativePrice,
      required this.isWarbond,
      required this.isPackage,
      required this.isVip});

  factory _$CatalogPropertyImpl.fromJson(Map<String, dynamic> json) =>
      _$$CatalogPropertyImplFromJson(json);

  @override
  String id;
  @override
  String name;
  @override
  String title;
  @override
  String subtitle;
  @override
  String url;
  @override
  String? excerpt;
  @override
  String? chineseExcerpt;
  @override
  String type;
  @override
  Media media;
  @override
  Price price;
  @override
  Stock stock;
  @override
  NativePrice nativePrice;
  @override
  bool isWarbond;
  @override
  bool isPackage;
  @override
  bool isVip;

  @override
  String toString() {
    return 'CatalogProperty(id: $id, name: $name, title: $title, subtitle: $subtitle, url: $url, excerpt: $excerpt, chineseExcerpt: $chineseExcerpt, type: $type, media: $media, price: $price, stock: $stock, nativePrice: $nativePrice, isWarbond: $isWarbond, isPackage: $isPackage, isVip: $isVip)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CatalogPropertyImplCopyWith<_$CatalogPropertyImpl> get copyWith =>
      __$$CatalogPropertyImplCopyWithImpl<_$CatalogPropertyImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CatalogPropertyImplToJson(
      this,
    );
  }
}

abstract class _CatalogProperty implements CatalogProperty {
  factory _CatalogProperty(
      {required String id,
      required String name,
      required String title,
      required String subtitle,
      required String url,
      String? excerpt,
      String? chineseExcerpt,
      required String type,
      required Media media,
      required Price price,
      required Stock stock,
      required NativePrice nativePrice,
      required bool isWarbond,
      required bool isPackage,
      required bool isVip}) = _$CatalogPropertyImpl;

  factory _CatalogProperty.fromJson(Map<String, dynamic> json) =
      _$CatalogPropertyImpl.fromJson;

  @override
  String get id;
  set id(String value);
  @override
  String get name;
  set name(String value);
  @override
  String get title;
  set title(String value);
  @override
  String get subtitle;
  set subtitle(String value);
  @override
  String get url;
  set url(String value);
  @override
  String? get excerpt;
  set excerpt(String? value);
  @override
  String? get chineseExcerpt;
  set chineseExcerpt(String? value);
  @override
  String get type;
  set type(String value);
  @override
  Media get media;
  set media(Media value);
  @override
  Price get price;
  set price(Price value);
  @override
  Stock get stock;
  set stock(Stock value);
  @override
  NativePrice get nativePrice;
  set nativePrice(NativePrice value);
  @override
  bool get isWarbond;
  set isWarbond(bool value);
  @override
  bool get isPackage;
  set isPackage(bool value);
  @override
  bool get isVip;
  set isVip(bool value);
  @override
  @JsonKey(ignore: true)
  _$$CatalogPropertyImplCopyWith<_$CatalogPropertyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Media _$MediaFromJson(Map<String, dynamic> json) {
  return _Media.fromJson(json);
}

/// @nodoc
mixin _$Media {
  ImageUrl get thumbnail => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MediaCopyWith<Media> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaCopyWith<$Res> {
  factory $MediaCopyWith(Media value, $Res Function(Media) then) =
      _$MediaCopyWithImpl<$Res, Media>;
  @useResult
  $Res call({ImageUrl thumbnail});

  $ImageUrlCopyWith<$Res> get thumbnail;
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
    Object? thumbnail = null,
  }) {
    return _then(_value.copyWith(
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as ImageUrl,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ImageUrlCopyWith<$Res> get thumbnail {
    return $ImageUrlCopyWith<$Res>(_value.thumbnail, (value) {
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
  $Res call({ImageUrl thumbnail});

  @override
  $ImageUrlCopyWith<$Res> get thumbnail;
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
    Object? thumbnail = null,
  }) {
    return _then(_$MediaImpl(
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as ImageUrl,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MediaImpl implements _Media {
  const _$MediaImpl({required this.thumbnail});

  factory _$MediaImpl.fromJson(Map<String, dynamic> json) =>
      _$$MediaImplFromJson(json);

  @override
  final ImageUrl thumbnail;

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
  const factory _Media({required final ImageUrl thumbnail}) = _$MediaImpl;

  factory _Media.fromJson(Map<String, dynamic> json) = _$MediaImpl.fromJson;

  @override
  ImageUrl get thumbnail;
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
  String get slideshow => throw _privateConstructorUsedError;
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
  $Res call({String slideshow, String storeSmall});
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
    Object? slideshow = null,
    Object? storeSmall = null,
  }) {
    return _then(_value.copyWith(
      slideshow: null == slideshow
          ? _value.slideshow
          : slideshow // ignore: cast_nullable_to_non_nullable
              as String,
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
  $Res call({String slideshow, String storeSmall});
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
    Object? slideshow = null,
    Object? storeSmall = null,
  }) {
    return _then(_$ImageUrlImpl(
      slideshow: null == slideshow
          ? _value.slideshow
          : slideshow // ignore: cast_nullable_to_non_nullable
              as String,
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
  const _$ImageUrlImpl({required this.slideshow, required this.storeSmall});

  factory _$ImageUrlImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImageUrlImplFromJson(json);

  @override
  final String slideshow;
  @override
  final String storeSmall;

  @override
  String toString() {
    return 'ImageUrl(slideshow: $slideshow, storeSmall: $storeSmall)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageUrlImpl &&
            (identical(other.slideshow, slideshow) ||
                other.slideshow == slideshow) &&
            (identical(other.storeSmall, storeSmall) ||
                other.storeSmall == storeSmall));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, slideshow, storeSmall);

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
  const factory _ImageUrl(
      {required final String slideshow,
      required final String storeSmall}) = _$ImageUrlImpl;

  factory _ImageUrl.fromJson(Map<String, dynamic> json) =
      _$ImageUrlImpl.fromJson;

  @override
  String get slideshow;
  @override
  String get storeSmall;
  @override
  @JsonKey(ignore: true)
  _$$ImageUrlImplCopyWith<_$ImageUrlImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Price _$PriceFromJson(Map<String, dynamic> json) {
  return _Price.fromJson(json);
}

/// @nodoc
mixin _$Price {
  int get amount => throw _privateConstructorUsedError;
  List<String> get taxDescription => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PriceCopyWith<Price> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceCopyWith<$Res> {
  factory $PriceCopyWith(Price value, $Res Function(Price) then) =
      _$PriceCopyWithImpl<$Res, Price>;
  @useResult
  $Res call({int amount, List<String> taxDescription});
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
    Object? taxDescription = null,
  }) {
    return _then(_value.copyWith(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      taxDescription: null == taxDescription
          ? _value.taxDescription
          : taxDescription // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
  $Res call({int amount, List<String> taxDescription});
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
    Object? taxDescription = null,
  }) {
    return _then(_$PriceImpl(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      taxDescription: null == taxDescription
          ? _value._taxDescription
          : taxDescription // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PriceImpl implements _Price {
  const _$PriceImpl(
      {required this.amount, required final List<String> taxDescription})
      : _taxDescription = taxDescription;

  factory _$PriceImpl.fromJson(Map<String, dynamic> json) =>
      _$$PriceImplFromJson(json);

  @override
  final int amount;
  final List<String> _taxDescription;
  @override
  List<String> get taxDescription {
    if (_taxDescription is EqualUnmodifiableListView) return _taxDescription;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_taxDescription);
  }

  @override
  String toString() {
    return 'Price(amount: $amount, taxDescription: $taxDescription)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PriceImpl &&
            (identical(other.amount, amount) || other.amount == amount) &&
            const DeepCollectionEquality()
                .equals(other._taxDescription, _taxDescription));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, amount,
      const DeepCollectionEquality().hash(_taxDescription));

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
  const factory _Price(
      {required final int amount,
      required final List<String> taxDescription}) = _$PriceImpl;

  factory _Price.fromJson(Map<String, dynamic> json) = _$PriceImpl.fromJson;

  @override
  int get amount;
  @override
  List<String> get taxDescription;
  @override
  @JsonKey(ignore: true)
  _$$PriceImplCopyWith<_$PriceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Stock _$StockFromJson(Map<String, dynamic> json) {
  return _Stock.fromJson(json);
}

/// @nodoc
mixin _$Stock {
  bool get unlimited => throw _privateConstructorUsedError;
  bool get show => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StockCopyWith<Stock> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockCopyWith<$Res> {
  factory $StockCopyWith(Stock value, $Res Function(Stock) then) =
      _$StockCopyWithImpl<$Res, Stock>;
  @useResult
  $Res call({bool unlimited, bool show});
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
  $Res call({bool unlimited, bool show});
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StockImpl implements _Stock {
  const _$StockImpl({required this.unlimited, required this.show});

  factory _$StockImpl.fromJson(Map<String, dynamic> json) =>
      _$$StockImplFromJson(json);

  @override
  final bool unlimited;
  @override
  final bool show;

  @override
  String toString() {
    return 'Stock(unlimited: $unlimited, show: $show)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StockImpl &&
            (identical(other.unlimited, unlimited) ||
                other.unlimited == unlimited) &&
            (identical(other.show, show) || other.show == show));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, unlimited, show);

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
  const factory _Stock(
      {required final bool unlimited, required final bool show}) = _$StockImpl;

  factory _Stock.fromJson(Map<String, dynamic> json) = _$StockImpl.fromJson;

  @override
  bool get unlimited;
  @override
  bool get show;
  @override
  @JsonKey(ignore: true)
  _$$StockImplCopyWith<_$StockImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NativePrice _$NativePriceFromJson(Map<String, dynamic> json) {
  return _NativePrice.fromJson(json);
}

/// @nodoc
mixin _$NativePrice {
  int get amount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NativePriceCopyWith<NativePrice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NativePriceCopyWith<$Res> {
  factory $NativePriceCopyWith(
          NativePrice value, $Res Function(NativePrice) then) =
      _$NativePriceCopyWithImpl<$Res, NativePrice>;
  @useResult
  $Res call({int amount});
}

/// @nodoc
class _$NativePriceCopyWithImpl<$Res, $Val extends NativePrice>
    implements $NativePriceCopyWith<$Res> {
  _$NativePriceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
  }) {
    return _then(_value.copyWith(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NativePriceImplCopyWith<$Res>
    implements $NativePriceCopyWith<$Res> {
  factory _$$NativePriceImplCopyWith(
          _$NativePriceImpl value, $Res Function(_$NativePriceImpl) then) =
      __$$NativePriceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int amount});
}

/// @nodoc
class __$$NativePriceImplCopyWithImpl<$Res>
    extends _$NativePriceCopyWithImpl<$Res, _$NativePriceImpl>
    implements _$$NativePriceImplCopyWith<$Res> {
  __$$NativePriceImplCopyWithImpl(
      _$NativePriceImpl _value, $Res Function(_$NativePriceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
  }) {
    return _then(_$NativePriceImpl(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NativePriceImpl implements _NativePrice {
  const _$NativePriceImpl({required this.amount});

  factory _$NativePriceImpl.fromJson(Map<String, dynamic> json) =>
      _$$NativePriceImplFromJson(json);

  @override
  final int amount;

  @override
  String toString() {
    return 'NativePrice(amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NativePriceImpl &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, amount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NativePriceImplCopyWith<_$NativePriceImpl> get copyWith =>
      __$$NativePriceImplCopyWithImpl<_$NativePriceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NativePriceImplToJson(
      this,
    );
  }
}

abstract class _NativePrice implements NativePrice {
  const factory _NativePrice({required final int amount}) = _$NativePriceImpl;

  factory _NativePrice.fromJson(Map<String, dynamic> json) =
      _$NativePriceImpl.fromJson;

  @override
  int get amount;
  @override
  @JsonKey(ignore: true)
  _$$NativePriceImplCopyWith<_$NativePriceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CatalogResponse _$CatalogResponseFromJson(Map<String, dynamic> json) {
  return _CatalogResponse.fromJson(json);
}

/// @nodoc
mixin _$CatalogResponse {
  CatalogData get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CatalogResponseCopyWith<CatalogResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CatalogResponseCopyWith<$Res> {
  factory $CatalogResponseCopyWith(
          CatalogResponse value, $Res Function(CatalogResponse) then) =
      _$CatalogResponseCopyWithImpl<$Res, CatalogResponse>;
  @useResult
  $Res call({CatalogData data});

  $CatalogDataCopyWith<$Res> get data;
}

/// @nodoc
class _$CatalogResponseCopyWithImpl<$Res, $Val extends CatalogResponse>
    implements $CatalogResponseCopyWith<$Res> {
  _$CatalogResponseCopyWithImpl(this._value, this._then);

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
              as CatalogData,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CatalogDataCopyWith<$Res> get data {
    return $CatalogDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CatalogResponseImplCopyWith<$Res>
    implements $CatalogResponseCopyWith<$Res> {
  factory _$$CatalogResponseImplCopyWith(_$CatalogResponseImpl value,
          $Res Function(_$CatalogResponseImpl) then) =
      __$$CatalogResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CatalogData data});

  @override
  $CatalogDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$CatalogResponseImplCopyWithImpl<$Res>
    extends _$CatalogResponseCopyWithImpl<$Res, _$CatalogResponseImpl>
    implements _$$CatalogResponseImplCopyWith<$Res> {
  __$$CatalogResponseImplCopyWithImpl(
      _$CatalogResponseImpl _value, $Res Function(_$CatalogResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$CatalogResponseImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as CatalogData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CatalogResponseImpl implements _CatalogResponse {
  const _$CatalogResponseImpl({required this.data});

  factory _$CatalogResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CatalogResponseImplFromJson(json);

  @override
  final CatalogData data;

  @override
  String toString() {
    return 'CatalogResponse(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CatalogResponseImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CatalogResponseImplCopyWith<_$CatalogResponseImpl> get copyWith =>
      __$$CatalogResponseImplCopyWithImpl<_$CatalogResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CatalogResponseImplToJson(
      this,
    );
  }
}

abstract class _CatalogResponse implements CatalogResponse {
  const factory _CatalogResponse({required final CatalogData data}) =
      _$CatalogResponseImpl;

  factory _CatalogResponse.fromJson(Map<String, dynamic> json) =
      _$CatalogResponseImpl.fromJson;

  @override
  CatalogData get data;
  @override
  @JsonKey(ignore: true)
  _$$CatalogResponseImplCopyWith<_$CatalogResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CatalogData _$CatalogDataFromJson(Map<String, dynamic> json) {
  return _CatalogData.fromJson(json);
}

/// @nodoc
mixin _$CatalogData {
  Store get store => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CatalogDataCopyWith<CatalogData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CatalogDataCopyWith<$Res> {
  factory $CatalogDataCopyWith(
          CatalogData value, $Res Function(CatalogData) then) =
      _$CatalogDataCopyWithImpl<$Res, CatalogData>;
  @useResult
  $Res call({Store store});

  $StoreCopyWith<$Res> get store;
}

/// @nodoc
class _$CatalogDataCopyWithImpl<$Res, $Val extends CatalogData>
    implements $CatalogDataCopyWith<$Res> {
  _$CatalogDataCopyWithImpl(this._value, this._then);

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
abstract class _$$CatalogDataImplCopyWith<$Res>
    implements $CatalogDataCopyWith<$Res> {
  factory _$$CatalogDataImplCopyWith(
          _$CatalogDataImpl value, $Res Function(_$CatalogDataImpl) then) =
      __$$CatalogDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Store store});

  @override
  $StoreCopyWith<$Res> get store;
}

/// @nodoc
class __$$CatalogDataImplCopyWithImpl<$Res>
    extends _$CatalogDataCopyWithImpl<$Res, _$CatalogDataImpl>
    implements _$$CatalogDataImplCopyWith<$Res> {
  __$$CatalogDataImplCopyWithImpl(
      _$CatalogDataImpl _value, $Res Function(_$CatalogDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? store = null,
  }) {
    return _then(_$CatalogDataImpl(
      store: null == store
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as Store,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CatalogDataImpl implements _CatalogData {
  const _$CatalogDataImpl({required this.store});

  factory _$CatalogDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$CatalogDataImplFromJson(json);

  @override
  final Store store;

  @override
  String toString() {
    return 'CatalogData(store: $store)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CatalogDataImpl &&
            (identical(other.store, store) || other.store == store));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, store);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CatalogDataImplCopyWith<_$CatalogDataImpl> get copyWith =>
      __$$CatalogDataImplCopyWithImpl<_$CatalogDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CatalogDataImplToJson(
      this,
    );
  }
}

abstract class _CatalogData implements CatalogData {
  const factory _CatalogData({required final Store store}) = _$CatalogDataImpl;

  factory _CatalogData.fromJson(Map<String, dynamic> json) =
      _$CatalogDataImpl.fromJson;

  @override
  Store get store;
  @override
  @JsonKey(ignore: true)
  _$$CatalogDataImplCopyWith<_$CatalogDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Store _$StoreFromJson(Map<String, dynamic> json) {
  return _Store.fromJson(json);
}

/// @nodoc
mixin _$Store {
  Listing get listing => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoreCopyWith<Store> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreCopyWith<$Res> {
  factory $StoreCopyWith(Store value, $Res Function(Store) then) =
      _$StoreCopyWithImpl<$Res, Store>;
  @useResult
  $Res call({Listing listing});

  $ListingCopyWith<$Res> get listing;
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
    Object? listing = null,
  }) {
    return _then(_value.copyWith(
      listing: null == listing
          ? _value.listing
          : listing // ignore: cast_nullable_to_non_nullable
              as Listing,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ListingCopyWith<$Res> get listing {
    return $ListingCopyWith<$Res>(_value.listing, (value) {
      return _then(_value.copyWith(listing: value) as $Val);
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
  $Res call({Listing listing});

  @override
  $ListingCopyWith<$Res> get listing;
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
    Object? listing = null,
  }) {
    return _then(_$StoreImpl(
      listing: null == listing
          ? _value.listing
          : listing // ignore: cast_nullable_to_non_nullable
              as Listing,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StoreImpl implements _Store {
  const _$StoreImpl({required this.listing});

  factory _$StoreImpl.fromJson(Map<String, dynamic> json) =>
      _$$StoreImplFromJson(json);

  @override
  final Listing listing;

  @override
  String toString() {
    return 'Store(listing: $listing)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoreImpl &&
            (identical(other.listing, listing) || other.listing == listing));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, listing);

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
  const factory _Store({required final Listing listing}) = _$StoreImpl;

  factory _Store.fromJson(Map<String, dynamic> json) = _$StoreImpl.fromJson;

  @override
  Listing get listing;
  @override
  @JsonKey(ignore: true)
  _$$StoreImplCopyWith<_$StoreImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Listing _$ListingFromJson(Map<String, dynamic> json) {
  return _Listing.fromJson(json);
}

/// @nodoc
mixin _$Listing {
  List<CatalogProperty> get resources => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListingCopyWith<Listing> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListingCopyWith<$Res> {
  factory $ListingCopyWith(Listing value, $Res Function(Listing) then) =
      _$ListingCopyWithImpl<$Res, Listing>;
  @useResult
  $Res call({List<CatalogProperty> resources});
}

/// @nodoc
class _$ListingCopyWithImpl<$Res, $Val extends Listing>
    implements $ListingCopyWith<$Res> {
  _$ListingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resources = null,
  }) {
    return _then(_value.copyWith(
      resources: null == resources
          ? _value.resources
          : resources // ignore: cast_nullable_to_non_nullable
              as List<CatalogProperty>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ListingImplCopyWith<$Res> implements $ListingCopyWith<$Res> {
  factory _$$ListingImplCopyWith(
          _$ListingImpl value, $Res Function(_$ListingImpl) then) =
      __$$ListingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CatalogProperty> resources});
}

/// @nodoc
class __$$ListingImplCopyWithImpl<$Res>
    extends _$ListingCopyWithImpl<$Res, _$ListingImpl>
    implements _$$ListingImplCopyWith<$Res> {
  __$$ListingImplCopyWithImpl(
      _$ListingImpl _value, $Res Function(_$ListingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resources = null,
  }) {
    return _then(_$ListingImpl(
      resources: null == resources
          ? _value._resources
          : resources // ignore: cast_nullable_to_non_nullable
              as List<CatalogProperty>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ListingImpl implements _Listing {
  const _$ListingImpl({required final List<CatalogProperty> resources})
      : _resources = resources;

  factory _$ListingImpl.fromJson(Map<String, dynamic> json) =>
      _$$ListingImplFromJson(json);

  final List<CatalogProperty> _resources;
  @override
  List<CatalogProperty> get resources {
    if (_resources is EqualUnmodifiableListView) return _resources;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_resources);
  }

  @override
  String toString() {
    return 'Listing(resources: $resources)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListingImpl &&
            const DeepCollectionEquality()
                .equals(other._resources, _resources));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_resources));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ListingImplCopyWith<_$ListingImpl> get copyWith =>
      __$$ListingImplCopyWithImpl<_$ListingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ListingImplToJson(
      this,
    );
  }
}

abstract class _Listing implements Listing {
  const factory _Listing({required final List<CatalogProperty> resources}) =
      _$ListingImpl;

  factory _Listing.fromJson(Map<String, dynamic> json) = _$ListingImpl.fromJson;

  @override
  List<CatalogProperty> get resources;
  @override
  @JsonKey(ignore: true)
  _$$ListingImplCopyWith<_$ListingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
