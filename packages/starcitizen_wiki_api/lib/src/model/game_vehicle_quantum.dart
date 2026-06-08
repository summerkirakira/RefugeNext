//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'game_vehicle_quantum.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GameVehicleQuantum {
  /// Returns a new [GameVehicleQuantum] instance.
  GameVehicleQuantum({

     this.quantumSpeed,

     this.quantumSpoolTime,

     this.quantumFuelCapacity,

     this.quantumRange,

     this.portOlisarToArccorpTime,

     this.portOlisarToArccorpFuel,
  });

      /// Quantum travel speed in m/s.
  @JsonKey(
    
    name: r'quantum_speed',
    required: false,
    includeIfNull: false,
  )


  final num? quantumSpeed;



      /// Quantum drive spool-up time in seconds.
  @JsonKey(
    
    name: r'quantum_spool_time',
    required: false,
    includeIfNull: false,
  )


  final num? quantumSpoolTime;



      /// Quantum fuel capacity.
  @JsonKey(
    
    name: r'quantum_fuel_capacity',
    required: false,
    includeIfNull: false,
  )


  final num? quantumFuelCapacity;



      /// Maximum quantum travel range in meters.
  @JsonKey(
    
    name: r'quantum_range',
    required: false,
    includeIfNull: false,
  )


  final num? quantumRange;



      /// Reference travel time from Port Olisar to ArcCorp in seconds.
  @JsonKey(
    
    name: r'port_olisar_to_arccorp_time',
    required: false,
    includeIfNull: false,
  )


  final num? portOlisarToArccorpTime;



      /// Reference fuel usage from Port Olisar to ArcCorp.
  @JsonKey(
    
    name: r'port_olisar_to_arccorp_fuel',
    required: false,
    includeIfNull: false,
  )


  final num? portOlisarToArccorpFuel;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GameVehicleQuantum &&
      other.quantumSpeed == quantumSpeed &&
      other.quantumSpoolTime == quantumSpoolTime &&
      other.quantumFuelCapacity == quantumFuelCapacity &&
      other.quantumRange == quantumRange &&
      other.portOlisarToArccorpTime == portOlisarToArccorpTime &&
      other.portOlisarToArccorpFuel == portOlisarToArccorpFuel;

    @override
    int get hashCode =>
        (quantumSpeed == null ? 0 : quantumSpeed.hashCode) +
        (quantumSpoolTime == null ? 0 : quantumSpoolTime.hashCode) +
        (quantumFuelCapacity == null ? 0 : quantumFuelCapacity.hashCode) +
        (quantumRange == null ? 0 : quantumRange.hashCode) +
        (portOlisarToArccorpTime == null ? 0 : portOlisarToArccorpTime.hashCode) +
        (portOlisarToArccorpFuel == null ? 0 : portOlisarToArccorpFuel.hashCode);

  factory GameVehicleQuantum.fromJson(Map<String, dynamic> json) => _$GameVehicleQuantumFromJson(json);

  Map<String, dynamic> toJson() => _$GameVehicleQuantumToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

