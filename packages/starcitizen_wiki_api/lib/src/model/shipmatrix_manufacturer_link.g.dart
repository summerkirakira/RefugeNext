// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipmatrix_manufacturer_link.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShipmatrixManufacturerLink _$ShipmatrixManufacturerLinkFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ShipmatrixManufacturerLink', json, ($checkedConvert) {
  final val = ShipmatrixManufacturerLink(
    id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
    name: $checkedConvert('name', (v) => v as String?),
    code: $checkedConvert('code', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$ShipmatrixManufacturerLinkToJson(
  ShipmatrixManufacturerLink instance,
) => <String, dynamic>{
  'id': ?instance.id,
  'name': ?instance.name,
  'code': ?instance.code,
};
