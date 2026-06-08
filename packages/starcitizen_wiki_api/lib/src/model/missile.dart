//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/missile_explosion.dart';
import 'package:starcitizen_wiki_api/src/model/weapon_damage.dart';
import 'package:starcitizen_wiki_api/src/model/missile_delays.dart';
import 'package:starcitizen_wiki_api/src/model/missile_flight.dart';
import 'package:starcitizen_wiki_api/src/model/missile_target_lock.dart';
import 'package:json_annotation/json_annotation.dart';

part 'missile.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Missile {
  /// Returns a new [Missile] instance.
  Missile({

     this.clusterSize,

     this.signalType,

     this.trackingSignalMin,

     this.lockTime,

     this.lockRangeMax,

     this.lockRangeMin,

     this.lockAngle,

     this.speed,

     this.fuelTankSize,

     this.explosionRadiusMin,

     this.explosionRadiusMax,

     this.flight,

     this.targetLock,

     this.explosion,

     this.delays,

     this.damageTotal,

     this.damages,

     this.damageMap,
  });

      /// Deprecated. Use `explosion.cluster_size`.
  @Deprecated('clusterSize has been deprecated')
  @JsonKey(
    
    name: r'cluster_size',
    required: false,
    includeIfNull: false,
  )


  final num? clusterSize;



      /// Type of tracking signal used for target acquisition.
  @JsonKey(
    
    name: r'signal_type',
    required: false,
    includeIfNull: false,
  )


  final String? signalType;



      /// Minimum target signal strength required for tracking.
  @JsonKey(
    
    name: r'tracking_signal_min',
    required: false,
    includeIfNull: false,
  )


  final double? trackingSignalMin;



      /// Deprecated. Use `delays.lock_time`.
  @Deprecated('lockTime has been deprecated')
  @JsonKey(
    
    name: r'lock_time',
    required: false,
    includeIfNull: false,
  )


  final double? lockTime;



      /// Deprecated. Use `target_lock.range_max`.
  @Deprecated('lockRangeMax has been deprecated')
  @JsonKey(
    
    name: r'lock_range_max',
    required: false,
    includeIfNull: false,
  )


  final double? lockRangeMax;



      /// Deprecated. Use `target_lock.range_min`.
  @Deprecated('lockRangeMin has been deprecated')
  @JsonKey(
    
    name: r'lock_range_min',
    required: false,
    includeIfNull: false,
  )


  final double? lockRangeMin;



      /// Deprecated. Use `target_lock.angle`.
  @Deprecated('lockAngle has been deprecated')
  @JsonKey(
    
    name: r'lock_angle',
    required: false,
    includeIfNull: false,
  )


  final double? lockAngle;



      /// Deprecated. Use `flight.speed`.
  @Deprecated('speed has been deprecated')
  @JsonKey(
    
    name: r'speed',
    required: false,
    includeIfNull: false,
  )


  final double? speed;



      /// Deprecated. Use `flight.fuel_tank_size`.
  @Deprecated('fuelTankSize has been deprecated')
  @JsonKey(
    
    name: r'fuel_tank_size',
    required: false,
    includeIfNull: false,
  )


  final double? fuelTankSize;



      /// Deprecated. Use `explosion.radius_min`.
  @Deprecated('explosionRadiusMin has been deprecated')
  @JsonKey(
    
    name: r'explosion_radius_min',
    required: false,
    includeIfNull: false,
  )


  final double? explosionRadiusMin;



      /// Deprecated. Use `explosion.radius_max`.
  @Deprecated('explosionRadiusMax has been deprecated')
  @JsonKey(
    
    name: r'explosion_radius_max',
    required: false,
    includeIfNull: false,
  )


  final double? explosionRadiusMax;



  @JsonKey(
    
    name: r'flight',
    required: false,
    includeIfNull: false,
  )


  final MissileFlight? flight;



  @JsonKey(
    
    name: r'target_lock',
    required: false,
    includeIfNull: false,
  )


  final MissileTargetLock? targetLock;



  @JsonKey(
    
    name: r'explosion',
    required: false,
    includeIfNull: false,
  )


  final MissileExplosion? explosion;



  @JsonKey(
    
    name: r'delays',
    required: false,
    includeIfNull: false,
  )


  final MissileDelays? delays;



      /// Total combined damage from all damage types.
  @JsonKey(
    
    name: r'damage_total',
    required: false,
    includeIfNull: false,
  )


  final double? damageTotal;



      /// Deprecated. Use `damage_map`.
  @Deprecated('damages has been deprecated')
  @JsonKey(
    
    name: r'damages',
    required: false,
    includeIfNull: false,
  )


  final List<WeaponDamage>? damages;



      /// Map of damage types to values (preferred representation).
  @JsonKey(
    
    name: r'damage_map',
    required: false,
    includeIfNull: false,
  )


  final Map<String, num>? damageMap;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Missile &&
      other.clusterSize == clusterSize &&
      other.signalType == signalType &&
      other.trackingSignalMin == trackingSignalMin &&
      other.lockTime == lockTime &&
      other.lockRangeMax == lockRangeMax &&
      other.lockRangeMin == lockRangeMin &&
      other.lockAngle == lockAngle &&
      other.speed == speed &&
      other.fuelTankSize == fuelTankSize &&
      other.explosionRadiusMin == explosionRadiusMin &&
      other.explosionRadiusMax == explosionRadiusMax &&
      other.flight == flight &&
      other.targetLock == targetLock &&
      other.explosion == explosion &&
      other.delays == delays &&
      other.damageTotal == damageTotal &&
      other.damages == damages &&
      other.damageMap == damageMap;

    @override
    int get hashCode =>
        (clusterSize == null ? 0 : clusterSize.hashCode) +
        (signalType == null ? 0 : signalType.hashCode) +
        (trackingSignalMin == null ? 0 : trackingSignalMin.hashCode) +
        (lockTime == null ? 0 : lockTime.hashCode) +
        (lockRangeMax == null ? 0 : lockRangeMax.hashCode) +
        (lockRangeMin == null ? 0 : lockRangeMin.hashCode) +
        (lockAngle == null ? 0 : lockAngle.hashCode) +
        (speed == null ? 0 : speed.hashCode) +
        (fuelTankSize == null ? 0 : fuelTankSize.hashCode) +
        (explosionRadiusMin == null ? 0 : explosionRadiusMin.hashCode) +
        (explosionRadiusMax == null ? 0 : explosionRadiusMax.hashCode) +
        flight.hashCode +
        targetLock.hashCode +
        explosion.hashCode +
        delays.hashCode +
        (damageTotal == null ? 0 : damageTotal.hashCode) +
        (damages == null ? 0 : damages.hashCode) +
        (damageMap == null ? 0 : damageMap.hashCode);

  factory Missile.fromJson(Map<String, dynamic> json) => _$MissileFromJson(json);

  Map<String, dynamic> toJson() => _$MissileToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

