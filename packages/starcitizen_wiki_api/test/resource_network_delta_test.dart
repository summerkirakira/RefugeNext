import 'package:test/test.dart';
import 'package:starcitizen_wiki_api/starcitizen_wiki_api.dart';

// tests for ResourceNetworkDelta
void main() {
  final ResourceNetworkDelta? instance = /* ResourceNetworkDelta(...) */ null;
  // TODO add properties to the entity

  group(ResourceNetworkDelta, () {
    // Delta type (Consumption, Generation, Conversion, Storage, NetworkReflection).
    // String type
    test('to test the property `type`', () async {
      // TODO
    });

    // Target resource affected (Power, Fuel, Coolant, QuantumFuel, Shield, LifeSupport).
    // String resource
    test('to test the property `resource`', () async {
      // TODO
    });

    // Rate applied per tick (game native units). Typical power draw ~2-5; fuel draw often 0.01.
    // double rate
    test('to test the property `rate`', () async {
      // TODO
    });

    // Minimum fraction of the resource that must be available before the delta applies.
    // double minimumFraction
    test('to test the property `minimumFraction`', () async {
      // TODO
    });

    // Resource produced by conversion/storage deltas.
    // String generatedResource
    test('to test the property `generatedResource`', () async {
      // TODO
    });

    // Rate of the generated resource.
    // double generatedRate
    test('to test the property `generatedRate`', () async {
      // TODO
    });

    // Whether stored resource is discharged (0/1 flag).
    // double discharge
    test('to test the property `discharge`', () async {
      // TODO
    });

    // Prevents generating above capacity (0/1 flag).
    // double noOverGeneration
    test('to test the property `noOverGeneration`', () async {
      // TODO
    });

    // Binary reflection value for NetworkReflection deltas.
    // double binaryEvaluation
    test('to test the property `binaryEvaluation`', () async {
      // TODO
    });

    // Optional composition entries describing how generated resource is assembled.
    // List<ResourceNetworkDeltaCompositionInner> composition
    test('to test the property `composition`', () async {
      // TODO
    });

  });
}
