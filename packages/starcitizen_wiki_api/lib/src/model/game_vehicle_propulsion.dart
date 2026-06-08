//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/game_vehicle_propulsion_thrust_capacity.dart';
import 'package:starcitizen_wiki_api/src/model/game_vehicle_propulsion_thrusters_inner.dart';
import 'package:json_annotation/json_annotation.dart';

part 'game_vehicle_propulsion.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GameVehiclePropulsion {
  /// Returns a new [GameVehiclePropulsion] instance.
  GameVehiclePropulsion({

     this.thrusters,

     this.thrustCapacity,
  });

      /// Array of thruster groups by type.
  @JsonKey(
    
    name: r'thrusters',
    required: false,
    includeIfNull: false,
  )


  final List<GameVehiclePropulsionThrustersInner>? thrusters;



  @JsonKey(
    
    name: r'thrust_capacity',
    required: false,
    includeIfNull: false,
  )


  final GameVehiclePropulsionThrustCapacity? thrustCapacity;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GameVehiclePropulsion &&
      other.thrusters == thrusters &&
      other.thrustCapacity == thrustCapacity;

    @override
    int get hashCode =>
        thrusters.hashCode +
        (thrustCapacity == null ? 0 : thrustCapacity.hashCode);

  factory GameVehiclePropulsion.fromJson(Map<String, dynamic> json) => _$GameVehiclePropulsionFromJson(json);

  Map<String, dynamic> toJson() => _$GameVehiclePropulsionToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

