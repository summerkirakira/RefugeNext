import 'package:test/test.dart';
import 'package:starcitizen_wiki_api/starcitizen_wiki_api.dart';

// tests for QuantumDrive
void main() {
  final QuantumDrive? instance = /* QuantumDrive(...) */ null;
  // TODO add properties to the entity

  group(QuantumDrive, () {
    // Total quantum fuel consumed to complete a spool (QuantumFuelRequirement).
    // double quantumFuelRequirement
    test('to test the property `quantumFuelRequirement`', () async {
      // TODO
    });

    // Continuous quantum fuel burn per meter travelled (FuelRate).
    // double fuelRate
    test('to test the property `fuelRate`', () async {
      // TODO
    });

    // Maximum permitted quantum jump distance in meters (JumpRange).
    // double jumpRange
    test('to test the property `jumpRange`', () async {
      // TODO
    });

    // Jump range formatted as human-readable distance (e.g. \"~56 GM\"). Null when jump_range is null.
    // String jumpRangeFormatted
    test('to test the property `jumpRangeFormatted`', () async {
      // TODO
    });

    // Automatic disengage distance when approaching destination in meters (DisconnectRange).
    // double disconnectRange
    test('to test the property `disconnectRange`', () async {
      // TODO
    });

    // Disconnect range formatted as human-readable distance (e.g. \"35 km\"). Null when disconnect_range is null.
    // String disconnectRangeFormatted
    test('to test the property `disconnectRangeFormatted`', () async {
      // TODO
    });

    // QuantumDriveThermalEnergyDraw thermalEnergyDraw
    test('to test the property `thermalEnergyDraw`', () async {
      // TODO
    });

    // QuantumDriveJumpProfile standardJump
    test('to test the property `standardJump`', () async {
      // TODO
    });

    // QuantumDriveJumpProfile splineJump
    test('to test the property `splineJump`', () async {
      // TODO
    });

    // List of jump profiles with an explicit mode identifier.
    // List<QuantumDriveJumpProfile> modes
    test('to test the property `modes`', () async {
      // TODO
    });

    // Fuel consumption in SCU per GM (FuelConsumptionSCUPerGM).
    // double fuelConsumptionScuPerGm
    test('to test the property `fuelConsumptionScuPerGm`', () async {
      // TODO
    });

    // Fuel efficiency in GM per SCU (FuelEfficiencyGMPerSCU).
    // double fuelEfficiency
    test('to test the property `fuelEfficiency`', () async {
      // TODO
    });

    // QuantumDriveTravelTime10gm travelTime10gm
    test('to test the property `travelTime10gm`', () async {
      // TODO
    });

  });
}
