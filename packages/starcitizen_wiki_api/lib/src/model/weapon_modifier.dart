//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/weapon_modifier_zeroing.dart';
import 'package:starcitizen_wiki_api/src/model/weapon_modifier_recoil.dart';
import 'package:starcitizen_wiki_api/src/model/weapon_modifier_base.dart';
import 'package:starcitizen_wiki_api/src/model/weapon_modifier_aim.dart';
import 'package:starcitizen_wiki_api/src/model/weapon_modifier_spread.dart';
import 'package:starcitizen_wiki_api/src/model/weapon_modifier_regen.dart';
import 'package:starcitizen_wiki_api/src/model/weapon_modifier_salvage.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weapon_modifier.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class WeaponModifier {
  /// Returns a new [WeaponModifier] instance.
  WeaponModifier({

     this.activateOnAttach,

     this.ignoreWear,

     this.base_,

     this.recoil,

     this.spread,

     this.aim,

     this.regen,

     this.salvage,

     this.zeroing,

     this.fireRateMultiplier,

     this.damageMultiplier,

     this.damageOverTimeMultiplier,

     this.projectileSpeedMultiplier,

     this.ammoCostMultiplier,

     this.heatGenerationMultiplier,

     this.soundRadiusMultiplier,

     this.chargeTimeMultiplier,
  });

      /// Whether the modifier becomes active as soon as it is attached.
  @JsonKey(
    
    name: r'activate_on_attach',
    required: false,
    includeIfNull: false,
  )


  final bool? activateOnAttach;



      /// If true, the modifier ignores item wear/maintenance effects.
  @JsonKey(
    
    name: r'ignore_wear',
    required: false,
    includeIfNull: false,
  )


  final bool? ignoreWear;



  @JsonKey(
    
    name: r'base',
    required: false,
    includeIfNull: false,
  )


  final WeaponModifierBase? base_;



  @JsonKey(
    
    name: r'recoil',
    required: false,
    includeIfNull: false,
  )


  final WeaponModifierRecoil? recoil;



  @JsonKey(
    
    name: r'spread',
    required: false,
    includeIfNull: false,
  )


  final WeaponModifierSpread? spread;



  @JsonKey(
    
    name: r'aim',
    required: false,
    includeIfNull: false,
  )


  final WeaponModifierAim? aim;



  @JsonKey(
    
    name: r'regen',
    required: false,
    includeIfNull: false,
  )


  final WeaponModifierRegen? regen;



  @JsonKey(
    
    name: r'salvage',
    required: false,
    includeIfNull: false,
  )


  final WeaponModifierSalvage? salvage;



  @JsonKey(
    
    name: r'zeroing',
    required: false,
    includeIfNull: false,
  )


  final WeaponModifierZeroing? zeroing;



      /// Deprecated: Use `base.fire_rate_multiplier`.
  @Deprecated('fireRateMultiplier has been deprecated')
  @JsonKey(
    
    name: r'fire_rate_multiplier',
    required: false,
    includeIfNull: false,
  )


  final double? fireRateMultiplier;



      /// Deprecated: Use `base.damage_multiplier`.
  @Deprecated('damageMultiplier has been deprecated')
  @JsonKey(
    
    name: r'damage_multiplier',
    required: false,
    includeIfNull: false,
  )


  final double? damageMultiplier;



      /// Deprecated: v2 compatibility field. No non-deprecated replacement is currently returned by this resource.
  @Deprecated('damageOverTimeMultiplier has been deprecated')
  @JsonKey(
    
    name: r'damage_over_time_multiplier',
    required: false,
    includeIfNull: false,
  )


  final double? damageOverTimeMultiplier;



      /// Deprecated: Use `base.projectile_speed_multiplier`.
  @Deprecated('projectileSpeedMultiplier has been deprecated')
  @JsonKey(
    
    name: r'projectile_speed_multiplier',
    required: false,
    includeIfNull: false,
  )


  final double? projectileSpeedMultiplier;



      /// Deprecated: Use `base.ammo_cost_multiplier`.
  @Deprecated('ammoCostMultiplier has been deprecated')
  @JsonKey(
    
    name: r'ammo_cost_multiplier',
    required: false,
    includeIfNull: false,
  )


  final double? ammoCostMultiplier;



      /// Deprecated: Use `base.heat_generation_multiplier`.
  @Deprecated('heatGenerationMultiplier has been deprecated')
  @JsonKey(
    
    name: r'heat_generation_multiplier',
    required: false,
    includeIfNull: false,
  )


  final double? heatGenerationMultiplier;



      /// Deprecated: Use `base.sound_radius_multiplier`.
  @Deprecated('soundRadiusMultiplier has been deprecated')
  @JsonKey(
    
    name: r'sound_radius_multiplier',
    required: false,
    includeIfNull: false,
  )


  final double? soundRadiusMultiplier;



      /// Deprecated: Use `base.charge_time_multiplier`.
  @Deprecated('chargeTimeMultiplier has been deprecated')
  @JsonKey(
    
    name: r'charge_time_multiplier',
    required: false,
    includeIfNull: false,
  )


  final double? chargeTimeMultiplier;





    @override
    bool operator ==(Object other) => identical(this, other) || other is WeaponModifier &&
      other.activateOnAttach == activateOnAttach &&
      other.ignoreWear == ignoreWear &&
      other.base_ == base_ &&
      other.recoil == recoil &&
      other.spread == spread &&
      other.aim == aim &&
      other.regen == regen &&
      other.salvage == salvage &&
      other.zeroing == zeroing &&
      other.fireRateMultiplier == fireRateMultiplier &&
      other.damageMultiplier == damageMultiplier &&
      other.damageOverTimeMultiplier == damageOverTimeMultiplier &&
      other.projectileSpeedMultiplier == projectileSpeedMultiplier &&
      other.ammoCostMultiplier == ammoCostMultiplier &&
      other.heatGenerationMultiplier == heatGenerationMultiplier &&
      other.soundRadiusMultiplier == soundRadiusMultiplier &&
      other.chargeTimeMultiplier == chargeTimeMultiplier;

    @override
    int get hashCode =>
        (activateOnAttach == null ? 0 : activateOnAttach.hashCode) +
        (ignoreWear == null ? 0 : ignoreWear.hashCode) +
        (base_ == null ? 0 : base_.hashCode) +
        (recoil == null ? 0 : recoil.hashCode) +
        (spread == null ? 0 : spread.hashCode) +
        (aim == null ? 0 : aim.hashCode) +
        (regen == null ? 0 : regen.hashCode) +
        (salvage == null ? 0 : salvage.hashCode) +
        (zeroing == null ? 0 : zeroing.hashCode) +
        (fireRateMultiplier == null ? 0 : fireRateMultiplier.hashCode) +
        (damageMultiplier == null ? 0 : damageMultiplier.hashCode) +
        (damageOverTimeMultiplier == null ? 0 : damageOverTimeMultiplier.hashCode) +
        (projectileSpeedMultiplier == null ? 0 : projectileSpeedMultiplier.hashCode) +
        (ammoCostMultiplier == null ? 0 : ammoCostMultiplier.hashCode) +
        (heatGenerationMultiplier == null ? 0 : heatGenerationMultiplier.hashCode) +
        (soundRadiusMultiplier == null ? 0 : soundRadiusMultiplier.hashCode) +
        (chargeTimeMultiplier == null ? 0 : chargeTimeMultiplier.hashCode);

  factory WeaponModifier.fromJson(Map<String, dynamic> json) => _$WeaponModifierFromJson(json);

  Map<String, dynamic> toJson() => _$WeaponModifierToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

