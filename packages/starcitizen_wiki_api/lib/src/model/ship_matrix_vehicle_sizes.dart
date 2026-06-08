//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'ship_matrix_vehicle_sizes.g.dart';


@Deprecated('ShipMatrixVehicleSizes has been deprecated')
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ShipMatrixVehicleSizes {
  /// Returns a new [ShipMatrixVehicleSizes] instance.
  ShipMatrixVehicleSizes({

     this.length,

     this.beam,

     this.height,
  });

  @JsonKey(
    
    name: r'length',
    required: false,
    includeIfNull: false,
  )


  final double? length;



  @JsonKey(
    
    name: r'beam',
    required: false,
    includeIfNull: false,
  )


  final double? beam;



  @JsonKey(
    
    name: r'height',
    required: false,
    includeIfNull: false,
  )


  final double? height;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ShipMatrixVehicleSizes &&
      other.length == length &&
      other.beam == beam &&
      other.height == height;

    @override
    int get hashCode =>
        length.hashCode +
        beam.hashCode +
        height.hashCode;

  factory ShipMatrixVehicleSizes.fromJson(Map<String, dynamic> json) => _$ShipMatrixVehicleSizesFromJson(json);

  Map<String, dynamic> toJson() => _$ShipMatrixVehicleSizesToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

