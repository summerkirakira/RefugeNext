//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'ship_matrix_vehicle_manufacturer.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ShipMatrixVehicleManufacturer {
  /// Returns a new [ShipMatrixVehicleManufacturer] instance.
  ShipMatrixVehicleManufacturer({

     this.code,

     this.name,
  });

  @JsonKey(
    
    name: r'code',
    required: false,
    includeIfNull: false,
  )


  final String? code;



  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ShipMatrixVehicleManufacturer &&
      other.code == code &&
      other.name == name;

    @override
    int get hashCode =>
        code.hashCode +
        name.hashCode;

  factory ShipMatrixVehicleManufacturer.fromJson(Map<String, dynamic> json) => _$ShipMatrixVehicleManufacturerFromJson(json);

  Map<String, dynamic> toJson() => _$ShipMatrixVehicleManufacturerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

