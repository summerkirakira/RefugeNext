//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/vehicle_weapon_spread.dart';
import 'package:starcitizen_wiki_api/src/model/vehicle_weapon_capacitor.dart';
import 'package:starcitizen_wiki_api/src/model/vehicle_weapon_mode.dart';
import 'package:starcitizen_wiki_api/src/model/vehicle_weapon_barrel_spin_time.dart';
import 'package:starcitizen_wiki_api/src/model/vehicle_weapon_charge.dart';
import 'package:starcitizen_wiki_api/src/model/vehicle_weapon_charge_modifier.dart';
import 'package:starcitizen_wiki_api/src/model/vehicle_weapon_damage.dart';
import 'package:starcitizen_wiki_api/src/model/vehicle_weapon_heat.dart';
import 'package:starcitizen_wiki_api/src/model/vehicle_weapon_damage_entry.dart';
import 'package:starcitizen_wiki_api/src/model/vehicle_weapon_magazine_volume.dart';
import 'package:json_annotation/json_annotation.dart';

part 'vehicle_weapon.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class VehicleWeapon {
  /// Returns a new [VehicleWeapon] instance.
  VehicleWeapon({

     this.class_,

     this.type,

     this.capacity,

     this.range,

     this.rpm,

     this.damage,

     this.modes,

     this.damagePerShot,

     this.damages,

     this.regeneration,

     this.ammunition,

     this.spread,

     this.barrelSpinTime,

     this.heat,

     this.capacitor,

     this.charge,

     this.chargeModifier,

     this.magazineVolume,
  });

      /// Weapon class.
  @JsonKey(
    
    name: r'class',
    required: false,
    includeIfNull: false,
  )


  final String? class_;



      /// Item type.
  @JsonKey(
    
    name: r'type',
    required: false,
    includeIfNull: false,
  )


  final String? type;



      /// Ammunition capacity.
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



      /// Primary mode rounds per minute.
  @JsonKey(
    
    name: r'rpm',
    required: false,
    includeIfNull: false,
  )


  final double? rpm;



      /// Damage summary and per-type alpha/dps.
  @JsonKey(
    
    name: r'damage',
    required: false,
    includeIfNull: false,
  )


  final VehicleWeaponDamage? damage;



      /// Fire modes as provided by the game data.
  @JsonKey(
    
    name: r'modes',
    required: false,
    includeIfNull: false,
  )


  final List<VehicleWeaponMode>? modes;



      /// Deprecated. Use `damage.alpha_total` (and/or `damage.alpha.*` for per-type values).
  @Deprecated('damagePerShot has been deprecated')
  @JsonKey(
    
    name: r'damage_per_shot',
    required: false,
    includeIfNull: false,
  )


  final double? damagePerShot;



      /// Deprecated. Use `damage` (and its `alpha`/`dps` breakdown).
  @Deprecated('damages has been deprecated')
  @JsonKey(
    
    name: r'damages',
    required: false,
    includeIfNull: false,
  )


  final List<VehicleWeaponDamageEntry>? damages;



      /// Deprecated. Use `capacitor.regen_per_second`.
  @Deprecated('regeneration has been deprecated')
  @JsonKey(
    
    name: r'regeneration',
    required: false,
    includeIfNull: false,
  )


  final double? regeneration;



      /// Deprecated: use ammunition from the root resource.
  @Deprecated('ammunition has been deprecated')
  @JsonKey(
    
    name: r'ammunition',
    required: false,
    includeIfNull: false,
  )


  final Object? ammunition;



  @JsonKey(
    
    name: r'spread',
    required: false,
    includeIfNull: false,
  )


  final VehicleWeaponSpread? spread;



  @JsonKey(
    
    name: r'barrel_spin_time',
    required: false,
    includeIfNull: false,
  )


  final VehicleWeaponBarrelSpinTime? barrelSpinTime;



  @JsonKey(
    
    name: r'heat',
    required: false,
    includeIfNull: false,
  )


  final VehicleWeaponHeat? heat;



  @JsonKey(
    
    name: r'capacitor',
    required: false,
    includeIfNull: false,
  )


  final VehicleWeaponCapacitor? capacitor;



  @JsonKey(
    
    name: r'charge',
    required: false,
    includeIfNull: false,
  )


  final VehicleWeaponCharge? charge;



  @JsonKey(
    
    name: r'charge_modifier',
    required: false,
    includeIfNull: false,
  )


  final VehicleWeaponChargeModifier? chargeModifier;



  @JsonKey(
    
    name: r'magazine_volume',
    required: false,
    includeIfNull: false,
  )


  final VehicleWeaponMagazineVolume? magazineVolume;





    @override
    bool operator ==(Object other) => identical(this, other) || other is VehicleWeapon &&
      other.class_ == class_ &&
      other.type == type &&
      other.capacity == capacity &&
      other.range == range &&
      other.rpm == rpm &&
      other.damage == damage &&
      other.modes == modes &&
      other.damagePerShot == damagePerShot &&
      other.damages == damages &&
      other.regeneration == regeneration &&
      other.ammunition == ammunition &&
      other.spread == spread &&
      other.barrelSpinTime == barrelSpinTime &&
      other.heat == heat &&
      other.capacitor == capacitor &&
      other.charge == charge &&
      other.chargeModifier == chargeModifier &&
      other.magazineVolume == magazineVolume;

    @override
    int get hashCode =>
        (class_ == null ? 0 : class_.hashCode) +
        (type == null ? 0 : type.hashCode) +
        (capacity == null ? 0 : capacity.hashCode) +
        (range == null ? 0 : range.hashCode) +
        (rpm == null ? 0 : rpm.hashCode) +
        (damage == null ? 0 : damage.hashCode) +
        (modes == null ? 0 : modes.hashCode) +
        (damagePerShot == null ? 0 : damagePerShot.hashCode) +
        (damages == null ? 0 : damages.hashCode) +
        (regeneration == null ? 0 : regeneration.hashCode) +
        (ammunition == null ? 0 : ammunition.hashCode) +
        (spread == null ? 0 : spread.hashCode) +
        (barrelSpinTime == null ? 0 : barrelSpinTime.hashCode) +
        (heat == null ? 0 : heat.hashCode) +
        (capacitor == null ? 0 : capacitor.hashCode) +
        (charge == null ? 0 : charge.hashCode) +
        (chargeModifier == null ? 0 : chargeModifier.hashCode) +
        (magazineVolume == null ? 0 : magazineVolume.hashCode);

  factory VehicleWeapon.fromJson(Map<String, dynamic> json) => _$VehicleWeaponFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleWeaponToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

