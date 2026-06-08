//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/uex_price.dart';
import 'package:json_annotation/json_annotation.dart';

part 'game_item_uex_prices.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GameItemUexPrices {
  /// Returns a new [GameItemUexPrices] instance.
  GameItemUexPrices({

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
    bool operator ==(Object other) => identical(this, other) || other is GameItemUexPrices &&
      other.purchase == purchase;

    @override
    int get hashCode =>
        purchase.hashCode;

  factory GameItemUexPrices.fromJson(Map<String, dynamic> json) => _$GameItemUexPricesFromJson(json);

  Map<String, dynamic> toJson() => _$GameItemUexPricesToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

