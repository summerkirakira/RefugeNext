// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_vehicle_quantum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameVehicleQuantum _$GameVehicleQuantumFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'GameVehicleQuantum',
      json,
      ($checkedConvert) {
        final val = GameVehicleQuantum(
          quantumSpeed: $checkedConvert('quantum_speed', (v) => v as num?),
          quantumSpoolTime: $checkedConvert(
            'quantum_spool_time',
            (v) => v as num?,
          ),
          quantumFuelCapacity: $checkedConvert(
            'quantum_fuel_capacity',
            (v) => v as num?,
          ),
          quantumRange: $checkedConvert('quantum_range', (v) => v as num?),
          portOlisarToArccorpTime: $checkedConvert(
            'port_olisar_to_arccorp_time',
            (v) => v as num?,
          ),
          portOlisarToArccorpFuel: $checkedConvert(
            'port_olisar_to_arccorp_fuel',
            (v) => v as num?,
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'quantumSpeed': 'quantum_speed',
        'quantumSpoolTime': 'quantum_spool_time',
        'quantumFuelCapacity': 'quantum_fuel_capacity',
        'quantumRange': 'quantum_range',
        'portOlisarToArccorpTime': 'port_olisar_to_arccorp_time',
        'portOlisarToArccorpFuel': 'port_olisar_to_arccorp_fuel',
      },
    );

Map<String, dynamic> _$GameVehicleQuantumToJson(GameVehicleQuantum instance) =>
    <String, dynamic>{
      'quantum_speed': ?instance.quantumSpeed,
      'quantum_spool_time': ?instance.quantumSpoolTime,
      'quantum_fuel_capacity': ?instance.quantumFuelCapacity,
      'quantum_range': ?instance.quantumRange,
      'port_olisar_to_arccorp_time': ?instance.portOlisarToArccorpTime,
      'port_olisar_to_arccorp_fuel': ?instance.portOlisarToArccorpFuel,
    };
