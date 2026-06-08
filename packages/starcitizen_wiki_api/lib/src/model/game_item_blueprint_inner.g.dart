// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_item_blueprint_inner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameItemBlueprintInner _$GameItemBlueprintInnerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'GameItemBlueprintInner',
  json,
  ($checkedConvert) {
    final val = GameItemBlueprintInner(
      uuid: $checkedConvert('uuid', (v) => v as String?),
      name: $checkedConvert('name', (v) => v as String?),
      link: $checkedConvert('link', (v) => v as String?),
      key: $checkedConvert('key', (v) => v as String?),
      categoryUuid: $checkedConvert('category_uuid', (v) => v as String?),
      outputItemUuid: $checkedConvert('output_item_uuid', (v) => v as String?),
      outputName: $checkedConvert('output_name', (v) => v as String?),
      outputClass: $checkedConvert('output_class', (v) => v as String?),
      craftTimeSeconds: $checkedConvert(
        'craft_time_seconds',
        (v) => (v as num?)?.toInt(),
      ),
      craftTimeLabel: $checkedConvert('craft_time_label', (v) => v as String?),
      isAvailableByDefault: $checkedConvert(
        'is_available_by_default',
        (v) => v as bool?,
      ),
      gameVersion: $checkedConvert('game_version', (v) => v as String?),
      ingredientCount: $checkedConvert(
        'ingredient_count',
        (v) => (v as num?)?.toInt(),
      ),
      unlockingMissionsCount: $checkedConvert(
        'unlocking_missions_count',
        (v) => (v as num?)?.toInt(),
      ),
      ingredients: $checkedConvert(
        'ingredients',
        (v) => (v as List<dynamic>?)
            ?.map(
              (e) => BlueprintIngredient.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
      dismantleReturns: $checkedConvert(
        'dismantle_returns',
        (v) => (v as List<dynamic>?)
            ?.map(
              (e) => BlueprintDismantleReturnSummary.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
      output: $checkedConvert(
        'output',
        (v) => v == null
            ? null
            : BlueprintOutput.fromJson(v as Map<String, dynamic>),
      ),
      dismantle: $checkedConvert(
        'dismantle',
        (v) => v == null
            ? null
            : BlueprintDismantle.fromJson(v as Map<String, dynamic>),
      ),
      requirementGroups: $checkedConvert(
        'requirement_groups',
        (v) => (v as List<dynamic>?)
            ?.map(
              (e) =>
                  BlueprintRequirementGroup.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
      summaryProperties: $checkedConvert(
        'summary_properties',
        (v) => (v as List<dynamic>?)
            ?.map(
              (e) =>
                  BlueprintSummaryProperty.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
      unlockingMissions: $checkedConvert(
        'unlocking_missions',
        (v) => (v as List<dynamic>?)
            ?.map(
              (e) =>
                  BlueprintUnlockingMission.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
      unlockingMissionsGrouped: $checkedConvert(
        'unlocking_missions_grouped',
        (v) => (v as List<dynamic>?)
            ?.map(
              (e) => BlueprintUnlockingMissionsGrouped.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
      aspects: $checkedConvert(
        'aspects',
        (v) => v == null
            ? null
            : BlueprintAspects.fromJson(v as Map<String, dynamic>),
      ),
      tiers: $checkedConvert(
        'tiers',
        (v) => (v as List<dynamic>?)
            ?.map((e) => BlueprintTier.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      webUrl: $checkedConvert('web_url', (v) => v as String?),
      outputItemWebUrl: $checkedConvert(
        'output_item_web_url',
        (v) => v as String?,
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'categoryUuid': 'category_uuid',
    'outputItemUuid': 'output_item_uuid',
    'outputName': 'output_name',
    'outputClass': 'output_class',
    'craftTimeSeconds': 'craft_time_seconds',
    'craftTimeLabel': 'craft_time_label',
    'isAvailableByDefault': 'is_available_by_default',
    'gameVersion': 'game_version',
    'ingredientCount': 'ingredient_count',
    'unlockingMissionsCount': 'unlocking_missions_count',
    'dismantleReturns': 'dismantle_returns',
    'requirementGroups': 'requirement_groups',
    'summaryProperties': 'summary_properties',
    'unlockingMissions': 'unlocking_missions',
    'unlockingMissionsGrouped': 'unlocking_missions_grouped',
    'webUrl': 'web_url',
    'outputItemWebUrl': 'output_item_web_url',
  },
);

Map<String, dynamic> _$GameItemBlueprintInnerToJson(
  GameItemBlueprintInner instance,
) => <String, dynamic>{
  'uuid': ?instance.uuid,
  'name': ?instance.name,
  'link': ?instance.link,
  'key': ?instance.key,
  'category_uuid': ?instance.categoryUuid,
  'output_item_uuid': ?instance.outputItemUuid,
  'output_name': ?instance.outputName,
  'output_class': ?instance.outputClass,
  'craft_time_seconds': ?instance.craftTimeSeconds,
  'craft_time_label': ?instance.craftTimeLabel,
  'is_available_by_default': ?instance.isAvailableByDefault,
  'game_version': ?instance.gameVersion,
  'ingredient_count': ?instance.ingredientCount,
  'unlocking_missions_count': ?instance.unlockingMissionsCount,
  'ingredients': ?instance.ingredients?.map((e) => e.toJson()).toList(),
  'dismantle_returns': ?instance.dismantleReturns
      ?.map((e) => e.toJson())
      .toList(),
  'output': ?instance.output?.toJson(),
  'dismantle': ?instance.dismantle?.toJson(),
  'requirement_groups': ?instance.requirementGroups
      ?.map((e) => e.toJson())
      .toList(),
  'summary_properties': ?instance.summaryProperties
      ?.map((e) => e.toJson())
      .toList(),
  'unlocking_missions': ?instance.unlockingMissions
      ?.map((e) => e.toJson())
      .toList(),
  'unlocking_missions_grouped': ?instance.unlockingMissionsGrouped
      ?.map((e) => e.toJson())
      .toList(),
  'aspects': ?instance.aspects?.toJson(),
  'tiers': ?instance.tiers?.map((e) => e.toJson()).toList(),
  'web_url': ?instance.webUrl,
  'output_item_web_url': ?instance.outputItemWebUrl,
};
