//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'ship_matrix_vehicle_agility_acceleration.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ShipMatrixVehicleAgilityAcceleration {
  /// Returns a new [ShipMatrixVehicleAgilityAcceleration] instance.
  ShipMatrixVehicleAgilityAcceleration({

     this.xAxis,

     this.yAxis,

     this.zAxis,
  });

  @JsonKey(
    
    name: r'x_axis',
    required: false,
    includeIfNull: false,
  )


  final double? xAxis;



  @JsonKey(
    
    name: r'y_axis',
    required: false,
    includeIfNull: false,
  )


  final double? yAxis;



  @JsonKey(
    
    name: r'z_axis',
    required: false,
    includeIfNull: false,
  )


  final double? zAxis;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ShipMatrixVehicleAgilityAcceleration &&
      other.xAxis == xAxis &&
      other.yAxis == yAxis &&
      other.zAxis == zAxis;

    @override
    int get hashCode =>
        xAxis.hashCode +
        yAxis.hashCode +
        zAxis.hashCode;

  factory ShipMatrixVehicleAgilityAcceleration.fromJson(Map<String, dynamic> json) => _$ShipMatrixVehicleAgilityAccelerationFromJson(json);

  Map<String, dynamic> toJson() => _$ShipMatrixVehicleAgilityAccelerationToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

