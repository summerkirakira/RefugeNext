//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'mission_lifetime.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MissionLifetime {
  /// Returns a new [MissionLifetime] instance.
  MissionLifetime({

     this.label,

     this.respawnTimeSeconds,

     this.maxInstances,

     this.respawnTimeVariationSeconds,

     this.maxInstancesPerPlayer,
  });

  @JsonKey(
    
    name: r'label',
    required: false,
    includeIfNull: false,
  )


  final String? label;



  @JsonKey(
    
    name: r'respawn_time_seconds',
    required: false,
    includeIfNull: false,
  )


  final int? respawnTimeSeconds;



  @JsonKey(
    
    name: r'max_instances',
    required: false,
    includeIfNull: false,
  )


  final int? maxInstances;



  @JsonKey(
    
    name: r'respawn_time_variation_seconds',
    required: false,
    includeIfNull: false,
  )


  final int? respawnTimeVariationSeconds;



  @JsonKey(
    
    name: r'max_instances_per_player',
    required: false,
    includeIfNull: false,
  )


  final int? maxInstancesPerPlayer;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MissionLifetime &&
      other.label == label &&
      other.respawnTimeSeconds == respawnTimeSeconds &&
      other.maxInstances == maxInstances &&
      other.respawnTimeVariationSeconds == respawnTimeVariationSeconds &&
      other.maxInstancesPerPlayer == maxInstancesPerPlayer;

    @override
    int get hashCode =>
        (label == null ? 0 : label.hashCode) +
        respawnTimeSeconds.hashCode +
        maxInstances.hashCode +
        respawnTimeVariationSeconds.hashCode +
        maxInstancesPerPlayer.hashCode;

  factory MissionLifetime.fromJson(Map<String, dynamic> json) => _$MissionLifetimeFromJson(json);

  Map<String, dynamic> toJson() => _$MissionLifetimeToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

