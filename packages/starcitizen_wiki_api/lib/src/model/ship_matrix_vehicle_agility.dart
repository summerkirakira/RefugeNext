//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/ship_matrix_vehicle_agility_acceleration.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ship_matrix_vehicle_agility.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ShipMatrixVehicleAgility {
  /// Returns a new [ShipMatrixVehicleAgility] instance.
  ShipMatrixVehicleAgility({

     this.pitch,

     this.yaw,

     this.roll,

     this.acceleration,
  });

  @JsonKey(
    
    name: r'pitch',
    required: false,
    includeIfNull: false,
  )


  final double? pitch;



  @JsonKey(
    
    name: r'yaw',
    required: false,
    includeIfNull: false,
  )


  final double? yaw;



  @JsonKey(
    
    name: r'roll',
    required: false,
    includeIfNull: false,
  )


  final double? roll;



  @JsonKey(
    
    name: r'acceleration',
    required: false,
    includeIfNull: false,
  )


  final ShipMatrixVehicleAgilityAcceleration? acceleration;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ShipMatrixVehicleAgility &&
      other.pitch == pitch &&
      other.yaw == yaw &&
      other.roll == roll &&
      other.acceleration == acceleration;

    @override
    int get hashCode =>
        pitch.hashCode +
        yaw.hashCode +
        roll.hashCode +
        acceleration.hashCode;

  factory ShipMatrixVehicleAgility.fromJson(Map<String, dynamic> json) => _$ShipMatrixVehicleAgilityFromJson(json);

  Map<String, dynamic> toJson() => _$ShipMatrixVehicleAgilityToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

