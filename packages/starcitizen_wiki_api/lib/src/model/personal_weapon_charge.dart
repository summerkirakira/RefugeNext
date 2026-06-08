//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'personal_weapon_charge.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PersonalWeaponCharge {
  /// Returns a new [PersonalWeaponCharge] instance.
  PersonalWeaponCharge({

     this.time,

     this.overchargeTime,

     this.overchargedTime,

     this.cooldownTime,

     this.autoFire,

     this.requireFullCharge,

     this.autoCharge,

     this.interpolateBonus,
  });

      /// Time to reach full charge in seconds.
  @JsonKey(
    
    name: r'time',
    required: false,
    includeIfNull: false,
  )


  final double? time;



      /// Time window for overcharge in seconds.
  @JsonKey(
    
    name: r'overcharge_time',
    required: false,
    includeIfNull: false,
  )


  final double? overchargeTime;



      /// Duration of overcharged state in seconds.
  @JsonKey(
    
    name: r'overcharged_time',
    required: false,
    includeIfNull: false,
  )


  final double? overchargedTime;



      /// Cooldown after firing in seconds.
  @JsonKey(
    
    name: r'cooldown_time',
    required: false,
    includeIfNull: false,
  )


  final double? cooldownTime;



      /// Auto-fire when fully charged.
  @JsonKey(
    
    name: r'auto_fire',
    required: false,
    includeIfNull: false,
  )


  final bool? autoFire;



      /// Must be fully charged before firing.
  @JsonKey(
    
    name: r'require_full_charge',
    required: false,
    includeIfNull: false,
  )


  final bool? requireFullCharge;



      /// Auto-charges when held.
  @JsonKey(
    
    name: r'auto_charge',
    required: false,
    includeIfNull: false,
  )


  final bool? autoCharge;



      /// Interpolates charge bonus linearly.
  @JsonKey(
    
    name: r'interpolate_bonus',
    required: false,
    includeIfNull: false,
  )


  final bool? interpolateBonus;





    @override
    bool operator ==(Object other) => identical(this, other) || other is PersonalWeaponCharge &&
      other.time == time &&
      other.overchargeTime == overchargeTime &&
      other.overchargedTime == overchargedTime &&
      other.cooldownTime == cooldownTime &&
      other.autoFire == autoFire &&
      other.requireFullCharge == requireFullCharge &&
      other.autoCharge == autoCharge &&
      other.interpolateBonus == interpolateBonus;

    @override
    int get hashCode =>
        (time == null ? 0 : time.hashCode) +
        (overchargeTime == null ? 0 : overchargeTime.hashCode) +
        (overchargedTime == null ? 0 : overchargedTime.hashCode) +
        (cooldownTime == null ? 0 : cooldownTime.hashCode) +
        (autoFire == null ? 0 : autoFire.hashCode) +
        (requireFullCharge == null ? 0 : requireFullCharge.hashCode) +
        (autoCharge == null ? 0 : autoCharge.hashCode) +
        (interpolateBonus == null ? 0 : interpolateBonus.hashCode);

  factory PersonalWeaponCharge.fromJson(Map<String, dynamic> json) => _$PersonalWeaponChargeFromJson(json);

  Map<String, dynamic> toJson() => _$PersonalWeaponChargeToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

