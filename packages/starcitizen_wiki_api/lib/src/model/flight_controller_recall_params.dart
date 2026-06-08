//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'flight_controller_recall_params.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class FlightControllerRecallParams {
  /// Returns a new [FlightControllerRecallParams] instance.
  FlightControllerRecallParams({

     this.hoverHeightAtDestination,

     this.forwardOffset,

     this.obstructionDetectionRange,

     this.defaultPlatformDetectionRange,

     this.minimumRecallDistance,

     this.brakingDistanceOffset,
  });

      /// Target hover height in meters when arriving at the recall destination.
  @JsonKey(
    
    name: r'hover_height_at_destination',
    required: false,
    includeIfNull: false,
  )


  final double? hoverHeightAtDestination;



      /// Forward offset in meters from the destination point where the ship stages before final landing.
  @JsonKey(
    
    name: r'forward_offset',
    required: false,
    includeIfNull: false,
  )


  final double? forwardOffset;



      /// Range in meters to scan for obstacles while recalling.
  @JsonKey(
    
    name: r'obstruction_detection_range',
    required: false,
    includeIfNull: false,
  )


  final double? obstructionDetectionRange;



      /// Detection radius in meters to locate a viable landing platform.
  @JsonKey(
    
    name: r'default_platform_detection_range',
    required: false,
    includeIfNull: false,
  )


  final double? defaultPlatformDetectionRange;



      /// Minimum distance in meters from the player before recall engages.
  @JsonKey(
    
    name: r'minimum_recall_distance',
    required: false,
    includeIfNull: false,
  )


  final double? minimumRecallDistance;



      /// Extra buffer distance in meters used to start braking during recall approach.
  @JsonKey(
    
    name: r'braking_distance_offset',
    required: false,
    includeIfNull: false,
  )


  final double? brakingDistanceOffset;





    @override
    bool operator ==(Object other) => identical(this, other) || other is FlightControllerRecallParams &&
      other.hoverHeightAtDestination == hoverHeightAtDestination &&
      other.forwardOffset == forwardOffset &&
      other.obstructionDetectionRange == obstructionDetectionRange &&
      other.defaultPlatformDetectionRange == defaultPlatformDetectionRange &&
      other.minimumRecallDistance == minimumRecallDistance &&
      other.brakingDistanceOffset == brakingDistanceOffset;

    @override
    int get hashCode =>
        (hoverHeightAtDestination == null ? 0 : hoverHeightAtDestination.hashCode) +
        (forwardOffset == null ? 0 : forwardOffset.hashCode) +
        (obstructionDetectionRange == null ? 0 : obstructionDetectionRange.hashCode) +
        (defaultPlatformDetectionRange == null ? 0 : defaultPlatformDetectionRange.hashCode) +
        (minimumRecallDistance == null ? 0 : minimumRecallDistance.hashCode) +
        (brakingDistanceOffset == null ? 0 : brakingDistanceOffset.hashCode);

  factory FlightControllerRecallParams.fromJson(Map<String, dynamic> json) => _$FlightControllerRecallParamsFromJson(json);

  Map<String, dynamic> toJson() => _$FlightControllerRecallParamsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

