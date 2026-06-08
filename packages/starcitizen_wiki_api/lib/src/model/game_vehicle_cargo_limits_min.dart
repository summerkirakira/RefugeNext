//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'game_vehicle_cargo_limits_min.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GameVehicleCargoLimitsMin {
  /// Returns a new [GameVehicleCargoLimitsMin] instance.
  GameVehicleCargoLimitsMin({

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
    bool operator ==(Object other) => identical(this, other) || other is GameVehicleCargoLimitsMin &&
      other.x == x &&
      other.y == y &&
      other.z == z;

    @override
    int get hashCode =>
        (x == null ? 0 : x.hashCode) +
        (y == null ? 0 : y.hashCode) +
        (z == null ? 0 : z.hashCode);

  factory GameVehicleCargoLimitsMin.fromJson(Map<String, dynamic> json) => _$GameVehicleCargoLimitsMinFromJson(json);

  Map<String, dynamic> toJson() => _$GameVehicleCargoLimitsMinToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

