//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/vehicle_armor_signal_multiplier.dart';
import 'package:starcitizen_wiki_api/src/model/vehicle_armor_penetration_resistance.dart';
import 'package:starcitizen_wiki_api/src/model/vehicle_armor_resistance_multiplier.dart';
import 'package:starcitizen_wiki_api/src/model/vehicle_armor_damage_multiplier.dart';
import 'package:starcitizen_wiki_api/src/model/vehicle_armor_deflection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'vehicle_armor.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class VehicleArmor {
  /// Returns a new [VehicleArmor] instance.
  VehicleArmor({

     this.uuid,

     this.health,

     this.signalInfrared,

     this.signalElectromagnetic,

     this.signalCrossSection,

     this.damagePhysical,

     this.damageEnergy,

     this.damageDistortion,

     this.damageThermal,

     this.damageBiochemical,

     this.damageStun,

     this.signalMultiplier,

     this.damageMultiplier,

     this.resistanceMultiplier,

     this.deflection,

     this.penetrationResistance,
  });

      /// Armor item UUID.
  @JsonKey(
    
    name: r'uuid',
    required: false,
    includeIfNull: false,
  )


  final String? uuid;



      /// Armor health points from Durability system.
  @JsonKey(
    
    name: r'health',
    required: false,
    includeIfNull: false,
  )


  final double? health;



      /// Deprecated: Use signal_multiplier.infrared instead. Infrared signature multiplier. Lower values make the ship harder to detect via heat signature.
  @Deprecated('signalInfrared has been deprecated')
  @JsonKey(
    
    name: r'signal_infrared',
    required: false,
    includeIfNull: false,
  )


  final double? signalInfrared;



      /// Deprecated: Use signal_multiplier.electromagnetic instead. Electromagnetic signature multiplier. Lower values provide better EM stealth.
  @Deprecated('signalElectromagnetic has been deprecated')
  @JsonKey(
    
    name: r'signal_electromagnetic',
    required: false,
    includeIfNull: false,
  )


  final double? signalElectromagnetic;



      /// Deprecated: Use signal_multiplier.cross_section instead. Radar cross-section multiplier. Affects radar detectability.
  @Deprecated('signalCrossSection has been deprecated')
  @JsonKey(
    
    name: r'signal_cross_section',
    required: false,
    includeIfNull: false,
  )


  final double? signalCrossSection;



      /// Deprecated: Use damage_multiplier.physical instead. Physical damage multiplier. Typically 0.62, providing 38% damage reduction.
  @Deprecated('damagePhysical has been deprecated')
  @JsonKey(
    
    name: r'damage_physical',
    required: false,
    includeIfNull: false,
  )


  final double? damagePhysical;



      /// Deprecated: Use damage_multiplier.energy instead. Energy weapon damage multiplier. Values around 1.0 are neutral.
  @Deprecated('damageEnergy has been deprecated')
  @JsonKey(
    
    name: r'damage_energy',
    required: false,
    includeIfNull: false,
  )


  final double? damageEnergy;



      /// Deprecated: Use damage_multiplier.distortion instead. Distortion damage multiplier. Typically around 1.0.
  @Deprecated('damageDistortion has been deprecated')
  @JsonKey(
    
    name: r'damage_distortion',
    required: false,
    includeIfNull: false,
  )


  final double? damageDistortion;



      /// Deprecated: Use damage_multiplier.thermal instead. Thermal damage multiplier. Typically 1.0 (neutral, no resistance).
  @Deprecated('damageThermal has been deprecated')
  @JsonKey(
    
    name: r'damage_thermal',
    required: false,
    includeIfNull: false,
  )


  final double? damageThermal;



      /// Deprecated: Use damage_multiplier.biochemical instead. Biochemical damage multiplier. Typically 1.0 (neutral, no resistance).
  @Deprecated('damageBiochemical has been deprecated')
  @JsonKey(
    
    name: r'damage_biochemical',
    required: false,
    includeIfNull: false,
  )


  final double? damageBiochemical;



      /// Deprecated: Use damage_multiplier.stun instead. Stun damage multiplier. Typically 0 (complete immunity to stun).
  @Deprecated('damageStun has been deprecated')
  @JsonKey(
    
    name: r'damage_stun',
    required: false,
    includeIfNull: false,
  )


  final double? damageStun;



  @JsonKey(
    
    name: r'signal_multiplier',
    required: false,
    includeIfNull: false,
  )


  final VehicleArmorSignalMultiplier? signalMultiplier;



  @JsonKey(
    
    name: r'damage_multiplier',
    required: false,
    includeIfNull: false,
  )


  final VehicleArmorDamageMultiplier? damageMultiplier;



  @JsonKey(
    
    name: r'resistance_multiplier',
    required: false,
    includeIfNull: false,
  )


  final VehicleArmorResistanceMultiplier? resistanceMultiplier;



  @JsonKey(
    
    name: r'deflection',
    required: false,
    includeIfNull: false,
  )


  final VehicleArmorDeflection? deflection;



  @JsonKey(
    
    name: r'penetration_resistance',
    required: false,
    includeIfNull: false,
  )


  final VehicleArmorPenetrationResistance? penetrationResistance;





    @override
    bool operator ==(Object other) => identical(this, other) || other is VehicleArmor &&
      other.uuid == uuid &&
      other.health == health &&
      other.signalInfrared == signalInfrared &&
      other.signalElectromagnetic == signalElectromagnetic &&
      other.signalCrossSection == signalCrossSection &&
      other.damagePhysical == damagePhysical &&
      other.damageEnergy == damageEnergy &&
      other.damageDistortion == damageDistortion &&
      other.damageThermal == damageThermal &&
      other.damageBiochemical == damageBiochemical &&
      other.damageStun == damageStun &&
      other.signalMultiplier == signalMultiplier &&
      other.damageMultiplier == damageMultiplier &&
      other.resistanceMultiplier == resistanceMultiplier &&
      other.deflection == deflection &&
      other.penetrationResistance == penetrationResistance;

    @override
    int get hashCode =>
        (uuid == null ? 0 : uuid.hashCode) +
        (health == null ? 0 : health.hashCode) +
        (signalInfrared == null ? 0 : signalInfrared.hashCode) +
        (signalElectromagnetic == null ? 0 : signalElectromagnetic.hashCode) +
        (signalCrossSection == null ? 0 : signalCrossSection.hashCode) +
        (damagePhysical == null ? 0 : damagePhysical.hashCode) +
        (damageEnergy == null ? 0 : damageEnergy.hashCode) +
        (damageDistortion == null ? 0 : damageDistortion.hashCode) +
        (damageThermal == null ? 0 : damageThermal.hashCode) +
        (damageBiochemical == null ? 0 : damageBiochemical.hashCode) +
        (damageStun == null ? 0 : damageStun.hashCode) +
        (signalMultiplier == null ? 0 : signalMultiplier.hashCode) +
        (damageMultiplier == null ? 0 : damageMultiplier.hashCode) +
        (resistanceMultiplier == null ? 0 : resistanceMultiplier.hashCode) +
        (deflection == null ? 0 : deflection.hashCode) +
        (penetrationResistance == null ? 0 : penetrationResistance.hashCode);

  factory VehicleArmor.fromJson(Map<String, dynamic> json) => _$VehicleArmorFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleArmorToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

