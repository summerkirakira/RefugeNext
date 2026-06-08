//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'ship_matrix_vehicle_speed.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ShipMatrixVehicleSpeed {
  /// Returns a new [ShipMatrixVehicleSpeed] instance.
  ShipMatrixVehicleSpeed({

     this.scm,

     this.max,
  });

  @JsonKey(
    
    name: r'scm',
    required: false,
    includeIfNull: false,
  )


  final double? scm;



  @JsonKey(
    
    name: r'max',
    required: false,
    includeIfNull: false,
  )


  final double? max;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ShipMatrixVehicleSpeed &&
      other.scm == scm &&
      other.max == max;

    @override
    int get hashCode =>
        (scm == null ? 0 : scm.hashCode) +
        (max == null ? 0 : max.hashCode);

  factory ShipMatrixVehicleSpeed.fromJson(Map<String, dynamic> json) => _$ShipMatrixVehicleSpeedFromJson(json);

  Map<String, dynamic> toJson() => _$ShipMatrixVehicleSpeedToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

