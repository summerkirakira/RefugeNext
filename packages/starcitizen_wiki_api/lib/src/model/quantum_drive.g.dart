// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quantum_drive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuantumDrive _$QuantumDriveFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'QuantumDrive',
  json,
  ($checkedConvert) {
    final val = QuantumDrive(
      quantumFuelRequirement: $checkedConvert(
        'quantum_fuel_requirement',
        (v) => (v as num?)?.toDouble(),
      ),
      fuelRate: $checkedConvert('fuel_rate', (v) => (v as num?)?.toDouble()),
      jumpRange: $checkedConvert('jump_range', (v) => (v as num?)?.toDouble()),
      jumpRangeFormatted: $checkedConvert(
        'jump_range_formatted',
        (v) => v as String?,
      ),
      disconnectRange: $checkedConvert(
        'disconnect_range',
        (v) => (v as num?)?.toDouble(),
      ),
      disconnectRangeFormatted: $checkedConvert(
        'disconnect_range_formatted',
        (v) => v as String?,
      ),
      thermalEnergyDraw: $checkedConvert(
        'thermal_energy_draw',
        (v) => v == null
            ? null
            : QuantumDriveThermalEnergyDraw.fromJson(v as Map<String, dynamic>),
      ),
      standardJump: $checkedConvert(
        'standard_jump',
        (v) => v == null
            ? null
            : QuantumDriveJumpProfile.fromJson(v as Map<String, dynamic>),
      ),
      splineJump: $checkedConvert(
        'spline_jump',
        (v) => v == null
            ? null
            : QuantumDriveJumpProfile.fromJson(v as Map<String, dynamic>),
      ),
      modes: $checkedConvert(
        'modes',
        (v) => (v as List<dynamic>?)
            ?.map(
              (e) =>
                  QuantumDriveJumpProfile.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
      fuelConsumptionScuPerGm: $checkedConvert(
        'fuel_consumption_scu_per_gm',
        (v) => (v as num?)?.toDouble(),
      ),
      fuelEfficiency: $checkedConvert(
        'fuel_efficiency',
        (v) => (v as num?)?.toDouble(),
      ),
      travelTime10gm: $checkedConvert(
        'travel_time_10gm',
        (v) => v == null
            ? null
            : QuantumDriveTravelTime10gm.fromJson(v as Map<String, dynamic>),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'quantumFuelRequirement': 'quantum_fuel_requirement',
    'fuelRate': 'fuel_rate',
    'jumpRange': 'jump_range',
    'jumpRangeFormatted': 'jump_range_formatted',
    'disconnectRange': 'disconnect_range',
    'disconnectRangeFormatted': 'disconnect_range_formatted',
    'thermalEnergyDraw': 'thermal_energy_draw',
    'standardJump': 'standard_jump',
    'splineJump': 'spline_jump',
    'fuelConsumptionScuPerGm': 'fuel_consumption_scu_per_gm',
    'fuelEfficiency': 'fuel_efficiency',
    'travelTime10gm': 'travel_time_10gm',
  },
);

Map<String, dynamic> _$QuantumDriveToJson(QuantumDrive instance) =>
    <String, dynamic>{
      'quantum_fuel_requirement': ?instance.quantumFuelRequirement,
      'fuel_rate': ?instance.fuelRate,
      'jump_range': ?instance.jumpRange,
      'jump_range_formatted': ?instance.jumpRangeFormatted,
      'disconnect_range': ?instance.disconnectRange,
      'disconnect_range_formatted': ?instance.disconnectRangeFormatted,
      'thermal_energy_draw': ?instance.thermalEnergyDraw?.toJson(),
      'standard_jump': ?instance.standardJump?.toJson(),
      'spline_jump': ?instance.splineJump?.toJson(),
      'modes': ?instance.modes?.map((e) => e.toJson()).toList(),
      'fuel_consumption_scu_per_gm': ?instance.fuelConsumptionScuPerGm,
      'fuel_efficiency': ?instance.fuelEfficiency,
      'travel_time_10gm': ?instance.travelTime10gm?.toJson(),
    };
