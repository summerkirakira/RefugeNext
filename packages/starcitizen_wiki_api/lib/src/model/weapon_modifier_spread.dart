//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'weapon_modifier_spread.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class WeaponModifierSpread {
  /// Returns a new [WeaponModifierSpread] instance.
  WeaponModifierSpread({

     this.minMultiplier,

     this.minChange,

     this.maxMultiplier,

     this.maxChange,

     this.firstAttackMultiplier,

     this.firstAttackChange,

     this.perAttackMultiplier,

     this.perAttackChange,

     this.decayMultiplier,

     this.decayChange,
  });

      /// Minimum spread multiplier.
  @JsonKey(
    
    name: r'min_multiplier',
    required: false,
    includeIfNull: false,
  )


  final double? minMultiplier;



      /// Minimum spread change.
  @JsonKey(
    
    name: r'min_change',
    required: false,
    includeIfNull: false,
  )


  final double? minChange;



      /// Maximum spread multiplier.
  @JsonKey(
    
    name: r'max_multiplier',
    required: false,
    includeIfNull: false,
  )


  final double? maxMultiplier;



      /// Maximum spread change.
  @JsonKey(
    
    name: r'max_change',
    required: false,
    includeIfNull: false,
  )


  final double? maxChange;



      /// First shot spread multiplier.
  @JsonKey(
    
    name: r'first_attack_multiplier',
    required: false,
    includeIfNull: false,
  )


  final double? firstAttackMultiplier;



      /// First shot spread change.
  @JsonKey(
    
    name: r'first_attack_change',
    required: false,
    includeIfNull: false,
  )


  final double? firstAttackChange;



      /// Per-shot spread multiplier.
  @JsonKey(
    
    name: r'per_attack_multiplier',
    required: false,
    includeIfNull: false,
  )


  final double? perAttackMultiplier;



      /// Per-shot spread change.
  @JsonKey(
    
    name: r'per_attack_change',
    required: false,
    includeIfNull: false,
  )


  final double? perAttackChange;



      /// Spread decay multiplier.
  @JsonKey(
    
    name: r'decay_multiplier',
    required: false,
    includeIfNull: false,
  )


  final double? decayMultiplier;



      /// Spread decay change.
  @JsonKey(
    
    name: r'decay_change',
    required: false,
    includeIfNull: false,
  )


  final double? decayChange;





    @override
    bool operator ==(Object other) => identical(this, other) || other is WeaponModifierSpread &&
      other.minMultiplier == minMultiplier &&
      other.minChange == minChange &&
      other.maxMultiplier == maxMultiplier &&
      other.maxChange == maxChange &&
      other.firstAttackMultiplier == firstAttackMultiplier &&
      other.firstAttackChange == firstAttackChange &&
      other.perAttackMultiplier == perAttackMultiplier &&
      other.perAttackChange == perAttackChange &&
      other.decayMultiplier == decayMultiplier &&
      other.decayChange == decayChange;

    @override
    int get hashCode =>
        (minMultiplier == null ? 0 : minMultiplier.hashCode) +
        (minChange == null ? 0 : minChange.hashCode) +
        (maxMultiplier == null ? 0 : maxMultiplier.hashCode) +
        (maxChange == null ? 0 : maxChange.hashCode) +
        (firstAttackMultiplier == null ? 0 : firstAttackMultiplier.hashCode) +
        (firstAttackChange == null ? 0 : firstAttackChange.hashCode) +
        (perAttackMultiplier == null ? 0 : perAttackMultiplier.hashCode) +
        (perAttackChange == null ? 0 : perAttackChange.hashCode) +
        (decayMultiplier == null ? 0 : decayMultiplier.hashCode) +
        (decayChange == null ? 0 : decayChange.hashCode);

  factory WeaponModifierSpread.fromJson(Map<String, dynamic> json) => _$WeaponModifierSpreadFromJson(json);

  Map<String, dynamic> toJson() => _$WeaponModifierSpreadToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

