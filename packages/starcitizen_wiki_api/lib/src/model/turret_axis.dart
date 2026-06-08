//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'turret_axis.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TurretAxis {
  /// Returns a new [TurretAxis] instance.
  TurretAxis({

     this.slavedOnly,

     this.speed,

     this.timeToFullSpeed,

     this.accelerationDecay,

     this.angleLimitMin,

     this.angleLimitMax,
  });

      /// Whether the axis is slaved-only.
  @JsonKey(
    
    name: r'slaved_only',
    required: false,
    includeIfNull: false,
  )


  final bool? slavedOnly;



      /// Axis rotation speed.
  @JsonKey(
    
    name: r'speed',
    required: false,
    includeIfNull: false,
  )


  final double? speed;



      /// Seconds to reach full rotation speed.
  @JsonKey(
    
    name: r'time_to_full_speed',
    required: false,
    includeIfNull: false,
  )


  final double? timeToFullSpeed;



      /// Acceleration decay value.
  @JsonKey(
    
    name: r'acceleration_decay',
    required: false,
    includeIfNull: false,
  )


  final double? accelerationDecay;



      /// Minimum target angle when RestrictTargetAngles is enabled.
  @JsonKey(
    
    name: r'angle_limit_min',
    required: false,
    includeIfNull: false,
  )


  final double? angleLimitMin;



      /// Maximum target angle when RestrictTargetAngles is enabled.
  @JsonKey(
    
    name: r'angle_limit_max',
    required: false,
    includeIfNull: false,
  )


  final double? angleLimitMax;





    @override
    bool operator ==(Object other) => identical(this, other) || other is TurretAxis &&
      other.slavedOnly == slavedOnly &&
      other.speed == speed &&
      other.timeToFullSpeed == timeToFullSpeed &&
      other.accelerationDecay == accelerationDecay &&
      other.angleLimitMin == angleLimitMin &&
      other.angleLimitMax == angleLimitMax;

    @override
    int get hashCode =>
        (slavedOnly == null ? 0 : slavedOnly.hashCode) +
        (speed == null ? 0 : speed.hashCode) +
        (timeToFullSpeed == null ? 0 : timeToFullSpeed.hashCode) +
        (accelerationDecay == null ? 0 : accelerationDecay.hashCode) +
        (angleLimitMin == null ? 0 : angleLimitMin.hashCode) +
        (angleLimitMax == null ? 0 : angleLimitMax.hashCode);

  factory TurretAxis.fromJson(Map<String, dynamic> json) => _$TurretAxisFromJson(json);

  Map<String, dynamic> toJson() => _$TurretAxisToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

