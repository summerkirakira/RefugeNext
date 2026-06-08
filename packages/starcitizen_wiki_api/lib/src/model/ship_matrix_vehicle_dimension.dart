//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'ship_matrix_vehicle_dimension.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ShipMatrixVehicleDimension {
  /// Returns a new [ShipMatrixVehicleDimension] instance.
  ShipMatrixVehicleDimension({

     this.length,

     this.width,

     this.height,
  });

  @JsonKey(
    
    name: r'length',
    required: false,
    includeIfNull: false,
  )


  final double? length;



  @JsonKey(
    
    name: r'width',
    required: false,
    includeIfNull: false,
  )


  final double? width;



  @JsonKey(
    
    name: r'height',
    required: false,
    includeIfNull: false,
  )


  final double? height;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ShipMatrixVehicleDimension &&
      other.length == length &&
      other.width == width &&
      other.height == height;

    @override
    int get hashCode =>
        length.hashCode +
        width.hashCode +
        height.hashCode;

  factory ShipMatrixVehicleDimension.fromJson(Map<String, dynamic> json) => _$ShipMatrixVehicleDimensionFromJson(json);

  Map<String, dynamic> toJson() => _$ShipMatrixVehicleDimensionToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

