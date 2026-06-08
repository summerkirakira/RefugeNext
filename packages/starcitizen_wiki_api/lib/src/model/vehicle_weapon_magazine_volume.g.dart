// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_weapon_magazine_volume.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleWeaponMagazineVolume _$VehicleWeaponMagazineVolumeFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('VehicleWeaponMagazineVolume', json, ($checkedConvert) {
  final val = VehicleWeaponMagazineVolume(
    microScu: $checkedConvert('micro_scu', (v) => (v as num?)?.toInt()),
    scu: $checkedConvert('scu', (v) => (v as num?)?.toDouble()),
  );
  return val;
}, fieldKeyMap: const {'microScu': 'micro_scu'});

Map<String, dynamic> _$VehicleWeaponMagazineVolumeToJson(
  VehicleWeaponMagazineVolume instance,
) => <String, dynamic>{'micro_scu': ?instance.microScu, 'scu': ?instance.scu};
