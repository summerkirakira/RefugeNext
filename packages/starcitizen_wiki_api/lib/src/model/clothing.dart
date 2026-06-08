//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/radiation_resistance.dart';
import 'package:starcitizen_wiki_api/src/model/clothing_resistances_inner.dart';
import 'package:json_annotation/json_annotation.dart';

part 'clothing.g.dart';


@Deprecated('Clothing has been deprecated')
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Clothing {
  /// Returns a new [Clothing] instance.
  Clothing({

     this.clothingType,

     this.slot,

     this.type,

     this.resistances,

     this.tempResistanceMin,

     this.tempResistanceMax,

     this.radiationResistance,

     this.gforceResistance,
  });

      /// Property is set if resource is of type \"clothing\". Superseded by type.
  @Deprecated('clothingType has been deprecated')
  @JsonKey(
    
    name: r'clothing_type',
    required: false,
    includeIfNull: false,
  )


  final String? clothingType;



      /// Clothing slot derived from the item classification (e.g. Torso, Legs, Arms, Head).
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





    @override
    bool operator ==(Object other) => identical(this, other) || other is Clothing &&
      other.clothingType == clothingType &&
      other.slot == slot &&
      other.type == type &&
      other.resistances == resistances &&
      other.tempResistanceMin == tempResistanceMin &&
      other.tempResistanceMax == tempResistanceMax &&
      other.radiationResistance == radiationResistance &&
      other.gforceResistance == gforceResistance;

    @override
    int get hashCode =>
        (clothingType == null ? 0 : clothingType.hashCode) +
        (slot == null ? 0 : slot.hashCode) +
        (type == null ? 0 : type.hashCode) +
        (resistances == null ? 0 : resistances.hashCode) +
        (tempResistanceMin == null ? 0 : tempResistanceMin.hashCode) +
        (tempResistanceMax == null ? 0 : tempResistanceMax.hashCode) +
        (radiationResistance == null ? 0 : radiationResistance.hashCode) +
        (gforceResistance == null ? 0 : gforceResistance.hashCode);

  factory Clothing.fromJson(Map<String, dynamic> json) => _$ClothingFromJson(json);

  Map<String, dynamic> toJson() => _$ClothingToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

