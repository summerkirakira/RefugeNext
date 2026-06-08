//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/bomb_delays.dart';
import 'package:starcitizen_wiki_api/src/model/weapon_damage.dart';
import 'package:starcitizen_wiki_api/src/model/bomb_damage_map.dart';
import 'package:starcitizen_wiki_api/src/model/bomb_explosion.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bomb.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Bomb {
  /// Returns a new [Bomb] instance.
  Bomb({

     this.armTime,

     this.igniteTime,

     this.collisionDelayTime,

     this.explosionSafetyDistance,

     this.explosionRadiusMin,

     this.explosionRadiusMax,

     this.maximumDropAngle,

     this.damage,

     this.damageTotal,

     this.damages,

     this.explosion,

     this.delays,

     this.damageMap,
  });

      /// Time in seconds after release before the bomb is armed and can detonate. Scales with bomb size (0.5s for S3, 5.0s for S10).
  @JsonKey(
    
    name: r'arm_time',
    required: false,
    includeIfNull: false,
  )


  final double? armTime;



      /// Time in seconds between arming and detonation.
  @JsonKey(
    
    name: r'ignite_time',
    required: false,
    includeIfNull: false,
  )


  final double? igniteTime;



      /// Delay in seconds before collision detection becomes active after release.
  @JsonKey(
    
    name: r'collision_delay_time',
    required: false,
    includeIfNull: false,
  )


  final double? collisionDelayTime;



      /// Deprecated: Use explosion.safety_distance instead. Minimum safe distance in meters from the explosion. Typically 50m for all bomb sizes.
  @Deprecated('explosionSafetyDistance has been deprecated')
  @JsonKey(
    
    name: r'explosion_safety_distance',
    required: false,
    includeIfNull: false,
  )


  final double? explosionSafetyDistance;



      /// Deprecated: Use explosion.radius_min instead. Minimum explosion radius in meters. Scales with bomb size (40m for S3, 100m for S5, 250m for S10).
  @Deprecated('explosionRadiusMin has been deprecated')
  @JsonKey(
    
    name: r'explosion_radius_min',
    required: false,
    includeIfNull: false,
  )


  final double? explosionRadiusMin;



      /// Deprecated: Use explosion.radius_max instead. Maximum explosion radius in meters. Typically equal to minimum radius for uniform blast.
  @Deprecated('explosionRadiusMax has been deprecated')
  @JsonKey(
    
    name: r'explosion_radius_max',
    required: false,
    includeIfNull: false,
  )


  final double? explosionRadiusMax;



      /// Maximum angle in degrees from level flight at which the bomb can be deployed. Typically 90 degrees.
  @JsonKey(
    
    name: r'maximum_drop_angle',
    required: false,
    includeIfNull: false,
  )


  final double? maximumDropAngle;



      /// Deprecated: use damage_total.
  @Deprecated('damage has been deprecated')
  @JsonKey(
    
    name: r'damage',
    required: false,
    includeIfNull: false,
  )


  final double? damage;



      /// Total combined damage from all damage types. Scales dramatically with bomb size (27,000 for S3, 568,297 for S10).
  @JsonKey(
    
    name: r'damage_total',
    required: false,
    includeIfNull: false,
  )


  final double? damageTotal;



      /// Deprecated: use damage_map.
  @Deprecated('damages has been deprecated')
  @JsonKey(
    
    name: r'damages',
    required: false,
    includeIfNull: false,
  )


  final List<WeaponDamage>? damages;



  @JsonKey(
    
    name: r'explosion',
    required: false,
    includeIfNull: false,
  )


  final BombExplosion? explosion;



  @JsonKey(
    
    name: r'delays',
    required: false,
    includeIfNull: false,
  )


  final BombDelays? delays;



  @JsonKey(
    
    name: r'damage_map',
    required: false,
    includeIfNull: false,
  )


  final BombDamageMap? damageMap;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Bomb &&
      other.armTime == armTime &&
      other.igniteTime == igniteTime &&
      other.collisionDelayTime == collisionDelayTime &&
      other.explosionSafetyDistance == explosionSafetyDistance &&
      other.explosionRadiusMin == explosionRadiusMin &&
      other.explosionRadiusMax == explosionRadiusMax &&
      other.maximumDropAngle == maximumDropAngle &&
      other.damage == damage &&
      other.damageTotal == damageTotal &&
      other.damages == damages &&
      other.explosion == explosion &&
      other.delays == delays &&
      other.damageMap == damageMap;

    @override
    int get hashCode =>
        (armTime == null ? 0 : armTime.hashCode) +
        (igniteTime == null ? 0 : igniteTime.hashCode) +
        (collisionDelayTime == null ? 0 : collisionDelayTime.hashCode) +
        (explosionSafetyDistance == null ? 0 : explosionSafetyDistance.hashCode) +
        (explosionRadiusMin == null ? 0 : explosionRadiusMin.hashCode) +
        (explosionRadiusMax == null ? 0 : explosionRadiusMax.hashCode) +
        (maximumDropAngle == null ? 0 : maximumDropAngle.hashCode) +
        (damage == null ? 0 : damage.hashCode) +
        (damageTotal == null ? 0 : damageTotal.hashCode) +
        (damages == null ? 0 : damages.hashCode) +
        (explosion == null ? 0 : explosion.hashCode) +
        (delays == null ? 0 : delays.hashCode) +
        (damageMap == null ? 0 : damageMap.hashCode);

  factory Bomb.fromJson(Map<String, dynamic> json) => _$BombFromJson(json);

  Map<String, dynamic> toJson() => _$BombToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

