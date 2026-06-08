import 'package:test/test.dart';
import 'package:starcitizen_wiki_api/starcitizen_wiki_api.dart';

// tests for QuantumInterdictionGenerator
void main() {
  final QuantumInterdictionGenerator? instance = /* QuantumInterdictionGenerator(...) */ null;
  // TODO add properties to the entity

  group(QuantumInterdictionGenerator, () {
    // Fractions of the generator total power budget reserved for base/idle, pulse, and jammer phases.
    // QuantumInterdictionGeneratorPowerFractions powerFractions
    test('to test the property `powerFractions`', () async {
      // TODO
    });

    // Continuous interdiction field used to yank ships out of quantum travel.
    // QuantumInterdictionGeneratorJamming jamming
    test('to test the property `jamming`', () async {
      // TODO
    });

    // Quantum interdiction pulse (QIP) burst stats.
    // QuantumInterdictionGeneratorPulse pulse
    test('to test the property `pulse`', () async {
      // TODO
    });

    // Deprecated. Use `pulse.radius`.
    // double interdictionRange
    test('to test the property `interdictionRange`', () async {
      // TODO
    });

    // Deprecated. Use `jamming.range`.
    // double jammerRange
    test('to test the property `jammerRange`', () async {
      // TODO
    });

    // Deprecated. Use `pulse.charge_time`.
    // double chargeDuration
    test('to test the property `chargeDuration`', () async {
      // TODO
    });

    // Deprecated. Use `pulse.activation_phase_duration`.
    // double activationDuration
    test('to test the property `activationDuration`', () async {
      // TODO
    });

    // Deprecated. Use `pulse.discharge_time`.
    // double dischargeDuration
    test('to test the property `dischargeDuration`', () async {
      // TODO
    });

    // Deprecated. Use `pulse.cooldown_time`.
    // double cooldownDuration
    test('to test the property `cooldownDuration`', () async {
      // TODO
    });

    // Deprecated. Use `pulse.disperse_charge_time`.
    // double disperseChargeDuration
    test('to test the property `disperseChargeDuration`', () async {
      // TODO
    });

  });
}
