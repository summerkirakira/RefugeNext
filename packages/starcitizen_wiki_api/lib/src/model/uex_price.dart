//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/starmap_location_link.dart';
import 'package:json_annotation/json_annotation.dart';

part 'uex_price.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class UexPrice {
  /// Returns a new [UexPrice] instance.
  UexPrice({

     this.priceBuy,

     this.priceSell,

     this.priceRent,

     this.terminalId,

     this.terminalCode,

     this.terminalName,

     this.starmapLocation,

     this.dateUpdated,

     this.gameVersion,

     this.uexLink,
  });

  @JsonKey(
    
    name: r'price_buy',
    required: false,
    includeIfNull: false,
  )


  final num? priceBuy;



  @JsonKey(
    
    name: r'price_sell',
    required: false,
    includeIfNull: false,
  )


  final num? priceSell;



  @JsonKey(
    
    name: r'price_rent',
    required: false,
    includeIfNull: false,
  )


  final num? priceRent;



  @JsonKey(
    
    name: r'terminal_id',
    required: false,
    includeIfNull: false,
  )


  final int? terminalId;



  @JsonKey(
    
    name: r'terminal_code',
    required: false,
    includeIfNull: false,
  )


  final String? terminalCode;



  @JsonKey(
    
    name: r'terminal_name',
    required: false,
    includeIfNull: false,
  )


  final String? terminalName;



  @JsonKey(
    
    name: r'starmap_location',
    required: false,
    includeIfNull: false,
  )


  final StarmapLocationLink? starmapLocation;



  @JsonKey(
    
    name: r'date_updated',
    required: false,
    includeIfNull: false,
  )


  final String? dateUpdated;



  @JsonKey(
    
    name: r'game_version',
    required: false,
    includeIfNull: false,
  )


  final String? gameVersion;



      /// Link to the UEX terminal page for this item/vehicle price
  @JsonKey(
    
    name: r'uex_link',
    required: false,
    includeIfNull: false,
  )


  final String? uexLink;





    @override
    bool operator ==(Object other) => identical(this, other) || other is UexPrice &&
      other.priceBuy == priceBuy &&
      other.priceSell == priceSell &&
      other.priceRent == priceRent &&
      other.terminalId == terminalId &&
      other.terminalCode == terminalCode &&
      other.terminalName == terminalName &&
      other.starmapLocation == starmapLocation &&
      other.dateUpdated == dateUpdated &&
      other.gameVersion == gameVersion &&
      other.uexLink == uexLink;

    @override
    int get hashCode =>
        (priceBuy == null ? 0 : priceBuy.hashCode) +
        (priceSell == null ? 0 : priceSell.hashCode) +
        (priceRent == null ? 0 : priceRent.hashCode) +
        (terminalId == null ? 0 : terminalId.hashCode) +
        (terminalCode == null ? 0 : terminalCode.hashCode) +
        (terminalName == null ? 0 : terminalName.hashCode) +
        (starmapLocation == null ? 0 : starmapLocation.hashCode) +
        (dateUpdated == null ? 0 : dateUpdated.hashCode) +
        (gameVersion == null ? 0 : gameVersion.hashCode) +
        (uexLink == null ? 0 : uexLink.hashCode);

  factory UexPrice.fromJson(Map<String, dynamic> json) => _$UexPriceFromJson(json);

  Map<String, dynamic> toJson() => _$UexPriceToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

