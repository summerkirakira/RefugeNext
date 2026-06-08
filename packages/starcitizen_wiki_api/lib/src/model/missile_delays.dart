//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'missile_delays.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MissileDelays {
  /// Returns a new [MissileDelays] instance.
  MissileDelays({

     this.armTime,

     this.igniteTime,

     this.collisionDelayTime,

     this.lockTime,
  });

      /// Time in seconds after launch before warhead arms.
  @JsonKey(
    
    name: r'arm_time',
    required: false,
    includeIfNull: false,
  )


  final double? armTime;



      /// Delay in seconds between launch and engine ignition.
  @JsonKey(
    
    name: r'ignite_time',
    required: false,
    includeIfNull: false,
  )


  final double? igniteTime;



      /// Delay in seconds before collision detection is active after launch.
  @JsonKey(
    
    name: r'collision_delay_time',
    required: false,
    includeIfNull: false,
  )


  final double? collisionDelayTime;



      /// Time in seconds required to establish a target lock.
  @JsonKey(
    
    name: r'lock_time',
    required: false,
    includeIfNull: false,
  )


  final double? lockTime;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MissileDelays &&
      other.armTime == armTime &&
      other.igniteTime == igniteTime &&
      other.collisionDelayTime == collisionDelayTime &&
      other.lockTime == lockTime;

    @override
    int get hashCode =>
        (armTime == null ? 0 : armTime.hashCode) +
        (igniteTime == null ? 0 : igniteTime.hashCode) +
        (collisionDelayTime == null ? 0 : collisionDelayTime.hashCode) +
        (lockTime == null ? 0 : lockTime.hashCode);

  factory MissileDelays.fromJson(Map<String, dynamic> json) => _$MissileDelaysFromJson(json);

  Map<String, dynamic> toJson() => _$MissileDelaysToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

