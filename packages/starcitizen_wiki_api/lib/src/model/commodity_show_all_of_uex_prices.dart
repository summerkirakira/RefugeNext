//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/uex_price.dart';
import 'package:json_annotation/json_annotation.dart';

part 'commodity_show_all_of_uex_prices.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CommodityShowAllOfUexPrices {
  /// Returns a new [CommodityShowAllOfUexPrices] instance.
  CommodityShowAllOfUexPrices({

     this.purchase,
  });

      /// Purchase prices from UEX Corp.
  @JsonKey(
    
    name: r'purchase',
    required: false,
    includeIfNull: false,
  )


  final List<UexPrice>? purchase;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CommodityShowAllOfUexPrices &&
      other.purchase == purchase;

    @override
    int get hashCode =>
        purchase.hashCode;

  factory CommodityShowAllOfUexPrices.fromJson(Map<String, dynamic> json) => _$CommodityShowAllOfUexPricesFromJson(json);

  Map<String, dynamic> toJson() => _$CommodityShowAllOfUexPricesToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

