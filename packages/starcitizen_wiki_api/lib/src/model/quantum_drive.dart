//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/quantum_drive_thermal_energy_draw.dart';
import 'package:starcitizen_wiki_api/src/model/quantum_drive_travel_time10gm.dart';
import 'package:starcitizen_wiki_api/src/model/quantum_drive_jump_profile.dart';
import 'package:json_annotation/json_annotation.dart';

part 'quantum_drive.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class QuantumDrive {
  /// Returns a new [QuantumDrive] instance.
  QuantumDrive({

     this.quantumFuelRequirement,

     this.fuelRate,

     this.jumpRange,

     this.jumpRangeFormatted,

     this.disconnectRange,

     this.disconnectRangeFormatted,

     this.thermalEnergyDraw,

     this.standardJump,

     this.splineJump,

     this.modes,

     this.fuelConsumptionScuPerGm,

     this.fuelEfficiency,

     this.travelTime10gm,
  });

      /// Total quantum fuel consumed to complete a spool (QuantumFuelRequirement).
  @JsonKey(
    
    name: r'quantum_fuel_requirement',
    required: false,
    includeIfNull: false,
  )


  final double? quantumFuelRequirement;



      /// Continuous quantum fuel burn per meter travelled (FuelRate).
  @JsonKey(
    
    name: r'fuel_rate',
    required: false,
    includeIfNull: false,
  )


  final double? fuelRate;



      /// Maximum permitted quantum jump distance in meters (JumpRange).
  @JsonKey(
    
    name: r'jump_range',
    required: false,
    includeIfNull: false,
  )


  final double? jumpRange;



      /// Jump range formatted as human-readable distance (e.g. \"~56 GM\"). Null when jump_range is null.
  @JsonKey(
    
    name: r'jump_range_formatted',
    required: false,
    includeIfNull: false,
  )


  final String? jumpRangeFormatted;



      /// Automatic disengage distance when approaching destination in meters (DisconnectRange).
  @JsonKey(
    
    name: r'disconnect_range',
    required: false,
    includeIfNull: false,
  )


  final double? disconnectRange;



      /// Disconnect range formatted as human-readable distance (e.g. \"35 km\"). Null when disconnect_range is null.
  @JsonKey(
    
    name: r'disconnect_range_formatted',
    required: false,
    includeIfNull: false,
  )


  final String? disconnectRangeFormatted;



  @JsonKey(
    
    name: r'thermal_energy_draw',
    required: false,
    includeIfNull: false,
  )


  final QuantumDriveThermalEnergyDraw? thermalEnergyDraw;



  @JsonKey(
    
    name: r'standard_jump',
    required: false,
    includeIfNull: false,
  )


  final QuantumDriveJumpProfile? standardJump;



  @JsonKey(
    
    name: r'spline_jump',
    required: false,
    includeIfNull: false,
  )


  final QuantumDriveJumpProfile? splineJump;



      /// List of jump profiles with an explicit mode identifier.
  @JsonKey(
    
    name: r'modes',
    required: false,
    includeIfNull: false,
  )


  final List<QuantumDriveJumpProfile>? modes;



      /// Fuel consumption in SCU per GM (FuelConsumptionSCUPerGM).
  @JsonKey(
    
    name: r'fuel_consumption_scu_per_gm',
    required: false,
    includeIfNull: false,
  )


  final double? fuelConsumptionScuPerGm;



      /// Fuel efficiency in GM per SCU (FuelEfficiencyGMPerSCU).
  @JsonKey(
    
    name: r'fuel_efficiency',
    required: false,
    includeIfNull: false,
  )


  final double? fuelEfficiency;



  @JsonKey(
    
    name: r'travel_time_10gm',
    required: false,
    includeIfNull: false,
  )


  final QuantumDriveTravelTime10gm? travelTime10gm;





    @override
    bool operator ==(Object other) => identical(this, other) || other is QuantumDrive &&
      other.quantumFuelRequirement == quantumFuelRequirement &&
      other.fuelRate == fuelRate &&
      other.jumpRange == jumpRange &&
      other.jumpRangeFormatted == jumpRangeFormatted &&
      other.disconnectRange == disconnectRange &&
      other.disconnectRangeFormatted == disconnectRangeFormatted &&
      other.thermalEnergyDraw == thermalEnergyDraw &&
      other.standardJump == standardJump &&
      other.splineJump == splineJump &&
      other.modes == modes &&
      other.fuelConsumptionScuPerGm == fuelConsumptionScuPerGm &&
      other.fuelEfficiency == fuelEfficiency &&
      other.travelTime10gm == travelTime10gm;

    @override
    int get hashCode =>
        (quantumFuelRequirement == null ? 0 : quantumFuelRequirement.hashCode) +
        (fuelRate == null ? 0 : fuelRate.hashCode) +
        (jumpRange == null ? 0 : jumpRange.hashCode) +
        (jumpRangeFormatted == null ? 0 : jumpRangeFormatted.hashCode) +
        (disconnectRange == null ? 0 : disconnectRange.hashCode) +
        (disconnectRangeFormatted == null ? 0 : disconnectRangeFormatted.hashCode) +
        thermalEnergyDraw.hashCode +
        standardJump.hashCode +
        splineJump.hashCode +
        modes.hashCode +
        (fuelConsumptionScuPerGm == null ? 0 : fuelConsumptionScuPerGm.hashCode) +
        (fuelEfficiency == null ? 0 : fuelEfficiency.hashCode) +
        travelTime10gm.hashCode;

  factory QuantumDrive.fromJson(Map<String, dynamic> json) => _$QuantumDriveFromJson(json);

  Map<String, dynamic> toJson() => _$QuantumDriveToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

