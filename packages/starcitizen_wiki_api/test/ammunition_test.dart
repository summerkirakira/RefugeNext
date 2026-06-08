import 'package:test/test.dart';
import 'package:starcitizen_wiki_api/starcitizen_wiki_api.dart';

// tests for Ammunition
void main() {
  final Ammunition? instance = /* Ammunition(...) */ null;
  // TODO add properties to the entity

  group(Ammunition, () {
    // Unique identifier for this ammunition type.
    // String uuid
    test('to test the property `uuid`', () async {
      // TODO
    });

    // Projectile speed in m/s.
    // double speed
    test('to test the property `speed`', () async {
      // TODO
    });

    // Lifetime in seconds before the projectile despawns.
    // double lifetime
    test('to test the property `lifetime`', () async {
      // TODO
    });

    // Effective range in meters (speed × lifetime when provided by the game).
    // double range
    test('to test the property `range`', () async {
      // TODO
    });

    // Projectile size used by the game for collision/damage logic.
    // int size
    test('to test the property `size`', () async {
      // TODO
    });

    // Maximum ammo or charge stored in the weapon battery/magazine for this ammo definition.
    // int capacity
    test('to test the property `capacity`', () async {
      // TODO
    });

    // Starting ammo or charge loaded when the item spawns.
    // int initialCapacity
    test('to test the property `initialCapacity`', () async {
      // TODO
    });

    // Damage retention percentage at penetration level 1.
    // double damageFalloffLevel1
    test('to test the property `damageFalloffLevel1`', () async {
      // TODO
    });

    // Damage retention percentage at penetration level 2.
    // double damageFalloffLevel2
    test('to test the property `damageFalloffLevel2`', () async {
      // TODO
    });

    // Damage retention percentage at penetration level 3.
    // double damageFalloffLevel3
    test('to test the property `damageFalloffLevel3`', () async {
      // TODO
    });

    // Maximum armor or material thickness (m) this round can pierce.
    // double maxPenetrationThickness
    test('to test the property `maxPenetrationThickness`', () async {
      // TODO
    });

    // AmmunitionPenetration penetration
    test('to test the property `penetration`', () async {
      // TODO
    });

    // Deprecated: Use impact_damage_map instead. Direct hit damage per projectile, split by damage type. Zero values are omitted.
    // List<WeaponDamageEntry> impactDamage
    test('to test the property `impactDamage`', () async {
      // TODO
    });

    // Deprecated: Use detonation_damage_map instead. Explosion damage applied on detonation-capable projectiles.
    // List<WeaponDamageEntry> detonationDamage
    test('to test the property `detonationDamage`', () async {
      // TODO
    });

    // AmmunitionImpactDamageMap impactDamageMap
    test('to test the property `impactDamageMap`', () async {
      // TODO
    });

    // AmmunitionDetonationDamageMap detonationDamageMap
    test('to test the property `detonationDamageMap`', () async {
      // TODO
    });

    // AmmunitionExplosionRadius explosionRadius
    test('to test the property `explosionRadius`', () async {
      // TODO
    });

    // Impulse multiplier applied on impact. Typically always 1.
    // double impulseScale
    test('to test the property `impulseScale`', () async {
      // TODO
    });

    // Projectile type: 2 = ballistic, -1 = energy/laser.
    // int bulletType
    test('to test the property `bulletType`', () async {
      // TODO
    });

    // AmmunitionDamageDropMinDistance damageDropMinDistance
    test('to test the property `damageDropMinDistance`', () async {
      // TODO
    });

    // AmmunitionDamageDropPerMeter damageDropPerMeter
    test('to test the property `damageDropPerMeter`', () async {
      // TODO
    });

    // AmmunitionDamageDropMinDamage damageDropMinDamage
    test('to test the property `damageDropMinDamage`', () async {
      // TODO
    });

    // AmmunitionBulletImpulseFalloff bulletImpulseFalloff
    test('to test the property `bulletImpulseFalloff`', () async {
      // TODO
    });

    // AmmunitionBulletElectron bulletElectron
    test('to test the property `bulletElectron`', () async {
      // TODO
    });

    // Cargo volume consumed per round in microSCU.
    // int conversionRate
    test('to test the property `conversionRate`', () async {
      // TODO
    });

    // AmmunitionDamageFalloffs damageFalloffs
    test('to test the property `damageFalloffs`', () async {
      // TODO
    });

    // Deprecated: use damage_falloff_level_* and max_penetration_thickness when present.
    // Object piercability
    test('to test the property `piercability`', () async {
      // TODO
    });

  });
}
