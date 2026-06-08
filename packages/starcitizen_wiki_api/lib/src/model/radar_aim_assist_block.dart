//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'radar_aim_assist_block.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class RadarAimAssistBlock {
  /// Returns a new [RadarAimAssistBlock] instance.
  RadarAimAssistBlock({

     this.distanceMinAssignment,

     this.distanceMaxAssignment,

     this.outsideRangeBufferDistance,
  });

      /// Minimum distance for aim assist target assignment in meters.
  @JsonKey(
    
    name: r'distance_min_assignment',
    required: false,
    includeIfNull: false,
  )


  final double? distanceMinAssignment;



      /// Maximum distance for aim assist target assignment in meters.
  @JsonKey(
    
    name: r'distance_max_assignment',
    required: false,
    includeIfNull: false,
  )


  final double? distanceMaxAssignment;



      /// Buffer distance beyond max range in meters.
  @JsonKey(
    
    name: r'outside_range_buffer_distance',
    required: false,
    includeIfNull: false,
  )


  final double? outsideRangeBufferDistance;





    @override
    bool operator ==(Object other) => identical(this, other) || other is RadarAimAssistBlock &&
      other.distanceMinAssignment == distanceMinAssignment &&
      other.distanceMaxAssignment == distanceMaxAssignment &&
      other.outsideRangeBufferDistance == outsideRangeBufferDistance;

    @override
    int get hashCode =>
        (distanceMinAssignment == null ? 0 : distanceMinAssignment.hashCode) +
        (distanceMaxAssignment == null ? 0 : distanceMaxAssignment.hashCode) +
        (outsideRangeBufferDistance == null ? 0 : outsideRangeBufferDistance.hashCode);

  factory RadarAimAssistBlock.fromJson(Map<String, dynamic> json) => _$RadarAimAssistBlockFromJson(json);

  Map<String, dynamic> toJson() => _$RadarAimAssistBlockToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

