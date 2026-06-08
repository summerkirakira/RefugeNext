//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/medicine_all_of_consumption.dart';
import 'package:starcitizen_wiki_api/src/model/medicine_all_of_container.dart';
import 'package:json_annotation/json_annotation.dart';

part 'medicine.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Medicine {
  /// Returns a new [Medicine] instance.
  Medicine({

     this.nutrition,

     this.buffs,

     this.debuffs,

     this.container,

     this.consumption,

     this.nutritionalDensityRating,

     this.hydrationEfficacyIndex,

     this.containerType,

     this.oneShotConsume,

     this.canBeReclosed,

     this.discardWhenConsumed,

     this.effects,

     this.combatBuffs,

     this.impactResistances,
  });

      /// Dynamic map of nutrient name (snake_case) to total amount.
  @JsonKey(
    
    name: r'nutrition',
    required: false,
    includeIfNull: false,
  )


  final Map<String, num>? nutrition;



      /// Dynamic map of effect/buff type (snake_case) to duration in seconds.
  @JsonKey(
    
    name: r'buffs',
    required: false,
    includeIfNull: false,
  )


  final Map<String, num>? buffs;



      /// Dynamic map of debuff type (snake_case) to duration in seconds.
  @JsonKey(
    
    name: r'debuffs',
    required: false,
    includeIfNull: false,
  )


  final Map<String, num>? debuffs;



  @JsonKey(
    
    name: r'container',
    required: false,
    includeIfNull: false,
  )


  final MedicineAllOfContainer? container;



  @JsonKey(
    
    name: r'consumption',
    required: false,
    includeIfNull: false,
  )


  final MedicineAllOfConsumption? consumption;



      /// Nutritional density rating (NDR) from food data or description.
  @JsonKey(
    
    name: r'nutritional_density_rating',
    required: false,
    includeIfNull: false,
  )


  final String? nutritionalDensityRating;



      /// Hydration efficacy index (HEI) from food data or description.
  @JsonKey(
    
    name: r'hydration_efficacy_index',
    required: false,
    includeIfNull: false,
  )


  final String? hydrationEfficacyIndex;



      /// Deprecated. Use `container.type`.
  @Deprecated('containerType has been deprecated')
  @JsonKey(
    
    name: r'container_type',
    required: false,
    includeIfNull: false,
  )


  final String? containerType;



      /// Deprecated. Use `consumption.one_shot_consume`.
  @Deprecated('oneShotConsume has been deprecated')
  @JsonKey(
    
    name: r'one_shot_consume',
    required: false,
    includeIfNull: false,
  )


  final bool? oneShotConsume;



      /// Deprecated. Use `container.can_be_reclosed`.
  @Deprecated('canBeReclosed has been deprecated')
  @JsonKey(
    
    name: r'can_be_reclosed',
    required: false,
    includeIfNull: false,
  )


  final bool? canBeReclosed;



      /// Deprecated. Use `container.discard_when_consumed`.
  @Deprecated('discardWhenConsumed has been deprecated')
  @JsonKey(
    
    name: r'discard_when_consumed',
    required: false,
    includeIfNull: false,
  )


  final bool? discardWhenConsumed;



      /// List of effect strings (parsed from food data or description). Null when no effects are present.
  @JsonKey(
    
    name: r'effects',
    required: false,
    includeIfNull: false,
  )


  final List<String>? effects;



      /// Dynamic map of combat buff flags (derived from MedicalEffects.CombatBuffs). Keys are normalized (snake_case, without `_mask`). Values are boolean flags.
  @JsonKey(
    
    name: r'combat_buffs',
    required: false,
    includeIfNull: false,
  )


  final Map<String, bool>? combatBuffs;



      /// Dynamic map of impact resistance flags (derived from MedicalEffects.ImpactResistance). Keys are normalized (snake_case, without `impact_resistance_` or `_mask`). Values are boolean flags.
  @JsonKey(
    
    name: r'impact_resistances',
    required: false,
    includeIfNull: false,
  )


  final Map<String, bool>? impactResistances;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Medicine &&
      other.nutrition == nutrition &&
      other.buffs == buffs &&
      other.debuffs == debuffs &&
      other.container == container &&
      other.consumption == consumption &&
      other.nutritionalDensityRating == nutritionalDensityRating &&
      other.hydrationEfficacyIndex == hydrationEfficacyIndex &&
      other.containerType == containerType &&
      other.oneShotConsume == oneShotConsume &&
      other.canBeReclosed == canBeReclosed &&
      other.discardWhenConsumed == discardWhenConsumed &&
      other.effects == effects &&
      other.combatBuffs == combatBuffs &&
      other.impactResistances == impactResistances;

    @override
    int get hashCode =>
        nutrition.hashCode +
        buffs.hashCode +
        debuffs.hashCode +
        container.hashCode +
        consumption.hashCode +
        (nutritionalDensityRating == null ? 0 : nutritionalDensityRating.hashCode) +
        (hydrationEfficacyIndex == null ? 0 : hydrationEfficacyIndex.hashCode) +
        (containerType == null ? 0 : containerType.hashCode) +
        (oneShotConsume == null ? 0 : oneShotConsume.hashCode) +
        (canBeReclosed == null ? 0 : canBeReclosed.hashCode) +
        (discardWhenConsumed == null ? 0 : discardWhenConsumed.hashCode) +
        (effects == null ? 0 : effects.hashCode) +
        combatBuffs.hashCode +
        impactResistances.hashCode;

  factory Medicine.fromJson(Map<String, dynamic> json) => _$MedicineFromJson(json);

  Map<String, dynamic> toJson() => _$MedicineToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

