//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/melee_weapon_attack_damages.dart';
import 'package:json_annotation/json_annotation.dart';

part 'melee_weapon_attack_mode.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MeleeWeaponAttackMode {
  /// Returns a new [MeleeWeaponAttackMode] instance.
  MeleeWeaponAttackMode({

     this.category,

     this.damage,

     this.stunRecoveryModifier,

     this.blockStunReductionModifier,

     this.blockStunStaminaModifier,

     this.attackImpulse,

     this.ignoreBodyPartImpulseScale,

     this.forceKnockdown,

     this.damages,
  });

      /// Attack animation category (e.g., BladeSlash, BladeStab, SyringeStab).
  @JsonKey(
    
    name: r'category',
    required: false,
    includeIfNull: false,
  )


  final String? category;



      /// Total damage value (DamageTotal).
  @JsonKey(
    
    name: r'damage',
    required: false,
    includeIfNull: false,
  )


  final double? damage;



      /// Modifier applied to stun recovery time.
  @JsonKey(
    
    name: r'stun_recovery_modifier',
    required: false,
    includeIfNull: false,
  )


  final double? stunRecoveryModifier;



      /// Modifier reducing stun duration when blocking.
  @JsonKey(
    
    name: r'block_stun_reduction_modifier',
    required: false,
    includeIfNull: false,
  )


  final double? blockStunReductionModifier;



      /// Modifier applied to stamina cost of blocking a stun.
  @JsonKey(
    
    name: r'block_stun_stamina_modifier',
    required: false,
    includeIfNull: false,
  )


  final double? blockStunStaminaModifier;



      /// Physical impulse applied to the target on hit.
  @JsonKey(
    
    name: r'attack_impulse',
    required: false,
    includeIfNull: false,
  )


  final double? attackImpulse;



      /// Whether impulse ignores body-part-specific scaling.
  @JsonKey(
    
    name: r'ignore_body_part_impulse_scale',
    required: false,
    includeIfNull: false,
  )


  final bool? ignoreBodyPartImpulseScale;



      /// Knockdown behavior (e.g., None).
  @JsonKey(
    
    name: r'force_knockdown',
    required: false,
    includeIfNull: false,
  )


  final String? forceKnockdown;



  @JsonKey(
    
    name: r'damages',
    required: false,
    includeIfNull: false,
  )


  final MeleeWeaponAttackDamages? damages;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MeleeWeaponAttackMode &&
      other.category == category &&
      other.damage == damage &&
      other.stunRecoveryModifier == stunRecoveryModifier &&
      other.blockStunReductionModifier == blockStunReductionModifier &&
      other.blockStunStaminaModifier == blockStunStaminaModifier &&
      other.attackImpulse == attackImpulse &&
      other.ignoreBodyPartImpulseScale == ignoreBodyPartImpulseScale &&
      other.forceKnockdown == forceKnockdown &&
      other.damages == damages;

    @override
    int get hashCode =>
        (category == null ? 0 : category.hashCode) +
        (damage == null ? 0 : damage.hashCode) +
        (stunRecoveryModifier == null ? 0 : stunRecoveryModifier.hashCode) +
        (blockStunReductionModifier == null ? 0 : blockStunReductionModifier.hashCode) +
        (blockStunStaminaModifier == null ? 0 : blockStunStaminaModifier.hashCode) +
        (attackImpulse == null ? 0 : attackImpulse.hashCode) +
        (ignoreBodyPartImpulseScale == null ? 0 : ignoreBodyPartImpulseScale.hashCode) +
        (forceKnockdown == null ? 0 : forceKnockdown.hashCode) +
        damages.hashCode;

  factory MeleeWeaponAttackMode.fromJson(Map<String, dynamic> json) => _$MeleeWeaponAttackModeFromJson(json);

  Map<String, dynamic> toJson() => _$MeleeWeaponAttackModeToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

