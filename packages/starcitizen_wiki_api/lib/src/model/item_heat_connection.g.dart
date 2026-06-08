// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_heat_connection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemHeatConnection _$ItemHeatConnectionFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ItemHeatConnection',
      json,
      ($checkedConvert) {
        final val = ItemHeatConnection(
          temperatureToIr: $checkedConvert(
            'temperature_to_ir',
            (v) => (v as num?)?.toDouble(),
          ),
          irTemperatureThreshold: $checkedConvert(
            'ir_temperature_threshold',
            (v) => (v as num?)?.toDouble(),
          ),
          overpowerHeat: $checkedConvert(
            'overpower_heat',
            (v) => (v as num?)?.toDouble(),
          ),
          overclockThresholdMin: $checkedConvert(
            'overclock_threshold_min',
            (v) => (v as num?)?.toDouble(),
          ),
          overclockThresholdMax: $checkedConvert(
            'overclock_threshold_max',
            (v) => (v as num?)?.toDouble(),
          ),
          thermalEnergyBase: $checkedConvert(
            'thermal_energy_base',
            (v) => (v as num?)?.toDouble(),
          ),
          thermalEnergyDraw: $checkedConvert(
            'thermal_energy_draw',
            (v) => (v as num?)?.toDouble(),
          ),
          thermalConductivity: $checkedConvert(
            'thermal_conductivity',
            (v) => (v as num?)?.toDouble(),
          ),
          specificHeatCapacity: $checkedConvert(
            'specific_heat_capacity',
            (v) => (v as num?)?.toDouble(),
          ),
          mass: $checkedConvert('mass', (v) => (v as num?)?.toDouble()),
          surfaceArea: $checkedConvert(
            'surface_area',
            (v) => (v as num?)?.toDouble(),
          ),
          startCoolingTemperature: $checkedConvert(
            'start_cooling_temperature',
            (v) => (v as num?)?.toDouble(),
          ),
          maxCoolingRate: $checkedConvert(
            'max_cooling_rate',
            (v) => (v as num?)?.toDouble(),
          ),
          maxTemperature: $checkedConvert(
            'max_temperature',
            (v) => (v as num?)?.toDouble(),
          ),
          minTemperature: $checkedConvert(
            'min_temperature',
            (v) => (v as num?)?.toDouble(),
          ),
          overheatTemperature: $checkedConvert(
            'overheat_temperature',
            (v) => (v as num?)?.toDouble(),
          ),
          recoveryTemperature: $checkedConvert(
            'recovery_temperature',
            (v) => (v as num?)?.toDouble(),
          ),
          misfireMinTemperature: $checkedConvert(
            'misfire_min_temperature',
            (v) => (v as num?)?.toDouble(),
          ),
          misfireMaxTemperature: $checkedConvert(
            'misfire_max_temperature',
            (v) => (v as num?)?.toDouble(),
          ),
          irEmission: $checkedConvert(
            'ir_emission',
            (v) => (v as num?)?.toDouble(),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'temperatureToIr': 'temperature_to_ir',
        'irTemperatureThreshold': 'ir_temperature_threshold',
        'overpowerHeat': 'overpower_heat',
        'overclockThresholdMin': 'overclock_threshold_min',
        'overclockThresholdMax': 'overclock_threshold_max',
        'thermalEnergyBase': 'thermal_energy_base',
        'thermalEnergyDraw': 'thermal_energy_draw',
        'thermalConductivity': 'thermal_conductivity',
        'specificHeatCapacity': 'specific_heat_capacity',
        'surfaceArea': 'surface_area',
        'startCoolingTemperature': 'start_cooling_temperature',
        'maxCoolingRate': 'max_cooling_rate',
        'maxTemperature': 'max_temperature',
        'minTemperature': 'min_temperature',
        'overheatTemperature': 'overheat_temperature',
        'recoveryTemperature': 'recovery_temperature',
        'misfireMinTemperature': 'misfire_min_temperature',
        'misfireMaxTemperature': 'misfire_max_temperature',
        'irEmission': 'ir_emission',
      },
    );

Map<String, dynamic> _$ItemHeatConnectionToJson(ItemHeatConnection instance) =>
    <String, dynamic>{
      'temperature_to_ir': ?instance.temperatureToIr,
      'ir_temperature_threshold': ?instance.irTemperatureThreshold,
      'overpower_heat': ?instance.overpowerHeat,
      'overclock_threshold_min': ?instance.overclockThresholdMin,
      'overclock_threshold_max': ?instance.overclockThresholdMax,
      'thermal_energy_base': ?instance.thermalEnergyBase,
      'thermal_energy_draw': ?instance.thermalEnergyDraw,
      'thermal_conductivity': ?instance.thermalConductivity,
      'specific_heat_capacity': ?instance.specificHeatCapacity,
      'mass': ?instance.mass,
      'surface_area': ?instance.surfaceArea,
      'start_cooling_temperature': ?instance.startCoolingTemperature,
      'max_cooling_rate': ?instance.maxCoolingRate,
      'max_temperature': ?instance.maxTemperature,
      'min_temperature': ?instance.minTemperature,
      'overheat_temperature': ?instance.overheatTemperature,
      'recovery_temperature': ?instance.recoveryTemperature,
      'misfire_min_temperature': ?instance.misfireMinTemperature,
      'misfire_max_temperature': ?instance.misfireMaxTemperature,
      'ir_emission': ?instance.irEmission,
    };
