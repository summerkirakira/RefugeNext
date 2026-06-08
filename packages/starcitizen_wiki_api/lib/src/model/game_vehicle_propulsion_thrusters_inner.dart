//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'game_vehicle_propulsion_thrusters_inner.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GameVehiclePropulsionThrustersInner {
  /// Returns a new [GameVehiclePropulsionThrustersInner] instance.
  GameVehiclePropulsionThrustersInner({

     this.type,

     this.count,

     this.capacity,

     this.g,
  });

      /// Thruster type (Main, Maneuver, Retro, etc).
  @JsonKey(
    
    name: r'type',
    required: false,
    includeIfNull: false,
  )


  final String? type;



      /// Number of thrusters of this type.
  @JsonKey(
    
    name: r'count',
    required: false,
    includeIfNull: false,
  )


  final int? count;



      /// Thruster capacity.
  @JsonKey(
    
    name: r'capacity',
    required: false,
    includeIfNull: false,
  )


  final num? capacity;



      /// G-force rating.
  @JsonKey(
    
    name: r'g',
    required: false,
    includeIfNull: false,
  )


  final num? g;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GameVehiclePropulsionThrustersInner &&
      other.type == type &&
      other.count == count &&
      other.capacity == capacity &&
      other.g == g;

    @override
    int get hashCode =>
        type.hashCode +
        count.hashCode +
        (capacity == null ? 0 : capacity.hashCode) +
        (g == null ? 0 : g.hashCode);

  factory GameVehiclePropulsionThrustersInner.fromJson(Map<String, dynamic> json) => _$GameVehiclePropulsionThrustersInnerFromJson(json);

  Map<String, dynamic> toJson() => _$GameVehiclePropulsionThrustersInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

