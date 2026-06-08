//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'flight_controller_precision_mode.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class FlightControllerPrecisionMode {
  /// Returns a new [FlightControllerPrecisionMode] instance.
  FlightControllerPrecisionMode({

     this.maxSpeedFullProximityAssist,

     this.maxSpeedZeroProximityAssist,

     this.minDistance,

     this.maxDistance,
  });

      /// Precision mode max speed (m/s) with full proximity assist enabled.
  @JsonKey(
    
    name: r'max_speed_full_proximity_assist',
    required: false,
    includeIfNull: false,
  )


  final double? maxSpeedFullProximityAssist;



      /// Precision mode max speed (m/s) when proximity assist is disabled.
  @JsonKey(
    
    name: r'max_speed_zero_proximity_assist',
    required: false,
    includeIfNull: false,
  )


  final double? maxSpeedZeroProximityAssist;



      /// Minimum distance in meters where precision landing assist calculations begin.
  @JsonKey(
    
    name: r'min_distance',
    required: false,
    includeIfNull: false,
  )


  final double? minDistance;



      /// Maximum distance in meters where precision landing assist calculations apply.
  @JsonKey(
    
    name: r'max_distance',
    required: false,
    includeIfNull: false,
  )


  final double? maxDistance;





    @override
    bool operator ==(Object other) => identical(this, other) || other is FlightControllerPrecisionMode &&
      other.maxSpeedFullProximityAssist == maxSpeedFullProximityAssist &&
      other.maxSpeedZeroProximityAssist == maxSpeedZeroProximityAssist &&
      other.minDistance == minDistance &&
      other.maxDistance == maxDistance;

    @override
    int get hashCode =>
        (maxSpeedFullProximityAssist == null ? 0 : maxSpeedFullProximityAssist.hashCode) +
        (maxSpeedZeroProximityAssist == null ? 0 : maxSpeedZeroProximityAssist.hashCode) +
        (minDistance == null ? 0 : minDistance.hashCode) +
        (maxDistance == null ? 0 : maxDistance.hashCode);

  factory FlightControllerPrecisionMode.fromJson(Map<String, dynamic> json) => _$FlightControllerPrecisionModeFromJson(json);

  Map<String, dynamic> toJson() => _$FlightControllerPrecisionModeToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

