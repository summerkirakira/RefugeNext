//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'celestial_object_sensor.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CelestialObjectSensor {
  /// Returns a new [CelestialObjectSensor] instance.
  CelestialObjectSensor({

     this.population,

     this.economy,

     this.danger,
  });

  @JsonKey(
    
    name: r'population',
    required: false,
    includeIfNull: false,
  )


  final double? population;



  @JsonKey(
    
    name: r'economy',
    required: false,
    includeIfNull: false,
  )


  final double? economy;



  @JsonKey(
    
    name: r'danger',
    required: false,
    includeIfNull: false,
  )


  final double? danger;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CelestialObjectSensor &&
      other.population == population &&
      other.economy == economy &&
      other.danger == danger;

    @override
    int get hashCode =>
        population.hashCode +
        economy.hashCode +
        danger.hashCode;

  factory CelestialObjectSensor.fromJson(Map<String, dynamic> json) => _$CelestialObjectSensorFromJson(json);

  Map<String, dynamic> toJson() => _$CelestialObjectSensorToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

