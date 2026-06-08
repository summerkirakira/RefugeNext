//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'bomb_explosion.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class BombExplosion {
  /// Returns a new [BombExplosion] instance.
  BombExplosion({

     this.requiresLauncher,

     this.radiusMin,

     this.radiusMax,

     this.safetyDistance,

     this.proximity,
  });

      /// Whether the bomb requires a launcher to deploy.
  @JsonKey(
    
    name: r'requires_launcher',
    required: false,
    includeIfNull: false,
  )


  final bool? requiresLauncher;



      /// Minimum explosion radius in meters. Replacement for explosion_radius_min.
  @JsonKey(
    
    name: r'radius_min',
    required: false,
    includeIfNull: false,
  )


  final double? radiusMin;



      /// Maximum explosion radius in meters. Replacement for explosion_radius_max.
  @JsonKey(
    
    name: r'radius_max',
    required: false,
    includeIfNull: false,
  )


  final double? radiusMax;



      /// Minimum safe distance in meters from the explosion. Replacement for explosion_safety_distance.
  @JsonKey(
    
    name: r'safety_distance',
    required: false,
    includeIfNull: false,
  )


  final double? safetyDistance;



      /// Proximity trigger distance for detonation.
  @JsonKey(
    
    name: r'proximity',
    required: false,
    includeIfNull: false,
  )


  final double? proximity;





    @override
    bool operator ==(Object other) => identical(this, other) || other is BombExplosion &&
      other.requiresLauncher == requiresLauncher &&
      other.radiusMin == radiusMin &&
      other.radiusMax == radiusMax &&
      other.safetyDistance == safetyDistance &&
      other.proximity == proximity;

    @override
    int get hashCode =>
        (requiresLauncher == null ? 0 : requiresLauncher.hashCode) +
        (radiusMin == null ? 0 : radiusMin.hashCode) +
        (radiusMax == null ? 0 : radiusMax.hashCode) +
        (safetyDistance == null ? 0 : safetyDistance.hashCode) +
        (proximity == null ? 0 : proximity.hashCode);

  factory BombExplosion.fromJson(Map<String, dynamic> json) => _$BombExplosionFromJson(json);

  Map<String, dynamic> toJson() => _$BombExplosionToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

