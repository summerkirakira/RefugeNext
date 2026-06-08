// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uex_price.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UexPrice _$UexPriceFromJson(Map<String, dynamic> json) => $checkedCreate(
  'UexPrice',
  json,
  ($checkedConvert) {
    final val = UexPrice(
      priceBuy: $checkedConvert('price_buy', (v) => v as num?),
      priceSell: $checkedConvert('price_sell', (v) => v as num?),
      priceRent: $checkedConvert('price_rent', (v) => v as num?),
      terminalId: $checkedConvert('terminal_id', (v) => (v as num?)?.toInt()),
      terminalCode: $checkedConvert('terminal_code', (v) => v as String?),
      terminalName: $checkedConvert('terminal_name', (v) => v as String?),
      starmapLocation: $checkedConvert(
        'starmap_location',
        (v) => v == null
            ? null
            : StarmapLocationLink.fromJson(v as Map<String, dynamic>),
      ),
      dateUpdated: $checkedConvert('date_updated', (v) => v as String?),
      gameVersion: $checkedConvert('game_version', (v) => v as String?),
      uexLink: $checkedConvert('uex_link', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'priceBuy': 'price_buy',
    'priceSell': 'price_sell',
    'priceRent': 'price_rent',
    'terminalId': 'terminal_id',
    'terminalCode': 'terminal_code',
    'terminalName': 'terminal_name',
    'starmapLocation': 'starmap_location',
    'dateUpdated': 'date_updated',
    'gameVersion': 'game_version',
    'uexLink': 'uex_link',
  },
);

Map<String, dynamic> _$UexPriceToJson(UexPrice instance) => <String, dynamic>{
  'price_buy': ?instance.priceBuy,
  'price_sell': ?instance.priceSell,
  'price_rent': ?instance.priceRent,
  'terminal_id': ?instance.terminalId,
  'terminal_code': ?instance.terminalCode,
  'terminal_name': ?instance.terminalName,
  'starmap_location': ?instance.starmapLocation?.toJson(),
  'date_updated': ?instance.dateUpdated,
  'game_version': ?instance.gameVersion,
  'uex_link': ?instance.uexLink,
};
