//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/uex_price.dart';
import 'package:json_annotation/json_annotation.dart';

part 'game_vehicle_uex_prices.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GameVehicleUexPrices {
  /// Returns a new [GameVehicleUexPrices] instance.
  GameVehicleUexPrices({

     this.purchase,

     this.rental,
  });

      /// Purchase prices from UEX Corp.
  @JsonKey(
    
    name: r'purchase',
    required: false,
    includeIfNull: false,
  )


  final List<UexPrice>? purchase;



      /// Rental prices from UEX Corp.
  @JsonKey(
    
    name: r'rental',
    required: false,
    includeIfNull: false,
  )


  final List<UexPrice>? rental;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GameVehicleUexPrices &&
      other.purchase == purchase &&
      other.rental == rental;

    @override
    int get hashCode =>
        purchase.hashCode +
        rental.hashCode;

  factory GameVehicleUexPrices.fromJson(Map<String, dynamic> json) => _$GameVehicleUexPricesFromJson(json);

  Map<String, dynamic> toJson() => _$GameVehicleUexPricesToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

