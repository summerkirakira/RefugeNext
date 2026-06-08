//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'game_vehicle_crew.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GameVehicleCrew {
  /// Returns a new [GameVehicleCrew] instance.
  GameVehicleCrew({

     this.min,

     this.max,

     this.weapon,

     this.operation,
  });

      /// Minimum crew required to operate.
  @JsonKey(
    
    name: r'min',
    required: false,
    includeIfNull: false,
  )


  final int? min;



      /// Maximum crew capacity.
  @JsonKey(
    
    name: r'max',
    required: false,
    includeIfNull: false,
  )


  final int? max;



      /// Number of weapon crew stations.
  @JsonKey(
    
    name: r'weapon',
    required: false,
    includeIfNull: false,
  )


  final int? weapon;



      /// Number of operational crew stations.
  @JsonKey(
    
    name: r'operation',
    required: false,
    includeIfNull: false,
  )


  final int? operation;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GameVehicleCrew &&
      other.min == min &&
      other.max == max &&
      other.weapon == weapon &&
      other.operation == operation;

    @override
    int get hashCode =>
        (min == null ? 0 : min.hashCode) +
        (max == null ? 0 : max.hashCode) +
        (weapon == null ? 0 : weapon.hashCode) +
        (operation == null ? 0 : operation.hashCode);

  factory GameVehicleCrew.fromJson(Map<String, dynamic> json) => _$GameVehicleCrewFromJson(json);

  Map<String, dynamic> toJson() => _$GameVehicleCrewToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

