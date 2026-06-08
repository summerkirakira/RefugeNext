//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'weapon_modifier_recoil.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class WeaponModifierRecoil {
  /// Returns a new [WeaponModifierRecoil] instance.
  WeaponModifierRecoil({

     this.decayMultiplier,

     this.decayChange,

     this.multiplier,

     this.multiplierChange,
  });

      /// Recoil decay multiplier.
  @JsonKey(
    
    name: r'decay_multiplier',
    required: false,
    includeIfNull: false,
  )


  final double? decayMultiplier;



      /// Recoil decay change.
  @JsonKey(
    
    name: r'decay_change',
    required: false,
    includeIfNull: false,
  )


  final double? decayChange;



      /// Recoil randomness multiplier.
  @JsonKey(
    
    name: r'multiplier',
    required: false,
    includeIfNull: false,
  )


  final double? multiplier;



      /// Recoil randomness change.
  @JsonKey(
    
    name: r'multiplier_change',
    required: false,
    includeIfNull: false,
  )


  final double? multiplierChange;





    @override
    bool operator ==(Object other) => identical(this, other) || other is WeaponModifierRecoil &&
      other.decayMultiplier == decayMultiplier &&
      other.decayChange == decayChange &&
      other.multiplier == multiplier &&
      other.multiplierChange == multiplierChange;

    @override
    int get hashCode =>
        (decayMultiplier == null ? 0 : decayMultiplier.hashCode) +
        (decayChange == null ? 0 : decayChange.hashCode) +
        (multiplier == null ? 0 : multiplier.hashCode) +
        (multiplierChange == null ? 0 : multiplierChange.hashCode);

  factory WeaponModifierRecoil.fromJson(Map<String, dynamic> json) => _$WeaponModifierRecoilFromJson(json);

  Map<String, dynamic> toJson() => _$WeaponModifierRecoilToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

