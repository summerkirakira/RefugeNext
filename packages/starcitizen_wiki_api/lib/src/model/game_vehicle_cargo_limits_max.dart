//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'game_vehicle_cargo_limits_max.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GameVehicleCargoLimitsMax {
  /// Returns a new [GameVehicleCargoLimitsMax] instance.
  GameVehicleCargoLimitsMax({

     this.x,

     this.y,

     this.z,
  });

  @JsonKey(
    
    name: r'x',
    required: false,
    includeIfNull: false,
  )


  final num? x;



  @JsonKey(
    
    name: r'y',
    required: false,
    includeIfNull: false,
  )


  final num? y;



  @JsonKey(
    
    name: r'z',
    required: false,
    includeIfNull: false,
  )


  final num? z;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GameVehicleCargoLimitsMax &&
      other.x == x &&
      other.y == y &&
      other.z == z;

    @override
    int get hashCode =>
        (x == null ? 0 : x.hashCode) +
        (y == null ? 0 : y.hashCode) +
        (z == null ? 0 : z.hashCode);

  factory GameVehicleCargoLimitsMax.fromJson(Map<String, dynamic> json) => _$GameVehicleCargoLimitsMaxFromJson(json);

  Map<String, dynamic> toJson() => _$GameVehicleCargoLimitsMaxToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

