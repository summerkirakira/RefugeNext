//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/ammunition_bullet_impulse_falloff.dart';
import 'package:starcitizen_wiki_api/src/model/ammunition_damage_drop_min_distance.dart';
import 'package:starcitizen_wiki_api/src/model/ammunition_damage_drop_per_meter.dart';
import 'package:starcitizen_wiki_api/src/model/ammunition_detonation_damage_map.dart';
import 'package:starcitizen_wiki_api/src/model/ammunition_bullet_electron.dart';
import 'package:starcitizen_wiki_api/src/model/ammunition_impact_damage_map.dart';
import 'package:starcitizen_wiki_api/src/model/ammunition_penetration.dart';
import 'package:starcitizen_wiki_api/src/model/weapon_damage_entry.dart';
import 'package:starcitizen_wiki_api/src/model/ammunition_damage_falloffs.dart';
import 'package:starcitizen_wiki_api/src/model/ammunition_explosion_radius.dart';
import 'package:starcitizen_wiki_api/src/model/ammunition_damage_drop_min_damage.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ammunition.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Ammunition {
  /// Returns a new [Ammunition] instance.
  Ammunition({

     this.uuid,

     this.speed,

     this.lifetime,

     this.range,

     this.size,

     this.capacity,

     this.initialCapacity,

     this.damageFalloffLevel1,

     this.damageFalloffLevel2,

     this.damageFalloffLevel3,

     this.maxPenetrationThickness,

     this.penetration,

     this.impactDamage,

     this.detonationDamage,

     this.impactDamageMap,

     this.detonationDamageMap,

     this.explosionRadius,

     this.impulseScale,

     this.bulletType,

     this.damageDropMinDistance,

     this.damageDropPerMeter,

     this.damageDropMinDamage,

     this.bulletImpulseFalloff,

     this.bulletElectron,

     this.conversionRate,

     this.damageFalloffs,

     this.piercability,
  });

      /// Unique identifier for this ammunition type.
  @JsonKey(
    
    name: r'uuid',
    required: false,
    includeIfNull: false,
  )


  final String? uuid;



      /// Projectile speed in m/s.
  @JsonKey(
    
    name: r'speed',
    required: false,
    includeIfNull: false,
  )


  final double? speed;



      /// Lifetime in seconds before the projectile despawns.
  @JsonKey(
    
    name: r'lifetime',
    required: false,
    includeIfNull: false,
  )


  final double? lifetime;



      /// Effective range in meters (speed × lifetime when provided by the game).
  @JsonKey(
    
    name: r'range',
    required: false,
    includeIfNull: false,
  )


  final double? range;



      /// Projectile size used by the game for collision/damage logic.
  @JsonKey(
    
    name: r'size',
    required: false,
    includeIfNull: false,
  )


  final int? size;



      /// Maximum ammo or charge stored in the weapon battery/magazine for this ammo definition.
  @JsonKey(
    
    name: r'capacity',
    required: false,
    includeIfNull: false,
  )


  final int? capacity;



      /// Starting ammo or charge loaded when the item spawns.
  @JsonKey(
    
    name: r'initial_capacity',
    required: false,
    includeIfNull: false,
  )


  final int? initialCapacity;



      /// Damage retention percentage at penetration level 1.
  @JsonKey(
    
    name: r'damage_falloff_level_1',
    required: false,
    includeIfNull: false,
  )


  final double? damageFalloffLevel1;



      /// Damage retention percentage at penetration level 2.
  @JsonKey(
    
    name: r'damage_falloff_level_2',
    required: false,
    includeIfNull: false,
  )


  final double? damageFalloffLevel2;



      /// Damage retention percentage at penetration level 3.
  @JsonKey(
    
    name: r'damage_falloff_level_3',
    required: false,
    includeIfNull: false,
  )


  final double? damageFalloffLevel3;



      /// Maximum armor or material thickness (m) this round can pierce.
  @JsonKey(
    
    name: r'max_penetration_thickness',
    required: false,
    includeIfNull: false,
  )


  final double? maxPenetrationThickness;



  @JsonKey(
    
    name: r'penetration',
    required: false,
    includeIfNull: false,
  )


  final AmmunitionPenetration? penetration;



      /// Deprecated: Use impact_damage_map instead. Direct hit damage per projectile, split by damage type. Zero values are omitted.
  @Deprecated('impactDamage has been deprecated')
  @JsonKey(
    
    name: r'impact_damage',
    required: false,
    includeIfNull: false,
  )


  final List<WeaponDamageEntry>? impactDamage;



      /// Deprecated: Use detonation_damage_map instead. Explosion damage applied on detonation-capable projectiles.
  @Deprecated('detonationDamage has been deprecated')
  @JsonKey(
    
    name: r'detonation_damage',
    required: false,
    includeIfNull: false,
  )


  final List<WeaponDamageEntry>? detonationDamage;



  @JsonKey(
    
    name: r'impact_damage_map',
    required: false,
    includeIfNull: false,
  )


  final AmmunitionImpactDamageMap? impactDamageMap;



  @JsonKey(
    
    name: r'detonation_damage_map',
    required: false,
    includeIfNull: false,
  )


  final AmmunitionDetonationDamageMap? detonationDamageMap;



  @JsonKey(
    
    name: r'explosion_radius',
    required: false,
    includeIfNull: false,
  )


  final AmmunitionExplosionRadius? explosionRadius;



      /// Impulse multiplier applied on impact. Typically always 1.
  @JsonKey(
    
    name: r'impulse_scale',
    required: false,
    includeIfNull: false,
  )


  final double? impulseScale;



      /// Projectile type: 2 = ballistic, -1 = energy/laser.
  @JsonKey(
    
    name: r'bullet_type',
    required: false,
    includeIfNull: false,
  )


  final int? bulletType;



  @JsonKey(
    
    name: r'damage_drop_min_distance',
    required: false,
    includeIfNull: false,
  )


  final AmmunitionDamageDropMinDistance? damageDropMinDistance;



  @JsonKey(
    
    name: r'damage_drop_per_meter',
    required: false,
    includeIfNull: false,
  )


  final AmmunitionDamageDropPerMeter? damageDropPerMeter;



  @JsonKey(
    
    name: r'damage_drop_min_damage',
    required: false,
    includeIfNull: false,
  )


  final AmmunitionDamageDropMinDamage? damageDropMinDamage;



  @JsonKey(
    
    name: r'bullet_impulse_falloff',
    required: false,
    includeIfNull: false,
  )


  final AmmunitionBulletImpulseFalloff? bulletImpulseFalloff;



  @JsonKey(
    
    name: r'bullet_electron',
    required: false,
    includeIfNull: false,
  )


  final AmmunitionBulletElectron? bulletElectron;



      /// Cargo volume consumed per round in microSCU.
  @JsonKey(
    
    name: r'conversion_rate',
    required: false,
    includeIfNull: false,
  )


  final int? conversionRate;



  @Deprecated('damageFalloffs has been deprecated')
  @JsonKey(
    
    name: r'damage_falloffs',
    required: false,
    includeIfNull: false,
  )


  final AmmunitionDamageFalloffs? damageFalloffs;



      /// Deprecated: use damage_falloff_level_* and max_penetration_thickness when present.
  @Deprecated('piercability has been deprecated')
  @JsonKey(
    
    name: r'piercability',
    required: false,
    includeIfNull: false,
  )


  final Object? piercability;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Ammunition &&
      other.uuid == uuid &&
      other.speed == speed &&
      other.lifetime == lifetime &&
      other.range == range &&
      other.size == size &&
      other.capacity == capacity &&
      other.initialCapacity == initialCapacity &&
      other.damageFalloffLevel1 == damageFalloffLevel1 &&
      other.damageFalloffLevel2 == damageFalloffLevel2 &&
      other.damageFalloffLevel3 == damageFalloffLevel3 &&
      other.maxPenetrationThickness == maxPenetrationThickness &&
      other.penetration == penetration &&
      other.impactDamage == impactDamage &&
      other.detonationDamage == detonationDamage &&
      other.impactDamageMap == impactDamageMap &&
      other.detonationDamageMap == detonationDamageMap &&
      other.explosionRadius == explosionRadius &&
      other.impulseScale == impulseScale &&
      other.bulletType == bulletType &&
      other.damageDropMinDistance == damageDropMinDistance &&
      other.damageDropPerMeter == damageDropPerMeter &&
      other.damageDropMinDamage == damageDropMinDamage &&
      other.bulletImpulseFalloff == bulletImpulseFalloff &&
      other.bulletElectron == bulletElectron &&
      other.conversionRate == conversionRate &&
      other.damageFalloffs == damageFalloffs &&
      other.piercability == piercability;

    @override
    int get hashCode =>
        (uuid == null ? 0 : uuid.hashCode) +
        (speed == null ? 0 : speed.hashCode) +
        (lifetime == null ? 0 : lifetime.hashCode) +
        (range == null ? 0 : range.hashCode) +
        (size == null ? 0 : size.hashCode) +
        (capacity == null ? 0 : capacity.hashCode) +
        (initialCapacity == null ? 0 : initialCapacity.hashCode) +
        (damageFalloffLevel1 == null ? 0 : damageFalloffLevel1.hashCode) +
        (damageFalloffLevel2 == null ? 0 : damageFalloffLevel2.hashCode) +
        (damageFalloffLevel3 == null ? 0 : damageFalloffLevel3.hashCode) +
        (maxPenetrationThickness == null ? 0 : maxPenetrationThickness.hashCode) +
        (penetration == null ? 0 : penetration.hashCode) +
        (impactDamage == null ? 0 : impactDamage.hashCode) +
        (detonationDamage == null ? 0 : detonationDamage.hashCode) +
        (impactDamageMap == null ? 0 : impactDamageMap.hashCode) +
        (detonationDamageMap == null ? 0 : detonationDamageMap.hashCode) +
        (explosionRadius == null ? 0 : explosionRadius.hashCode) +
        (impulseScale == null ? 0 : impulseScale.hashCode) +
        (bulletType == null ? 0 : bulletType.hashCode) +
        (damageDropMinDistance == null ? 0 : damageDropMinDistance.hashCode) +
        (damageDropPerMeter == null ? 0 : damageDropPerMeter.hashCode) +
        (damageDropMinDamage == null ? 0 : damageDropMinDamage.hashCode) +
        (bulletImpulseFalloff == null ? 0 : bulletImpulseFalloff.hashCode) +
        (bulletElectron == null ? 0 : bulletElectron.hashCode) +
        (conversionRate == null ? 0 : conversionRate.hashCode) +
        (damageFalloffs == null ? 0 : damageFalloffs.hashCode) +
        (piercability == null ? 0 : piercability.hashCode);

  factory Ammunition.fromJson(Map<String, dynamic> json) => _$AmmunitionFromJson(json);

  Map<String, dynamic> toJson() => _$AmmunitionToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

