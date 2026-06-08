//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'game_vehicle_cross_section.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GameVehicleCrossSection {
  /// Returns a new [GameVehicleCrossSection] instance.
  GameVehicleCrossSection({

     this.length,

     this.width,

     this.height,
  });

      /// Cross-section length (X axis).
  @JsonKey(
    
    name: r'length',
    required: false,
    includeIfNull: false,
  )


  final num? length;



      /// Cross-section width (Y axis).
  @JsonKey(
    
    name: r'width',
    required: false,
    includeIfNull: false,
  )


  final num? width;



      /// Cross-section height (Z axis).
  @JsonKey(
    
    name: r'height',
    required: false,
    includeIfNull: false,
  )


  final num? height;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GameVehicleCrossSection &&
      other.length == length &&
      other.width == width &&
      other.height == height;

    @override
    int get hashCode =>
        (length == null ? 0 : length.hashCode) +
        (width == null ? 0 : width.hashCode) +
        (height == null ? 0 : height.hashCode);

  factory GameVehicleCrossSection.fromJson(Map<String, dynamic> json) => _$GameVehicleCrossSectionFromJson(json);

  Map<String, dynamic> toJson() => _$GameVehicleCrossSectionToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

