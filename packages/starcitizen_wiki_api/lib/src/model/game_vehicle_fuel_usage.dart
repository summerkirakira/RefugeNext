//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'game_vehicle_fuel_usage.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GameVehicleFuelUsage {
  /// Returns a new [GameVehicleFuelUsage] instance.
  GameVehicleFuelUsage({

     this.main,

     this.retro,

     this.vtol,

     this.maneuvering,
  });

      /// Main engine fuel consumption rate.
  @JsonKey(
    
    name: r'main',
    required: false,
    includeIfNull: false,
  )


  final num? main;



      /// Retro thruster fuel consumption rate.
  @JsonKey(
    
    name: r'retro',
    required: false,
    includeIfNull: false,
  )


  final num? retro;



      /// VTOL fuel consumption rate.
  @JsonKey(
    
    name: r'vtol',
    required: false,
    includeIfNull: false,
  )


  final num? vtol;



      /// Maneuvering thruster fuel consumption rate.
  @JsonKey(
    
    name: r'maneuvering',
    required: false,
    includeIfNull: false,
  )


  final num? maneuvering;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GameVehicleFuelUsage &&
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

  factory GameVehicleFuelUsage.fromJson(Map<String, dynamic> json) => _$GameVehicleFuelUsageFromJson(json);

  Map<String, dynamic> toJson() => _$GameVehicleFuelUsageToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

