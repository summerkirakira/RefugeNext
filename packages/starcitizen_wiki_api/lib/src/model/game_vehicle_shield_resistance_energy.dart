//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'game_vehicle_shield_resistance_energy.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GameVehicleShieldResistanceEnergy {
  /// Returns a new [GameVehicleShieldResistanceEnergy] instance.
  GameVehicleShieldResistanceEnergy({

     this.minimum,

     this.maximum,
  });

  @JsonKey(
    
    name: r'minimum',
    required: false,
    includeIfNull: false,
  )


  final num? minimum;



  @JsonKey(
    
    name: r'maximum',
    required: false,
    includeIfNull: false,
  )


  final num? maximum;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GameVehicleShieldResistanceEnergy &&
      other.minimum == minimum &&
      other.maximum == maximum;

    @override
    int get hashCode =>
        (minimum == null ? 0 : minimum.hashCode) +
        (maximum == null ? 0 : maximum.hashCode);

  factory GameVehicleShieldResistanceEnergy.fromJson(Map<String, dynamic> json) => _$GameVehicleShieldResistanceEnergyFromJson(json);

  Map<String, dynamic> toJson() => _$GameVehicleShieldResistanceEnergyToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

