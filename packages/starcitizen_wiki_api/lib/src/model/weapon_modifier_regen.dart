//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'weapon_modifier_regen.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class WeaponModifierRegen {
  /// Returns a new [WeaponModifierRegen] instance.
  WeaponModifierRegen({

     this.powerRatioMultiplier,

     this.maxAmmoLoadMultiplier,

     this.maxRegenPerSecMultiplier,
  });

      /// Power ratio multiplier.
  @JsonKey(
    
    name: r'power_ratio_multiplier',
    required: false,
    includeIfNull: false,
  )


  final double? powerRatioMultiplier;



      /// Maximum ammo load multiplier.
  @JsonKey(
    
    name: r'max_ammo_load_multiplier',
    required: false,
    includeIfNull: false,
  )


  final double? maxAmmoLoadMultiplier;



      /// Maximum regeneration per second multiplier.
  @JsonKey(
    
    name: r'max_regen_per_sec_multiplier',
    required: false,
    includeIfNull: false,
  )


  final double? maxRegenPerSecMultiplier;





    @override
    bool operator ==(Object other) => identical(this, other) || other is WeaponModifierRegen &&
      other.powerRatioMultiplier == powerRatioMultiplier &&
      other.maxAmmoLoadMultiplier == maxAmmoLoadMultiplier &&
      other.maxRegenPerSecMultiplier == maxRegenPerSecMultiplier;

    @override
    int get hashCode =>
        (powerRatioMultiplier == null ? 0 : powerRatioMultiplier.hashCode) +
        (maxAmmoLoadMultiplier == null ? 0 : maxAmmoLoadMultiplier.hashCode) +
        (maxRegenPerSecMultiplier == null ? 0 : maxRegenPerSecMultiplier.hashCode);

  factory WeaponModifierRegen.fromJson(Map<String, dynamic> json) => _$WeaponModifierRegenFromJson(json);

  Map<String, dynamic> toJson() => _$WeaponModifierRegenToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

