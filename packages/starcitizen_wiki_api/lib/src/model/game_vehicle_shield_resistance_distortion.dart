//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'game_vehicle_shield_resistance_distortion.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GameVehicleShieldResistanceDistortion {
  /// Returns a new [GameVehicleShieldResistanceDistortion] instance.
  GameVehicleShieldResistanceDistortion({

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
    bool operator ==(Object other) => identical(this, other) || other is GameVehicleShieldResistanceDistortion &&
      other.minimum == minimum &&
      other.maximum == maximum;

    @override
    int get hashCode =>
        (minimum == null ? 0 : minimum.hashCode) +
        (maximum == null ? 0 : maximum.hashCode);

  factory GameVehicleShieldResistanceDistortion.fromJson(Map<String, dynamic> json) => _$GameVehicleShieldResistanceDistortionFromJson(json);

  Map<String, dynamic> toJson() => _$GameVehicleShieldResistanceDistortionToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

