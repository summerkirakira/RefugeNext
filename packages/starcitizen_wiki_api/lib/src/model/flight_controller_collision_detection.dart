//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'flight_controller_collision_detection.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class FlightControllerCollisionDetection {
  /// Returns a new [FlightControllerCollisionDetection] instance.
  FlightControllerCollisionDetection({

     this.collisionWarnSpeed,

     this.collisionWarnTime,

     this.collisionDangerCloseWarnTime,
  });

      /// Relative speed in m/s that triggers a collision warning.
  @JsonKey(
    
    name: r'collision_warn_speed',
    required: false,
    includeIfNull: false,
  )


  final double? collisionWarnSpeed;



      /// Seconds until projected impact when general collision warning fires.
  @JsonKey(
    
    name: r'collision_warn_time',
    required: false,
    includeIfNull: false,
  )


  final double? collisionWarnTime;



      /// Seconds until impact for the urgent/danger-close warning stage.
  @JsonKey(
    
    name: r'collision_danger_close_warn_time',
    required: false,
    includeIfNull: false,
  )


  final double? collisionDangerCloseWarnTime;





    @override
    bool operator ==(Object other) => identical(this, other) || other is FlightControllerCollisionDetection &&
      other.collisionWarnSpeed == collisionWarnSpeed &&
      other.collisionWarnTime == collisionWarnTime &&
      other.collisionDangerCloseWarnTime == collisionDangerCloseWarnTime;

    @override
    int get hashCode =>
        (collisionWarnSpeed == null ? 0 : collisionWarnSpeed.hashCode) +
        (collisionWarnTime == null ? 0 : collisionWarnTime.hashCode) +
        (collisionDangerCloseWarnTime == null ? 0 : collisionDangerCloseWarnTime.hashCode);

  factory FlightControllerCollisionDetection.fromJson(Map<String, dynamic> json) => _$FlightControllerCollisionDetectionFromJson(json);

  Map<String, dynamic> toJson() => _$FlightControllerCollisionDetectionToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

