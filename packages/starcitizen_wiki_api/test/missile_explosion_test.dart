import 'package:test/test.dart';
import 'package:starcitizen_wiki_api/starcitizen_wiki_api.dart';

// tests for MissileExplosion
void main() {
  final MissileExplosion? instance = /* MissileExplosion(...) */ null;
  // TODO add properties to the entity

  group(MissileExplosion, () {
    // Whether this missile splits into multiple submunitions during flight.
    // bool isCluster
    test('to test the property `isCluster`', () async {
      // TODO
    });

    // Number of submunitions released when the missile splits (when applicable).
    // num clusterSize
    test('to test the property `clusterSize`', () async {
      // TODO
    });

    // Whether the missile must be fired from a dedicated launcher/rack.
    // bool requiresLauncher
    test('to test the property `requiresLauncher`', () async {
      // TODO
    });

    // Whether the missile can be fired without a lock.
    // bool allowDumbFiring
    test('to test the property `allowDumbFiring`', () async {
      // TODO
    });

    // Minimum explosion damage radius in meters.
    // double radiusMin
    test('to test the property `radiusMin`', () async {
      // TODO
    });

    // Maximum explosion damage radius in meters.
    // double radiusMax
    test('to test the property `radiusMax`', () async {
      // TODO
    });

    // Minimum safe distance in meters from the explosion center.
    // double safetyDistance
    test('to test the property `safetyDistance`', () async {
      // TODO
    });

    // Proximity fuse / projectile proximity value (as provided by source data).
    // double proximity
    test('to test the property `proximity`', () async {
      // TODO
    });

  });
}
