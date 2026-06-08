//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/suit_armor.dart';
import 'package:starcitizen_wiki_api/src/model/clothing.dart';
import 'package:starcitizen_wiki_api/src/model/radiation_resistance.dart';
import 'package:starcitizen_wiki_api/src/model/suit_armor_damage_resistance.dart';
import 'package:starcitizen_wiki_api/src/model/clothing_resistances_inner.dart';
import 'package:starcitizen_wiki_api/src/model/suit_armor_damage_resistance_map.dart';
import 'package:json_annotation/json_annotation.dart';

part 'game_item_clothing.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GameItemClothing {
  /// Returns a new [GameItemClothing] instance.
  GameItemClothing({

     this.clothingType,

     this.slot,

     this.type,

     this.resistances,

     this.tempResistanceMin,

     this.tempResistanceMax,

     this.radiationResistance,

     this.gforceResistance,

     this.armorType,

     this.damageResistance,

     this.damageResistanceMap,

     this.protectedBodyParts,

     this.signature,
  });

      /// Property is set if resource is of type \"clothing\". Superseded by type.
  @Deprecated('clothingType has been deprecated')
  @JsonKey(
    
    name: r'clothing_type',
    required: false,
    includeIfNull: false,
  )


  final String? clothingType;



      /// Armor slot derived from the item classification (e.g. Arms, Core, Legs, Helmet).
  @JsonKey(
    
    name: r'slot',
    required: false,
    includeIfNull: false,
  )


  final String? slot;



      /// Clothing type, not actually set in the game data but derived from the item name.
  @JsonKey(
    
    name: r'type',
    required: false,
    includeIfNull: false,
  )


  final String? type;



      /// Array of damage resistance entries for this clothing. Each entry includes damage type (physical, energy, distortion, thermal, biochemical, stun), damage multiplier (lower = more resistant), and damage threshold. Only damage types with defined multipliers are included.
  @JsonKey(
    
    name: r'resistances',
    required: false,
    includeIfNull: false,
  )


  final List<ClothingResistancesInner>? resistances;



      /// Deprecated: Use temperature_resistance from root.
  @Deprecated('tempResistanceMin has been deprecated')
  @JsonKey(
    
    name: r'temp_resistance_min',
    required: false,
    includeIfNull: false,
  )


  final double? tempResistanceMin;



      /// Deprecated: Use temperature_resistance from root.
  @Deprecated('tempResistanceMax has been deprecated')
  @JsonKey(
    
    name: r'temp_resistance_max',
    required: false,
    includeIfNull: false,
  )


  final double? tempResistanceMax;



      /// Radiation protection values from RadiationResistance.
  @JsonKey(
    
    name: r'radiation_resistance',
    required: false,
    includeIfNull: false,
  )


  final RadiationResistance? radiationResistance;



      /// G-force tolerance modifier from root. Positive increases tolerance, negative reduces it.
  @JsonKey(
    
    name: r'gforce_resistance',
    required: false,
    includeIfNull: false,
  )


  final double? gforceResistance;



      /// Deprecated legacy field. Use `slot`.
  @Deprecated('armorType has been deprecated')
  @JsonKey(
    
    name: r'armor_type',
    required: false,
    includeIfNull: false,
  )


  final String? armorType;



      /// Structured resistance values.
  @Deprecated('damageResistance has been deprecated')
  @JsonKey(
    
    name: r'damage_resistance',
    required: false,
    includeIfNull: false,
  )


  final SuitArmorDamageResistance? damageResistance;



      /// Flattened resistance values and multiplier deltas.
  @JsonKey(
    
    name: r'damage_resistance_map',
    required: false,
    includeIfNull: false,
  )


  final SuitArmorDamageResistanceMap? damageResistanceMap;



      /// UUIDs of body parts covered by this armor.
  @JsonKey(
    
    name: r'protected_body_parts',
    required: false,
    includeIfNull: false,
  )


  final List<String>? protectedBodyParts;



      /// Signature emissions produced by the armor (map form).
  @JsonKey(
    
    name: r'signature',
    required: false,
    includeIfNull: false,
  )


  final Map<String, num>? signature;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GameItemClothing &&
      other.clothingType == clothingType &&
      other.slot == slot &&
      other.type == type &&
      other.resistances == resistances &&
      other.tempResistanceMin == tempResistanceMin &&
      other.tempResistanceMax == tempResistanceMax &&
      other.radiationResistance == radiationResistance &&
      other.gforceResistance == gforceResistance &&
      other.armorType == armorType &&
      other.damageResistance == damageResistance &&
      other.damageResistanceMap == damageResistanceMap &&
      other.protectedBodyParts == protectedBodyParts &&
      other.signature == signature;

    @override
    int get hashCode =>
        (clothingType == null ? 0 : clothingType.hashCode) +
        (slot == null ? 0 : slot.hashCode) +
        (type == null ? 0 : type.hashCode) +
        (resistances == null ? 0 : resistances.hashCode) +
        (tempResistanceMin == null ? 0 : tempResistanceMin.hashCode) +
        (tempResistanceMax == null ? 0 : tempResistanceMax.hashCode) +
        (radiationResistance == null ? 0 : radiationResistance.hashCode) +
        (gforceResistance == null ? 0 : gforceResistance.hashCode) +
        (armorType == null ? 0 : armorType.hashCode) +
        (damageResistance == null ? 0 : damageResistance.hashCode) +
        (damageResistanceMap == null ? 0 : damageResistanceMap.hashCode) +
        protectedBodyParts.hashCode +
        (signature == null ? 0 : signature.hashCode);

  factory GameItemClothing.fromJson(Map<String, dynamic> json) => _$GameItemClothingFromJson(json);

  Map<String, dynamic> toJson() => _$GameItemClothingToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

