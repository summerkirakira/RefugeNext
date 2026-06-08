//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/melee_weapon_attack_mode.dart';
import 'package:json_annotation/json_annotation.dart';

part 'melee_weapon.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MeleeWeapon {
  /// Returns a new [MeleeWeapon] instance.
  MeleeWeapon({

     this.canBeUsedForTakeDown,

     this.canBlock,

     this.canBeUsedInProne,

     this.canDodge,

     this.stanceTransitionMeleeDelay,

     this.meleeCombatConfig,

     this.attackModes,
  });

      /// Whether this weapon can be used for takedown attacks.
  @JsonKey(
    
    name: r'can_be_used_for_take_down',
    required: false,
    includeIfNull: false,
  )


  final bool? canBeUsedForTakeDown;



      /// Whether the wielder can block incoming attacks.
  @JsonKey(
    
    name: r'can_block',
    required: false,
    includeIfNull: false,
  )


  final bool? canBlock;



      /// Whether the weapon can be used while prone.
  @JsonKey(
    
    name: r'can_be_used_in_prone',
    required: false,
    includeIfNull: false,
  )


  final bool? canBeUsedInProne;



      /// Whether the wielder can dodge while equipped.
  @JsonKey(
    
    name: r'can_dodge',
    required: false,
    includeIfNull: false,
  )


  final bool? canDodge;



      /// Delay in seconds when transitioning to a melee stance.
  @JsonKey(
    
    name: r'stance_transition_melee_delay',
    required: false,
    includeIfNull: false,
  )


  final double? stanceTransitionMeleeDelay;



      /// UUID reference to the melee combat config record.
  @JsonKey(
    
    name: r'melee_combat_config',
    required: false,
    includeIfNull: false,
  )


  final String? meleeCombatConfig;



      /// Attack configurations as returned by the resource.
  @JsonKey(
    
    name: r'attack_modes',
    required: false,
    includeIfNull: false,
  )


  final List<MeleeWeaponAttackMode>? attackModes;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MeleeWeapon &&
      other.canBeUsedForTakeDown == canBeUsedForTakeDown &&
      other.canBlock == canBlock &&
      other.canBeUsedInProne == canBeUsedInProne &&
      other.canDodge == canDodge &&
      other.stanceTransitionMeleeDelay == stanceTransitionMeleeDelay &&
      other.meleeCombatConfig == meleeCombatConfig &&
      other.attackModes == attackModes;

    @override
    int get hashCode =>
        (canBeUsedForTakeDown == null ? 0 : canBeUsedForTakeDown.hashCode) +
        (canBlock == null ? 0 : canBlock.hashCode) +
        (canBeUsedInProne == null ? 0 : canBeUsedInProne.hashCode) +
        (canDodge == null ? 0 : canDodge.hashCode) +
        (stanceTransitionMeleeDelay == null ? 0 : stanceTransitionMeleeDelay.hashCode) +
        (meleeCombatConfig == null ? 0 : meleeCombatConfig.hashCode) +
        (attackModes == null ? 0 : attackModes.hashCode);

  factory MeleeWeapon.fromJson(Map<String, dynamic> json) => _$MeleeWeaponFromJson(json);

  Map<String, dynamic> toJson() => _$MeleeWeaponToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

