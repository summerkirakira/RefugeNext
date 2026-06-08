//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'cargo_grid.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CargoGrid {
  /// Returns a new [CargoGrid] instance.
  CargoGrid({

     this.scu,

     this.x,

     this.y,

     this.z,
  });

      /// Cargo capacity in Standard Cargo Units.
  @JsonKey(
    
    name: r'scu',
    required: false,
    includeIfNull: false,
  )


  final double? scu;



      /// Interior width in meters.
  @JsonKey(
    
    name: r'x',
    required: false,
    includeIfNull: false,
  )


  final double? x;



      /// Interior depth in meters.
  @JsonKey(
    
    name: r'y',
    required: false,
    includeIfNull: false,
  )


  final double? y;



      /// Interior height in meters.
  @JsonKey(
    
    name: r'z',
    required: false,
    includeIfNull: false,
  )


  final double? z;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CargoGrid &&
      other.scu == scu &&
      other.x == x &&
      other.y == y &&
      other.z == z;

    @override
    int get hashCode =>
        (scu == null ? 0 : scu.hashCode) +
        (x == null ? 0 : x.hashCode) +
        (y == null ? 0 : y.hashCode) +
        (z == null ? 0 : z.hashCode);

  factory CargoGrid.fromJson(Map<String, dynamic> json) => _$CargoGridFromJson(json);

  Map<String, dynamic> toJson() => _$CargoGridToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

