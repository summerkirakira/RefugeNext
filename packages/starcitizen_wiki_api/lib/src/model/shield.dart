//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/shield_reserve_pool.dart';
import 'package:starcitizen_wiki_api/src/model/shield_damage_map.dart';
import 'package:starcitizen_wiki_api/src/model/shield_regen_delay.dart';
import 'package:json_annotation/json_annotation.dart';

part 'shield.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Shield {
  /// Returns a new [Shield] instance.
  Shield({

     this.maxHealth,

     this.regenRate,

     this.regenTime,

     this.decayRatio,

     this.reservePool,

     this.regenDelay,

     this.electricalChargeDamageResistance,

     this.absorption,

     this.resistance,

     this.maxShieldHealth,

     this.maxShieldRegen,
  });

      /// Total shield hit points across all faces.
  @JsonKey(
    
    name: r'max_health',
    required: false,
    includeIfNull: false,
  )


  final double? maxHealth;



      /// Maximum shield regeneration per second.
  @JsonKey(
    
    name: r'regen_rate',
    required: false,
    includeIfNull: false,
  )


  final double? regenRate;



      /// Shield regeneration time in seconds.
  @JsonKey(
    
    name: r'regen_time',
    required: false,
    includeIfNull: false,
  )


  final double? regenTime;



      /// Portion of regeneration lost when shield is taking damage.
  @JsonKey(
    
    name: r'decay_ratio',
    required: false,
    includeIfNull: false,
  )


  final double? decayRatio;



  @JsonKey(
    
    name: r'reserve_pool',
    required: false,
    includeIfNull: false,
  )


  final ShieldReservePool? reservePool;



  @JsonKey(
    
    name: r'regen_delay',
    required: false,
    includeIfNull: false,
  )


  final ShieldRegenDelay? regenDelay;



      /// Additional resistance to electrical charge damage.
  @JsonKey(
    
    name: r'electrical_charge_damage_resistance',
    required: false,
    includeIfNull: false,
  )


  final double? electricalChargeDamageResistance;



      /// Absorption ranges by damage type.
  @JsonKey(
    
    name: r'absorption',
    required: false,
    includeIfNull: false,
  )


  final ShieldDamageMap? absorption;



      /// Resistance ranges by damage type.
  @JsonKey(
    
    name: r'resistance',
    required: false,
    includeIfNull: false,
  )


  final ShieldDamageMap? resistance;



      /// Deprecated. Use `max_health`.
  @Deprecated('maxShieldHealth has been deprecated')
  @JsonKey(
    
    name: r'max_shield_health',
    required: false,
    includeIfNull: false,
  )


  final double? maxShieldHealth;



      /// Deprecated. Use `regen_rate`.
  @Deprecated('maxShieldRegen has been deprecated')
  @JsonKey(
    
    name: r'max_shield_regen',
    required: false,
    includeIfNull: false,
  )


  final double? maxShieldRegen;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Shield &&
      other.maxHealth == maxHealth &&
      other.regenRate == regenRate &&
      other.regenTime == regenTime &&
      other.decayRatio == decayRatio &&
      other.reservePool == reservePool &&
      other.regenDelay == regenDelay &&
      other.electricalChargeDamageResistance == electricalChargeDamageResistance &&
      other.absorption == absorption &&
      other.resistance == resistance &&
      other.maxShieldHealth == maxShieldHealth &&
      other.maxShieldRegen == maxShieldRegen;

    @override
    int get hashCode =>
        (maxHealth == null ? 0 : maxHealth.hashCode) +
        (regenRate == null ? 0 : regenRate.hashCode) +
        (regenTime == null ? 0 : regenTime.hashCode) +
        (decayRatio == null ? 0 : decayRatio.hashCode) +
        reservePool.hashCode +
        regenDelay.hashCode +
        (electricalChargeDamageResistance == null ? 0 : electricalChargeDamageResistance.hashCode) +
        (absorption == null ? 0 : absorption.hashCode) +
        (resistance == null ? 0 : resistance.hashCode) +
        (maxShieldHealth == null ? 0 : maxShieldHealth.hashCode) +
        (maxShieldRegen == null ? 0 : maxShieldRegen.hashCode);

  factory Shield.fromJson(Map<String, dynamic> json) => _$ShieldFromJson(json);

  Map<String, dynamic> toJson() => _$ShieldToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

