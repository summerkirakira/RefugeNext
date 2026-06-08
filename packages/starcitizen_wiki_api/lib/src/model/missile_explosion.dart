//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'missile_explosion.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MissileExplosion {
  /// Returns a new [MissileExplosion] instance.
  MissileExplosion({

     this.isCluster,

     this.clusterSize,

     this.requiresLauncher,

     this.allowDumbFiring,

     this.radiusMin,

     this.radiusMax,

     this.safetyDistance,

     this.proximity,
  });

      /// Whether this missile splits into multiple submunitions during flight.
  @JsonKey(
    
    name: r'is_cluster',
    required: false,
    includeIfNull: false,
  )


  final bool? isCluster;



      /// Number of submunitions released when the missile splits (when applicable).
  @JsonKey(
    
    name: r'cluster_size',
    required: false,
    includeIfNull: false,
  )


  final num? clusterSize;



      /// Whether the missile must be fired from a dedicated launcher/rack.
  @JsonKey(
    
    name: r'requires_launcher',
    required: false,
    includeIfNull: false,
  )


  final bool? requiresLauncher;



      /// Whether the missile can be fired without a lock.
  @JsonKey(
    
    name: r'allow_dumb_firing',
    required: false,
    includeIfNull: false,
  )


  final bool? allowDumbFiring;



      /// Minimum explosion damage radius in meters.
  @JsonKey(
    
    name: r'radius_min',
    required: false,
    includeIfNull: false,
  )


  final double? radiusMin;



      /// Maximum explosion damage radius in meters.
  @JsonKey(
    
    name: r'radius_max',
    required: false,
    includeIfNull: false,
  )


  final double? radiusMax;



      /// Minimum safe distance in meters from the explosion center.
  @JsonKey(
    
    name: r'safety_distance',
    required: false,
    includeIfNull: false,
  )


  final double? safetyDistance;



      /// Proximity fuse / projectile proximity value (as provided by source data).
  @JsonKey(
    
    name: r'proximity',
    required: false,
    includeIfNull: false,
  )


  final double? proximity;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MissileExplosion &&
      other.isCluster == isCluster &&
      other.clusterSize == clusterSize &&
      other.requiresLauncher == requiresLauncher &&
      other.allowDumbFiring == allowDumbFiring &&
      other.radiusMin == radiusMin &&
      other.radiusMax == radiusMax &&
      other.safetyDistance == safetyDistance &&
      other.proximity == proximity;

    @override
    int get hashCode =>
        (isCluster == null ? 0 : isCluster.hashCode) +
        (clusterSize == null ? 0 : clusterSize.hashCode) +
        (requiresLauncher == null ? 0 : requiresLauncher.hashCode) +
        (allowDumbFiring == null ? 0 : allowDumbFiring.hashCode) +
        (radiusMin == null ? 0 : radiusMin.hashCode) +
        (radiusMax == null ? 0 : radiusMax.hashCode) +
        (safetyDistance == null ? 0 : safetyDistance.hashCode) +
        (proximity == null ? 0 : proximity.hashCode);

  factory MissileExplosion.fromJson(Map<String, dynamic> json) => _$MissileExplosionFromJson(json);

  Map<String, dynamic> toJson() => _$MissileExplosionToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

