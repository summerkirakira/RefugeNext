//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'game_vehicle_shield_absorption_biochemical.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GameVehicleShieldAbsorptionBiochemical {
  /// Returns a new [GameVehicleShieldAbsorptionBiochemical] instance.
  GameVehicleShieldAbsorptionBiochemical({

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
    bool operator ==(Object other) => identical(this, other) || other is GameVehicleShieldAbsorptionBiochemical &&
      other.minimum == minimum &&
      other.maximum == maximum;

    @override
    int get hashCode =>
        (minimum == null ? 0 : minimum.hashCode) +
        (maximum == null ? 0 : maximum.hashCode);

  factory GameVehicleShieldAbsorptionBiochemical.fromJson(Map<String, dynamic> json) => _$GameVehicleShieldAbsorptionBiochemicalFromJson(json);

  Map<String, dynamic> toJson() => _$GameVehicleShieldAbsorptionBiochemicalToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

