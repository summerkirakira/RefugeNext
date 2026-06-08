// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_vehicle_drive_agility.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameVehicleDriveAgility _$GameVehicleDriveAgilityFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('GameVehicleDriveAgility', json, ($checkedConvert) {
  final val = GameVehicleDriveAgility(
    handling: $checkedConvert('handling', (v) => v as num?),
    grip: $checkedConvert('grip', (v) => v as num?),
    acceleration: $checkedConvert('acceleration', (v) => v as num?),
  );
  return val;
});

Map<String, dynamic> _$GameVehicleDriveAgilityToJson(
  GameVehicleDriveAgility instance,
) => <String, dynamic>{
  'handling': ?instance.handling,
  'grip': ?instance.grip,
  'acceleration': ?instance.acceleration,
};
