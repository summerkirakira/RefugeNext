// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quantum_drive_travel_time10gm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuantumDriveTravelTime10gm _$QuantumDriveTravelTime10gmFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('QuantumDriveTravelTime10gm', json, ($checkedConvert) {
  final val = QuantumDriveTravelTime10gm(
    seconds: $checkedConvert('seconds', (v) => (v as num?)?.toDouble()),
    formatted: $checkedConvert('formatted', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$QuantumDriveTravelTime10gmToJson(
  QuantumDriveTravelTime10gm instance,
) => <String, dynamic>{
  'seconds': ?instance.seconds,
  'formatted': ?instance.formatted,
};
