import 'package:test/test.dart';
import 'package:starcitizen_wiki_api/starcitizen_wiki_api.dart';

// tests for ItemDistortion
void main() {
  final ItemDistortion? instance = /* ItemDistortion(...) */ null;
  // TODO add properties to the entity

  group(ItemDistortion, () {
    // Rate at which distortion damage recovers per second. Higher values mean faster recovery.
    // double decayRate
    test('to test the property `decayRate`', () async {
      // TODO
    });

    // Delay in seconds before distortion recovery begins after taking damage.
    // double decayDelay
    test('to test the property `decayDelay`', () async {
      // TODO
    });

    // Maximum distortion pool capacity, total distortion damage the item can absorb before shutting down.
    // double max
    test('to test the property `max`', () async {
      // TODO
    });

    // Deprecated: Use max.
    // double maximum
    test('to test the property `maximum`', () async {
      // TODO
    });

    // Deprecated: Does not exist in game data.
    // double overloadRatio
    test('to test the property `overloadRatio`', () async {
      // TODO
    });

    // Ratio of max at which a distortion warning indicator triggers (e.g. 0.75 = warning at 75%).
    // double warningRatio
    test('to test the property `warningRatio`', () async {
      // TODO
    });

    // Threshold below which distortion must fall before the item reactivates after overload. 0 = immediate recovery.
    // double recoveryRatio
    test('to test the property `recoveryRatio`', () async {
      // TODO
    });

    // Deprecated: Does not exist in game data.
    // double recoveryTime
    test('to test the property `recoveryTime`', () async {
      // TODO
    });

    // Power output ratio at maximum distortion. Currently always 0 (reserved for future use).
    // double powerRatioAtMaxDistortion
    test('to test the property `powerRatioAtMaxDistortion`', () async {
      // TODO
    });

    // Whether power output only changes when distortion reaches maximum (1 = yes, 0 = gradual).
    // int powerChangeOnlyAtMaxDistortion
    test('to test the property `powerChangeOnlyAtMaxDistortion`', () async {
      // TODO
    });

    // Computed duration in seconds the item remains shut down (Maximum / DecayRate + DecayDelay).
    // double shutdownTime
    test('to test the property `shutdownTime`', () async {
      // TODO
    });

  });
}
