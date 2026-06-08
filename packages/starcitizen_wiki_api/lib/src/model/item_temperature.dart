//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'item_temperature.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ItemTemperature {
  /// Returns a new [ItemTemperature] instance.
  ItemTemperature({

     this.unit,

     this.coolingThreshold,

     this.irThreshold,

     this.overheatThreshold,

     this.overheatTemperature,

     this.maxTemperature,

     this.recoveryTemperature,
  });

      /// Temperature unit (always \"C\" for Celsius).
  @JsonKey(
    
    name: r'unit',
    required: false,
    includeIfNull: false,
  )


  final String? unit;



      /// Temperature in Celsius at which active cooling begins.
  @JsonKey(
    
    name: r'cooling_threshold',
    required: false,
    includeIfNull: false,
  )


  final double? coolingThreshold;



      /// Temperature in Celsius above which IR emission becomes detectable.
  @JsonKey(
    
    name: r'ir_threshold',
    required: false,
    includeIfNull: false,
  )


  final double? irThreshold;



      /// Temperature in Celsius at which the overheat warning triggers (before full overheat).
  @JsonKey(
    
    name: r'overheat_threshold',
    required: false,
    includeIfNull: false,
  )


  final double? overheatThreshold;



      /// Deprecated: Use overheat_threshold.
  @Deprecated('overheatTemperature has been deprecated')
  @JsonKey(
    
    name: r'overheat_temperature',
    required: false,
    includeIfNull: false,
  )


  final double? overheatTemperature;



      /// Temperature in Celsius at which the item fully overheats and shuts down.
  @JsonKey(
    
    name: r'max_temperature',
    required: false,
    includeIfNull: false,
  )


  final double? maxTemperature;



      /// Temperature in Celsius the item must cool to before recovering from overheat.
  @JsonKey(
    
    name: r'recovery_temperature',
    required: false,
    includeIfNull: false,
  )


  final double? recoveryTemperature;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ItemTemperature &&
      other.unit == unit &&
      other.coolingThreshold == coolingThreshold &&
      other.irThreshold == irThreshold &&
      other.overheatThreshold == overheatThreshold &&
      other.overheatTemperature == overheatTemperature &&
      other.maxTemperature == maxTemperature &&
      other.recoveryTemperature == recoveryTemperature;

    @override
    int get hashCode =>
        (unit == null ? 0 : unit.hashCode) +
        (coolingThreshold == null ? 0 : coolingThreshold.hashCode) +
        (irThreshold == null ? 0 : irThreshold.hashCode) +
        (overheatThreshold == null ? 0 : overheatThreshold.hashCode) +
        (overheatTemperature == null ? 0 : overheatTemperature.hashCode) +
        (maxTemperature == null ? 0 : maxTemperature.hashCode) +
        (recoveryTemperature == null ? 0 : recoveryTemperature.hashCode);

  factory ItemTemperature.fromJson(Map<String, dynamic> json) => _$ItemTemperatureFromJson(json);

  Map<String, dynamic> toJson() => _$ItemTemperatureToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

