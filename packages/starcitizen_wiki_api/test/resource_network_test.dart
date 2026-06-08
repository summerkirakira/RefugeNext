import 'package:test/test.dart';
import 'package:starcitizen_wiki_api/starcitizen_wiki_api.dart';

// tests for ResourceNetwork
void main() {
  final ResourceNetwork? instance = /* ResourceNetwork(...) */ null;
  // TODO add properties to the entity

  group(ResourceNetwork, () {
    // Whether the item participates in the ship/station resource network.
    // bool isNetworked
    test('to test the property `isNetworked`', () async {
      // TODO
    });

    // True when the item acts as a relay node.
    // bool isRelay
    test('to test the property `isRelay`', () async {
      // TODO
    });

    // Processing priority within the network (higher runs earlier). Commonly 50; fuel tanks use 100.
    // int defaultPriority
    test('to test the property `defaultPriority`', () async {
      // TODO
    });

    // List of available network states and their resource deltas.
    // List<ResourceNetworkState> states
    test('to test the property `states`', () async {
      // TODO
    });

    // ResourceNetworkRepair repair
    test('to test the property `repair`', () async {
      // TODO
    });

    // ResourceNetworkUsage usage
    test('to test the property `usage`', () async {
      // TODO
    });

    // ResourceNetworkGeneration generation
    test('to test the property `generation`', () async {
      // TODO
    });

  });
}
