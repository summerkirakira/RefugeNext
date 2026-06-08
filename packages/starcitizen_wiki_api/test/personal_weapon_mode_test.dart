import 'package:test/test.dart';
import 'package:starcitizen_wiki_api/starcitizen_wiki_api.dart';

// tests for PersonalWeaponMode
void main() {
  final PersonalWeaponMode? instance = /* PersonalWeaponMode(...) */ null;
  // TODO add properties to the entity

  group(PersonalWeaponMode, () {
    // Mode name.
    // String mode
    test('to test the property `mode`', () async {
      // TODO
    });

    // Localized label.
    // String localised
    test('to test the property `localised`', () async {
      // TODO
    });

    // Fire type.
    // String type
    test('to test the property `type`', () async {
      // TODO
    });

    // Rounds per minute.
    // double rpm
    test('to test the property `rpm`', () async {
      // TODO
    });

    // Ammo consumed per shot.
    // int ammoPerShot
    test('to test the property `ammoPerShot`', () async {
      // TODO
    });

    // Pellets per shot.
    // int pelletsPerShot
    test('to test the property `pelletsPerShot`', () async {
      // TODO
    });

    // Damage per second.
    // double damagePerSecond
    test('to test the property `damagePerSecond`', () async {
      // TODO
    });

    // Heat generated per shot (projectile modes).
    // double heatPerShot
    test('to test the property `heatPerShot`', () async {
      // TODO
    });

    // Durability lost per shot (projectile modes).
    // double wearPerShot
    test('to test the property `wearPerShot`', () async {
      // TODO
    });

    // Heat generated per second (beam / continuous-fire modes).
    // double heatPerSecond
    test('to test the property `heatPerSecond`', () async {
      // TODO
    });

    // Durability lost per second (beam / continuous-fire modes).
    // double wearPerSecond
    test('to test the property `wearPerSecond`', () async {
      // TODO
    });

    // Whether the weapon fires during barrel spin-up (rapid mode).
    // bool fireDuringSpinUp
    test('to test the property `fireDuringSpinUp`', () async {
      // TODO
    });

    // Number of shots per burst (burst mode).
    // int shotCount
    test('to test the property `shotCount`', () async {
      // TODO
    });

    // Cooldown time between bursts in seconds (burst mode).
    // double cooldownTime
    test('to test the property `cooldownTime`', () async {
      // TODO
    });

    // Sequence mode identifier (sequence mode).
    // String sequenceMode
    test('to test the property `sequenceMode`', () async {
      // TODO
    });

    // Beam spool-up time in seconds (beam mode).
    // double chargeUpTime
    test('to test the property `chargeUpTime`', () async {
      // TODO
    });

    // Beam spool-down time in seconds (beam mode).
    // double chargeDownTime
    test('to test the property `chargeDownTime`', () async {
      // TODO
    });

    // Range at which full damage is applied (beam mode).
    // double fullDamageRange
    test('to test the property `fullDamageRange`', () async {
      // TODO
    });

    // Range at which damage drops to zero (beam mode).
    // double zeroDamageRange
    test('to test the property `zeroDamageRange`', () async {
      // TODO
    });

    // Beam hit registration type (beam mode).
    // String hitType
    test('to test the property `hitType`', () async {
      // TODO
    });

    // Beam impact radius (beam / salvage mode).
    // double hitRadius
    test('to test the property `hitRadius`', () async {
      // TODO
    });

    // Minimum power draw (beam / salvage mode).
    // double minEnergyDraw
    test('to test the property `minEnergyDraw`', () async {
      // TODO
    });

    // Maximum power draw (beam / salvage mode).
    // double maxEnergyDraw
    test('to test the property `maxEnergyDraw`', () async {
      // TODO
    });

    // Healing mode identifier (healingbeam mode).
    // String healingMode
    test('to test the property `healingMode`', () async {
      // TODO
    });

    // SCU healed per second (healingbeam mode).
    // double healingPerSecond
    test('to test the property `healingPerSecond`', () async {
      // TODO
    });

    // Ammo consumed per medical SCU (healingbeam mode).
    // double ammoPerMscu
    test('to test the property `ammoPerMscu`', () async {
      // TODO
    });

    // Medical ammo type tag (healingbeam mode).
    // String medicalAmmoType
    test('to test the property `medicalAmmoType`', () async {
      // TODO
    });

    // External healing mode (healingbeam mode).
    // String externalHealing
    test('to test the property `externalHealing`', () async {
      // TODO
    });

    // Toggle mode flag (healingbeam mode).
    // bool toggle
    test('to test the property `toggle`', () async {
      // TODO
    });

    // Maximum healing distance (healingbeam mode).
    // double maxDistance
    test('to test the property `maxDistance`', () async {
      // TODO
    });

    // Maximum sensor range for target detection (healingbeam mode).
    // double maxSensorDistance
    test('to test the property `maxSensorDistance`', () async {
      // TODO
    });

    // Auto-dosage BDL modifier (healingbeam mode).
    // double autoDosageModifier
    test('to test the property `autoDosageModifier`', () async {
      // TODO
    });

    // Time before healing breaks in seconds (healingbeam mode).
    // double healingBreakTime
    test('to test the property `healingBreakTime`', () async {
      // TODO
    });

    // Max dose for auto-adjustment (healingbeam mode).
    // double maxDoseForAutoAdjustment
    test('to test the property `maxDoseForAutoAdjustment`', () async {
      // TODO
    });

    // Battery drain per second (healingbeam mode).
    // double batteryDrainPerSecond
    test('to test the property `batteryDrainPerSecond`', () async {
      // TODO
    });

    // Material recovery rate (salvage mode).
    // double materialEfficiency
    test('to test the property `materialEfficiency`', () async {
      // TODO
    });

    // Max hull repair rate (salvage mode).
    // double maxHealthRepairRate
    test('to test the property `maxHealthRepairRate`', () async {
      // TODO
    });

    // Max damage-map repair rate (salvage mode).
    // double maxDamageMapRepairRate
    test('to test the property `maxDamageMapRepairRate`', () async {
      // TODO
    });

    // Health restored per ammo unit (salvage mode).
    // double healthToAmmoRatio
    test('to test the property `healthToAmmoRatio`', () async {
      // TODO
    });

    // Beam ramp-up time in seconds (salvage mode).
    // double rampUpTime
    test('to test the property `rampUpTime`', () async {
      // TODO
    });

    // Beam ramp-down time in seconds (salvage mode).
    // double rampDownTime
    test('to test the property `rampDownTime`', () async {
      // TODO
    });

    // Max vehicle damage ratio (salvage mode).
    // double maxVehicleDamageRatio
    test('to test the property `maxVehicleDamageRatio`', () async {
      // TODO
    });

    // Ratio of repaired material (salvage mode).
    // double repairedMaterialRatio
    test('to test the property `repairedMaterialRatio`', () async {
      // TODO
    });

    // Can fire when target is at full health (salvage mode).
    // bool salvageCanFireOnFull
    test('to test the property `salvageCanFireOnFull`', () async {
      // TODO
    });

    // Damage threshold for salvage operations (salvage mode).
    // double damageThreshold
    test('to test the property `damageThreshold`', () async {
      // TODO
    });

    // Minimum mining distance (collectionbeam mode).
    // double minimumDistance
    test('to test the property `minimumDistance`', () async {
      // TODO
    });

    // Maximum mining distance (collectionbeam mode).
    // double maximumDistance
    test('to test the property `maximumDistance`', () async {
      // TODO
    });

    // Collection beam radius (collectionbeam mode).
    // double beamRadius
    test('to test the property `beamRadius`', () async {
      // TODO
    });

    // Ore collection rate (collectionbeam mode).
    // double collectionRate
    test('to test the property `collectionRate`', () async {
      // TODO
    });

    // Power consumption (collectionbeam mode).
    // double energyDraw
    test('to test the property `energyDraw`', () async {
      // TODO
    });

    // Extractor classification tag (collectionbeam mode).
    // String miningExtractorTag
    test('to test the property `miningExtractorTag`', () async {
      // TODO
    });

    // Toggle mode flag (tractorbeam mode).
    // bool toggleMode
    test('to test the property `toggleMode`', () async {
      // TODO
    });

  });
}
