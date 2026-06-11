//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'game_vehicle_power.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GameVehiclePower {
  /// Returns a new [GameVehiclePower] instance.
  GameVehiclePower({

     this.generationSegments,

     this.usedSegmentsShields,

     this.usedSegmentsQuantum,

     this.usedSegmentsGrouped,
  });

      /// Total power generation segments available.
  @JsonKey(
    
    name: r'generation_segments',
    required: false,
    includeIfNull: false,
  )


  final num? generationSegments;



      /// Power segments consumed by shields.
  @JsonKey(
    
    name: r'used_segments_shields',
    required: false,
    includeIfNull: false,
  )


  final num? usedSegmentsShields;



      /// Power segments consumed by quantum drive.
  @JsonKey(
    
    name: r'used_segments_quantum',
    required: false,
    includeIfNull: false,
  )


  final num? usedSegmentsQuantum;



      /// Grouped power segments consumed.
  @JsonKey(
    
    name: r'used_segments_grouped',
    required: false,
    includeIfNull: false,
  )


  final Map<String, num>? usedSegmentsGrouped;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GameVehiclePower &&
      other.generationSegments == generationSegments &&
      other.usedSegmentsShields == usedSegmentsShields &&
      other.usedSegmentsQuantum == usedSegmentsQuantum &&
      other.usedSegmentsGrouped == usedSegmentsGrouped;

    @override
    int get hashCode =>
        (generationSegments == null ? 0 : generationSegments.hashCode) +
        (usedSegmentsShields == null ? 0 : usedSegmentsShields.hashCode) +
        (usedSegmentsQuantum == null ? 0 : usedSegmentsQuantum.hashCode) +
        (usedSegmentsGrouped == null ? 0 : usedSegmentsGrouped.hashCode);

  factory GameVehiclePower.fromJson(Map<String, dynamic> json) => _$GameVehiclePowerFromJson(json);

  Map<String, dynamic> toJson() => _$GameVehiclePowerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

