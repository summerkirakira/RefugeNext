// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thruster_fuel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ThrusterFuel _$ThrusterFuelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ThrusterFuel',
      json,
      ($checkedConvert) {
        final val = ThrusterFuel(
          burnRatePer10kNewton: $checkedConvert(
            'burn_rate_per_10k_newton',
            (v) => (v as num?)?.toDouble(),
          ),
        );
        return val;
      },
      fieldKeyMap: const {'burnRatePer10kNewton': 'burn_rate_per_10k_newton'},
    );

Map<String, dynamic> _$ThrusterFuelToJson(ThrusterFuel instance) =>
    <String, dynamic>{
      'burn_rate_per_10k_newton': ?instance.burnRatePer10kNewton,
    };
