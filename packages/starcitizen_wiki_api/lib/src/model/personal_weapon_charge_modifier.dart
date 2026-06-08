//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'personal_weapon_charge_modifier.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PersonalWeaponChargeModifier {
  /// Returns a new [PersonalWeaponChargeModifier] instance.
  PersonalWeaponChargeModifier({

     this.damage,

     this.fireRate,

     this.ammoSpeed,

     this.fireRateOverride,

     this.pelletsOverride,

     this.burstShotsOverride,

     this.heatMultiplier,
  });

      /// Damage multiplier at full charge.
  @JsonKey(
    
    name: r'damage',
    required: false,
    includeIfNull: false,
  )


  final double? damage;



      /// Fire rate multiplier at full charge.
  @JsonKey(
    
    name: r'fire_rate',
    required: false,
    includeIfNull: false,
  )


  final double? fireRate;



      /// Projectile speed multiplier at full charge.
  @JsonKey(
    
    name: r'ammo_speed',
    required: false,
    includeIfNull: false,
  )


  final double? ammoSpeed;



      /// Override fire rate at full charge.
  @JsonKey(
    
    name: r'fire_rate_override',
    required: false,
    includeIfNull: false,
  )


  final double? fireRateOverride;



      /// Override pellet count at full charge.
  @JsonKey(
    
    name: r'pellets_override',
    required: false,
    includeIfNull: false,
  )


  final int? pelletsOverride;



      /// Override burst shot count at full charge.
  @JsonKey(
    
    name: r'burst_shots_override',
    required: false,
    includeIfNull: false,
  )


  final int? burstShotsOverride;



      /// Heat generation multiplier at full charge.
  @JsonKey(
    
    name: r'heat_multiplier',
    required: false,
    includeIfNull: false,
  )


  final double? heatMultiplier;





    @override
    bool operator ==(Object other) => identical(this, other) || other is PersonalWeaponChargeModifier &&
      other.damage == damage &&
      other.fireRate == fireRate &&
      other.ammoSpeed == ammoSpeed &&
      other.fireRateOverride == fireRateOverride &&
      other.pelletsOverride == pelletsOverride &&
      other.burstShotsOverride == burstShotsOverride &&
      other.heatMultiplier == heatMultiplier;

    @override
    int get hashCode =>
        (damage == null ? 0 : damage.hashCode) +
        (fireRate == null ? 0 : fireRate.hashCode) +
        (ammoSpeed == null ? 0 : ammoSpeed.hashCode) +
        (fireRateOverride == null ? 0 : fireRateOverride.hashCode) +
        (pelletsOverride == null ? 0 : pelletsOverride.hashCode) +
        (burstShotsOverride == null ? 0 : burstShotsOverride.hashCode) +
        (heatMultiplier == null ? 0 : heatMultiplier.hashCode);

  factory PersonalWeaponChargeModifier.fromJson(Map<String, dynamic> json) => _$PersonalWeaponChargeModifierFromJson(json);

  Map<String, dynamic> toJson() => _$PersonalWeaponChargeModifierToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

