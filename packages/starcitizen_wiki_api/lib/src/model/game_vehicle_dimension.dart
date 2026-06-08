//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'game_vehicle_dimension.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GameVehicleDimension {
  /// Returns a new [GameVehicleDimension] instance.
  GameVehicleDimension({

     this.length,

     this.width,

     this.height,
  });

      /// Length in meters.
  @JsonKey(
    
    name: r'length',
    required: false,
    includeIfNull: false,
  )


  final num? length;



      /// Width (beam) in meters.
  @JsonKey(
    
    name: r'width',
    required: false,
    includeIfNull: false,
  )


  final num? width;



      /// Height in meters.
  @JsonKey(
    
    name: r'height',
    required: false,
    includeIfNull: false,
  )


  final num? height;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GameVehicleDimension &&
      other.length == length &&
      other.width == width &&
      other.height == height;

    @override
    int get hashCode =>
        length.hashCode +
        width.hashCode +
        height.hashCode;

  factory GameVehicleDimension.fromJson(Map<String, dynamic> json) => _$GameVehicleDimensionFromJson(json);

  Map<String, dynamic> toJson() => _$GameVehicleDimensionToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

