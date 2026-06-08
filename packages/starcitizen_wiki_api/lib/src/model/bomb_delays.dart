//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'bomb_delays.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class BombDelays {
  /// Returns a new [BombDelays] instance.
  BombDelays({

     this.armTime,

     this.igniteTime,

     this.collisionDelayTime,
  });

      /// Time in seconds after release before the bomb is armed. Same as top-level arm_time.
  @JsonKey(
    
    name: r'arm_time',
    required: false,
    includeIfNull: false,
  )


  final double? armTime;



      /// Time in seconds between arming and detonation. Same as top-level ignite_time.
  @JsonKey(
    
    name: r'ignite_time',
    required: false,
    includeIfNull: false,
  )


  final double? igniteTime;



      /// Delay before collision detection becomes active. Same as top-level collision_delay_time.
  @JsonKey(
    
    name: r'collision_delay_time',
    required: false,
    includeIfNull: false,
  )


  final double? collisionDelayTime;





    @override
    bool operator ==(Object other) => identical(this, other) || other is BombDelays &&
      other.armTime == armTime &&
      other.igniteTime == igniteTime &&
      other.collisionDelayTime == collisionDelayTime;

    @override
    int get hashCode =>
        (armTime == null ? 0 : armTime.hashCode) +
        (igniteTime == null ? 0 : igniteTime.hashCode) +
        (collisionDelayTime == null ? 0 : collisionDelayTime.hashCode);

  factory BombDelays.fromJson(Map<String, dynamic> json) => _$BombDelaysFromJson(json);

  Map<String, dynamic> toJson() => _$BombDelaysToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

