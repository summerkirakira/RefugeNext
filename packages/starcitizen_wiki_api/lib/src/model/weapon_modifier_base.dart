//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'weapon_modifier_base.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class WeaponModifierBase {
  /// Returns a new [WeaponModifierBase] instance.
  WeaponModifierBase({

     this.muzzleFlashMultiplier,

     this.muzzleFlashChange,

     this.fireRateMultiplier,

     this.fireRateChange,

     this.damageMultiplier,

     this.damageChange,

     this.projectileSpeedMultiplier,

     this.projectileSpeedChange,

     this.ammoCostMultiplier,

     this.ammoCostChange,

     this.heatGenerationMultiplier,

     this.heatGenerationChange,

     this.soundRadiusMultiplier,

     this.soundRadiusChange,

     this.chargeTimeMultiplier,

     this.chargeTimeChange,
  });

      /// Muzzle flash scale multiplier.
  @JsonKey(
    
    name: r'muzzle_flash_multiplier',
    required: false,
    includeIfNull: false,
  )


  final double? muzzleFlashMultiplier;



      /// Muzzle flash scale change.
  @JsonKey(
    
    name: r'muzzle_flash_change',
    required: false,
    includeIfNull: false,
  )


  final double? muzzleFlashChange;



      /// Fire rate multiplier.
  @JsonKey(
    
    name: r'fire_rate_multiplier',
    required: false,
    includeIfNull: false,
  )


  final double? fireRateMultiplier;



      /// Fire rate change.
  @JsonKey(
    
    name: r'fire_rate_change',
    required: false,
    includeIfNull: false,
  )


  final double? fireRateChange;



      /// Damage multiplier.
  @JsonKey(
    
    name: r'damage_multiplier',
    required: false,
    includeIfNull: false,
  )


  final double? damageMultiplier;



      /// Damage change.
  @JsonKey(
    
    name: r'damage_change',
    required: false,
    includeIfNull: false,
  )


  final double? damageChange;



      /// Projectile speed multiplier.
  @JsonKey(
    
    name: r'projectile_speed_multiplier',
    required: false,
    includeIfNull: false,
  )


  final double? projectileSpeedMultiplier;



      /// Projectile speed change.
  @JsonKey(
    
    name: r'projectile_speed_change',
    required: false,
    includeIfNull: false,
  )


  final double? projectileSpeedChange;



      /// Ammo cost multiplier.
  @JsonKey(
    
    name: r'ammo_cost_multiplier',
    required: false,
    includeIfNull: false,
  )


  final double? ammoCostMultiplier;



      /// Ammo cost change.
  @JsonKey(
    
    name: r'ammo_cost_change',
    required: false,
    includeIfNull: false,
  )


  final double? ammoCostChange;



      /// Heat generation multiplier.
  @JsonKey(
    
    name: r'heat_generation_multiplier',
    required: false,
    includeIfNull: false,
  )


  final double? heatGenerationMultiplier;



      /// Heat generation change.
  @JsonKey(
    
    name: r'heat_generation_change',
    required: false,
    includeIfNull: false,
  )


  final double? heatGenerationChange;



      /// Sound radius multiplier.
  @JsonKey(
    
    name: r'sound_radius_multiplier',
    required: false,
    includeIfNull: false,
  )


  final double? soundRadiusMultiplier;



      /// Sound radius change.
  @JsonKey(
    
    name: r'sound_radius_change',
    required: false,
    includeIfNull: false,
  )


  final double? soundRadiusChange;



      /// Charge time multiplier.
  @JsonKey(
    
    name: r'charge_time_multiplier',
    required: false,
    includeIfNull: false,
  )


  final double? chargeTimeMultiplier;



      /// Charge time change.
  @JsonKey(
    
    name: r'charge_time_change',
    required: false,
    includeIfNull: false,
  )


  final double? chargeTimeChange;





    @override
    bool operator ==(Object other) => identical(this, other) || other is WeaponModifierBase &&
      other.muzzleFlashMultiplier == muzzleFlashMultiplier &&
      other.muzzleFlashChange == muzzleFlashChange &&
      other.fireRateMultiplier == fireRateMultiplier &&
      other.fireRateChange == fireRateChange &&
      other.damageMultiplier == damageMultiplier &&
      other.damageChange == damageChange &&
      other.projectileSpeedMultiplier == projectileSpeedMultiplier &&
      other.projectileSpeedChange == projectileSpeedChange &&
      other.ammoCostMultiplier == ammoCostMultiplier &&
      other.ammoCostChange == ammoCostChange &&
      other.heatGenerationMultiplier == heatGenerationMultiplier &&
      other.heatGenerationChange == heatGenerationChange &&
      other.soundRadiusMultiplier == soundRadiusMultiplier &&
      other.soundRadiusChange == soundRadiusChange &&
      other.chargeTimeMultiplier == chargeTimeMultiplier &&
      other.chargeTimeChange == chargeTimeChange;

    @override
    int get hashCode =>
        (muzzleFlashMultiplier == null ? 0 : muzzleFlashMultiplier.hashCode) +
        (muzzleFlashChange == null ? 0 : muzzleFlashChange.hashCode) +
        (fireRateMultiplier == null ? 0 : fireRateMultiplier.hashCode) +
        (fireRateChange == null ? 0 : fireRateChange.hashCode) +
        (damageMultiplier == null ? 0 : damageMultiplier.hashCode) +
        (damageChange == null ? 0 : damageChange.hashCode) +
        (projectileSpeedMultiplier == null ? 0 : projectileSpeedMultiplier.hashCode) +
        (projectileSpeedChange == null ? 0 : projectileSpeedChange.hashCode) +
        (ammoCostMultiplier == null ? 0 : ammoCostMultiplier.hashCode) +
        (ammoCostChange == null ? 0 : ammoCostChange.hashCode) +
        (heatGenerationMultiplier == null ? 0 : heatGenerationMultiplier.hashCode) +
        (heatGenerationChange == null ? 0 : heatGenerationChange.hashCode) +
        (soundRadiusMultiplier == null ? 0 : soundRadiusMultiplier.hashCode) +
        (soundRadiusChange == null ? 0 : soundRadiusChange.hashCode) +
        (chargeTimeMultiplier == null ? 0 : chargeTimeMultiplier.hashCode) +
        (chargeTimeChange == null ? 0 : chargeTimeChange.hashCode);

  factory WeaponModifierBase.fromJson(Map<String, dynamic> json) => _$WeaponModifierBaseFromJson(json);

  Map<String, dynamic> toJson() => _$WeaponModifierBaseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

