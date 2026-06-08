//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/blueprint_dismantle.dart';
import 'package:starcitizen_wiki_api/src/model/blueprint.dart';
import 'package:starcitizen_wiki_api/src/model/blueprint_unlocking_mission.dart';
import 'package:starcitizen_wiki_api/src/model/blueprint_ingredient.dart';
import 'package:starcitizen_wiki_api/src/model/blueprint_summary_property.dart';
import 'package:starcitizen_wiki_api/src/model/blueprint_unlocking_missions_grouped.dart';
import 'package:starcitizen_wiki_api/src/model/blueprint_requirement_group.dart';
import 'package:starcitizen_wiki_api/src/model/blueprint_tier.dart';
import 'package:starcitizen_wiki_api/src/model/blueprint_dismantle_return_summary.dart';
import 'package:starcitizen_wiki_api/src/model/blueprint_output.dart';
import 'package:starcitizen_wiki_api/src/model/item_blueprint_link.dart';
import 'package:starcitizen_wiki_api/src/model/blueprint_aspects.dart';
import 'package:json_annotation/json_annotation.dart';

part 'game_item_blueprint_inner.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GameItemBlueprintInner {
  /// Returns a new [GameItemBlueprintInner] instance.
  GameItemBlueprintInner({

     this.uuid,

     this.name,

     this.link,

     this.key,

     this.categoryUuid,

     this.outputItemUuid,

     this.outputName,

     this.outputClass,

     this.craftTimeSeconds,

     this.craftTimeLabel,

     this.isAvailableByDefault,

     this.gameVersion,

     this.ingredientCount,

     this.unlockingMissionsCount,

     this.ingredients,

     this.dismantleReturns,

     this.output,

     this.dismantle,

     this.requirementGroups,

     this.summaryProperties,

     this.unlockingMissions,

     this.unlockingMissionsGrouped,

     this.aspects,

     this.tiers,

     this.webUrl,

     this.outputItemWebUrl,
  });

      /// Unique blueprint identifier
  @JsonKey(
    
    name: r'uuid',
    required: false,
    includeIfNull: false,
  )


  final String? uuid;



      /// Display name of the blueprint.
  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



      /// API URL for this blueprint
  @JsonKey(
    
    name: r'link',
    required: false,
    includeIfNull: false,
  )


  final String? link;



      /// Internal blueprint key (e.g. BP_CRAFT_behr_pistol_ballistic_01)
  @JsonKey(
    
    name: r'key',
    required: false,
    includeIfNull: false,
  )


  final String? key;



      /// UUID of the blueprint category
  @JsonKey(
    
    name: r'category_uuid',
    required: false,
    includeIfNull: false,
  )


  final String? categoryUuid;



      /// UUID of the item this blueprint crafts
  @JsonKey(
    
    name: r'output_item_uuid',
    required: false,
    includeIfNull: false,
  )


  final String? outputItemUuid;



      /// Display name of the crafted item
  @JsonKey(
    
    name: r'output_name',
    required: false,
    includeIfNull: false,
  )


  final String? outputName;



      /// Internal class identifier of the crafted item
  @JsonKey(
    
    name: r'output_class',
    required: false,
    includeIfNull: false,
  )


  final String? outputClass;



      /// Crafting duration in seconds
  @JsonKey(
    
    name: r'craft_time_seconds',
    required: false,
    includeIfNull: false,
  )


  final int? craftTimeSeconds;



      /// Human-readable crafting duration
  @JsonKey(
    
    name: r'craft_time_label',
    required: false,
    includeIfNull: false,
  )


  final String? craftTimeLabel;



      /// Whether this blueprint is available without unlocking
  @JsonKey(
    
    name: r'is_available_by_default',
    required: false,
    includeIfNull: false,
  )


  final bool? isAvailableByDefault;



      /// Game version code this data applies to
  @JsonKey(
    
    name: r'game_version',
    required: false,
    includeIfNull: false,
  )


  final String? gameVersion;



      /// Total number of distinct ingredients across all requirement groups
  @JsonKey(
    
    name: r'ingredient_count',
    required: false,
    includeIfNull: false,
  )


  final int? ingredientCount;



      /// Number of missions that can unlock this blueprint
  @JsonKey(
    
    name: r'unlocking_missions_count',
    required: false,
    includeIfNull: false,
  )


  final int? unlockingMissionsCount;



      /// Ingredients required to craft the item
  @JsonKey(
    
    name: r'ingredients',
    required: false,
    includeIfNull: false,
  )


  final List<BlueprintIngredient>? ingredients;



      /// Resources returned when dismantling the crafted item
  @JsonKey(
    
    name: r'dismantle_returns',
    required: false,
    includeIfNull: false,
  )


  final List<BlueprintDismantleReturnSummary>? dismantleReturns;



  @JsonKey(
    
    name: r'output',
    required: false,
    includeIfNull: false,
  )


  final BlueprintOutput? output;



  @JsonKey(
    
    name: r'dismantle',
    required: false,
    includeIfNull: false,
  )


  final BlueprintDismantle? dismantle;



      /// Only included on blueprint detail responses.
  @JsonKey(
    
    name: r'requirement_groups',
    required: false,
    includeIfNull: false,
  )


  final List<BlueprintRequirementGroup>? requirementGroups;



      /// Only included on blueprint detail responses.
  @JsonKey(
    
    name: r'summary_properties',
    required: false,
    includeIfNull: false,
  )


  final List<BlueprintSummaryProperty>? summaryProperties;



      /// Only included on blueprint detail responses.
  @JsonKey(
    
    name: r'unlocking_missions',
    required: false,
    includeIfNull: false,
  )


  final List<BlueprintUnlockingMission>? unlockingMissions;



      /// Only included on blueprint detail responses.
  @JsonKey(
    
    name: r'unlocking_missions_grouped',
    required: false,
    includeIfNull: false,
  )


  final List<BlueprintUnlockingMissionsGrouped>? unlockingMissionsGrouped;



  @JsonKey(
    
    name: r'aspects',
    required: false,
    includeIfNull: false,
  )


  final BlueprintAspects? aspects;



      /// Only included on blueprint detail responses.
  @JsonKey(
    
    name: r'tiers',
    required: false,
    includeIfNull: false,
  )


  final List<BlueprintTier>? tiers;



      /// Web URL for the blueprint detail page
  @JsonKey(
    
    name: r'web_url',
    required: false,
    includeIfNull: false,
  )


  final String? webUrl;



      /// Web URL for the crafted item detail page
  @JsonKey(
    
    name: r'output_item_web_url',
    required: false,
    includeIfNull: false,
  )


  final String? outputItemWebUrl;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GameItemBlueprintInner &&
      other.uuid == uuid &&
      other.name == name &&
      other.link == link &&
      other.key == key &&
      other.categoryUuid == categoryUuid &&
      other.outputItemUuid == outputItemUuid &&
      other.outputName == outputName &&
      other.outputClass == outputClass &&
      other.craftTimeSeconds == craftTimeSeconds &&
      other.craftTimeLabel == craftTimeLabel &&
      other.isAvailableByDefault == isAvailableByDefault &&
      other.gameVersion == gameVersion &&
      other.ingredientCount == ingredientCount &&
      other.unlockingMissionsCount == unlockingMissionsCount &&
      other.ingredients == ingredients &&
      other.dismantleReturns == dismantleReturns &&
      other.output == output &&
      other.dismantle == dismantle &&
      other.requirementGroups == requirementGroups &&
      other.summaryProperties == summaryProperties &&
      other.unlockingMissions == unlockingMissions &&
      other.unlockingMissionsGrouped == unlockingMissionsGrouped &&
      other.aspects == aspects &&
      other.tiers == tiers &&
      other.webUrl == webUrl &&
      other.outputItemWebUrl == outputItemWebUrl;

    @override
    int get hashCode =>
        uuid.hashCode +
        name.hashCode +
        link.hashCode +
        key.hashCode +
        categoryUuid.hashCode +
        outputItemUuid.hashCode +
        (outputName == null ? 0 : outputName.hashCode) +
        (outputClass == null ? 0 : outputClass.hashCode) +
        (craftTimeSeconds == null ? 0 : craftTimeSeconds.hashCode) +
        (craftTimeLabel == null ? 0 : craftTimeLabel.hashCode) +
        isAvailableByDefault.hashCode +
        (gameVersion == null ? 0 : gameVersion.hashCode) +
        ingredientCount.hashCode +
        unlockingMissionsCount.hashCode +
        ingredients.hashCode +
        dismantleReturns.hashCode +
        output.hashCode +
        dismantle.hashCode +
        requirementGroups.hashCode +
        summaryProperties.hashCode +
        unlockingMissions.hashCode +
        unlockingMissionsGrouped.hashCode +
        aspects.hashCode +
        tiers.hashCode +
        webUrl.hashCode +
        (outputItemWebUrl == null ? 0 : outputItemWebUrl.hashCode);

  factory GameItemBlueprintInner.fromJson(Map<String, dynamic> json) => _$GameItemBlueprintInnerFromJson(json);

  Map<String, dynamic> toJson() => _$GameItemBlueprintInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

