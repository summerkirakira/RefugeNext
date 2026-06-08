//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'item_heat_connection.g.dart';


@Deprecated('ItemHeatConnection has been deprecated')
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ItemHeatConnection {
  /// Returns a new [ItemHeatConnection] instance.
  ItemHeatConnection({

     this.temperatureToIr,

     this.irTemperatureThreshold,

     this.overpowerHeat,

     this.overclockThresholdMin,

     this.overclockThresholdMax,

     this.thermalEnergyBase,

     this.thermalEnergyDraw,

     this.thermalConductivity,

     this.specificHeatCapacity,

     this.mass,

     this.surfaceArea,

     this.startCoolingTemperature,

     this.maxCoolingRate,

     this.maxTemperature,

     this.minTemperature,

     this.overheatTemperature,

     this.recoveryTemperature,

     this.misfireMinTemperature,

     this.misfireMaxTemperature,

     this.irEmission,
  });

  @JsonKey(
    
    name: r'temperature_to_ir',
    required: false,
    includeIfNull: false,
  )


  final double? temperatureToIr;



      /// StartIRTemperature
  @JsonKey(
    
    name: r'ir_temperature_threshold',
    required: false,
    includeIfNull: false,
  )


  final double? irTemperatureThreshold;



  @JsonKey(
    
    name: r'overpower_heat',
    required: false,
    includeIfNull: false,
  )


  final double? overpowerHeat;



  @JsonKey(
    
    name: r'overclock_threshold_min',
    required: false,
    includeIfNull: false,
  )


  final double? overclockThresholdMin;



  @JsonKey(
    
    name: r'overclock_threshold_max',
    required: false,
    includeIfNull: false,
  )


  final double? overclockThresholdMax;



  @JsonKey(
    
    name: r'thermal_energy_base',
    required: false,
    includeIfNull: false,
  )


  final double? thermalEnergyBase;



  @JsonKey(
    
    name: r'thermal_energy_draw',
    required: false,
    includeIfNull: false,
  )


  final double? thermalEnergyDraw;



  @JsonKey(
    
    name: r'thermal_conductivity',
    required: false,
    includeIfNull: false,
  )


  final double? thermalConductivity;



  @JsonKey(
    
    name: r'specific_heat_capacity',
    required: false,
    includeIfNull: false,
  )


  final double? specificHeatCapacity;



  @JsonKey(
    
    name: r'mass',
    required: false,
    includeIfNull: false,
  )


  final double? mass;



  @JsonKey(
    
    name: r'surface_area',
    required: false,
    includeIfNull: false,
  )


  final double? surfaceArea;



  @JsonKey(
    
    name: r'start_cooling_temperature',
    required: false,
    includeIfNull: false,
  )


  final double? startCoolingTemperature;



  @JsonKey(
    
    name: r'max_cooling_rate',
    required: false,
    includeIfNull: false,
  )


  final double? maxCoolingRate;



  @JsonKey(
    
    name: r'max_temperature',
    required: false,
    includeIfNull: false,
  )


  final double? maxTemperature;



  @JsonKey(
    
    name: r'min_temperature',
    required: false,
    includeIfNull: false,
  )


  final double? minTemperature;



  @JsonKey(
    
    name: r'overheat_temperature',
    required: false,
    includeIfNull: false,
  )


  final double? overheatTemperature;



  @JsonKey(
    
    name: r'recovery_temperature',
    required: false,
    includeIfNull: false,
  )


  final double? recoveryTemperature;



  @JsonKey(
    
    name: r'misfire_min_temperature',
    required: false,
    includeIfNull: false,
  )


  final double? misfireMinTemperature;



  @JsonKey(
    
    name: r'misfire_max_temperature',
    required: false,
    includeIfNull: false,
  )


  final double? misfireMaxTemperature;



      /// (StartCoolingTemperature - StartIRTemperature) * TemperatureToIR
  @JsonKey(
    
    name: r'ir_emission',
    required: false,
    includeIfNull: false,
  )


  final double? irEmission;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ItemHeatConnection &&
      other.temperatureToIr == temperatureToIr &&
      other.irTemperatureThreshold == irTemperatureThreshold &&
      other.overpowerHeat == overpowerHeat &&
      other.overclockThresholdMin == overclockThresholdMin &&
      other.overclockThresholdMax == overclockThresholdMax &&
      other.thermalEnergyBase == thermalEnergyBase &&
      other.thermalEnergyDraw == thermalEnergyDraw &&
      other.thermalConductivity == thermalConductivity &&
      other.specificHeatCapacity == specificHeatCapacity &&
      other.mass == mass &&
      other.surfaceArea == surfaceArea &&
      other.startCoolingTemperature == startCoolingTemperature &&
      other.maxCoolingRate == maxCoolingRate &&
      other.maxTemperature == maxTemperature &&
      other.minTemperature == minTemperature &&
      other.overheatTemperature == overheatTemperature &&
      other.recoveryTemperature == recoveryTemperature &&
      other.misfireMinTemperature == misfireMinTemperature &&
      other.misfireMaxTemperature == misfireMaxTemperature &&
      other.irEmission == irEmission;

    @override
    int get hashCode =>
        (temperatureToIr == null ? 0 : temperatureToIr.hashCode) +
        (irTemperatureThreshold == null ? 0 : irTemperatureThreshold.hashCode) +
        (overpowerHeat == null ? 0 : overpowerHeat.hashCode) +
        (overclockThresholdMin == null ? 0 : overclockThresholdMin.hashCode) +
        (overclockThresholdMax == null ? 0 : overclockThresholdMax.hashCode) +
        (thermalEnergyBase == null ? 0 : thermalEnergyBase.hashCode) +
        (thermalEnergyDraw == null ? 0 : thermalEnergyDraw.hashCode) +
        (thermalConductivity == null ? 0 : thermalConductivity.hashCode) +
        (specificHeatCapacity == null ? 0 : specificHeatCapacity.hashCode) +
        (mass == null ? 0 : mass.hashCode) +
        (surfaceArea == null ? 0 : surfaceArea.hashCode) +
        (startCoolingTemperature == null ? 0 : startCoolingTemperature.hashCode) +
        (maxCoolingRate == null ? 0 : maxCoolingRate.hashCode) +
        (maxTemperature == null ? 0 : maxTemperature.hashCode) +
        (minTemperature == null ? 0 : minTemperature.hashCode) +
        (overheatTemperature == null ? 0 : overheatTemperature.hashCode) +
        (recoveryTemperature == null ? 0 : recoveryTemperature.hashCode) +
        (misfireMinTemperature == null ? 0 : misfireMinTemperature.hashCode) +
        (misfireMaxTemperature == null ? 0 : misfireMaxTemperature.hashCode) +
        (irEmission == null ? 0 : irEmission.hashCode);

  factory ItemHeatConnection.fromJson(Map<String, dynamic> json) => _$ItemHeatConnectionFromJson(json);

  Map<String, dynamic> toJson() => _$ItemHeatConnectionToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

