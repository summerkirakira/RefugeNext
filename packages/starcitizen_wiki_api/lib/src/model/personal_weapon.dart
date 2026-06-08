//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/personal_weapon_damage.dart';
import 'package:starcitizen_wiki_api/src/model/personal_weapon_charge.dart';
import 'package:starcitizen_wiki_api/src/model/weapon_damage_entry.dart';
import 'package:starcitizen_wiki_api/src/model/personal_weapon_spread.dart';
import 'package:starcitizen_wiki_api/src/model/personal_weapon_charge_modifier.dart';
import 'package:starcitizen_wiki_api/src/model/personal_weapon_mode.dart';
import 'package:json_annotation/json_annotation.dart';

part 'personal_weapon.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PersonalWeapon {
  /// Returns a new [PersonalWeapon] instance.
  PersonalWeapon({

     this.class_,

     this.type,

     this.magazineType,

     this.magazineSize,

     this.effectiveRange,

     this.capacity,

     this.range,

     this.damagePerShot,

     this.pelletsPerShot,

     this.rof,

     this.rpm,

     this.damages,

     this.modes,

     this.fireMode,

     this.damage,

     this.spread,

     this.adsSpread,

     this.charge,

     this.chargeModifier,

     this.ammunition,
  });

      /// Class as provided by DescriptionData.Class.
  @JsonKey(
    
    name: r'class',
    required: false,
    includeIfNull: false,
  )


  final String? class_;



      /// Type as provided by DescriptionData.Item Type.
  @JsonKey(
    
    name: r'type',
    required: false,
    includeIfNull: false,
  )


  final String? type;



      /// Deprecated: legacy field, currently returned as an empty string; do not use.
  @Deprecated('magazineType has been deprecated')
  @JsonKey(
    
    name: r'magazine_type',
    required: false,
    includeIfNull: false,
  )


  final String? magazineType;



      /// Deprecated: use `capacity`.
  @Deprecated('magazineSize has been deprecated')
  @JsonKey(
    
    name: r'magazine_size',
    required: false,
    includeIfNull: false,
  )


  final int? magazineSize;



      /// Deprecated: use `range`.
  @Deprecated('effectiveRange has been deprecated')
  @JsonKey(
    
    name: r'effective_range',
    required: false,
    includeIfNull: false,
  )


  final double? effectiveRange;



      /// Weapon magazine capacity.
  @JsonKey(
    
    name: r'capacity',
    required: false,
    includeIfNull: false,
  )


  final int? capacity;



      /// Effective range in meters.
  @JsonKey(
    
    name: r'range',
    required: false,
    includeIfNull: false,
  )


  final double? range;



      /// Deprecated: use `damage.alpha_total` (or per-type `damage.alpha.*`) instead.
  @Deprecated('damagePerShot has been deprecated')
  @JsonKey(
    
    name: r'damage_per_shot',
    required: false,
    includeIfNull: false,
  )


  final double? damagePerShot;



      /// Pellets per shot.
  @JsonKey(
    
    name: r'pellets_per_shot',
    required: false,
    includeIfNull: false,
  )


  final int? pelletsPerShot;



      /// Deprecated: use `rpm`.
  @Deprecated('rof has been deprecated')
  @JsonKey(
    
    name: r'rof',
    required: false,
    includeIfNull: false,
  )


  final double? rof;



      /// Rounds per minute for the first fire mode.
  @JsonKey(
    
    name: r'rpm',
    required: false,
    includeIfNull: false,
  )


  final double? rpm;



      /// Deprecated: legacy ammunition-derived entries. Prefer `damage` for weapon damage totals/breakdowns.
  @Deprecated('damages has been deprecated')
  @JsonKey(
    
    name: r'damages',
    required: false,
    includeIfNull: false,
  )


  final List<WeaponDamageEntry>? damages;



      /// Fire modes returned from Weapon.Modes.
  @JsonKey(
    
    name: r'modes',
    required: false,
    includeIfNull: false,
  )


  final List<PersonalWeaponMode>? modes;



      /// Weapon fire mode.
  @JsonKey(
    
    name: r'fire_mode',
    required: false,
    includeIfNull: false,
  )


  final String? fireMode;



  @JsonKey(
    
    name: r'damage',
    required: false,
    includeIfNull: false,
  )


  final PersonalWeaponDamage? damage;



  @JsonKey(
    
    name: r'spread',
    required: false,
    includeIfNull: false,
  )


  final PersonalWeaponSpread? spread;



  @JsonKey(
    
    name: r'ads_spread',
    required: false,
    includeIfNull: false,
  )


  final PersonalWeaponSpread? adsSpread;



  @JsonKey(
    
    name: r'charge',
    required: false,
    includeIfNull: false,
  )


  final PersonalWeaponCharge? charge;



  @JsonKey(
    
    name: r'charge_modifier',
    required: false,
    includeIfNull: false,
  )


  final PersonalWeaponChargeModifier? chargeModifier;



      /// Deprecated: use the root-level ammunition resource (outside this specification payload) where available.
  @Deprecated('ammunition has been deprecated')
  @JsonKey(
    
    name: r'ammunition',
    required: false,
    includeIfNull: false,
  )


  final Object? ammunition;





    @override
    bool operator ==(Object other) => identical(this, other) || other is PersonalWeapon &&
      other.class_ == class_ &&
      other.type == type &&
      other.magazineType == magazineType &&
      other.magazineSize == magazineSize &&
      other.effectiveRange == effectiveRange &&
      other.capacity == capacity &&
      other.range == range &&
      other.damagePerShot == damagePerShot &&
      other.pelletsPerShot == pelletsPerShot &&
      other.rof == rof &&
      other.rpm == rpm &&
      other.damages == damages &&
      other.modes == modes &&
      other.fireMode == fireMode &&
      other.damage == damage &&
      other.spread == spread &&
      other.adsSpread == adsSpread &&
      other.charge == charge &&
      other.chargeModifier == chargeModifier &&
      other.ammunition == ammunition;

    @override
    int get hashCode =>
        (class_ == null ? 0 : class_.hashCode) +
        (type == null ? 0 : type.hashCode) +
        (magazineType == null ? 0 : magazineType.hashCode) +
        (magazineSize == null ? 0 : magazineSize.hashCode) +
        (effectiveRange == null ? 0 : effectiveRange.hashCode) +
        (capacity == null ? 0 : capacity.hashCode) +
        (range == null ? 0 : range.hashCode) +
        (damagePerShot == null ? 0 : damagePerShot.hashCode) +
        (pelletsPerShot == null ? 0 : pelletsPerShot.hashCode) +
        (rof == null ? 0 : rof.hashCode) +
        (rpm == null ? 0 : rpm.hashCode) +
        (damages == null ? 0 : damages.hashCode) +
        (modes == null ? 0 : modes.hashCode) +
        (fireMode == null ? 0 : fireMode.hashCode) +
        damage.hashCode +
        (spread == null ? 0 : spread.hashCode) +
        (adsSpread == null ? 0 : adsSpread.hashCode) +
        (charge == null ? 0 : charge.hashCode) +
        (chargeModifier == null ? 0 : chargeModifier.hashCode) +
        (ammunition == null ? 0 : ammunition.hashCode);

  factory PersonalWeapon.fromJson(Map<String, dynamic> json) => _$PersonalWeaponFromJson(json);

  Map<String, dynamic> toJson() => _$PersonalWeaponToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

