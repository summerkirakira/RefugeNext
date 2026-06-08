//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'game_vehicle_propulsion_thrust_capacity.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GameVehiclePropulsionThrustCapacity {
  /// Returns a new [GameVehiclePropulsionThrustCapacity] instance.
  GameVehiclePropulsionThrustCapacity({

     this.main,

     this.retro,

     this.vtol,

     this.maneuvering,
  });

      /// Main engine thrust in Newtons.
  @JsonKey(
    
    name: r'main',
    required: false,
    includeIfNull: false,
  )


  final num? main;



      /// Retro thruster thrust in Newtons.
  @JsonKey(
    
    name: r'retro',
    required: false,
    includeIfNull: false,
  )


  final num? retro;



      /// VTOL thruster thrust in Newtons.
  @JsonKey(
    
    name: r'vtol',
    required: false,
    includeIfNull: false,
  )


  final num? vtol;



      /// Maneuvering thruster thrust in Newtons.
  @JsonKey(
    
    name: r'maneuvering',
    required: false,
    includeIfNull: false,
  )


  final num? maneuvering;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GameVehiclePropulsionThrustCapacity &&
      other.main == main &&
      other.retro == retro &&
      other.vtol == vtol &&
      other.maneuvering == maneuvering;

    @override
    int get hashCode =>
        (main == null ? 0 : main.hashCode) +
        (retro == null ? 0 : retro.hashCode) +
        (vtol == null ? 0 : vtol.hashCode) +
        (maneuvering == null ? 0 : maneuvering.hashCode);

  factory GameVehiclePropulsionThrustCapacity.fromJson(Map<String, dynamic> json) => _$GameVehiclePropulsionThrustCapacityFromJson(json);

  Map<String, dynamic> toJson() => _$GameVehiclePropulsionThrustCapacityToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

