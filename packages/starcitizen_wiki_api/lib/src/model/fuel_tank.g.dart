// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fuel_tank.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FuelTank _$FuelTankFromJson(Map<String, dynamic> json) => $checkedCreate(
  'FuelTank',
  json,
  ($checkedConvert) {
    final val = FuelTank(
      fillRate: $checkedConvert('fill_rate', (v) => (v as num?)?.toDouble()),
      drainRate: $checkedConvert('drain_rate', (v) => (v as num?)?.toDouble()),
      capacity: $checkedConvert('capacity', (v) => (v as num?)?.toDouble()),
      dischargeRate: $checkedConvert(
        'discharge_rate',
        (v) => (v as num?)?.toDouble(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'fillRate': 'fill_rate',
    'drainRate': 'drain_rate',
    'dischargeRate': 'discharge_rate',
  },
);

Map<String, dynamic> _$FuelTankToJson(FuelTank instance) => <String, dynamic>{
  'fill_rate': ?instance.fillRate,
  'drain_rate': ?instance.drainRate,
  'capacity': ?instance.capacity,
  'discharge_rate': ?instance.dischargeRate,
};
