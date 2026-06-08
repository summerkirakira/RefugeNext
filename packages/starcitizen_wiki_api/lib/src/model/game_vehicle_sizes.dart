//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'game_vehicle_sizes.g.dart';


@Deprecated('GameVehicleSizes has been deprecated')
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GameVehicleSizes {
  /// Returns a new [GameVehicleSizes] instance.
  GameVehicleSizes({

     this.length,

     this.beam,

     this.height,
  });

  @JsonKey(
    
    name: r'length',
    required: false,
    includeIfNull: false,
  )


  final num? length;



  @JsonKey(
    
    name: r'beam',
    required: false,
    includeIfNull: false,
  )


  final num? beam;



  @JsonKey(
    
    name: r'height',
    required: false,
    includeIfNull: false,
  )


  final num? height;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GameVehicleSizes &&
      other.length == length &&
      other.beam == beam &&
      other.height == height;

    @override
    int get hashCode =>
        length.hashCode +
        beam.hashCode +
        height.hashCode;

  factory GameVehicleSizes.fromJson(Map<String, dynamic> json) => _$GameVehicleSizesFromJson(json);

  Map<String, dynamic> toJson() => _$GameVehicleSizesToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

