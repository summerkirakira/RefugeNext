//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'game_vehicle_shield_resistance_physical.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GameVehicleShieldResistancePhysical {
  /// Returns a new [GameVehicleShieldResistancePhysical] instance.
  GameVehicleShieldResistancePhysical({

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
    bool operator ==(Object other) => identical(this, other) || other is GameVehicleShieldResistancePhysical &&
      other.minimum == minimum &&
      other.maximum == maximum;

    @override
    int get hashCode =>
        (minimum == null ? 0 : minimum.hashCode) +
        (maximum == null ? 0 : maximum.hashCode);

  factory GameVehicleShieldResistancePhysical.fromJson(Map<String, dynamic> json) => _$GameVehicleShieldResistancePhysicalFromJson(json);

  Map<String, dynamic> toJson() => _$GameVehicleShieldResistancePhysicalToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

