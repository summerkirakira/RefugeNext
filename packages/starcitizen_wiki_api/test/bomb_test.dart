import 'package:test/test.dart';
import 'package:starcitizen_wiki_api/starcitizen_wiki_api.dart';

// tests for Bomb
void main() {
  final Bomb? instance = /* Bomb(...) */ null;
  // TODO add properties to the entity

  group(Bomb, () {
    // Time in seconds after release before the bomb is armed and can detonate. Scales with bomb size (0.5s for S3, 5.0s for S10).
    // double armTime
    test('to test the property `armTime`', () async {
      // TODO
    });

    // Time in seconds between arming and detonation.
    // double igniteTime
    test('to test the property `igniteTime`', () async {
      // TODO
    });

    // Delay in seconds before collision detection becomes active after release.
    // double collisionDelayTime
    test('to test the property `collisionDelayTime`', () async {
      // TODO
    });

    // Deprecated: Use explosion.safety_distance instead. Minimum safe distance in meters from the explosion. Typically 50m for all bomb sizes.
    // double explosionSafetyDistance
    test('to test the property `explosionSafetyDistance`', () async {
      // TODO
    });

    // Deprecated: Use explosion.radius_min instead. Minimum explosion radius in meters. Scales with bomb size (40m for S3, 100m for S5, 250m for S10).
    // double explosionRadiusMin
    test('to test the property `explosionRadiusMin`', () async {
      // TODO
    });

    // Deprecated: Use explosion.radius_max instead. Maximum explosion radius in meters. Typically equal to minimum radius for uniform blast.
    // double explosionRadiusMax
    test('to test the property `explosionRadiusMax`', () async {
      // TODO
    });

    // Maximum angle in degrees from level flight at which the bomb can be deployed. Typically 90 degrees.
    // double maximumDropAngle
    test('to test the property `maximumDropAngle`', () async {
      // TODO
    });

    // Deprecated: use damage_total.
    // double damage
    test('to test the property `damage`', () async {
      // TODO
    });

    // Total combined damage from all damage types. Scales dramatically with bomb size (27,000 for S3, 568,297 for S10).
    // double damageTotal
    test('to test the property `damageTotal`', () async {
      // TODO
    });

    // Deprecated: use damage_map.
    // List<WeaponDamage> damages
    test('to test the property `damages`', () async {
      // TODO
    });

    // BombExplosion explosion
    test('to test the property `explosion`', () async {
      // TODO
    });

    // BombDelays delays
    test('to test the property `delays`', () async {
      // TODO
    });

    // BombDamageMap damageMap
    test('to test the property `damageMap`', () async {
      // TODO
    });

  });
}
