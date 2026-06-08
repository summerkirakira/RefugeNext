// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'starcitizen_wiki.models.swagger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilterValue _$FilterValueFromJson(Map<String, dynamic> json) => FilterValue(
      value: json['value'],
      label: json['label'] as String?,
      count: (json['count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$FilterValueToJson(FilterValue instance) =>
    <String, dynamic>{
      'value': instance.value,
      'label': instance.label,
      'count': instance.count,
    };

BlueprintOutput _$BlueprintOutputFromJson(Map<String, dynamic> json) =>
    BlueprintOutput(
      uuid: json['uuid'] as String?,
      name: json['name'] as String?,
      $class: json['class'] as String?,
      type: json['type'] as String?,
      typeLabel: json['type_label'] as String?,
      subType: json['sub_type'] as String?,
      subtype: json['subtype'] as String?,
      grade: json['grade'] as String?,
      itemWebUrl: json['item_web_url'] as String?,
    );

Map<String, dynamic> _$BlueprintOutputToJson(BlueprintOutput instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'class': instance.$class,
      'type': instance.type,
      'type_label': instance.typeLabel,
      'sub_type': instance.subType,
      'subtype': instance.subtype,
      'grade': instance.grade,
      'item_web_url': instance.itemWebUrl,
    };

BlueprintModifierQualityRange _$BlueprintModifierQualityRangeFromJson(
        Map<String, dynamic> json) =>
    BlueprintModifierQualityRange(
      min: (json['min'] as num?)?.toDouble(),
      max: (json['max'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$BlueprintModifierQualityRangeToJson(
        BlueprintModifierQualityRange instance) =>
    <String, dynamic>{
      'min': instance.min,
      'max': instance.max,
    };

BlueprintModifierRange _$BlueprintModifierRangeFromJson(
        Map<String, dynamic> json) =>
    BlueprintModifierRange(
      atMinQuality: (json['at_min_quality'] as num?)?.toDouble(),
      atMaxQuality: (json['at_max_quality'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$BlueprintModifierRangeToJson(
        BlueprintModifierRange instance) =>
    <String, dynamic>{
      'at_min_quality': instance.atMinQuality,
      'at_max_quality': instance.atMaxQuality,
    };

BlueprintModifier _$BlueprintModifierFromJson(Map<String, dynamic> json) =>
    BlueprintModifier(
      propertyKey: json['property_key'] as String?,
      propertyUuid: json['property_uuid'] as String?,
      label: json['label'] as String?,
      betterWhen:
          blueprintModifierBetterWhenNullableFromJson(json['better_when']),
      qualityRange: json['quality_range'] == null
          ? null
          : BlueprintModifierQualityRange.fromJson(
              json['quality_range'] as Map<String, dynamic>),
      modifierRange: json['modifier_range'] == null
          ? null
          : BlueprintModifierRange.fromJson(
              json['modifier_range'] as Map<String, dynamic>),
      valueRangeType: blueprintModifierValueRangeTypeNullableFromJson(
          json['value_range_type']),
      valueSegments: (json['value_segments'] as List<dynamic>?)
          ?.map((e) => BlueprintModifier$ValueSegments$Item.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BlueprintModifierToJson(BlueprintModifier instance) =>
    <String, dynamic>{
      'property_key': instance.propertyKey,
      'property_uuid': instance.propertyUuid,
      'label': instance.label,
      'better_when':
          blueprintModifierBetterWhenNullableToJson(instance.betterWhen),
      'quality_range': instance.qualityRange?.toJson(),
      'modifier_range': instance.modifierRange?.toJson(),
      'value_range_type': blueprintModifierValueRangeTypeNullableToJson(
          instance.valueRangeType),
      'value_segments': instance.valueSegments?.map((e) => e.toJson()).toList(),
    };

BlueprintSummaryProperty _$BlueprintSummaryPropertyFromJson(
        Map<String, dynamic> json) =>
    BlueprintSummaryProperty(
      propertyKey: json['property_key'] as String?,
      propertyUuid: json['property_uuid'] as String?,
      label: json['label'] as String?,
      betterWhen: blueprintSummaryPropertyBetterWhenNullableFromJson(
          json['better_when']),
    );

Map<String, dynamic> _$BlueprintSummaryPropertyToJson(
        BlueprintSummaryProperty instance) =>
    <String, dynamic>{
      'property_key': instance.propertyKey,
      'property_uuid': instance.propertyUuid,
      'label': instance.label,
      'better_when':
          blueprintSummaryPropertyBetterWhenNullableToJson(instance.betterWhen),
    };

BlueprintRequirementChild _$BlueprintRequirementChildFromJson(
        Map<String, dynamic> json) =>
    BlueprintRequirementChild(
      key: json['key'] as String?,
      kind: blueprintRequirementChildKindNullableFromJson(json['kind']),
      uuid: json['uuid'] as String?,
      name: json['name'] as String?,
      requiredCount: (json['required_count'] as num?)?.toInt(),
      quantity: (json['quantity'] as num?)?.toDouble(),
      quantityScu: (json['quantity_scu'] as num?)?.toDouble(),
      minQuality: (json['min_quality'] as num?)?.toInt(),
      modifiers: (json['modifiers'] as List<dynamic>?)
              ?.map(
                  (e) => BlueprintModifier.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      children: (json['children'] as List<dynamic>?)
              ?.map((e) =>
                  BlueprintRequirementChild.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$BlueprintRequirementChildToJson(
        BlueprintRequirementChild instance) =>
    <String, dynamic>{
      'key': instance.key,
      'kind': blueprintRequirementChildKindNullableToJson(instance.kind),
      'uuid': instance.uuid,
      'name': instance.name,
      'required_count': instance.requiredCount,
      'quantity': instance.quantity,
      'quantity_scu': instance.quantityScu,
      'min_quality': instance.minQuality,
      'modifiers': instance.modifiers?.map((e) => e.toJson()).toList(),
      'children': instance.children?.map((e) => e.toJson()).toList(),
    };

BlueprintRequirementGroup _$BlueprintRequirementGroupFromJson(
        Map<String, dynamic> json) =>
    BlueprintRequirementGroup(
      key: json['key'] as String?,
      name: json['name'] as String?,
      kind: blueprintRequirementGroupKindNullableFromJson(json['kind']),
      requiredCount: (json['required_count'] as num?)?.toInt(),
      modifiers: (json['modifiers'] as List<dynamic>?)
              ?.map(
                  (e) => BlueprintModifier.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      children: (json['children'] as List<dynamic>?)
              ?.map((e) =>
                  BlueprintRequirementChild.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$BlueprintRequirementGroupToJson(
        BlueprintRequirementGroup instance) =>
    <String, dynamic>{
      'key': instance.key,
      'name': instance.name,
      'kind': blueprintRequirementGroupKindNullableToJson(instance.kind),
      'required_count': instance.requiredCount,
      'modifiers': instance.modifiers?.map((e) => e.toJson()).toList(),
      'children': instance.children?.map((e) => e.toJson()).toList(),
    };

BlueprintRequirementNode _$BlueprintRequirementNodeFromJson(
        Map<String, dynamic> json) =>
    BlueprintRequirementNode(
      kind: blueprintRequirementNodeKindNullableFromJson(json['kind']),
      key: json['key'] as String?,
      name: json['name'] as String?,
      uuid: json['uuid'] as String?,
      requiredCount: (json['required_count'] as num?)?.toInt(),
      quantity: (json['quantity'] as num?)?.toDouble(),
      quantityScu: (json['quantity_scu'] as num?)?.toDouble(),
      minQuality: (json['min_quality'] as num?)?.toInt(),
      modifiers: (json['modifiers'] as List<dynamic>?)
              ?.map(
                  (e) => BlueprintModifier.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      children: (json['children'] as List<dynamic>?)
              ?.map((e) =>
                  BlueprintRequirementNode.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$BlueprintRequirementNodeToJson(
        BlueprintRequirementNode instance) =>
    <String, dynamic>{
      'kind': blueprintRequirementNodeKindNullableToJson(instance.kind),
      'key': instance.key,
      'name': instance.name,
      'uuid': instance.uuid,
      'required_count': instance.requiredCount,
      'quantity': instance.quantity,
      'quantity_scu': instance.quantityScu,
      'min_quality': instance.minQuality,
      'modifiers': instance.modifiers?.map((e) => e.toJson()).toList(),
      'children': instance.children?.map((e) => e.toJson()).toList(),
    };

BlueprintTier _$BlueprintTierFromJson(Map<String, dynamic> json) =>
    BlueprintTier(
      tierIndex: (json['tier_index'] as num?)?.toInt(),
      craftTimeSeconds: (json['craft_time_seconds'] as num?)?.toInt(),
      requirements: json['requirements'],
    );

Map<String, dynamic> _$BlueprintTierToJson(BlueprintTier instance) =>
    <String, dynamic>{
      'tier_index': instance.tierIndex,
      'craft_time_seconds': instance.craftTimeSeconds,
      'requirements': instance.requirements,
    };

BlueprintIngredient _$BlueprintIngredientFromJson(Map<String, dynamic> json) =>
    BlueprintIngredient(
      name: json['name'] as String?,
      kind: blueprintIngredientKindNullableFromJson(json['kind']),
      resourceTypeUuid: json['resource_type_uuid'] as String?,
      itemUuid: json['item_uuid'] as String?,
      quantityScu: (json['quantity_scu'] as num?)?.toDouble(),
      quantity: (json['quantity'] as num?)?.toDouble(),
      link: json['link'] as String?,
      webUrl: json['web_url'] as String?,
    );

Map<String, dynamic> _$BlueprintIngredientToJson(
        BlueprintIngredient instance) =>
    <String, dynamic>{
      'name': instance.name,
      'kind': blueprintIngredientKindNullableToJson(instance.kind),
      'resource_type_uuid': instance.resourceTypeUuid,
      'item_uuid': instance.itemUuid,
      'quantity_scu': instance.quantityScu,
      'quantity': instance.quantity,
      'link': instance.link,
      'web_url': instance.webUrl,
    };

BlueprintDismantleReturnSummary _$BlueprintDismantleReturnSummaryFromJson(
        Map<String, dynamic> json) =>
    BlueprintDismantleReturnSummary(
      name: json['name'] as String?,
      resourceTypeUuid: json['resource_type_uuid'] as String?,
      quantityScu: (json['quantity_scu'] as num?)?.toDouble(),
      link: json['link'] as String?,
      webUrl: json['web_url'] as String?,
    );

Map<String, dynamic> _$BlueprintDismantleReturnSummaryToJson(
        BlueprintDismantleReturnSummary instance) =>
    <String, dynamic>{
      'name': instance.name,
      'resource_type_uuid': instance.resourceTypeUuid,
      'quantity_scu': instance.quantityScu,
      'link': instance.link,
      'web_url': instance.webUrl,
    };

BlueprintDismantle _$BlueprintDismantleFromJson(Map<String, dynamic> json) =>
    BlueprintDismantle(
      timeSeconds: (json['time_seconds'] as num?)?.toInt(),
      timeLabel: json['time_label'] as String?,
      efficiency: (json['efficiency'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$BlueprintDismantleToJson(BlueprintDismantle instance) =>
    <String, dynamic>{
      'time_seconds': instance.timeSeconds,
      'time_label': instance.timeLabel,
      'efficiency': instance.efficiency,
    };

BlueprintUnlockingMission _$BlueprintUnlockingMissionFromJson(
        Map<String, dynamic> json) =>
    BlueprintUnlockingMission(
      title: json['title'] as String?,
      debugName: json['debug_name'] as String?,
      rewardScope: json['reward_scope'] as String?,
      chance: (json['chance'] as num?)?.toDouble(),
      webUrl: json['web_url'] as String?,
    );

Map<String, dynamic> _$BlueprintUnlockingMissionToJson(
        BlueprintUnlockingMission instance) =>
    <String, dynamic>{
      'title': instance.title,
      'debug_name': instance.debugName,
      'reward_scope': instance.rewardScope,
      'chance': instance.chance,
      'web_url': instance.webUrl,
    };

BlueprintUnlockingMissionsGroupedEntry
    _$BlueprintUnlockingMissionsGroupedEntryFromJson(
            Map<String, dynamic> json) =>
        BlueprintUnlockingMissionsGroupedEntry(
          title: json['title'] as String?,
          rewardScope: json['reward_scope'] as String?,
          count: (json['count'] as num?)?.toInt(),
          webUrl: json['web_url'] as String?,
        );

Map<String, dynamic> _$BlueprintUnlockingMissionsGroupedEntryToJson(
        BlueprintUnlockingMissionsGroupedEntry instance) =>
    <String, dynamic>{
      'title': instance.title,
      'reward_scope': instance.rewardScope,
      'count': instance.count,
      'web_url': instance.webUrl,
    };

BlueprintUnlockingMissionsGrouped _$BlueprintUnlockingMissionsGroupedFromJson(
        Map<String, dynamic> json) =>
    BlueprintUnlockingMissionsGrouped(
      label: json['label'] as String?,
      chance: (json['chance'] as num?)?.toDouble(),
      missions: (json['missions'] as List<dynamic>?)
              ?.map((e) => BlueprintUnlockingMissionsGroupedEntry.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$BlueprintUnlockingMissionsGroupedToJson(
        BlueprintUnlockingMissionsGrouped instance) =>
    <String, dynamic>{
      'label': instance.label,
      'chance': instance.chance,
      'missions': instance.missions?.map((e) => e.toJson()).toList(),
    };

BlueprintAspectInput _$BlueprintAspectInputFromJson(
        Map<String, dynamic> json) =>
    BlueprintAspectInput(
      kind: json['kind'] as String?,
      uuid: json['uuid'] as String?,
      name: json['name'] as String?,
      quantity: (json['quantity'] as num?)?.toDouble(),
      quantityScu: (json['quantity_scu'] as num?)?.toDouble(),
      minQuality: (json['min_quality'] as num?)?.toInt(),
      webUrl: json['web_url'] as String?,
    );

Map<String, dynamic> _$BlueprintAspectInputToJson(
        BlueprintAspectInput instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'uuid': instance.uuid,
      'name': instance.name,
      'quantity': instance.quantity,
      'quantity_scu': instance.quantityScu,
      'min_quality': instance.minQuality,
      'web_url': instance.webUrl,
    };

BlueprintAspectSelectionGroup _$BlueprintAspectSelectionGroupFromJson(
        Map<String, dynamic> json) =>
    BlueprintAspectSelectionGroup(
      key: json['key'] as String?,
      name: json['name'] as String?,
      requiredCount: (json['required_count'] as num?)?.toInt(),
      optionCount: (json['option_count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$BlueprintAspectSelectionGroupToJson(
        BlueprintAspectSelectionGroup instance) =>
    <String, dynamic>{
      'key': instance.key,
      'name': instance.name,
      'required_count': instance.requiredCount,
      'option_count': instance.optionCount,
    };

BlueprintAspect _$BlueprintAspectFromJson(Map<String, dynamic> json) =>
    BlueprintAspect(
      key: json['key'] as String?,
      name: json['name'] as String?,
      requiredCount: (json['required_count'] as num?)?.toInt(),
      selectionGroup: json['selection_group'],
      input: json['input'] == null
          ? null
          : BlueprintAspectInput.fromJson(
              json['input'] as Map<String, dynamic>),
      modifiers: (json['modifiers'] as List<dynamic>?)
              ?.map(
                  (e) => BlueprintModifier.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      initialQuality: (json['initial_quality'] as num?)?.toInt(),
      sliderMin: (json['slider_min'] as num?)?.toInt(),
      sliderMax: (json['slider_max'] as num?)?.toInt(),
      hasModifiers: json['has_modifiers'] as bool?,
      hasDynamicModifiers: json['has_dynamic_modifiers'] as bool?,
      isSelected: json['is_selected'] as bool?,
    );

Map<String, dynamic> _$BlueprintAspectToJson(BlueprintAspect instance) =>
    <String, dynamic>{
      'key': instance.key,
      'name': instance.name,
      'required_count': instance.requiredCount,
      'selection_group': instance.selectionGroup,
      'input': instance.input?.toJson(),
      'modifiers': instance.modifiers?.map((e) => e.toJson()).toList(),
      'initial_quality': instance.initialQuality,
      'slider_min': instance.sliderMin,
      'slider_max': instance.sliderMax,
      'has_modifiers': instance.hasModifiers,
      'has_dynamic_modifiers': instance.hasDynamicModifiers,
      'is_selected': instance.isSelected,
    };

BlueprintAspectGroup _$BlueprintAspectGroupFromJson(
        Map<String, dynamic> json) =>
    BlueprintAspectGroup(
      key: json['key'] as String?,
      name: json['name'] as String?,
      displayName: json['display_name'] as String?,
      requiredCount: (json['required_count'] as num?)?.toInt(),
      optionCount: (json['option_count'] as num?)?.toInt(),
      isChoiceGroup: json['is_choice_group'] as bool?,
      selectedCount: (json['selected_count'] as num?)?.toInt(),
      aspectIndexes: (json['aspect_indexes'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          [],
    );

Map<String, dynamic> _$BlueprintAspectGroupToJson(
        BlueprintAspectGroup instance) =>
    <String, dynamic>{
      'key': instance.key,
      'name': instance.name,
      'display_name': instance.displayName,
      'required_count': instance.requiredCount,
      'option_count': instance.optionCount,
      'is_choice_group': instance.isChoiceGroup,
      'selected_count': instance.selectedCount,
      'aspect_indexes': instance.aspectIndexes,
    };

BlueprintAspects _$BlueprintAspectsFromJson(Map<String, dynamic> json) =>
    BlueprintAspects(
      aspects: (json['aspects'] as List<dynamic>?)
              ?.map((e) => BlueprintAspect.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      aspectGroups: (json['aspect_groups'] as List<dynamic>?)
              ?.map((e) =>
                  BlueprintAspectGroup.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      hasInteractiveAspects: json['has_interactive_aspects'] as bool?,
    );

Map<String, dynamic> _$BlueprintAspectsToJson(BlueprintAspects instance) =>
    <String, dynamic>{
      'aspects': instance.aspects?.map((e) => e.toJson()).toList(),
      'aspect_groups': instance.aspectGroups?.map((e) => e.toJson()).toList(),
      'has_interactive_aspects': instance.hasInteractiveAspects,
    };

Blueprint _$BlueprintFromJson(Map<String, dynamic> json) => Blueprint(
      uuid: json['uuid'] as String?,
      key: json['key'] as String?,
      categoryUuid: json['category_uuid'] as String?,
      outputItemUuid: json['output_item_uuid'] as String?,
      outputName: json['output_name'] as String?,
      outputClass: json['output_class'] as String?,
      craftTimeSeconds: (json['craft_time_seconds'] as num?)?.toInt(),
      craftTimeLabel: json['craft_time_label'] as String?,
      isAvailableByDefault: json['is_available_by_default'] as bool?,
      gameVersion: json['game_version'] as String?,
      ingredientCount: (json['ingredient_count'] as num?)?.toInt(),
      unlockingMissionsCount:
          (json['unlocking_missions_count'] as num?)?.toInt(),
      ingredients: (json['ingredients'] as List<dynamic>?)
              ?.map((e) =>
                  BlueprintIngredient.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      dismantleReturns: (json['dismantle_returns'] as List<dynamic>?)
              ?.map((e) => BlueprintDismantleReturnSummary.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          [],
      output: json['output'] == null
          ? null
          : BlueprintOutput.fromJson(json['output'] as Map<String, dynamic>),
      dismantle: json['dismantle'] == null
          ? null
          : BlueprintDismantle.fromJson(
              json['dismantle'] as Map<String, dynamic>),
      requirementGroups: (json['requirement_groups'] as List<dynamic>?)
              ?.map((e) =>
                  BlueprintRequirementGroup.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      summaryProperties: (json['summary_properties'] as List<dynamic>?)
              ?.map((e) =>
                  BlueprintSummaryProperty.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      unlockingMissions: (json['unlocking_missions'] as List<dynamic>?)
              ?.map((e) =>
                  BlueprintUnlockingMission.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      unlockingMissionsGrouped:
          (json['unlocking_missions_grouped'] as List<dynamic>?)
                  ?.map((e) => BlueprintUnlockingMissionsGrouped.fromJson(
                      e as Map<String, dynamic>))
                  .toList() ??
              [],
      aspects: json['aspects'] == null
          ? null
          : BlueprintAspects.fromJson(json['aspects'] as Map<String, dynamic>),
      tiers: (json['tiers'] as List<dynamic>?)
              ?.map((e) => BlueprintTier.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      link: json['link'] as String?,
      webUrl: json['web_url'] as String?,
      outputItemWebUrl: json['output_item_web_url'] as String?,
    );

Map<String, dynamic> _$BlueprintToJson(Blueprint instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'key': instance.key,
      'category_uuid': instance.categoryUuid,
      'output_item_uuid': instance.outputItemUuid,
      'output_name': instance.outputName,
      'output_class': instance.outputClass,
      'craft_time_seconds': instance.craftTimeSeconds,
      'craft_time_label': instance.craftTimeLabel,
      'is_available_by_default': instance.isAvailableByDefault,
      'game_version': instance.gameVersion,
      'ingredient_count': instance.ingredientCount,
      'unlocking_missions_count': instance.unlockingMissionsCount,
      'ingredients': instance.ingredients?.map((e) => e.toJson()).toList(),
      'dismantle_returns':
          instance.dismantleReturns?.map((e) => e.toJson()).toList(),
      'output': instance.output?.toJson(),
      'dismantle': instance.dismantle?.toJson(),
      'requirement_groups':
          instance.requirementGroups?.map((e) => e.toJson()).toList(),
      'summary_properties':
          instance.summaryProperties?.map((e) => e.toJson()).toList(),
      'unlocking_missions':
          instance.unlockingMissions?.map((e) => e.toJson()).toList(),
      'unlocking_missions_grouped':
          instance.unlockingMissionsGrouped?.map((e) => e.toJson()).toList(),
      'aspects': instance.aspects?.toJson(),
      'tiers': instance.tiers?.map((e) => e.toJson()).toList(),
      'link': instance.link,
      'web_url': instance.webUrl,
      'output_item_web_url': instance.outputItemWebUrl,
    };

CommodityIndexLocationEntry _$CommodityIndexLocationEntryFromJson(
        Map<String, dynamic> json) =>
    CommodityIndexLocationEntry(
      groupName: json['group_name'] as String?,
      resourceKind: json['resource_kind'] as String?,
      qualityMin: (json['quality_min'] as num?)?.toInt(),
      qualityMax: (json['quality_max'] as num?)?.toInt(),
      entryCount: (json['entry_count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CommodityIndexLocationEntryToJson(
        CommodityIndexLocationEntry instance) =>
    <String, dynamic>{
      'group_name': instance.groupName,
      'resource_kind': instance.resourceKind,
      'quality_min': instance.qualityMin,
      'quality_max': instance.qualityMax,
      'entry_count': instance.entryCount,
    };

CommodityIndexLocation _$CommodityIndexLocationFromJson(
        Map<String, dynamic> json) =>
    CommodityIndexLocation(
      name: json['name'] as String?,
      displayName: json['display_name'] as String?,
      system: json['system'] as String?,
      type: json['type'] as String?,
      parentName: json['parent_name'] as String?,
      parentType: json['parent_type'] as String?,
      uuid: json['uuid'] as String?,
      link: json['link'] as String?,
      entries: (json['entries'] as List<dynamic>?)
              ?.map((e) => CommodityIndexLocationEntry.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$CommodityIndexLocationToJson(
        CommodityIndexLocation instance) =>
    <String, dynamic>{
      'name': instance.name,
      'display_name': instance.displayName,
      'system': instance.system,
      'type': instance.type,
      'parent_name': instance.parentName,
      'parent_type': instance.parentType,
      'uuid': instance.uuid,
      'link': instance.link,
      'entries': instance.entries?.map((e) => e.toJson()).toList(),
    };

CommodityLink _$CommodityLinkFromJson(Map<String, dynamic> json) =>
    CommodityLink(
      uuid: json['uuid'] as String?,
      key: json['key'] as String?,
      name: json['name'] as String?,
      displayName: json['display_name'] as String?,
      slug: json['slug'] as String?,
      description: json['description'] as String?,
      tier: json['tier'] as String?,
      refinedVersion: json['refined_version'] == null
          ? null
          : CommodityLink$RefinedVersion.fromJson(
              json['refined_version'] as Map<String, dynamic>),
      densityGPerCc: (json['density_g_per_cc'] as num?)?.toDouble(),
      instability: (json['instability'] as num?)?.toDouble(),
      resistance: (json['resistance'] as num?)?.toDouble(),
      boxSizesScu: (json['box_sizes_scu'] as List<dynamic>?)
              ?.map((e) => (e as num).toDouble())
              .toList() ??
          [],
      validateDefaultCargoBox: json['validate_default_cargo_box'] as bool?,
      hasDefaultCargoContainers: json['has_default_cargo_containers'] as bool?,
      isMineable: json['is_mineable'] as bool?,
      hasShipMineables: json['has_ship_mineables'] as bool?,
      hasGroundVehicleMineables: json['has_ground_vehicle_mineables'] as bool?,
      hasFpsMineables: json['has_fps_mineables'] as bool?,
      hasHarvestables: json['has_harvestables'] as bool?,
      hasSalvage: json['has_salvage'] as bool?,
      signature: (json['signature'] as num?)?.toInt(),
      kind: json['kind'] as String?,
      commodityGroups: (json['commodity_groups'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      methods: (json['methods'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      systems: (json['systems'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      locations: (json['locations'] as List<dynamic>?)
              ?.map((e) =>
                  CommodityIndexLocation.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      link: json['link'] as String?,
      webUrl: json['web_url'] as String?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) =>
              CommodityLink$Images$Item.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CommodityLinkToJson(CommodityLink instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'key': instance.key,
      'name': instance.name,
      'display_name': instance.displayName,
      'slug': instance.slug,
      'description': instance.description,
      'tier': instance.tier,
      'refined_version': instance.refinedVersion?.toJson(),
      'density_g_per_cc': instance.densityGPerCc,
      'instability': instance.instability,
      'resistance': instance.resistance,
      'box_sizes_scu': instance.boxSizesScu,
      'validate_default_cargo_box': instance.validateDefaultCargoBox,
      'has_default_cargo_containers': instance.hasDefaultCargoContainers,
      'is_mineable': instance.isMineable,
      'has_ship_mineables': instance.hasShipMineables,
      'has_ground_vehicle_mineables': instance.hasGroundVehicleMineables,
      'has_fps_mineables': instance.hasFpsMineables,
      'has_harvestables': instance.hasHarvestables,
      'has_salvage': instance.hasSalvage,
      'signature': instance.signature,
      'kind': instance.kind,
      'commodity_groups': instance.commodityGroups,
      'methods': instance.methods,
      'systems': instance.systems,
      'locations': instance.locations?.map((e) => e.toJson()).toList(),
      'link': instance.link,
      'web_url': instance.webUrl,
      'images': instance.images?.map((e) => e.toJson()).toList(),
    };

CommodityDepositGroup _$CommodityDepositGroupFromJson(
        Map<String, dynamic> json) =>
    CommodityDepositGroup(
      resourceUuid: json['resource_uuid'] as String?,
      groupName: json['group_name'] as String?,
      resourceKind: json['resource_kind'] as String?,
    );

Map<String, dynamic> _$CommodityDepositGroupToJson(
        CommodityDepositGroup instance) =>
    <String, dynamic>{
      'resource_uuid': instance.resourceUuid,
      'group_name': instance.groupName,
      'resource_kind': instance.resourceKind,
    };

CommodityShowLocation _$CommodityShowLocationFromJson(
        Map<String, dynamic> json) =>
    CommodityShowLocation(
      name: json['name'] as String?,
      designation: json['designation'] as String?,
      displayName: json['display_name'] as String?,
      system: json['system'] as String?,
      type: json['type'] as String?,
      parentName: json['parent_name'] as String?,
      parentType: json['parent_type'] as String?,
      parentUuid: json['parent_uuid'] as String?,
      uuid: json['uuid'] as String?,
      link: json['link'] as String?,
      groupProbability: (json['group_probability'] as num?)?.toDouble(),
      groupProbabilityPercent:
          (json['group_probability_percent'] as num?)?.toDouble(),
      relativeProbability: (json['relative_probability'] as num?)?.toDouble(),
      relativeProbabilityPercent:
          (json['relative_probability_percent'] as num?)?.toDouble(),
      qualityMin: (json['quality_min'] as num?)?.toInt(),
      qualityMax: (json['quality_max'] as num?)?.toInt(),
      areas: (json['areas'] as List<dynamic>?)
              ?.map((e) => AreaBoost.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      resources: (json['resources'] as List<dynamic>?)
              ?.map((e) =>
                  CommodityDepositGroup.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$CommodityShowLocationToJson(
        CommodityShowLocation instance) =>
    <String, dynamic>{
      'name': instance.name,
      'designation': instance.designation,
      'display_name': instance.displayName,
      'system': instance.system,
      'type': instance.type,
      'parent_name': instance.parentName,
      'parent_type': instance.parentType,
      'parent_uuid': instance.parentUuid,
      'uuid': instance.uuid,
      'link': instance.link,
      'group_probability': instance.groupProbability,
      'group_probability_percent': instance.groupProbabilityPercent,
      'relative_probability': instance.relativeProbability,
      'relative_probability_percent': instance.relativeProbabilityPercent,
      'quality_min': instance.qualityMin,
      'quality_max': instance.qualityMax,
      'areas': instance.areas?.map((e) => e.toJson()).toList(),
      'resources': instance.resources?.map((e) => e.toJson()).toList(),
    };

CommodityVersionEntry _$CommodityVersionEntryFromJson(
        Map<String, dynamic> json) =>
    CommodityVersionEntry(
      name: json['name'] as String?,
      uuid: json['uuid'] as String?,
      webUrl: json['web_url'] as String?,
      link: json['link'] as String?,
    );

Map<String, dynamic> _$CommodityVersionEntryToJson(
        CommodityVersionEntry instance) =>
    <String, dynamic>{
      'name': instance.name,
      'uuid': instance.uuid,
      'web_url': instance.webUrl,
      'link': instance.link,
    };

CommoditySystemGroup _$CommoditySystemGroupFromJson(
        Map<String, dynamic> json) =>
    CommoditySystemGroup(
      name: json['name'] as String?,
      locations: (json['locations'] as List<dynamic>?)
              ?.map((e) =>
                  CommodityShowLocation.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$CommoditySystemGroupToJson(
        CommoditySystemGroup instance) =>
    <String, dynamic>{
      'name': instance.name,
      'locations': instance.locations?.map((e) => e.toJson()).toList(),
    };

CommodityShow _$CommodityShowFromJson(Map<String, dynamic> json) =>
    CommodityShow(
      uuid: json['uuid'] as String?,
      key: json['key'] as String?,
      name: json['name'] as String?,
      displayName: json['display_name'] as String?,
      slug: json['slug'] as String?,
      description: json['description'] as String?,
      tier: json['tier'] as String?,
      refinedVersion: json['refined_version'] == null
          ? null
          : CommodityShow$RefinedVersion.fromJson(
              json['refined_version'] as Map<String, dynamic>),
      densityGPerCc: (json['density_g_per_cc'] as num?)?.toDouble(),
      instability: (json['instability'] as num?)?.toDouble(),
      resistance: (json['resistance'] as num?)?.toDouble(),
      boxSizesScu: (json['box_sizes_scu'] as List<dynamic>?)
              ?.map((e) => (e as num).toDouble())
              .toList() ??
          [],
      validateDefaultCargoBox: json['validate_default_cargo_box'] as bool?,
      hasDefaultCargoContainers: json['has_default_cargo_containers'] as bool?,
      isMineable: json['is_mineable'] as bool?,
      hasShipMineables: json['has_ship_mineables'] as bool?,
      hasGroundVehicleMineables: json['has_ground_vehicle_mineables'] as bool?,
      hasFpsMineables: json['has_fps_mineables'] as bool?,
      hasHarvestables: json['has_harvestables'] as bool?,
      hasSalvage: json['has_salvage'] as bool?,
      signature: (json['signature'] as num?)?.toInt(),
      kind: json['kind'] as String?,
      commodityGroups: (json['commodity_groups'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      methods: (json['methods'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      systems: (json['systems'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      locations: (json['locations'] as List<dynamic>?)
              ?.map((e) =>
                  CommodityShowLocation.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      systemsGrouped: (json['systems_grouped'] as List<dynamic>?)
              ?.map((e) =>
                  CommoditySystemGroup.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      rawVersions: (json['raw_versions'] as List<dynamic>?)
              ?.map((e) =>
                  CommodityVersionEntry.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      blueprints: (json['blueprints'] as List<dynamic>?)
          ?.map((e) =>
              CommodityShow$Blueprints$Item.fromJson(e as Map<String, dynamic>))
          .toList(),
      items: (json['items'] as List<dynamic>?)
          ?.map((e) =>
              CommodityShow$Items$Item.fromJson(e as Map<String, dynamic>))
          .toList(),
      link: json['link'] as String?,
      webUrl: json['web_url'] as String?,
      uexPrices: json['uex_prices'] == null
          ? null
          : CommodityShow$UexPrices.fromJson(
              json['uex_prices'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CommodityShowToJson(CommodityShow instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'key': instance.key,
      'name': instance.name,
      'display_name': instance.displayName,
      'slug': instance.slug,
      'description': instance.description,
      'tier': instance.tier,
      'refined_version': instance.refinedVersion?.toJson(),
      'density_g_per_cc': instance.densityGPerCc,
      'instability': instance.instability,
      'resistance': instance.resistance,
      'box_sizes_scu': instance.boxSizesScu,
      'validate_default_cargo_box': instance.validateDefaultCargoBox,
      'has_default_cargo_containers': instance.hasDefaultCargoContainers,
      'is_mineable': instance.isMineable,
      'has_ship_mineables': instance.hasShipMineables,
      'has_ground_vehicle_mineables': instance.hasGroundVehicleMineables,
      'has_fps_mineables': instance.hasFpsMineables,
      'has_harvestables': instance.hasHarvestables,
      'has_salvage': instance.hasSalvage,
      'signature': instance.signature,
      'kind': instance.kind,
      'commodity_groups': instance.commodityGroups,
      'methods': instance.methods,
      'systems': instance.systems,
      'locations': instance.locations?.map((e) => e.toJson()).toList(),
      'systems_grouped':
          instance.systemsGrouped?.map((e) => e.toJson()).toList(),
      'raw_versions': instance.rawVersions?.map((e) => e.toJson()).toList(),
      'blueprints': instance.blueprints?.map((e) => e.toJson()).toList(),
      'items': instance.items?.map((e) => e.toJson()).toList(),
      'link': instance.link,
      'web_url': instance.webUrl,
      'uex_prices': instance.uexPrices?.toJson(),
    };

AreaException _$AreaExceptionFromJson(Map<String, dynamic> json) =>
    AreaException(
      name: json['name'] as String?,
      modifier: (json['modifier'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$AreaExceptionToJson(AreaException instance) =>
    <String, dynamic>{
      'name': instance.name,
      'modifier': instance.modifier,
    };

AreaBoost _$AreaBoostFromJson(Map<String, dynamic> json) => AreaBoost(
      name: json['name'] as String?,
      globalModifier: (json['global_modifier'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$AreaBoostToJson(AreaBoost instance) => <String, dynamic>{
      'name': instance.name,
      'global_modifier': instance.globalModifier,
    };

ClusteringParam _$ClusteringParamFromJson(Map<String, dynamic> json) =>
    ClusteringParam(
      minSize: (json['min_size'] as num?)?.toDouble(),
      maxSize: (json['max_size'] as num?)?.toDouble(),
      minProximity: (json['min_proximity'] as num?)?.toDouble(),
      maxProximity: (json['max_proximity'] as num?)?.toDouble(),
      relativeProbability: (json['relative_probability'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ClusteringParamToJson(ClusteringParam instance) =>
    <String, dynamic>{
      'min_size': instance.minSize,
      'max_size': instance.maxSize,
      'min_proximity': instance.minProximity,
      'max_proximity': instance.maxProximity,
      'relative_probability': instance.relativeProbability,
    };

Clustering _$ClusteringFromJson(Map<String, dynamic> json) => Clustering(
      key: json['key'] as String?,
      minSize: (json['min_size'] as num?)?.toDouble(),
      maxSize: (json['max_size'] as num?)?.toDouble(),
      minProximity: (json['min_proximity'] as num?)?.toDouble(),
      maxProximity: (json['max_proximity'] as num?)?.toDouble(),
      probability: (json['probability'] as num?)?.toDouble(),
      probabilityPercent: (json['probability_percent'] as num?)?.toDouble(),
      params: (json['params'] as List<dynamic>?)
              ?.map((e) => ClusteringParam.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$ClusteringToJson(Clustering instance) =>
    <String, dynamic>{
      'key': instance.key,
      'min_size': instance.minSize,
      'max_size': instance.maxSize,
      'min_proximity': instance.minProximity,
      'max_proximity': instance.maxProximity,
      'probability': instance.probability,
      'probability_percent': instance.probabilityPercent,
      'params': instance.params?.map((e) => e.toJson()).toList(),
    };

MaterialEntry _$MaterialEntryFromJson(Map<String, dynamic> json) =>
    MaterialEntry(
      key: json['key'] as String?,
      name: json['name'] as String?,
      uuid: json['uuid'] as String?,
      isCurrent: json['is_current'] as bool?,
      qualityMin: (json['quality_min'] as num?)?.toInt(),
      qualityMax: (json['quality_max'] as num?)?.toInt(),
      qualityMean: (json['quality_mean'] as num?)?.toInt(),
      qualityStddev: (json['quality_stddev'] as num?)?.toInt(),
      minPercentage: (json['min_percentage'] as num?)?.toDouble(),
      maxPercentage: (json['max_percentage'] as num?)?.toDouble(),
      instability: (json['instability'] as num?)?.toDouble(),
      resistance: (json['resistance'] as num?)?.toDouble(),
      groupProbability: (json['group_probability'] as num?)?.toDouble(),
      groupProbabilityPercent:
          (json['group_probability_percent'] as num?)?.toDouble(),
      relativeProbability: (json['relative_probability'] as num?)?.toDouble(),
      relativeProbabilityPercent:
          (json['relative_probability_percent'] as num?)?.toDouble(),
      qualityQuantizedValues:
          (json['quality_quantized_values'] as List<dynamic>?)
                  ?.map((e) => (e as num).toInt())
                  .toList() ??
              [],
      qualityQuantization: (json['quality_quantization'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          [],
    );

Map<String, dynamic> _$MaterialEntryToJson(MaterialEntry instance) =>
    <String, dynamic>{
      'key': instance.key,
      'name': instance.name,
      'uuid': instance.uuid,
      'is_current': instance.isCurrent,
      'quality_min': instance.qualityMin,
      'quality_max': instance.qualityMax,
      'quality_mean': instance.qualityMean,
      'quality_stddev': instance.qualityStddev,
      'min_percentage': instance.minPercentage,
      'max_percentage': instance.maxPercentage,
      'instability': instance.instability,
      'resistance': instance.resistance,
      'group_probability': instance.groupProbability,
      'group_probability_percent': instance.groupProbabilityPercent,
      'relative_probability': instance.relativeProbability,
      'relative_probability_percent': instance.relativeProbabilityPercent,
      'quality_quantized_values': instance.qualityQuantizedValues,
      'quality_quantization': instance.qualityQuantization,
    };

HarvestableSetup _$HarvestableSetupFromJson(Map<String, dynamic> json) =>
    HarvestableSetup(
      respawnSeconds: (json['respawn_seconds'] as num?)?.toInt(),
      respawnFormatted: json['respawn_formatted'] as String?,
      despawnSeconds: (json['despawn_seconds'] as num?)?.toInt(),
      despawnFormatted: json['despawn_formatted'] as String?,
      relativeProbability: (json['relative_probability'] as num?)?.toDouble(),
      relativeProbabilityPercent:
          (json['relative_probability_percent'] as num?)?.toDouble(),
      respawnMultiplier: (json['respawn_multiplier'] as num?)?.toDouble(),
      additionalWaitSeconds: (json['additional_wait_seconds'] as num?)?.toInt(),
      additionalWaitFormatted: json['additional_wait_formatted'] as String?,
    );

Map<String, dynamic> _$HarvestableSetupToJson(HarvestableSetup instance) =>
    <String, dynamic>{
      'respawn_seconds': instance.respawnSeconds,
      'respawn_formatted': instance.respawnFormatted,
      'despawn_seconds': instance.despawnSeconds,
      'despawn_formatted': instance.despawnFormatted,
      'relative_probability': instance.relativeProbability,
      'relative_probability_percent': instance.relativeProbabilityPercent,
      'respawn_multiplier': instance.respawnMultiplier,
      'additional_wait_seconds': instance.additionalWaitSeconds,
      'additional_wait_formatted': instance.additionalWaitFormatted,
    };

DepositBase _$DepositBaseFromJson(Map<String, dynamic> json) => DepositBase(
      key: json['key'] as String?,
      label: json['label'] as String?,
      signature: (json['signature'] as num?)?.toInt(),
      areaExceptions: (json['area_exceptions'] as List<dynamic>?)
              ?.map((e) => AreaException.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      clustering: json['clustering'],
      harvestableSetup: json['harvestable_setup'],
      providerNames: (json['provider_names'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      materials: (json['materials'] as List<dynamic>?)
              ?.map((e) => MaterialEntry.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      qualityMin: (json['quality_min'] as num?)?.toInt(),
      qualityMax: (json['quality_max'] as num?)?.toInt(),
      relativeProbabilityMin:
          (json['relative_probability_min'] as num?)?.toDouble(),
      relativeProbabilityMax:
          (json['relative_probability_max'] as num?)?.toDouble(),
      relativeProbabilityMinPercent:
          (json['relative_probability_min_percent'] as num?)?.toDouble(),
      relativeProbabilityMaxPercent:
          (json['relative_probability_max_percent'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$DepositBaseToJson(DepositBase instance) =>
    <String, dynamic>{
      'key': instance.key,
      'label': instance.label,
      'signature': instance.signature,
      'area_exceptions':
          instance.areaExceptions?.map((e) => e.toJson()).toList(),
      'clustering': instance.clustering,
      'harvestable_setup': instance.harvestableSetup,
      'provider_names': instance.providerNames,
      'materials': instance.materials?.map((e) => e.toJson()).toList(),
      'quality_min': instance.qualityMin,
      'quality_max': instance.qualityMax,
      'relative_probability_min': instance.relativeProbabilityMin,
      'relative_probability_max': instance.relativeProbabilityMax,
      'relative_probability_min_percent':
          instance.relativeProbabilityMinPercent,
      'relative_probability_max_percent':
          instance.relativeProbabilityMaxPercent,
    };

FactionIndex _$FactionIndexFromJson(Map<String, dynamic> json) => FactionIndex(
      uuid: json['uuid'] as String?,
      name: json['name'] as String?,
      factionType: json['faction_type'] as String?,
      lawful: json['lawful'] as bool?,
      isNpc: json['is_npc'] as bool?,
      hasReputation: json['has_reputation'] as bool?,
      link: json['link'] as String?,
    );

Map<String, dynamic> _$FactionIndexToJson(FactionIndex instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'faction_type': instance.factionType,
      'lawful': instance.lawful,
      'is_npc': instance.isNpc,
      'has_reputation': instance.hasReputation,
      'link': instance.link,
    };

Faction _$FactionFromJson(Map<String, dynamic> json) => Faction(
      uuid: json['uuid'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      defaultReaction: json['default_reaction'] as String?,
      factionType: json['faction_type'] as String?,
      ableToArrest: json['able_to_arrest'] as bool?,
      policesLawfulTrespass: json['polices_lawful_trespass'] as bool?,
      policesCriminality: json['polices_criminality'] as bool?,
      noLegalRights: json['no_legal_rights'] as bool?,
      hasReputation: json['has_reputation'] as bool?,
      headquarters: json['headquarters'] as String?,
      founded: json['founded'] as String?,
      leadership: json['leadership'] as String?,
      area: json['area'] as String?,
      focus: json['focus'] as String?,
      lawful: json['lawful'] as bool?,
      sortOrderScope: json['sort_order_scope'] as String?,
      isNpc: json['is_npc'] as bool?,
      reputationLadder: json['reputation_ladder'],
      link: json['link'] as String?,
    );

Map<String, dynamic> _$FactionToJson(Faction instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'description': instance.description,
      'default_reaction': instance.defaultReaction,
      'faction_type': instance.factionType,
      'able_to_arrest': instance.ableToArrest,
      'polices_lawful_trespass': instance.policesLawfulTrespass,
      'polices_criminality': instance.policesCriminality,
      'no_legal_rights': instance.noLegalRights,
      'has_reputation': instance.hasReputation,
      'headquarters': instance.headquarters,
      'founded': instance.founded,
      'leadership': instance.leadership,
      'area': instance.area,
      'focus': instance.focus,
      'lawful': instance.lawful,
      'sort_order_scope': instance.sortOrderScope,
      'is_npc': instance.isNpc,
      'reputation_ladder': instance.reputationLadder,
      'link': instance.link,
    };

FactionReputationLadder _$FactionReputationLadderFromJson(
        Map<String, dynamic> json) =>
    FactionReputationLadder(
      scopeName: json['scope_name'] as String?,
      displayName: json['display_name'] as String?,
      reputationCeiling: (json['reputation_ceiling'] as num?)?.toInt(),
      initialReputation: (json['initial_reputation'] as num?)?.toInt(),
      standings: (json['standings'] as List<dynamic>?)
              ?.map((e) => FactionStanding.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$FactionReputationLadderToJson(
        FactionReputationLadder instance) =>
    <String, dynamic>{
      'scope_name': instance.scopeName,
      'display_name': instance.displayName,
      'reputation_ceiling': instance.reputationCeiling,
      'initial_reputation': instance.initialReputation,
      'standings': instance.standings?.map((e) => e.toJson()).toList(),
    };

FactionStanding _$FactionStandingFromJson(Map<String, dynamic> json) =>
    FactionStanding(
      uuid: json['uuid'] as String?,
      name: json['name'] as String?,
      displayName: json['display_name'] as String?,
      minReputation: (json['min_reputation'] as num?)?.toInt(),
      driftReputation: (json['drift_reputation'] as num?)?.toInt(),
      driftTimeHours: (json['drift_time_hours'] as num?)?.toInt(),
      gated: json['gated'] as bool?,
    );

Map<String, dynamic> _$FactionStandingToJson(FactionStanding instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'display_name': instance.displayName,
      'min_reputation': instance.minReputation,
      'drift_reputation': instance.driftReputation,
      'drift_time_hours': instance.driftTimeHours,
      'gated': instance.gated,
    };

GameVersion _$GameVersionFromJson(Map<String, dynamic> json) => GameVersion(
      code: json['code'] as String?,
      channel: json['channel'] as String?,
      releasedAt: json['released_at'] == null
          ? null
          : DateTime.parse(json['released_at'] as String),
      isDefault: json['is_default'] as bool?,
    );

Map<String, dynamic> _$GameVersionToJson(GameVersion instance) =>
    <String, dynamic>{
      'code': instance.code,
      'channel': instance.channel,
      'released_at': instance.releasedAt?.toIso8601String(),
      'is_default': instance.isDefault,
    };

ItemDescriptionData _$ItemDescriptionDataFromJson(Map<String, dynamic> json) =>
    ItemDescriptionData(
      name: json['name'] as String?,
      value: json['value'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$ItemDescriptionDataToJson(
        ItemDescriptionData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
      'type': instance.type,
    };

ItemDimension _$ItemDimensionFromJson(Map<String, dynamic> json) =>
    ItemDimension(
      width: (json['width'] as num?)?.toDouble(),
      height: (json['height'] as num?)?.toDouble(),
      length: (json['length'] as num?)?.toDouble(),
      volume: (json['volume'] as num?)?.toDouble(),
      volumeConverted: (json['volume_converted'] as num?)?.toDouble(),
      volumeConvertedUnit: json['volume_converted_unit'] as String?,
      trueDimension: json['true_dimension'] == null
          ? null
          : ItemDimension$TrueDimension.fromJson(
              json['true_dimension'] as Map<String, dynamic>),
      dimensions: json['dimensions'],
      cargoDimension: json['cargo_dimension'],
      uiDimension: json['ui_dimension'],
    );

Map<String, dynamic> _$ItemDimensionToJson(ItemDimension instance) =>
    <String, dynamic>{
      'width': instance.width,
      'height': instance.height,
      'length': instance.length,
      'volume': instance.volume,
      'volume_converted': instance.volumeConverted,
      'volume_converted_unit': instance.volumeConvertedUnit,
      'true_dimension': instance.trueDimension?.toJson(),
      'dimensions': instance.dimensions,
      'cargo_dimension': instance.cargoDimension,
      'ui_dimension': instance.uiDimension,
    };

ItemDimensionBlock _$ItemDimensionBlockFromJson(Map<String, dynamic> json) =>
    ItemDimensionBlock(
      width: (json['width'] as num?)?.toDouble(),
      height: (json['height'] as num?)?.toDouble(),
      length: (json['length'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ItemDimensionBlockToJson(ItemDimensionBlock instance) =>
    <String, dynamic>{
      'width': instance.width,
      'height': instance.height,
      'length': instance.length,
    };

ItemDistortion _$ItemDistortionFromJson(Map<String, dynamic> json) =>
    ItemDistortion(
      decayRate: (json['decay_rate'] as num?)?.toDouble(),
      decayDelay: (json['decay_delay'] as num?)?.toDouble(),
      max: (json['max'] as num?)?.toDouble(),
      maximum: (json['maximum'] as num?)?.toDouble(),
      overloadRatio: (json['overload_ratio'] as num?)?.toDouble(),
      warningRatio: (json['warning_ratio'] as num?)?.toDouble(),
      recoveryRatio: (json['recovery_ratio'] as num?)?.toDouble(),
      recoveryTime: (json['recovery_time'] as num?)?.toDouble(),
      powerRatioAtMaxDistortion:
          (json['power_ratio_at_max_distortion'] as num?)?.toDouble(),
      powerChangeOnlyAtMaxDistortion:
          (json['power_change_only_at_max_distortion'] as num?)?.toInt(),
      shutdownTime: (json['shutdown_time'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ItemDistortionToJson(ItemDistortion instance) =>
    <String, dynamic>{
      'decay_rate': instance.decayRate,
      'decay_delay': instance.decayDelay,
      'max': instance.max,
      'maximum': instance.maximum,
      'overload_ratio': instance.overloadRatio,
      'warning_ratio': instance.warningRatio,
      'recovery_ratio': instance.recoveryRatio,
      'recovery_time': instance.recoveryTime,
      'power_ratio_at_max_distortion': instance.powerRatioAtMaxDistortion,
      'power_change_only_at_max_distortion':
          instance.powerChangeOnlyAtMaxDistortion,
      'shutdown_time': instance.shutdownTime,
    };

ItemDurability _$ItemDurabilityFromJson(Map<String, dynamic> json) =>
    ItemDurability(
      health: (json['health'] as num?)?.toDouble(),
      lifetime: (json['lifetime'] as num?)?.toDouble(),
      maxLifetime: (json['max_lifetime'] as num?)?.toDouble(),
      repairable: json['repairable'] as bool?,
      salvageable: json['salvageable'] as bool?,
      resistance: json['resistance'] == null
          ? null
          : ItemDurability$Resistance.fromJson(
              json['resistance'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ItemDurabilityToJson(ItemDurability instance) =>
    <String, dynamic>{
      'health': instance.health,
      'lifetime': instance.lifetime,
      'max_lifetime': instance.maxLifetime,
      'repairable': instance.repairable,
      'salvageable': instance.salvageable,
      'resistance': instance.resistance?.toJson(),
    };

ItemEmission _$ItemEmissionFromJson(Map<String, dynamic> json) => ItemEmission(
      ir: (json['ir'] as num?)?.toDouble(),
      emMin: (json['em_min'] as num?)?.toDouble(),
      emMax: (json['em_max'] as num?)?.toDouble(),
      emDecay: (json['em_decay'] as num?)?.toDouble(),
      emPerSegment: (json['em_per_segment'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ItemEmissionToJson(ItemEmission instance) =>
    <String, dynamic>{
      'ir': instance.ir,
      'em_min': instance.emMin,
      'em_max': instance.emMax,
      'em_decay': instance.emDecay,
      'em_per_segment': instance.emPerSegment,
    };

ItemHeatConnection _$ItemHeatConnectionFromJson(Map<String, dynamic> json) =>
    ItemHeatConnection(
      temperatureToIr: (json['temperature_to_ir'] as num?)?.toDouble(),
      irTemperatureThreshold:
          (json['ir_temperature_threshold'] as num?)?.toDouble(),
      overpowerHeat: (json['overpower_heat'] as num?)?.toDouble(),
      overclockThresholdMin:
          (json['overclock_threshold_min'] as num?)?.toDouble(),
      overclockThresholdMax:
          (json['overclock_threshold_max'] as num?)?.toDouble(),
      thermalEnergyBase: (json['thermal_energy_base'] as num?)?.toDouble(),
      thermalEnergyDraw: (json['thermal_energy_draw'] as num?)?.toDouble(),
      thermalConductivity: (json['thermal_conductivity'] as num?)?.toDouble(),
      specificHeatCapacity:
          (json['specific_heat_capacity'] as num?)?.toDouble(),
      mass: (json['mass'] as num?)?.toDouble(),
      surfaceArea: (json['surface_area'] as num?)?.toDouble(),
      startCoolingTemperature:
          (json['start_cooling_temperature'] as num?)?.toDouble(),
      maxCoolingRate: (json['max_cooling_rate'] as num?)?.toDouble(),
      maxTemperature: (json['max_temperature'] as num?)?.toDouble(),
      minTemperature: (json['min_temperature'] as num?)?.toDouble(),
      overheatTemperature: (json['overheat_temperature'] as num?)?.toDouble(),
      recoveryTemperature: (json['recovery_temperature'] as num?)?.toDouble(),
      misfireMinTemperature:
          (json['misfire_min_temperature'] as num?)?.toDouble(),
      misfireMaxTemperature:
          (json['misfire_max_temperature'] as num?)?.toDouble(),
      irEmission: (json['ir_emission'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ItemHeatConnectionToJson(ItemHeatConnection instance) =>
    <String, dynamic>{
      'temperature_to_ir': instance.temperatureToIr,
      'ir_temperature_threshold': instance.irTemperatureThreshold,
      'overpower_heat': instance.overpowerHeat,
      'overclock_threshold_min': instance.overclockThresholdMin,
      'overclock_threshold_max': instance.overclockThresholdMax,
      'thermal_energy_base': instance.thermalEnergyBase,
      'thermal_energy_draw': instance.thermalEnergyDraw,
      'thermal_conductivity': instance.thermalConductivity,
      'specific_heat_capacity': instance.specificHeatCapacity,
      'mass': instance.mass,
      'surface_area': instance.surfaceArea,
      'start_cooling_temperature': instance.startCoolingTemperature,
      'max_cooling_rate': instance.maxCoolingRate,
      'max_temperature': instance.maxTemperature,
      'min_temperature': instance.minTemperature,
      'overheat_temperature': instance.overheatTemperature,
      'recovery_temperature': instance.recoveryTemperature,
      'misfire_min_temperature': instance.misfireMinTemperature,
      'misfire_max_temperature': instance.misfireMaxTemperature,
      'ir_emission': instance.irEmission,
    };

ItemInventory _$ItemInventoryFromJson(Map<String, dynamic> json) =>
    ItemInventory(
      uuid: json['uuid'] as String?,
      width: (json['width'] as num?)?.toDouble(),
      height: (json['height'] as num?)?.toDouble(),
      length: (json['length'] as num?)?.toDouble(),
      volume: (json['volume'] as num?)?.toDouble(),
      scu: (json['scu'] as num?)?.toDouble(),
      scuConverted: (json['scu_converted'] as num?)?.toDouble(),
      unit: json['unit'] as String?,
      microScu: (json['micro_scu'] as num?)?.toDouble(),
      open: json['open'] as bool?,
      $external: json['external'] as bool?,
      closed: json['closed'] as bool?,
      minSize: json['min_size'] == null
          ? null
          : ItemInventory$MinSize.fromJson(
              json['min_size'] as Map<String, dynamic>),
      maxSize: json['max_size'] == null
          ? null
          : ItemInventory$MaxSize.fromJson(
              json['max_size'] as Map<String, dynamic>),
      minScuBox: (json['min_scu_box'] as num?)?.toDouble(),
      maxScuBox: (json['max_scu_box'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ItemInventoryToJson(ItemInventory instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'width': instance.width,
      'height': instance.height,
      'length': instance.length,
      'volume': instance.volume,
      'scu': instance.scu,
      'scu_converted': instance.scuConverted,
      'unit': instance.unit,
      'micro_scu': instance.microScu,
      'open': instance.open,
      'external': instance.$external,
      'closed': instance.closed,
      'min_size': instance.minSize?.toJson(),
      'max_size': instance.maxSize?.toJson(),
      'min_scu_box': instance.minScuBox,
      'max_scu_box': instance.maxScuBox,
    };

ItemLink _$ItemLinkFromJson(Map<String, dynamic> json) => ItemLink(
      uuid: json['uuid'] as String?,
      name: json['name'] as String?,
      className: json['class_name'] as String?,
      type: json['type'] as String?,
      typeLabel: json['type_label'] as String?,
      subType: json['sub_type'] as String?,
      subTypeLabel: json['sub_type_label'] as String?,
      classification: json['classification'] as String?,
      classificationLabel: json['classification_label'] as String?,
      isBaseVariant: json['is_base_variant'] as bool?,
      variantName: json['variant_name'] as String?,
      manufacturer: json['manufacturer'] == null
          ? null
          : ManufacturerLink.fromJson(
              json['manufacturer'] as Map<String, dynamic>),
      link: json['link'] as String?,
      webUrl: json['web_url'] as String?,
      size: (json['size'] as num?)?.toInt(),
      baseVariant: json['base_variant'] as String?,
      variants: (json['variants'] as List<dynamic>?)
              ?.map((e) => ItemLink.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$ItemLinkToJson(ItemLink instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'class_name': instance.className,
      'type': instance.type,
      'type_label': instance.typeLabel,
      'sub_type': instance.subType,
      'sub_type_label': instance.subTypeLabel,
      'classification': instance.classification,
      'classification_label': instance.classificationLabel,
      'is_base_variant': instance.isBaseVariant,
      'variant_name': instance.variantName,
      'manufacturer': instance.manufacturer?.toJson(),
      'link': instance.link,
      'web_url': instance.webUrl,
      'size': instance.size,
      'base_variant': instance.baseVariant,
      'variants': instance.variants?.map((e) => e.toJson()).toList(),
    };

ItemPort _$ItemPortFromJson(Map<String, dynamic> json) => ItemPort(
      name: json['name'] as String?,
      displayName: json['display_name'] as String?,
      position: json['position'] as String?,
      size: (json['size'] as num?)?.toInt(),
      sizes: json['sizes'] == null
          ? null
          : ItemPort$Sizes.fromJson(json['sizes'] as Map<String, dynamic>),
      compatibleTypes: (json['compatible_types'] as List<dynamic>?)
              ?.map((e) => ItemPortType.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      types:
          (json['types'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              [],
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              [],
      requiredTags: (json['required_tags'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      flags:
          (json['flags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              [],
      editable: json['editable'] as bool?,
      uneditable: json['uneditable'] as bool?,
      equippedItemUuid: json['equipped_item_uuid'] as String?,
      type: json['type'] as String?,
      subType: json['sub_type'] as String?,
      portTags: (json['port_tags'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      ports: (json['ports'] as List<dynamic>?)
              ?.map((e) => ItemPort.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      equippedItem: json['equipped_item'],
    );

Map<String, dynamic> _$ItemPortToJson(ItemPort instance) => <String, dynamic>{
      'name': instance.name,
      'display_name': instance.displayName,
      'position': instance.position,
      'size': instance.size,
      'sizes': instance.sizes?.toJson(),
      'compatible_types':
          instance.compatibleTypes?.map((e) => e.toJson()).toList(),
      'types': instance.types,
      'tags': instance.tags,
      'required_tags': instance.requiredTags,
      'flags': instance.flags,
      'editable': instance.editable,
      'uneditable': instance.uneditable,
      'equipped_item_uuid': instance.equippedItemUuid,
      'type': instance.type,
      'sub_type': instance.subType,
      'port_tags': instance.portTags,
      'ports': instance.ports?.map((e) => e.toJson()).toList(),
      'equipped_item': instance.equippedItem,
    };

ItemPortType _$ItemPortTypeFromJson(Map<String, dynamic> json) => ItemPortType(
      type: json['type'] as String?,
      subTypes: (json['sub_types'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
    );

Map<String, dynamic> _$ItemPortTypeToJson(ItemPortType instance) =>
    <String, dynamic>{
      'type': instance.type,
      'sub_types': instance.subTypes,
    };

ItemPowerConnection _$ItemPowerConnectionFromJson(Map<String, dynamic> json) =>
    ItemPowerConnection(
      powerBase: (json['power_base'] as num?)?.toDouble(),
      powerDraw: (json['power_draw'] as num?)?.toDouble(),
      throttleable: json['throttleable'] as bool?,
      overclockable: json['overclockable'] as bool?,
      overclockThresholdMin:
          (json['overclock_threshold_min'] as num?)?.toDouble(),
      overclockThresholdMax:
          (json['overclock_threshold_max'] as num?)?.toDouble(),
      overclockPerformance: (json['overclock_performance'] as num?)?.toDouble(),
      overpowerPerformance: (json['overpower_performance'] as num?)?.toDouble(),
      powerToEm: (json['power_to_em'] as num?)?.toDouble(),
      decayRateEm: (json['decay_rate_em'] as num?)?.toDouble(),
      emMin: (json['em_min'] as num?)?.toDouble(),
      emMax: (json['em_max'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ItemPowerConnectionToJson(
        ItemPowerConnection instance) =>
    <String, dynamic>{
      'power_base': instance.powerBase,
      'power_draw': instance.powerDraw,
      'throttleable': instance.throttleable,
      'overclockable': instance.overclockable,
      'overclock_threshold_min': instance.overclockThresholdMin,
      'overclock_threshold_max': instance.overclockThresholdMax,
      'overclock_performance': instance.overclockPerformance,
      'overpower_performance': instance.overpowerPerformance,
      'power_to_em': instance.powerToEm,
      'decay_rate_em': instance.decayRateEm,
      'em_min': instance.emMin,
      'em_max': instance.emMax,
    };

GameItem _$GameItemFromJson(Map<String, dynamic> json) => GameItem(
      uuid: json['uuid'] as String?,
      slug: json['slug'] as String?,
      name: json['name'] as String?,
      className: json['class_name'] as String?,
      classification: json['classification'] as String?,
      classificationLabel: json['classification_label'] as String?,
      description: json['description'],
      size: (json['size'] as num?)?.toInt(),
      mass: (json['mass'] as num?)?.toDouble(),
      rarity: gameItemRarityNullableFromJson(json['rarity']),
      eventSource: (json['event_source'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      isBaseVariant: json['is_base_variant'] as bool?,
      isCraftable: json['is_craftable'] as bool?,
      blueprint: (json['blueprint'] as List<dynamic>?)
              ?.map((e) => e as Object)
              .toList() ??
          [],
      grade: json['grade'] as String?,
      $class: json['class'] as String?,
      descriptionData: (json['description_data'] as List<dynamic>?)
              ?.map((e) =>
                  ItemDescriptionData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      manufacturerDescription: json['manufacturer_description'] as String?,
      manufacturer: json['manufacturer'],
      type: json['type'] as String?,
      typeLabel: json['type_label'] as String?,
      typeWebUrl: json['type_web_url'] as String?,
      subType: json['sub_type'] as String?,
      subTypeLabel: json['sub_type_label'] as String?,
      position: json['position'] as String?,
      maxMounts: (json['max_mounts'] as num?)?.toInt(),
      maxMissiles: (json['max_missiles'] as num?)?.toInt(),
      maxBombs: (json['max_bombs'] as num?)?.toInt(),
      minSize: (json['min_size'] as num?)?.toInt(),
      maxSize: (json['max_size'] as num?)?.toInt(),
      dimension: json['dimension'] == null
          ? null
          : ItemDimension.fromJson(json['dimension'] as Map<String, dynamic>),
      inventory: json['inventory'],
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              [],
      requiredTags: (json['required_tags'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      entityTags: (json['entity_tags'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      entityTagMap: (json['entity_tag_map'] as List<dynamic>?)
          ?.map((e) =>
              GameItem$EntityTagMap$Item.fromJson(e as Map<String, dynamic>))
          .toList(),
      interactions: (json['interactions'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      ports: (json['ports'] as List<dynamic>?)
              ?.map((e) => ItemPort.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      heat: json['heat'],
      temperature: json['temperature'],
      power: json['power'],
      distortion: json['distortion'],
      durability: json['durability'],
      resourceContainer: json['resource_container'],
      resourceNetwork: json['resource_network'],
      emission: json['emission'],
      seat: json['seat'],
      ammunition: json['ammunition'],
      temperatureResistance: json['temperature_resistance'],
      radiationResistance: json['radiation_resistance'],
      gforceResistance: (json['gforce_resistance'] as num?)?.toDouble(),
      armor: json['armor'],
      cooler: json['cooler'],
      flightController: json['flight_controller'],
      fuelTank: json['fuel_tank'],
      fuelIntake: json['fuel_intake'],
      hackingChip: json['hacking_chip'],
      miningLaser: json['mining_laser'],
      miningModule: json['mining_module'],
      miningModifier: json['mining_modifier'],
      miningGadget: json['mining_gadget'],
      quantumDrive: json['quantum_drive'],
      quantumInterdictionGenerator: json['quantum_interdiction_generator'],
      selfDestruct: json['self_destruct'],
      shield: json['shield'],
      shieldController: json['shield_controller'],
      jumpDrive: json['jump_drive'],
      thruster: json['thruster'],
      powerPlant: json['power_plant'],
      radar: json['radar'],
      cargoGrid: json['cargo_grid'],
      clothing: json['clothing'],
      suitArmor: json['suit_armor'],
      bomb: json['bomb'],
      missile: json['missile'],
      missileRack: json['missile_rack'],
      counterMeasure: json['counter_measure'],
      emp: json['emp'],
      personalWeapon: json['personal_weapon'],
      vehicleWeapon: json['vehicle_weapon'],
      meleeWeapon: json['melee_weapon'],
      grenade: json['grenade'],
      knife: json['knife'],
      turret: json['turret'],
      tractorBeam: json['tractor_beam'],
      food: json['food'],
      medical: json['medical'],
      weaponRack: json['weapon_rack'],
      weaponModifier: json['weapon_modifier'],
      salvageModifier: json['salvage_modifier'],
      ironSight: json['iron_sight'],
      laserPointer: json['laser_pointer'],
      flashlight: json['flashlight'],
      magazine: json['magazine'],
      compensator: json['compensator'],
      flashHider: json['flash_hider'],
      baseVariant: json['base_variant'],
      variants: (json['variants'] as List<dynamic>?)
              ?.map((e) => ItemLink.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      relatedItems: json['related_items'],
      shops:
          (json['shops'] as List<dynamic>?)?.map((e) => e as Object).toList() ??
              [],
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => GameItem$Images$Item.fromJson(e as Map<String, dynamic>))
          .toList(),
      uexPrices: json['uex_prices'] == null
          ? null
          : GameItem$UexPrices.fromJson(
              json['uex_prices'] as Map<String, dynamic>),
      vehicles: (json['vehicles'] as List<dynamic>?)
              ?.map((e) => VehicleLink.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      webUrl: json['web_url'] as String?,
      link: json['link'] as String?,
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      version: json['version'] as String?,
    );

Map<String, dynamic> _$GameItemToJson(GameItem instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'slug': instance.slug,
      'name': instance.name,
      'class_name': instance.className,
      'classification': instance.classification,
      'classification_label': instance.classificationLabel,
      'description': instance.description,
      'size': instance.size,
      'mass': instance.mass,
      'rarity': gameItemRarityNullableToJson(instance.rarity),
      'event_source': instance.eventSource,
      'is_base_variant': instance.isBaseVariant,
      'is_craftable': instance.isCraftable,
      'blueprint': instance.blueprint,
      'grade': instance.grade,
      'class': instance.$class,
      'description_data':
          instance.descriptionData?.map((e) => e.toJson()).toList(),
      'manufacturer_description': instance.manufacturerDescription,
      'manufacturer': instance.manufacturer,
      'type': instance.type,
      'type_label': instance.typeLabel,
      'type_web_url': instance.typeWebUrl,
      'sub_type': instance.subType,
      'sub_type_label': instance.subTypeLabel,
      'position': instance.position,
      'max_mounts': instance.maxMounts,
      'max_missiles': instance.maxMissiles,
      'max_bombs': instance.maxBombs,
      'min_size': instance.minSize,
      'max_size': instance.maxSize,
      'dimension': instance.dimension?.toJson(),
      'inventory': instance.inventory,
      'tags': instance.tags,
      'required_tags': instance.requiredTags,
      'entity_tags': instance.entityTags,
      'entity_tag_map': instance.entityTagMap?.map((e) => e.toJson()).toList(),
      'interactions': instance.interactions,
      'ports': instance.ports?.map((e) => e.toJson()).toList(),
      'heat': instance.heat,
      'temperature': instance.temperature,
      'power': instance.power,
      'distortion': instance.distortion,
      'durability': instance.durability,
      'resource_container': instance.resourceContainer,
      'resource_network': instance.resourceNetwork,
      'emission': instance.emission,
      'seat': instance.seat,
      'ammunition': instance.ammunition,
      'temperature_resistance': instance.temperatureResistance,
      'radiation_resistance': instance.radiationResistance,
      'gforce_resistance': instance.gforceResistance,
      'armor': instance.armor,
      'cooler': instance.cooler,
      'flight_controller': instance.flightController,
      'fuel_tank': instance.fuelTank,
      'fuel_intake': instance.fuelIntake,
      'hacking_chip': instance.hackingChip,
      'mining_laser': instance.miningLaser,
      'mining_module': instance.miningModule,
      'mining_modifier': instance.miningModifier,
      'mining_gadget': instance.miningGadget,
      'quantum_drive': instance.quantumDrive,
      'quantum_interdiction_generator': instance.quantumInterdictionGenerator,
      'self_destruct': instance.selfDestruct,
      'shield': instance.shield,
      'shield_controller': instance.shieldController,
      'jump_drive': instance.jumpDrive,
      'thruster': instance.thruster,
      'power_plant': instance.powerPlant,
      'radar': instance.radar,
      'cargo_grid': instance.cargoGrid,
      'clothing': instance.clothing,
      'suit_armor': instance.suitArmor,
      'bomb': instance.bomb,
      'missile': instance.missile,
      'missile_rack': instance.missileRack,
      'counter_measure': instance.counterMeasure,
      'emp': instance.emp,
      'personal_weapon': instance.personalWeapon,
      'vehicle_weapon': instance.vehicleWeapon,
      'melee_weapon': instance.meleeWeapon,
      'grenade': instance.grenade,
      'knife': instance.knife,
      'turret': instance.turret,
      'tractor_beam': instance.tractorBeam,
      'food': instance.food,
      'medical': instance.medical,
      'weapon_rack': instance.weaponRack,
      'weapon_modifier': instance.weaponModifier,
      'salvage_modifier': instance.salvageModifier,
      'iron_sight': instance.ironSight,
      'laser_pointer': instance.laserPointer,
      'flashlight': instance.flashlight,
      'magazine': instance.magazine,
      'compensator': instance.compensator,
      'flash_hider': instance.flashHider,
      'base_variant': instance.baseVariant,
      'variants': instance.variants?.map((e) => e.toJson()).toList(),
      'related_items': instance.relatedItems,
      'shops': instance.shops,
      'images': instance.images?.map((e) => e.toJson()).toList(),
      'uex_prices': instance.uexPrices?.toJson(),
      'vehicles': instance.vehicles?.map((e) => e.toJson()).toList(),
      'web_url': instance.webUrl,
      'link': instance.link,
      'updated_at': instance.updatedAt?.toIso8601String(),
      'version': instance.version,
    };

ItemBlueprintLink _$ItemBlueprintLinkFromJson(Map<String, dynamic> json) =>
    ItemBlueprintLink(
      uuid: json['uuid'] as String?,
      name: json['name'] as String?,
      link: json['link'] as String?,
    );

Map<String, dynamic> _$ItemBlueprintLinkToJson(ItemBlueprintLink instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'link': instance.link,
    };

ItemRelatedLink _$ItemRelatedLinkFromJson(Map<String, dynamic> json) =>
    ItemRelatedLink(
      uuid: json['uuid'] as String?,
      name: json['name'] as String?,
      className: json['class_name'] as String?,
      type: json['type'] as String?,
      typeLabel: json['type_label'] as String?,
      subType: json['sub_type'] as String?,
      subTypeLabel: json['sub_type_label'] as String?,
      classification: json['classification'] as String?,
      classificationLabel: json['classification_label'] as String?,
      isBaseVariant: json['is_base_variant'] as bool?,
      variantName: json['variant_name'] as String?,
      manufacturer: json['manufacturer'] == null
          ? null
          : ItemRelatedLink$Manufacturer.fromJson(
              json['manufacturer'] as Map<String, dynamic>),
      version: json['version'] as String?,
      link: json['link'] as String?,
      webUrl: json['web_url'] as String?,
      size: (json['size'] as num?)?.toInt(),
      grade: (json['grade'] as num?)?.toInt(),
      gradeLabel: json['grade_label'] as String?,
      $class: json['class'] as String?,
    );

Map<String, dynamic> _$ItemRelatedLinkToJson(ItemRelatedLink instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'class_name': instance.className,
      'type': instance.type,
      'type_label': instance.typeLabel,
      'sub_type': instance.subType,
      'sub_type_label': instance.subTypeLabel,
      'classification': instance.classification,
      'classification_label': instance.classificationLabel,
      'is_base_variant': instance.isBaseVariant,
      'variant_name': instance.variantName,
      'manufacturer': instance.manufacturer?.toJson(),
      'version': instance.version,
      'link': instance.link,
      'web_url': instance.webUrl,
      'size': instance.size,
      'grade': instance.grade,
      'grade_label': instance.gradeLabel,
      'class': instance.$class,
    };

ItemRelatedLinkExt _$ItemRelatedLinkExtFromJson(Map<String, dynamic> json) =>
    ItemRelatedLinkExt();

Map<String, dynamic> _$ItemRelatedLinkExtToJson(ItemRelatedLinkExt instance) =>
    <String, dynamic>{};

ItemRelatedItems _$ItemRelatedItemsFromJson(Map<String, dynamic> json) =>
    ItemRelatedItems(
      setName: json['set_name'] as String?,
      baseItem: json['base_item'],
      variantItems: (json['variant_items'] as List<dynamic>?)
              ?.map((e) => ItemRelatedLink.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      setItems: (json['set_items'] as List<dynamic>?)
              ?.map(
                  (e) => ItemRelatedLinkExt.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$ItemRelatedItemsToJson(ItemRelatedItems instance) =>
    <String, dynamic>{
      'set_name': instance.setName,
      'base_item': instance.baseItem,
      'variant_items': instance.variantItems?.map((e) => e.toJson()).toList(),
      'set_items': instance.setItems?.map((e) => e.toJson()).toList(),
    };

ItemTemperature _$ItemTemperatureFromJson(Map<String, dynamic> json) =>
    ItemTemperature(
      unit: json['unit'] as String?,
      coolingThreshold: (json['cooling_threshold'] as num?)?.toDouble(),
      irThreshold: (json['ir_threshold'] as num?)?.toDouble(),
      overheatThreshold: (json['overheat_threshold'] as num?)?.toDouble(),
      overheatTemperature: (json['overheat_temperature'] as num?)?.toDouble(),
      maxTemperature: (json['max_temperature'] as num?)?.toDouble(),
      recoveryTemperature: (json['recovery_temperature'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ItemTemperatureToJson(ItemTemperature instance) =>
    <String, dynamic>{
      'unit': instance.unit,
      'cooling_threshold': instance.coolingThreshold,
      'ir_threshold': instance.irThreshold,
      'overheat_threshold': instance.overheatThreshold,
      'overheat_temperature': instance.overheatTemperature,
      'max_temperature': instance.maxTemperature,
      'recovery_temperature': instance.recoveryTemperature,
    };

GamePortItem _$GamePortItemFromJson(Map<String, dynamic> json) => GamePortItem(
      uuid: json['uuid'] as String?,
      name: json['name'] as String?,
      className: json['class_name'] as String?,
      type: json['type'] as String?,
      typeLabel: json['type_label'] as String?,
      subType: json['sub_type'] as String?,
      subTypeLabel: json['sub_type_label'] as String?,
      classification: json['classification'] as String?,
      classificationLabel: json['classification_label'] as String?,
      isBaseVariant: json['is_base_variant'] as bool?,
      variantName: json['variant_name'] as String?,
      link: json['link'] as String?,
      webUrl: json['web_url'] as String?,
      size: (json['size'] as num?)?.toInt(),
      mass: (json['mass'] as num?)?.toDouble(),
      grade: json['grade'] as String?,
      $class: json['class'] as String?,
      manufacturer: json['manufacturer'],
      resourceNetwork: json['resource_network'],
      emission: json['emission'],
      version: json['version'] as String?,
    );

Map<String, dynamic> _$GamePortItemToJson(GamePortItem instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'class_name': instance.className,
      'type': instance.type,
      'type_label': instance.typeLabel,
      'sub_type': instance.subType,
      'sub_type_label': instance.subTypeLabel,
      'classification': instance.classification,
      'classification_label': instance.classificationLabel,
      'is_base_variant': instance.isBaseVariant,
      'variant_name': instance.variantName,
      'link': instance.link,
      'web_url': instance.webUrl,
      'size': instance.size,
      'mass': instance.mass,
      'grade': instance.grade,
      'class': instance.$class,
      'manufacturer': instance.manufacturer,
      'resource_network': instance.resourceNetwork,
      'emission': instance.emission,
      'version': instance.version,
    };

GamePortItemSummary _$GamePortItemSummaryFromJson(Map<String, dynamic> json) =>
    GamePortItemSummary(
      uuid: json['uuid'] as String?,
      name: json['name'] as String?,
      className: json['class_name'] as String?,
      type: json['type'] as String?,
      subType: json['sub_type'] as String?,
      size: (json['size'] as num?)?.toInt(),
      grade: (json['grade'] as num?)?.toInt(),
      manufacturer: json['manufacturer'] == null
          ? null
          : GamePortItemSummary$Manufacturer.fromJson(
              json['manufacturer'] as Map<String, dynamic>),
      link: json['link'] as String?,
      webUrl: json['web_url'] as String?,
    );

Map<String, dynamic> _$GamePortItemSummaryToJson(
        GamePortItemSummary instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'class_name': instance.className,
      'type': instance.type,
      'sub_type': instance.subType,
      'size': instance.size,
      'grade': instance.grade,
      'manufacturer': instance.manufacturer?.toJson(),
      'link': instance.link,
      'web_url': instance.webUrl,
    };

ResourceContainer _$ResourceContainerFromJson(Map<String, dynamic> json) =>
    ResourceContainer(
      mass: (json['mass'] as num?)?.toDouble(),
      immutable: json['immutable'] as bool?,
      defaultFillFraction: (json['default_fill_fraction'] as num?)?.toDouble(),
      capacity: json['capacity'] == null
          ? null
          : ResourceContainer$Capacity.fromJson(
              json['capacity'] as Map<String, dynamic>),
      inclusiveResources: (json['inclusive_resources'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      defaultComposition: (json['default_composition'] as List<dynamic>?)
              ?.map((e) => ResourceContainerCompositionEntry.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$ResourceContainerToJson(ResourceContainer instance) =>
    <String, dynamic>{
      'mass': instance.mass,
      'immutable': instance.immutable,
      'default_fill_fraction': instance.defaultFillFraction,
      'capacity': instance.capacity?.toJson(),
      'inclusive_resources': instance.inclusiveResources,
      'default_composition':
          instance.defaultComposition?.map((e) => e.toJson()).toList(),
    };

ResourceContainerCompositionEntry _$ResourceContainerCompositionEntryFromJson(
        Map<String, dynamic> json) =>
    ResourceContainerCompositionEntry(
      entry: json['entry'] as String?,
      weight: (json['weight'] as num?)?.toDouble(),
      commodity: json['commodity'],
    );

Map<String, dynamic> _$ResourceContainerCompositionEntryToJson(
        ResourceContainerCompositionEntry instance) =>
    <String, dynamic>{
      'entry': instance.entry,
      'weight': instance.weight,
      'commodity': instance.commodity,
    };

ResourceContainerCommodityLink _$ResourceContainerCommodityLinkFromJson(
        Map<String, dynamic> json) =>
    ResourceContainerCommodityLink(
      uuid: json['uuid'] as String?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      link: json['link'] as String?,
    );

Map<String, dynamic> _$ResourceContainerCommodityLinkToJson(
        ResourceContainerCommodityLink instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'slug': instance.slug,
      'link': instance.link,
    };

ResourceNetworkDelta _$ResourceNetworkDeltaFromJson(
        Map<String, dynamic> json) =>
    ResourceNetworkDelta(
      type: json['type'] as String?,
      resource: json['resource'] as String?,
      rate: (json['rate'] as num?)?.toDouble(),
      minimumFraction: (json['minimum_fraction'] as num?)?.toDouble(),
      generatedResource: json['generated_resource'] as String?,
      generatedRate: (json['generated_rate'] as num?)?.toDouble(),
      discharge: (json['discharge'] as num?)?.toDouble(),
      noOverGeneration: (json['no_over_generation'] as num?)?.toDouble(),
      binaryEvaluation: (json['binary_evaluation'] as num?)?.toDouble(),
      composition: (json['composition'] as List<dynamic>?)
          ?.map((e) => ResourceNetworkDelta$Composition$Item.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResourceNetworkDeltaToJson(
        ResourceNetworkDelta instance) =>
    <String, dynamic>{
      'type': instance.type,
      'resource': instance.resource,
      'rate': instance.rate,
      'minimum_fraction': instance.minimumFraction,
      'generated_resource': instance.generatedResource,
      'generated_rate': instance.generatedRate,
      'discharge': instance.discharge,
      'no_over_generation': instance.noOverGeneration,
      'binary_evaluation': instance.binaryEvaluation,
      'composition': instance.composition?.map((e) => e.toJson()).toList(),
    };

ResourceNetworkState _$ResourceNetworkStateFromJson(
        Map<String, dynamic> json) =>
    ResourceNetworkState(
      name: json['name'] as String?,
      signature: json['signature'] == null
          ? null
          : ResourceNetworkState$Signature.fromJson(
              json['signature'] as Map<String, dynamic>),
      deltas: (json['deltas'] as List<dynamic>?)
              ?.map((e) =>
                  ResourceNetworkDelta.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      powerRanges: (json['power_ranges'] as List<dynamic>?)
          ?.map((e) => ResourceNetworkState$PowerRanges$Item.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResourceNetworkStateToJson(
        ResourceNetworkState instance) =>
    <String, dynamic>{
      'name': instance.name,
      'signature': instance.signature?.toJson(),
      'deltas': instance.deltas?.map((e) => e.toJson()).toList(),
      'power_ranges': instance.powerRanges?.map((e) => e.toJson()).toList(),
    };

ResourceNetwork _$ResourceNetworkFromJson(Map<String, dynamic> json) =>
    ResourceNetwork(
      isNetworked: json['is_networked'] as bool?,
      isRelay: json['is_relay'] as bool?,
      defaultPriority: (json['default_priority'] as num?)?.toInt(),
      states: (json['states'] as List<dynamic>?)
              ?.map((e) =>
                  ResourceNetworkState.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      repair: json['repair'] == null
          ? null
          : ResourceNetwork$Repair.fromJson(
              json['repair'] as Map<String, dynamic>),
      usage: json['usage'] == null
          ? null
          : ResourceNetwork$Usage.fromJson(
              json['usage'] as Map<String, dynamic>),
      generation: json['generation'] == null
          ? null
          : ResourceNetwork$Generation.fromJson(
              json['generation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResourceNetworkToJson(ResourceNetwork instance) =>
    <String, dynamic>{
      'is_networked': instance.isNetworked,
      'is_relay': instance.isRelay,
      'default_priority': instance.defaultPriority,
      'states': instance.states?.map((e) => e.toJson()).toList(),
      'repair': instance.repair?.toJson(),
      'usage': instance.usage?.toJson(),
      'generation': instance.generation?.toJson(),
    };

AmmunitionDamageFalloff _$AmmunitionDamageFalloffFromJson(
        Map<String, dynamic> json) =>
    AmmunitionDamageFalloff(
      physical: (json['Physical'] as num?)?.toDouble(),
      energy: (json['Energy'] as num?)?.toDouble(),
      distortion: (json['Distortion'] as num?)?.toDouble(),
      thermal: (json['Thermal'] as num?)?.toDouble(),
      biochemical: (json['Biochemical'] as num?)?.toDouble(),
      stun: (json['Stun'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$AmmunitionDamageFalloffToJson(
        AmmunitionDamageFalloff instance) =>
    <String, dynamic>{
      'Physical': instance.physical,
      'Energy': instance.energy,
      'Distortion': instance.distortion,
      'Thermal': instance.thermal,
      'Biochemical': instance.biochemical,
      'Stun': instance.stun,
    };

Ammunition _$AmmunitionFromJson(Map<String, dynamic> json) => Ammunition(
      uuid: json['uuid'] as String?,
      speed: (json['speed'] as num?)?.toDouble(),
      lifetime: (json['lifetime'] as num?)?.toDouble(),
      range: (json['range'] as num?)?.toDouble(),
      size: (json['size'] as num?)?.toInt(),
      capacity: (json['capacity'] as num?)?.toInt(),
      initialCapacity: (json['initial_capacity'] as num?)?.toInt(),
      damageFalloffLevel1: (json['damage_falloff_level_1'] as num?)?.toDouble(),
      damageFalloffLevel2: (json['damage_falloff_level_2'] as num?)?.toDouble(),
      damageFalloffLevel3: (json['damage_falloff_level_3'] as num?)?.toDouble(),
      maxPenetrationThickness:
          (json['max_penetration_thickness'] as num?)?.toDouble(),
      penetration: json['penetration'] == null
          ? null
          : Ammunition$Penetration.fromJson(
              json['penetration'] as Map<String, dynamic>),
      impactDamage: (json['impact_damage'] as List<dynamic>?)
              ?.map(
                  (e) => WeaponDamageEntry.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      detonationDamage: (json['detonation_damage'] as List<dynamic>?)
              ?.map(
                  (e) => WeaponDamageEntry.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      impactDamageMap: json['impact_damage_map'] == null
          ? null
          : Ammunition$ImpactDamageMap.fromJson(
              json['impact_damage_map'] as Map<String, dynamic>),
      detonationDamageMap: json['detonation_damage_map'] == null
          ? null
          : Ammunition$DetonationDamageMap.fromJson(
              json['detonation_damage_map'] as Map<String, dynamic>),
      explosionRadius: json['explosion_radius'] == null
          ? null
          : Ammunition$ExplosionRadius.fromJson(
              json['explosion_radius'] as Map<String, dynamic>),
      impulseScale: (json['impulse_scale'] as num?)?.toDouble(),
      bulletType: (json['bullet_type'] as num?)?.toInt(),
      damageDropMinDistance: json['damage_drop_min_distance'] == null
          ? null
          : Ammunition$DamageDropMinDistance.fromJson(
              json['damage_drop_min_distance'] as Map<String, dynamic>),
      damageDropPerMeter: json['damage_drop_per_meter'] == null
          ? null
          : Ammunition$DamageDropPerMeter.fromJson(
              json['damage_drop_per_meter'] as Map<String, dynamic>),
      damageDropMinDamage: json['damage_drop_min_damage'] == null
          ? null
          : Ammunition$DamageDropMinDamage.fromJson(
              json['damage_drop_min_damage'] as Map<String, dynamic>),
      bulletImpulseFalloff: json['bullet_impulse_falloff'] == null
          ? null
          : Ammunition$BulletImpulseFalloff.fromJson(
              json['bullet_impulse_falloff'] as Map<String, dynamic>),
      bulletElectron: json['bullet_electron'] == null
          ? null
          : Ammunition$BulletElectron.fromJson(
              json['bullet_electron'] as Map<String, dynamic>),
      conversionRate: (json['conversion_rate'] as num?)?.toInt(),
      damageFalloffs: json['damage_falloffs'] == null
          ? null
          : Ammunition$DamageFalloffs.fromJson(
              json['damage_falloffs'] as Map<String, dynamic>),
      piercability: json['piercability'],
    );

Map<String, dynamic> _$AmmunitionToJson(Ammunition instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'speed': instance.speed,
      'lifetime': instance.lifetime,
      'range': instance.range,
      'size': instance.size,
      'capacity': instance.capacity,
      'initial_capacity': instance.initialCapacity,
      'damage_falloff_level_1': instance.damageFalloffLevel1,
      'damage_falloff_level_2': instance.damageFalloffLevel2,
      'damage_falloff_level_3': instance.damageFalloffLevel3,
      'max_penetration_thickness': instance.maxPenetrationThickness,
      'penetration': instance.penetration?.toJson(),
      'impact_damage': instance.impactDamage?.map((e) => e.toJson()).toList(),
      'detonation_damage':
          instance.detonationDamage?.map((e) => e.toJson()).toList(),
      'impact_damage_map': instance.impactDamageMap?.toJson(),
      'detonation_damage_map': instance.detonationDamageMap?.toJson(),
      'explosion_radius': instance.explosionRadius?.toJson(),
      'impulse_scale': instance.impulseScale,
      'bullet_type': instance.bulletType,
      'damage_drop_min_distance': instance.damageDropMinDistance?.toJson(),
      'damage_drop_per_meter': instance.damageDropPerMeter?.toJson(),
      'damage_drop_min_damage': instance.damageDropMinDamage?.toJson(),
      'bullet_impulse_falloff': instance.bulletImpulseFalloff?.toJson(),
      'bullet_electron': instance.bulletElectron?.toJson(),
      'conversion_rate': instance.conversionRate,
      'damage_falloffs': instance.damageFalloffs?.toJson(),
      'piercability': instance.piercability,
    };

VehicleArmor _$VehicleArmorFromJson(Map<String, dynamic> json) => VehicleArmor(
      uuid: json['uuid'] as String?,
      health: (json['health'] as num?)?.toDouble(),
      signalInfrared: (json['signal_infrared'] as num?)?.toDouble(),
      signalElectromagnetic:
          (json['signal_electromagnetic'] as num?)?.toDouble(),
      signalCrossSection: (json['signal_cross_section'] as num?)?.toDouble(),
      damagePhysical: (json['damage_physical'] as num?)?.toDouble(),
      damageEnergy: (json['damage_energy'] as num?)?.toDouble(),
      damageDistortion: (json['damage_distortion'] as num?)?.toDouble(),
      damageThermal: (json['damage_thermal'] as num?)?.toDouble(),
      damageBiochemical: (json['damage_biochemical'] as num?)?.toDouble(),
      damageStun: (json['damage_stun'] as num?)?.toDouble(),
      signalMultiplier: json['signal_multiplier'] == null
          ? null
          : VehicleArmor$SignalMultiplier.fromJson(
              json['signal_multiplier'] as Map<String, dynamic>),
      damageMultiplier: json['damage_multiplier'] == null
          ? null
          : VehicleArmor$DamageMultiplier.fromJson(
              json['damage_multiplier'] as Map<String, dynamic>),
      resistanceMultiplier: json['resistance_multiplier'] == null
          ? null
          : VehicleArmor$ResistanceMultiplier.fromJson(
              json['resistance_multiplier'] as Map<String, dynamic>),
      deflection: json['deflection'] == null
          ? null
          : VehicleArmor$Deflection.fromJson(
              json['deflection'] as Map<String, dynamic>),
      penetrationResistance: json['penetration_resistance'] == null
          ? null
          : VehicleArmor$PenetrationResistance.fromJson(
              json['penetration_resistance'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VehicleArmorToJson(VehicleArmor instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'health': instance.health,
      'signal_infrared': instance.signalInfrared,
      'signal_electromagnetic': instance.signalElectromagnetic,
      'signal_cross_section': instance.signalCrossSection,
      'damage_physical': instance.damagePhysical,
      'damage_energy': instance.damageEnergy,
      'damage_distortion': instance.damageDistortion,
      'damage_thermal': instance.damageThermal,
      'damage_biochemical': instance.damageBiochemical,
      'damage_stun': instance.damageStun,
      'signal_multiplier': instance.signalMultiplier?.toJson(),
      'damage_multiplier': instance.damageMultiplier?.toJson(),
      'resistance_multiplier': instance.resistanceMultiplier?.toJson(),
      'deflection': instance.deflection?.toJson(),
      'penetration_resistance': instance.penetrationResistance?.toJson(),
    };

Bomb _$BombFromJson(Map<String, dynamic> json) => Bomb(
      armTime: (json['arm_time'] as num?)?.toDouble(),
      igniteTime: (json['ignite_time'] as num?)?.toDouble(),
      collisionDelayTime: (json['collision_delay_time'] as num?)?.toDouble(),
      explosionSafetyDistance:
          (json['explosion_safety_distance'] as num?)?.toDouble(),
      explosionRadiusMin: (json['explosion_radius_min'] as num?)?.toDouble(),
      explosionRadiusMax: (json['explosion_radius_max'] as num?)?.toDouble(),
      maximumDropAngle: (json['maximum_drop_angle'] as num?)?.toDouble(),
      damage: (json['damage'] as num?)?.toDouble(),
      damageTotal: (json['damage_total'] as num?)?.toDouble(),
      damages: (json['damages'] as List<dynamic>?)
              ?.map((e) => WeaponDamage.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      explosion: json['explosion'] == null
          ? null
          : Bomb$Explosion.fromJson(json['explosion'] as Map<String, dynamic>),
      delays: json['delays'] == null
          ? null
          : Bomb$Delays.fromJson(json['delays'] as Map<String, dynamic>),
      damageMap: json['damage_map'] == null
          ? null
          : Bomb$DamageMap.fromJson(json['damage_map'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BombToJson(Bomb instance) => <String, dynamic>{
      'arm_time': instance.armTime,
      'ignite_time': instance.igniteTime,
      'collision_delay_time': instance.collisionDelayTime,
      'explosion_safety_distance': instance.explosionSafetyDistance,
      'explosion_radius_min': instance.explosionRadiusMin,
      'explosion_radius_max': instance.explosionRadiusMax,
      'maximum_drop_angle': instance.maximumDropAngle,
      'damage': instance.damage,
      'damage_total': instance.damageTotal,
      'damages': instance.damages?.map((e) => e.toJson()).toList(),
      'explosion': instance.explosion?.toJson(),
      'delays': instance.delays?.toJson(),
      'damage_map': instance.damageMap?.toJson(),
    };

CargoGrid _$CargoGridFromJson(Map<String, dynamic> json) => CargoGrid(
      scu: (json['scu'] as num?)?.toDouble(),
      x: (json['x'] as num?)?.toDouble(),
      y: (json['y'] as num?)?.toDouble(),
      z: (json['z'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CargoGridToJson(CargoGrid instance) => <String, dynamic>{
      'scu': instance.scu,
      'x': instance.x,
      'y': instance.y,
      'z': instance.z,
    };

Clothing _$ClothingFromJson(Map<String, dynamic> json) => Clothing(
      clothingType: json['clothing_type'] as String?,
      slot: json['slot'] as String?,
      type: json['type'] as String?,
      resistances: (json['resistances'] as List<dynamic>?)
          ?.map((e) =>
              Clothing$Resistances$Item.fromJson(e as Map<String, dynamic>))
          .toList(),
      tempResistanceMin: (json['temp_resistance_min'] as num?)?.toDouble(),
      tempResistanceMax: (json['temp_resistance_max'] as num?)?.toDouble(),
      radiationResistance: json['radiation_resistance'],
      gforceResistance: (json['gforce_resistance'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ClothingToJson(Clothing instance) => <String, dynamic>{
      'clothing_type': instance.clothingType,
      'slot': instance.slot,
      'type': instance.type,
      'resistances': instance.resistances?.map((e) => e.toJson()).toList(),
      'temp_resistance_min': instance.tempResistanceMin,
      'temp_resistance_max': instance.tempResistanceMax,
      'radiation_resistance': instance.radiationResistance,
      'gforce_resistance': instance.gforceResistance,
    };

Cooler _$CoolerFromJson(Map<String, dynamic> json) => Cooler(
      coolingRate: (json['cooling_rate'] as num?)?.toDouble(),
      suppressionIrFactor: (json['suppression_ir_factor'] as num?)?.toDouble(),
      suppressionHeatFactor:
          (json['suppression_heat_factor'] as num?)?.toDouble(),
      coolantSegmentGeneration:
          (json['coolant_segment_generation'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CoolerToJson(Cooler instance) => <String, dynamic>{
      'cooling_rate': instance.coolingRate,
      'suppression_ir_factor': instance.suppressionIrFactor,
      'suppression_heat_factor': instance.suppressionHeatFactor,
      'coolant_segment_generation': instance.coolantSegmentGeneration,
    };

CounterMeasure _$CounterMeasureFromJson(Map<String, dynamic> json) =>
    CounterMeasure(
      type: json['type'] as String?,
      signature: json['signature'] == null
          ? null
          : CounterMeasure$Signature.fromJson(
              json['signature'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CounterMeasureToJson(CounterMeasure instance) =>
    <String, dynamic>{
      'type': instance.type,
      'signature': instance.signature?.toJson(),
    };

Emp _$EmpFromJson(Map<String, dynamic> json) => Emp(
      distortionDamage: (json['distortion_damage'] as num?)?.toDouble(),
      empRadius: (json['emp_radius'] as num?)?.toDouble(),
      minEmpRadius: (json['min_emp_radius'] as num?)?.toDouble(),
      chargeDuration: (json['charge_duration'] as num?)?.toDouble(),
      unleashDuration: (json['unleash_duration'] as num?)?.toDouble(),
      cooldownDuration: (json['cooldown_duration'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$EmpToJson(Emp instance) => <String, dynamic>{
      'distortion_damage': instance.distortionDamage,
      'emp_radius': instance.empRadius,
      'min_emp_radius': instance.minEmpRadius,
      'charge_duration': instance.chargeDuration,
      'unleash_duration': instance.unleashDuration,
      'cooldown_duration': instance.cooldownDuration,
    };

FlightControllerBoostCapacitor _$FlightControllerBoostCapacitorFromJson(
        Map<String, dynamic> json) =>
    FlightControllerBoostCapacitor(
      capacity: (json['capacity'] as num?)?.toDouble(),
      thresholdRatio: (json['threshold_ratio'] as num?)?.toDouble(),
      idleCost: (json['idle_cost'] as num?)?.toDouble(),
      linearCost: (json['linear_cost'] as num?)?.toDouble(),
      angularCost: (json['angular_cost'] as num?)?.toDouble(),
      regenPerSec: (json['regen_per_sec'] as num?)?.toDouble(),
      regenDelay: (json['regen_delay'] as num?)?.toDouble(),
      regenTime: (json['regen_time'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$FlightControllerBoostCapacitorToJson(
        FlightControllerBoostCapacitor instance) =>
    <String, dynamic>{
      'capacity': instance.capacity,
      'threshold_ratio': instance.thresholdRatio,
      'idle_cost': instance.idleCost,
      'linear_cost': instance.linearCost,
      'angular_cost': instance.angularCost,
      'regen_per_sec': instance.regenPerSec,
      'regen_delay': instance.regenDelay,
      'regen_time': instance.regenTime,
    };

FlightControllerBoostActivation _$FlightControllerBoostActivationFromJson(
        Map<String, dynamic> json) =>
    FlightControllerBoostActivation(
      preDelayTime: (json['pre_delay_time'] as num?)?.toDouble(),
      rampUpTime: (json['ramp_up_time'] as num?)?.toDouble(),
      rampDownTime: (json['ramp_down_time'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$FlightControllerBoostActivationToJson(
        FlightControllerBoostActivation instance) =>
    <String, dynamic>{
      'pre_delay_time': instance.preDelayTime,
      'ramp_up_time': instance.rampUpTime,
      'ramp_down_time': instance.rampDownTime,
    };

FlightControllerThrusterDecay _$FlightControllerThrusterDecayFromJson(
        Map<String, dynamic> json) =>
    FlightControllerThrusterDecay(
      linearAccel: (json['linear_accel'] as num?)?.toDouble(),
      angularAccel: (json['angular_accel'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$FlightControllerThrusterDecayToJson(
        FlightControllerThrusterDecay instance) =>
    <String, dynamic>{
      'linear_accel': instance.linearAccel,
      'angular_accel': instance.angularAccel,
    };

FlightControllerMultiplier _$FlightControllerMultiplierFromJson(
        Map<String, dynamic> json) =>
    FlightControllerMultiplier(
      torqueImbalance: (json['torque_imbalance'] as num?)?.toDouble(),
      lift: (json['lift'] as num?)?.toDouble(),
      drag: (json['drag'] as num?)?.toDouble(),
      scmMaxDrag: (json['scm_max_drag'] as num?)?.toDouble(),
      precisionLanding: (json['precision_landing'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$FlightControllerMultiplierToJson(
        FlightControllerMultiplier instance) =>
    <String, dynamic>{
      'torque_imbalance': instance.torqueImbalance,
      'lift': instance.lift,
      'drag': instance.drag,
      'scm_max_drag': instance.scmMaxDrag,
      'precision_landing': instance.precisionLanding,
    };

FlightControllerSignedAxisMultiplier
    _$FlightControllerSignedAxisMultiplierFromJson(Map<String, dynamic> json) =>
        FlightControllerSignedAxisMultiplier(
          positive: (json['positive'] as num?)?.toDouble(),
          negative: (json['negative'] as num?)?.toDouble(),
        );

Map<String, dynamic> _$FlightControllerSignedAxisMultiplierToJson(
        FlightControllerSignedAxisMultiplier instance) =>
    <String, dynamic>{
      'positive': instance.positive,
      'negative': instance.negative,
    };

FlightControllerBoostMultiplier _$FlightControllerBoostMultiplierFromJson(
        Map<String, dynamic> json) =>
    FlightControllerBoostMultiplier(
      accelX: json['accel_x'] == null
          ? null
          : FlightControllerSignedAxisMultiplier.fromJson(
              json['accel_x'] as Map<String, dynamic>),
      accelY: json['accel_y'] == null
          ? null
          : FlightControllerSignedAxisMultiplier.fromJson(
              json['accel_y'] as Map<String, dynamic>),
      accelZ: json['accel_z'] == null
          ? null
          : FlightControllerSignedAxisMultiplier.fromJson(
              json['accel_z'] as Map<String, dynamic>),
      pitch: (json['pitch'] as num?)?.toDouble(),
      yaw: (json['yaw'] as num?)?.toDouble(),
      roll: (json['roll'] as num?)?.toDouble(),
      pitchAccel: (json['pitch_accel'] as num?)?.toDouble(),
      yawAccel: (json['yaw_accel'] as num?)?.toDouble(),
      rollAccel: (json['roll_accel'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$FlightControllerBoostMultiplierToJson(
        FlightControllerBoostMultiplier instance) =>
    <String, dynamic>{
      'accel_x': instance.accelX?.toJson(),
      'accel_y': instance.accelY?.toJson(),
      'accel_z': instance.accelZ?.toJson(),
      'pitch': instance.pitch,
      'yaw': instance.yaw,
      'roll': instance.roll,
      'pitch_accel': instance.pitchAccel,
      'yaw_accel': instance.yawAccel,
      'roll_accel': instance.rollAccel,
    };

FlightControllerPrecisionMode _$FlightControllerPrecisionModeFromJson(
        Map<String, dynamic> json) =>
    FlightControllerPrecisionMode(
      maxSpeedFullProximityAssist:
          (json['max_speed_full_proximity_assist'] as num?)?.toDouble(),
      maxSpeedZeroProximityAssist:
          (json['max_speed_zero_proximity_assist'] as num?)?.toDouble(),
      minDistance: (json['min_distance'] as num?)?.toDouble(),
      maxDistance: (json['max_distance'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$FlightControllerPrecisionModeToJson(
        FlightControllerPrecisionMode instance) =>
    <String, dynamic>{
      'max_speed_full_proximity_assist': instance.maxSpeedFullProximityAssist,
      'max_speed_zero_proximity_assist': instance.maxSpeedZeroProximityAssist,
      'min_distance': instance.minDistance,
      'max_distance': instance.maxDistance,
    };

FlightControllerRecallParams _$FlightControllerRecallParamsFromJson(
        Map<String, dynamic> json) =>
    FlightControllerRecallParams(
      hoverHeightAtDestination:
          (json['hover_height_at_destination'] as num?)?.toDouble(),
      forwardOffset: (json['forward_offset'] as num?)?.toDouble(),
      obstructionDetectionRange:
          (json['obstruction_detection_range'] as num?)?.toDouble(),
      defaultPlatformDetectionRange:
          (json['default_platform_detection_range'] as num?)?.toDouble(),
      minimumRecallDistance:
          (json['minimum_recall_distance'] as num?)?.toDouble(),
      brakingDistanceOffset:
          (json['braking_distance_offset'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$FlightControllerRecallParamsToJson(
        FlightControllerRecallParams instance) =>
    <String, dynamic>{
      'hover_height_at_destination': instance.hoverHeightAtDestination,
      'forward_offset': instance.forwardOffset,
      'obstruction_detection_range': instance.obstructionDetectionRange,
      'default_platform_detection_range':
          instance.defaultPlatformDetectionRange,
      'minimum_recall_distance': instance.minimumRecallDistance,
      'braking_distance_offset': instance.brakingDistanceOffset,
    };

FlightControllerCollisionDetection _$FlightControllerCollisionDetectionFromJson(
        Map<String, dynamic> json) =>
    FlightControllerCollisionDetection(
      collisionWarnSpeed: (json['collision_warn_speed'] as num?)?.toDouble(),
      collisionWarnTime: (json['collision_warn_time'] as num?)?.toDouble(),
      collisionDangerCloseWarnTime:
          (json['collision_danger_close_warn_time'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$FlightControllerCollisionDetectionToJson(
        FlightControllerCollisionDetection instance) =>
    <String, dynamic>{
      'collision_warn_speed': instance.collisionWarnSpeed,
      'collision_warn_time': instance.collisionWarnTime,
      'collision_danger_close_warn_time': instance.collisionDangerCloseWarnTime,
    };

FlightNoFuelParams _$FlightNoFuelParamsFromJson(Map<String, dynamic> json) =>
    FlightNoFuelParams(
      linearAccelerationModifier:
          (json['linear_acceleration_modifier'] as num?)?.toDouble(),
      angularAccelerationModifier:
          (json['angular_acceleration_modifier'] as num?)?.toDouble(),
      angularVelocityModifier:
          (json['angular_velocity_modifier'] as num?)?.toDouble(),
      legacyMaxSpeed: (json['legacy_max_speed'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$FlightNoFuelParamsToJson(FlightNoFuelParams instance) =>
    <String, dynamic>{
      'linear_acceleration_modifier': instance.linearAccelerationModifier,
      'angular_acceleration_modifier': instance.angularAccelerationModifier,
      'angular_velocity_modifier': instance.angularVelocityModifier,
      'legacy_max_speed': instance.legacyMaxSpeed,
    };

FlightControllerGravlev _$FlightControllerGravlevFromJson(
        Map<String, dynamic> json) =>
    FlightControllerGravlev(
      maxSpeed: (json['max_speed'] as num?)?.toDouble(),
      turnFriction: (json['turn_friction'] as num?)?.toDouble(),
      airControllerMultiplier:
          (json['air_controller_multiplier'] as num?)?.toDouble(),
      antiFallMultiplier: (json['anti_fall_multiplier'] as num?)?.toDouble(),
      lateralStrafeMultiplier:
          (json['lateral_strafe_multiplier'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$FlightControllerGravlevToJson(
        FlightControllerGravlev instance) =>
    <String, dynamic>{
      'max_speed': instance.maxSpeed,
      'turn_friction': instance.turnFriction,
      'air_controller_multiplier': instance.airControllerMultiplier,
      'anti_fall_multiplier': instance.antiFallMultiplier,
      'lateral_strafe_multiplier': instance.lateralStrafeMultiplier,
    };

FlightController _$FlightControllerFromJson(Map<String, dynamic> json) =>
    FlightController(
      scmSpeed: (json['scm_speed'] as num?)?.toDouble(),
      boostSpeedForward: (json['boost_speed_forward'] as num?)?.toDouble(),
      boostSpeedBackward: (json['boost_speed_backward'] as num?)?.toDouble(),
      maxSpeed: (json['max_speed'] as num?)?.toDouble(),
      pitch: (json['pitch'] as num?)?.toDouble(),
      yaw: (json['yaw'] as num?)?.toDouble(),
      roll: (json['roll'] as num?)?.toDouble(),
      pitchBoosted: (json['pitch_boosted'] as num?)?.toInt(),
      yawBoosted: (json['yaw_boosted'] as num?)?.toInt(),
      rollBoosted: (json['roll_boosted'] as num?)?.toInt(),
      boostCapacitor: json['boost_capacitor'] == null
          ? null
          : FlightControllerBoostCapacitor.fromJson(
              json['boost_capacitor'] as Map<String, dynamic>),
      boostActivation: json['boost_activation'] == null
          ? null
          : FlightControllerBoostActivation.fromJson(
              json['boost_activation'] as Map<String, dynamic>),
      thrusterDecay: json['thruster_decay'] == null
          ? null
          : FlightControllerThrusterDecay.fromJson(
              json['thruster_decay'] as Map<String, dynamic>),
      multiplier: json['multiplier'] == null
          ? null
          : FlightControllerMultiplier.fromJson(
              json['multiplier'] as Map<String, dynamic>),
      boostMultiplier: json['boost_multiplier'] == null
          ? null
          : FlightControllerBoostMultiplier.fromJson(
              json['boost_multiplier'] as Map<String, dynamic>),
      precisionMode: json['precision_mode'] == null
          ? null
          : FlightControllerPrecisionMode.fromJson(
              json['precision_mode'] as Map<String, dynamic>),
      recallParams: json['recall_params'],
      collisionDetection: json['collision_detection'],
      gravlev: json['gravlev'] == null
          ? null
          : FlightControllerGravlev.fromJson(
              json['gravlev'] as Map<String, dynamic>),
      noFuelParams: json['no_fuel_params'],
    );

Map<String, dynamic> _$FlightControllerToJson(FlightController instance) =>
    <String, dynamic>{
      'scm_speed': instance.scmSpeed,
      'boost_speed_forward': instance.boostSpeedForward,
      'boost_speed_backward': instance.boostSpeedBackward,
      'max_speed': instance.maxSpeed,
      'pitch': instance.pitch,
      'yaw': instance.yaw,
      'roll': instance.roll,
      'pitch_boosted': instance.pitchBoosted,
      'yaw_boosted': instance.yawBoosted,
      'roll_boosted': instance.rollBoosted,
      'boost_capacitor': instance.boostCapacitor?.toJson(),
      'boost_activation': instance.boostActivation?.toJson(),
      'thruster_decay': instance.thrusterDecay?.toJson(),
      'multiplier': instance.multiplier?.toJson(),
      'boost_multiplier': instance.boostMultiplier?.toJson(),
      'precision_mode': instance.precisionMode?.toJson(),
      'recall_params': instance.recallParams,
      'collision_detection': instance.collisionDetection,
      'gravlev': instance.gravlev?.toJson(),
      'no_fuel_params': instance.noFuelParams,
    };

FoodNutrition _$FoodNutritionFromJson(Map<String, dynamic> json) =>
    FoodNutrition();

Map<String, dynamic> _$FoodNutritionToJson(FoodNutrition instance) =>
    <String, dynamic>{};

FoodEffectDurations _$FoodEffectDurationsFromJson(Map<String, dynamic> json) =>
    FoodEffectDurations();

Map<String, dynamic> _$FoodEffectDurationsToJson(
        FoodEffectDurations instance) =>
    <String, dynamic>{};

FoodContainer _$FoodContainerFromJson(Map<String, dynamic> json) =>
    FoodContainer(
      type: json['type'] as String?,
      closed: json['closed'] as bool?,
      canBeReclosed: json['can_be_reclosed'] as bool?,
      discardWhenConsumed: json['discard_when_consumed'] as bool?,
    );

Map<String, dynamic> _$FoodContainerToJson(FoodContainer instance) =>
    <String, dynamic>{
      'type': instance.type,
      'closed': instance.closed,
      'can_be_reclosed': instance.canBeReclosed,
      'discard_when_consumed': instance.discardWhenConsumed,
    };

FoodConsumption _$FoodConsumptionFromJson(Map<String, dynamic> json) =>
    FoodConsumption(
      volume: (json['volume'] as num?)?.toDouble(),
      oneShotConsume: json['one_shot_consume'] as bool?,
    );

Map<String, dynamic> _$FoodConsumptionToJson(FoodConsumption instance) =>
    <String, dynamic>{
      'volume': instance.volume,
      'one_shot_consume': instance.oneShotConsume,
    };

Food _$FoodFromJson(Map<String, dynamic> json) => Food(
      nutrition: json['nutrition'] == null
          ? null
          : FoodNutrition.fromJson(json['nutrition'] as Map<String, dynamic>),
      buffs: json['buffs'] == null
          ? null
          : FoodEffectDurations.fromJson(json['buffs'] as Map<String, dynamic>),
      debuffs: json['debuffs'] == null
          ? null
          : FoodEffectDurations.fromJson(
              json['debuffs'] as Map<String, dynamic>),
      container: json['container'] == null
          ? null
          : FoodContainer.fromJson(json['container'] as Map<String, dynamic>),
      consumption: json['consumption'] == null
          ? null
          : FoodConsumption.fromJson(
              json['consumption'] as Map<String, dynamic>),
      nutritionalDensityRating: json['nutritional_density_rating'] as String?,
      hydrationEfficacyIndex: json['hydration_efficacy_index'] as String?,
      containerType: json['container_type'] as String?,
      oneShotConsume: json['one_shot_consume'] as bool?,
      canBeReclosed: json['can_be_reclosed'] as bool?,
      discardWhenConsumed: json['discard_when_consumed'] as bool?,
      effects: (json['effects'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
    );

Map<String, dynamic> _$FoodToJson(Food instance) => <String, dynamic>{
      'nutrition': instance.nutrition?.toJson(),
      'buffs': instance.buffs?.toJson(),
      'debuffs': instance.debuffs?.toJson(),
      'container': instance.container?.toJson(),
      'consumption': instance.consumption?.toJson(),
      'nutritional_density_rating': instance.nutritionalDensityRating,
      'hydration_efficacy_index': instance.hydrationEfficacyIndex,
      'container_type': instance.containerType,
      'one_shot_consume': instance.oneShotConsume,
      'can_be_reclosed': instance.canBeReclosed,
      'discard_when_consumed': instance.discardWhenConsumed,
      'effects': instance.effects,
    };

FuelIntake _$FuelIntakeFromJson(Map<String, dynamic> json) => FuelIntake(
      fuelPushRate: (json['fuel_push_rate'] as num?)?.toDouble(),
      minimumRate: (json['minimum_rate'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$FuelIntakeToJson(FuelIntake instance) =>
    <String, dynamic>{
      'fuel_push_rate': instance.fuelPushRate,
      'minimum_rate': instance.minimumRate,
    };

FuelTank _$FuelTankFromJson(Map<String, dynamic> json) => FuelTank(
      fillRate: (json['fill_rate'] as num?)?.toDouble(),
      drainRate: (json['drain_rate'] as num?)?.toDouble(),
      capacity: (json['capacity'] as num?)?.toDouble(),
      dischargeRate: (json['discharge_rate'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$FuelTankToJson(FuelTank instance) => <String, dynamic>{
      'fill_rate': instance.fillRate,
      'drain_rate': instance.drainRate,
      'capacity': instance.capacity,
      'discharge_rate': instance.dischargeRate,
    };

GrenadeAoe _$GrenadeAoeFromJson(Map<String, dynamic> json) => GrenadeAoe(
      min: (json['min'] as num?)?.toDouble(),
      max: (json['max'] as num?)?.toDouble(),
      minimum: (json['minimum'] as num?)?.toDouble(),
      maximum: (json['maximum'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$GrenadeAoeToJson(GrenadeAoe instance) =>
    <String, dynamic>{
      'min': instance.min,
      'max': instance.max,
      'minimum': instance.minimum,
      'maximum': instance.maximum,
    };

Grenade _$GrenadeFromJson(Map<String, dynamic> json) => Grenade(
      damageType: json['damage_type'] as String?,
      damage: (json['damage'] as num?)?.toDouble(),
      aoe: json['aoe'] == null
          ? null
          : GrenadeAoe.fromJson(json['aoe'] as Map<String, dynamic>),
      areaOfEffect: (json['area_of_effect'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$GrenadeToJson(Grenade instance) => <String, dynamic>{
      'damage_type': instance.damageType,
      'damage': instance.damage,
      'aoe': instance.aoe?.toJson(),
      'area_of_effect': instance.areaOfEffect,
    };

HackingChip _$HackingChipFromJson(Map<String, dynamic> json) => HackingChip(
      maxCharges: (json['max_charges'] as num?)?.toInt(),
      durationMultiplier: (json['duration_multiplier'] as num?)?.toDouble(),
      errorChance: (json['error_chance'] as num?)?.toDouble(),
      accessTag: json['access_tag'] as String?,
    );

Map<String, dynamic> _$HackingChipToJson(HackingChip instance) =>
    <String, dynamic>{
      'max_charges': instance.maxCharges,
      'duration_multiplier': instance.durationMultiplier,
      'error_chance': instance.errorChance,
      'access_tag': instance.accessTag,
    };

JumpDrive _$JumpDriveFromJson(Map<String, dynamic> json) => JumpDrive(
      alignmentRate: (json['alignment_rate'] as num?)?.toDouble(),
      alignmentDecayRate: (json['alignment_decay_rate'] as num?)?.toDouble(),
      tuningRate: (json['tuning_rate'] as num?)?.toDouble(),
      tuningDecayRate: (json['tuning_decay_rate'] as num?)?.toDouble(),
      fuelUsageEfficiencyMultiplier:
          (json['fuel_usage_efficiency_multiplier'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$JumpDriveToJson(JumpDrive instance) => <String, dynamic>{
      'alignment_rate': instance.alignmentRate,
      'alignment_decay_rate': instance.alignmentDecayRate,
      'tuning_rate': instance.tuningRate,
      'tuning_decay_rate': instance.tuningDecayRate,
      'fuel_usage_efficiency_multiplier':
          instance.fuelUsageEfficiencyMultiplier,
    };

Medicine _$MedicineFromJson(Map<String, dynamic> json) => Medicine(
      nutrition: json['nutrition'] as Map<String, dynamic>?,
      debuffs: json['debuffs'] as Map<String, dynamic>?,
      container: json['container'] == null
          ? null
          : Medicine$Container.fromJson(
              json['container'] as Map<String, dynamic>),
      consumption: json['consumption'] == null
          ? null
          : Medicine$Consumption.fromJson(
              json['consumption'] as Map<String, dynamic>),
      combatBuffs: json['combat_buffs'] as Map<String, dynamic>?,
      impactResistances: json['impact_resistances'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$MedicineToJson(Medicine instance) => <String, dynamic>{
      'nutrition': instance.nutrition,
      'debuffs': instance.debuffs,
      'container': instance.container?.toJson(),
      'consumption': instance.consumption?.toJson(),
      'combat_buffs': instance.combatBuffs,
      'impact_resistances': instance.impactResistances,
    };

MeleeWeaponAttackDamages _$MeleeWeaponAttackDamagesFromJson(
        Map<String, dynamic> json) =>
    MeleeWeaponAttackDamages(
      physical: (json['physical'] as num?)?.toDouble(),
      energy: (json['energy'] as num?)?.toDouble(),
      distortion: (json['distortion'] as num?)?.toDouble(),
      thermal: (json['thermal'] as num?)?.toDouble(),
      biochemical: (json['biochemical'] as num?)?.toDouble(),
      stun: (json['stun'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$MeleeWeaponAttackDamagesToJson(
        MeleeWeaponAttackDamages instance) =>
    <String, dynamic>{
      'physical': instance.physical,
      'energy': instance.energy,
      'distortion': instance.distortion,
      'thermal': instance.thermal,
      'biochemical': instance.biochemical,
      'stun': instance.stun,
    };

MeleeWeaponAttackMode _$MeleeWeaponAttackModeFromJson(
        Map<String, dynamic> json) =>
    MeleeWeaponAttackMode(
      category: json['category'] as String?,
      damage: (json['damage'] as num?)?.toDouble(),
      stunRecoveryModifier:
          (json['stun_recovery_modifier'] as num?)?.toDouble(),
      blockStunReductionModifier:
          (json['block_stun_reduction_modifier'] as num?)?.toDouble(),
      blockStunStaminaModifier:
          (json['block_stun_stamina_modifier'] as num?)?.toDouble(),
      attackImpulse: (json['attack_impulse'] as num?)?.toDouble(),
      ignoreBodyPartImpulseScale:
          json['ignore_body_part_impulse_scale'] as bool?,
      forceKnockdown: json['force_knockdown'] as String?,
      damages: json['damages'] == null
          ? null
          : MeleeWeaponAttackDamages.fromJson(
              json['damages'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MeleeWeaponAttackModeToJson(
        MeleeWeaponAttackMode instance) =>
    <String, dynamic>{
      'category': instance.category,
      'damage': instance.damage,
      'stun_recovery_modifier': instance.stunRecoveryModifier,
      'block_stun_reduction_modifier': instance.blockStunReductionModifier,
      'block_stun_stamina_modifier': instance.blockStunStaminaModifier,
      'attack_impulse': instance.attackImpulse,
      'ignore_body_part_impulse_scale': instance.ignoreBodyPartImpulseScale,
      'force_knockdown': instance.forceKnockdown,
      'damages': instance.damages?.toJson(),
    };

MeleeWeapon _$MeleeWeaponFromJson(Map<String, dynamic> json) => MeleeWeapon(
      canBeUsedForTakeDown: json['can_be_used_for_take_down'] as bool?,
      canBlock: json['can_block'] as bool?,
      canBeUsedInProne: json['can_be_used_in_prone'] as bool?,
      canDodge: json['can_dodge'] as bool?,
      stanceTransitionMeleeDelay:
          (json['stance_transition_melee_delay'] as num?)?.toDouble(),
      meleeCombatConfig: json['melee_combat_config'] as String?,
      attackModes: (json['attack_modes'] as List<dynamic>?)
              ?.map((e) =>
                  MeleeWeaponAttackMode.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$MeleeWeaponToJson(MeleeWeapon instance) =>
    <String, dynamic>{
      'can_be_used_for_take_down': instance.canBeUsedForTakeDown,
      'can_block': instance.canBlock,
      'can_be_used_in_prone': instance.canBeUsedInProne,
      'can_dodge': instance.canDodge,
      'stance_transition_melee_delay': instance.stanceTransitionMeleeDelay,
      'melee_combat_config': instance.meleeCombatConfig,
      'attack_modes': instance.attackModes?.map((e) => e.toJson()).toList(),
    };

MiningLaserPowerBand _$MiningLaserPowerBandFromJson(
        Map<String, dynamic> json) =>
    MiningLaserPowerBand(
      min: (json['min'] as num?)?.toDouble(),
      max: (json['max'] as num?)?.toDouble(),
      minimum: (json['minimum'] as num?)?.toDouble(),
      maximum: (json['maximum'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$MiningLaserPowerBandToJson(
        MiningLaserPowerBand instance) =>
    <String, dynamic>{
      'min': instance.min,
      'max': instance.max,
      'minimum': instance.minimum,
      'maximum': instance.maximum,
    };

MiningLaserModifier _$MiningLaserModifierFromJson(Map<String, dynamic> json) =>
    MiningLaserModifier(
      name: json['name'] as String?,
      displayName: json['display_name'] as String?,
      value: (json['value'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$MiningLaserModifierToJson(
        MiningLaserModifier instance) =>
    <String, dynamic>{
      'name': instance.name,
      'display_name': instance.displayName,
      'value': instance.value,
    };

MiningLaser _$MiningLaserFromJson(Map<String, dynamic> json) => MiningLaser(
      laserPower: json['laser_power'] == null
          ? null
          : MiningLaserPowerBand.fromJson(
              json['laser_power'] as Map<String, dynamic>),
      modifiers: (json['modifiers'] as List<dynamic>?)
              ?.map((e) =>
                  MiningLaserModifier.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      moduleSlots: (json['module_slots'] as num?)?.toInt(),
      throttleLerpSpeed: (json['throttle_lerp_speed'] as num?)?.toDouble(),
      throttleMinimum: (json['throttle_minimum'] as num?)?.toDouble(),
      powerTransfer: (json['power_transfer'] as num?)?.toDouble(),
      miningLaserPower: json['mining_laser_power'] as String?,
      modifierMap: json['modifier_map'] as Map<String, dynamic>?,
      extractionLaserPower: json['extraction_laser_power'] as String?,
      optimalRange: (json['optimal_range'] as num?)?.toDouble(),
      maximumRange: (json['maximum_range'] as num?)?.toDouble(),
      extractionThroughput: (json['extraction_throughput'] as num?)?.toDouble(),
      collectionPointRadius:
          (json['collection_point_radius'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$MiningLaserToJson(MiningLaser instance) =>
    <String, dynamic>{
      'laser_power': instance.laserPower?.toJson(),
      'modifiers': instance.modifiers?.map((e) => e.toJson()).toList(),
      'module_slots': instance.moduleSlots,
      'throttle_lerp_speed': instance.throttleLerpSpeed,
      'throttle_minimum': instance.throttleMinimum,
      'power_transfer': instance.powerTransfer,
      'mining_laser_power': instance.miningLaserPower,
      'modifier_map': instance.modifierMap,
      'extraction_laser_power': instance.extractionLaserPower,
      'optimal_range': instance.optimalRange,
      'maximum_range': instance.maximumRange,
      'extraction_throughput': instance.extractionThroughput,
      'collection_point_radius': instance.collectionPointRadius,
    };

MiningModifierValue _$MiningModifierValueFromJson(Map<String, dynamic> json) =>
    MiningModifierValue();

Map<String, dynamic> _$MiningModifierValueToJson(
        MiningModifierValue instance) =>
    <String, dynamic>{};

MiningModifierMap _$MiningModifierMapFromJson(Map<String, dynamic> json) =>
    MiningModifierMap();

Map<String, dynamic> _$MiningModifierMapToJson(MiningModifierMap instance) =>
    <String, dynamic>{};

MiningModifier _$MiningModifierFromJson(Map<String, dynamic> json) =>
    MiningModifier(
      type: json['type'] as String?,
      itemType: miningModifierItemTypeNullableFromJson(json['item_type']),
      charges: (json['charges'] as num?)?.toInt(),
      duration: (json['duration'] as num?)?.toDouble(),
      powerModifier: json['power_modifier'],
      modifierMap: json['modifier_map'] == null
          ? null
          : MiningModifierMap.fromJson(
              json['modifier_map'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MiningModifierToJson(MiningModifier instance) =>
    <String, dynamic>{
      'type': instance.type,
      'item_type': miningModifierItemTypeNullableToJson(instance.itemType),
      'charges': instance.charges,
      'duration': instance.duration,
      'power_modifier': instance.powerModifier,
      'modifier_map': instance.modifierMap?.toJson(),
    };

MiningModule _$MiningModuleFromJson(Map<String, dynamic> json) => MiningModule(
      type: json['type'] as String?,
      moduleType: json['module_type'] as String?,
      usage: json['usage'] == null
          ? null
          : MiningModule$Usage.fromJson(json['usage'] as Map<String, dynamic>),
      charges: (json['charges'] as num?)?.toInt(),
      lifetimeSeconds: (json['lifetime_seconds'] as num?)?.toDouble(),
      uses: (json['uses'] as num?)?.toInt(),
      durationSeconds: (json['duration_seconds'] as num?)?.toDouble(),
      modifiers: json['modifiers'] == null
          ? null
          : MiningModule$Modifiers.fromJson(
              json['modifiers'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MiningModuleToJson(MiningModule instance) =>
    <String, dynamic>{
      'type': instance.type,
      'module_type': instance.moduleType,
      'usage': instance.usage?.toJson(),
      'charges': instance.charges,
      'lifetime_seconds': instance.lifetimeSeconds,
      'uses': instance.uses,
      'duration_seconds': instance.durationSeconds,
      'modifiers': instance.modifiers?.toJson(),
    };

MissileRack _$MissileRackFromJson(Map<String, dynamic> json) => MissileRack(
      missileCount: (json['missile_count'] as num?)?.toInt(),
      missileSize: (json['missile_size'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MissileRackToJson(MissileRack instance) =>
    <String, dynamic>{
      'missile_count': instance.missileCount,
      'missile_size': instance.missileSize,
    };

MissileFlight _$MissileFlightFromJson(Map<String, dynamic> json) =>
    MissileFlight(
      enableLifetime: json['enable_lifetime'] as bool?,
      maxLifetime: (json['max_lifetime'] as num?)?.toDouble(),
      range: (json['range'] as num?)?.toDouble(),
      speed: (json['speed'] as num?)?.toDouble(),
      boostSpeed: (json['boost_speed'] as num?)?.toDouble(),
      interceptSpeed: (json['intercept_speed'] as num?)?.toDouble(),
      terminalSpeed: (json['terminal_speed'] as num?)?.toDouble(),
      boostPhaseDuration: (json['boost_phase_duration'] as num?)?.toDouble(),
      terminalPhaseEngagementTime:
          (json['terminal_phase_engagement_time'] as num?)?.toDouble(),
      terminalPhaseEngagementAngle:
          (json['terminal_phase_engagement_angle'] as num?)?.toDouble(),
      fuelTankSize: (json['fuel_tank_size'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$MissileFlightToJson(MissileFlight instance) =>
    <String, dynamic>{
      'enable_lifetime': instance.enableLifetime,
      'max_lifetime': instance.maxLifetime,
      'range': instance.range,
      'speed': instance.speed,
      'boost_speed': instance.boostSpeed,
      'intercept_speed': instance.interceptSpeed,
      'terminal_speed': instance.terminalSpeed,
      'boost_phase_duration': instance.boostPhaseDuration,
      'terminal_phase_engagement_time': instance.terminalPhaseEngagementTime,
      'terminal_phase_engagement_angle': instance.terminalPhaseEngagementAngle,
      'fuel_tank_size': instance.fuelTankSize,
    };

MissileTargetLock _$MissileTargetLockFromJson(Map<String, dynamic> json) =>
    MissileTargetLock(
      signalResilienceMin: (json['signal_resilience_min'] as num?)?.toDouble(),
      signalResilienceMax: (json['signal_resilience_max'] as num?)?.toDouble(),
      rangeMax: (json['range_max'] as num?)?.toDouble(),
      rangeMin: (json['range_min'] as num?)?.toDouble(),
      angle: (json['angle'] as num?)?.toDouble(),
      signalAmplifier: (json['signal_amplifier'] as num?)?.toDouble(),
      increaseRate: (json['increase_rate'] as num?)?.toDouble(),
      allowDumbFiring: json['allow_dumb_firing'] as bool?,
    );

Map<String, dynamic> _$MissileTargetLockToJson(MissileTargetLock instance) =>
    <String, dynamic>{
      'signal_resilience_min': instance.signalResilienceMin,
      'signal_resilience_max': instance.signalResilienceMax,
      'range_max': instance.rangeMax,
      'range_min': instance.rangeMin,
      'angle': instance.angle,
      'signal_amplifier': instance.signalAmplifier,
      'increase_rate': instance.increaseRate,
      'allow_dumb_firing': instance.allowDumbFiring,
    };

MissileExplosion _$MissileExplosionFromJson(Map<String, dynamic> json) =>
    MissileExplosion(
      isCluster: json['is_cluster'] as bool?,
      clusterSize: (json['cluster_size'] as num?)?.toDouble(),
      requiresLauncher: json['requires_launcher'] as bool?,
      allowDumbFiring: json['allow_dumb_firing'] as bool?,
      radiusMin: (json['radius_min'] as num?)?.toDouble(),
      radiusMax: (json['radius_max'] as num?)?.toDouble(),
      safetyDistance: (json['safety_distance'] as num?)?.toDouble(),
      proximity: (json['proximity'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$MissileExplosionToJson(MissileExplosion instance) =>
    <String, dynamic>{
      'is_cluster': instance.isCluster,
      'cluster_size': instance.clusterSize,
      'requires_launcher': instance.requiresLauncher,
      'allow_dumb_firing': instance.allowDumbFiring,
      'radius_min': instance.radiusMin,
      'radius_max': instance.radiusMax,
      'safety_distance': instance.safetyDistance,
      'proximity': instance.proximity,
    };

MissileDelays _$MissileDelaysFromJson(Map<String, dynamic> json) =>
    MissileDelays(
      armTime: (json['arm_time'] as num?)?.toDouble(),
      igniteTime: (json['ignite_time'] as num?)?.toDouble(),
      collisionDelayTime: (json['collision_delay_time'] as num?)?.toDouble(),
      lockTime: (json['lock_time'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$MissileDelaysToJson(MissileDelays instance) =>
    <String, dynamic>{
      'arm_time': instance.armTime,
      'ignite_time': instance.igniteTime,
      'collision_delay_time': instance.collisionDelayTime,
      'lock_time': instance.lockTime,
    };

MissileDamageMap _$MissileDamageMapFromJson(Map<String, dynamic> json) =>
    MissileDamageMap();

Map<String, dynamic> _$MissileDamageMapToJson(MissileDamageMap instance) =>
    <String, dynamic>{};

Missile _$MissileFromJson(Map<String, dynamic> json) => Missile(
      clusterSize: (json['cluster_size'] as num?)?.toDouble(),
      signalType: json['signal_type'] as String?,
      trackingSignalMin: (json['tracking_signal_min'] as num?)?.toDouble(),
      lockTime: (json['lock_time'] as num?)?.toDouble(),
      lockRangeMax: (json['lock_range_max'] as num?)?.toDouble(),
      lockRangeMin: (json['lock_range_min'] as num?)?.toDouble(),
      lockAngle: (json['lock_angle'] as num?)?.toDouble(),
      speed: (json['speed'] as num?)?.toDouble(),
      fuelTankSize: (json['fuel_tank_size'] as num?)?.toDouble(),
      explosionRadiusMin: (json['explosion_radius_min'] as num?)?.toDouble(),
      explosionRadiusMax: (json['explosion_radius_max'] as num?)?.toDouble(),
      flight: json['flight'] == null
          ? null
          : MissileFlight.fromJson(json['flight'] as Map<String, dynamic>),
      targetLock: json['target_lock'] == null
          ? null
          : MissileTargetLock.fromJson(
              json['target_lock'] as Map<String, dynamic>),
      explosion: json['explosion'] == null
          ? null
          : MissileExplosion.fromJson(
              json['explosion'] as Map<String, dynamic>),
      delays: json['delays'] == null
          ? null
          : MissileDelays.fromJson(json['delays'] as Map<String, dynamic>),
      damageTotal: (json['damage_total'] as num?)?.toDouble(),
      damages: (json['damages'] as List<dynamic>?)
              ?.map((e) => WeaponDamage.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      damageMap: json['damage_map'],
    );

Map<String, dynamic> _$MissileToJson(Missile instance) => <String, dynamic>{
      'cluster_size': instance.clusterSize,
      'signal_type': instance.signalType,
      'tracking_signal_min': instance.trackingSignalMin,
      'lock_time': instance.lockTime,
      'lock_range_max': instance.lockRangeMax,
      'lock_range_min': instance.lockRangeMin,
      'lock_angle': instance.lockAngle,
      'speed': instance.speed,
      'fuel_tank_size': instance.fuelTankSize,
      'explosion_radius_min': instance.explosionRadiusMin,
      'explosion_radius_max': instance.explosionRadiusMax,
      'flight': instance.flight?.toJson(),
      'target_lock': instance.targetLock?.toJson(),
      'explosion': instance.explosion?.toJson(),
      'delays': instance.delays?.toJson(),
      'damage_total': instance.damageTotal,
      'damages': instance.damages?.map((e) => e.toJson()).toList(),
      'damage_map': instance.damageMap,
    };

PersonalWeaponMode _$PersonalWeaponModeFromJson(Map<String, dynamic> json) =>
    PersonalWeaponMode(
      mode: json['mode'] as String?,
      localised: json['localised'] as String?,
      type: json['type'] as String?,
      rpm: (json['rpm'] as num?)?.toDouble(),
      ammoPerShot: (json['ammo_per_shot'] as num?)?.toInt(),
      pelletsPerShot: (json['pellets_per_shot'] as num?)?.toInt(),
      damagePerSecond: (json['damage_per_second'] as num?)?.toDouble(),
      heatPerShot: (json['heat_per_shot'] as num?)?.toDouble(),
      wearPerShot: (json['wear_per_shot'] as num?)?.toDouble(),
      heatPerSecond: (json['heat_per_second'] as num?)?.toDouble(),
      wearPerSecond: (json['wear_per_second'] as num?)?.toDouble(),
      fireDuringSpinUp: json['fire_during_spin_up'] as bool?,
      shotCount: (json['shot_count'] as num?)?.toInt(),
      cooldownTime: (json['cooldown_time'] as num?)?.toDouble(),
      sequenceMode: json['sequence_mode'] as String?,
      chargeUpTime: (json['charge_up_time'] as num?)?.toDouble(),
      chargeDownTime: (json['charge_down_time'] as num?)?.toDouble(),
      fullDamageRange: (json['full_damage_range'] as num?)?.toDouble(),
      zeroDamageRange: (json['zero_damage_range'] as num?)?.toDouble(),
      hitType: json['hit_type'] as String?,
      hitRadius: (json['hit_radius'] as num?)?.toDouble(),
      minEnergyDraw: (json['min_energy_draw'] as num?)?.toDouble(),
      maxEnergyDraw: (json['max_energy_draw'] as num?)?.toDouble(),
      healingMode: json['healing_mode'] as String?,
      healingPerSecond: (json['healing_per_second'] as num?)?.toDouble(),
      ammoPerMscu: (json['ammo_per_mscu'] as num?)?.toDouble(),
      medicalAmmoType: json['medical_ammo_type'] as String?,
      externalHealing: json['external_healing'] as String?,
      toggle: json['toggle'] as bool?,
      maxDistance: (json['max_distance'] as num?)?.toDouble(),
      maxSensorDistance: (json['max_sensor_distance'] as num?)?.toDouble(),
      autoDosageModifier: (json['auto_dosage_modifier'] as num?)?.toDouble(),
      healingBreakTime: (json['healing_break_time'] as num?)?.toDouble(),
      maxDoseForAutoAdjustment:
          (json['max_dose_for_auto_adjustment'] as num?)?.toDouble(),
      batteryDrainPerSecond:
          (json['battery_drain_per_second'] as num?)?.toDouble(),
      materialEfficiency: (json['material_efficiency'] as num?)?.toDouble(),
      maxHealthRepairRate: (json['max_health_repair_rate'] as num?)?.toDouble(),
      maxDamageMapRepairRate:
          (json['max_damage_map_repair_rate'] as num?)?.toDouble(),
      healthToAmmoRatio: (json['health_to_ammo_ratio'] as num?)?.toDouble(),
      rampUpTime: (json['ramp_up_time'] as num?)?.toDouble(),
      rampDownTime: (json['ramp_down_time'] as num?)?.toDouble(),
      maxVehicleDamageRatio:
          (json['max_vehicle_damage_ratio'] as num?)?.toDouble(),
      repairedMaterialRatio:
          (json['repaired_material_ratio'] as num?)?.toDouble(),
      salvageCanFireOnFull: json['salvage_can_fire_on_full'] as bool?,
      damageThreshold: (json['damage_threshold'] as num?)?.toDouble(),
      minimumDistance: (json['minimum_distance'] as num?)?.toDouble(),
      maximumDistance: (json['maximum_distance'] as num?)?.toDouble(),
      beamRadius: (json['beam_radius'] as num?)?.toDouble(),
      collectionRate: (json['collection_rate'] as num?)?.toDouble(),
      energyDraw: (json['energy_draw'] as num?)?.toDouble(),
      miningExtractorTag: json['mining_extractor_tag'] as String?,
      toggleMode: json['toggle_mode'] as bool?,
    );

Map<String, dynamic> _$PersonalWeaponModeToJson(PersonalWeaponMode instance) =>
    <String, dynamic>{
      'mode': instance.mode,
      'localised': instance.localised,
      'type': instance.type,
      'rpm': instance.rpm,
      'ammo_per_shot': instance.ammoPerShot,
      'pellets_per_shot': instance.pelletsPerShot,
      'damage_per_second': instance.damagePerSecond,
      'heat_per_shot': instance.heatPerShot,
      'wear_per_shot': instance.wearPerShot,
      'heat_per_second': instance.heatPerSecond,
      'wear_per_second': instance.wearPerSecond,
      'fire_during_spin_up': instance.fireDuringSpinUp,
      'shot_count': instance.shotCount,
      'cooldown_time': instance.cooldownTime,
      'sequence_mode': instance.sequenceMode,
      'charge_up_time': instance.chargeUpTime,
      'charge_down_time': instance.chargeDownTime,
      'full_damage_range': instance.fullDamageRange,
      'zero_damage_range': instance.zeroDamageRange,
      'hit_type': instance.hitType,
      'hit_radius': instance.hitRadius,
      'min_energy_draw': instance.minEnergyDraw,
      'max_energy_draw': instance.maxEnergyDraw,
      'healing_mode': instance.healingMode,
      'healing_per_second': instance.healingPerSecond,
      'ammo_per_mscu': instance.ammoPerMscu,
      'medical_ammo_type': instance.medicalAmmoType,
      'external_healing': instance.externalHealing,
      'toggle': instance.toggle,
      'max_distance': instance.maxDistance,
      'max_sensor_distance': instance.maxSensorDistance,
      'auto_dosage_modifier': instance.autoDosageModifier,
      'healing_break_time': instance.healingBreakTime,
      'max_dose_for_auto_adjustment': instance.maxDoseForAutoAdjustment,
      'battery_drain_per_second': instance.batteryDrainPerSecond,
      'material_efficiency': instance.materialEfficiency,
      'max_health_repair_rate': instance.maxHealthRepairRate,
      'max_damage_map_repair_rate': instance.maxDamageMapRepairRate,
      'health_to_ammo_ratio': instance.healthToAmmoRatio,
      'ramp_up_time': instance.rampUpTime,
      'ramp_down_time': instance.rampDownTime,
      'max_vehicle_damage_ratio': instance.maxVehicleDamageRatio,
      'repaired_material_ratio': instance.repairedMaterialRatio,
      'salvage_can_fire_on_full': instance.salvageCanFireOnFull,
      'damage_threshold': instance.damageThreshold,
      'minimum_distance': instance.minimumDistance,
      'maximum_distance': instance.maximumDistance,
      'beam_radius': instance.beamRadius,
      'collection_rate': instance.collectionRate,
      'energy_draw': instance.energyDraw,
      'mining_extractor_tag': instance.miningExtractorTag,
      'toggle_mode': instance.toggleMode,
    };

PersonalWeaponDamageVector _$PersonalWeaponDamageVectorFromJson(
        Map<String, dynamic> json) =>
    PersonalWeaponDamageVector(
      physical: (json['physical'] as num?)?.toDouble(),
      energy: (json['energy'] as num?)?.toDouble(),
      distortion: (json['distortion'] as num?)?.toDouble(),
      thermal: (json['thermal'] as num?)?.toDouble(),
      biochemical: (json['biochemical'] as num?)?.toDouble(),
      stun: (json['stun'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$PersonalWeaponDamageVectorToJson(
        PersonalWeaponDamageVector instance) =>
    <String, dynamic>{
      'physical': instance.physical,
      'energy': instance.energy,
      'distortion': instance.distortion,
      'thermal': instance.thermal,
      'biochemical': instance.biochemical,
      'stun': instance.stun,
    };

PersonalWeaponDamage _$PersonalWeaponDamageFromJson(
        Map<String, dynamic> json) =>
    PersonalWeaponDamage(
      dpsTotal: (json['dps_total'] as num?)?.toDouble(),
      alphaTotal: (json['alpha_total'] as num?)?.toDouble(),
      max: (json['max'] as num?)?.toDouble(),
      maximum: (json['maximum'] as num?)?.toDouble(),
      dps: json['dps'],
      alpha: json['alpha'],
    );

Map<String, dynamic> _$PersonalWeaponDamageToJson(
        PersonalWeaponDamage instance) =>
    <String, dynamic>{
      'dps_total': instance.dpsTotal,
      'alpha_total': instance.alphaTotal,
      'max': instance.max,
      'maximum': instance.maximum,
      'dps': instance.dps,
      'alpha': instance.alpha,
    };

PersonalWeaponSpread _$PersonalWeaponSpreadFromJson(
        Map<String, dynamic> json) =>
    PersonalWeaponSpread(
      min: (json['min'] as num?)?.toDouble(),
      max: (json['max'] as num?)?.toDouble(),
      minimum: (json['minimum'] as num?)?.toDouble(),
      maximum: (json['maximum'] as num?)?.toDouble(),
      firstAttack: (json['first_attack'] as num?)?.toDouble(),
      perAttack: (json['per_attack'] as num?)?.toDouble(),
      decay: (json['decay'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$PersonalWeaponSpreadToJson(
        PersonalWeaponSpread instance) =>
    <String, dynamic>{
      'min': instance.min,
      'max': instance.max,
      'minimum': instance.minimum,
      'maximum': instance.maximum,
      'first_attack': instance.firstAttack,
      'per_attack': instance.perAttack,
      'decay': instance.decay,
    };

PersonalWeaponCharge _$PersonalWeaponChargeFromJson(
        Map<String, dynamic> json) =>
    PersonalWeaponCharge(
      time: (json['time'] as num?)?.toDouble(),
      overchargeTime: (json['overcharge_time'] as num?)?.toDouble(),
      overchargedTime: (json['overcharged_time'] as num?)?.toDouble(),
      cooldownTime: (json['cooldown_time'] as num?)?.toDouble(),
      autoFire: json['auto_fire'] as bool?,
      requireFullCharge: json['require_full_charge'] as bool?,
      autoCharge: json['auto_charge'] as bool?,
      interpolateBonus: json['interpolate_bonus'] as bool?,
    );

Map<String, dynamic> _$PersonalWeaponChargeToJson(
        PersonalWeaponCharge instance) =>
    <String, dynamic>{
      'time': instance.time,
      'overcharge_time': instance.overchargeTime,
      'overcharged_time': instance.overchargedTime,
      'cooldown_time': instance.cooldownTime,
      'auto_fire': instance.autoFire,
      'require_full_charge': instance.requireFullCharge,
      'auto_charge': instance.autoCharge,
      'interpolate_bonus': instance.interpolateBonus,
    };

PersonalWeaponChargeModifier _$PersonalWeaponChargeModifierFromJson(
        Map<String, dynamic> json) =>
    PersonalWeaponChargeModifier(
      damage: (json['damage'] as num?)?.toDouble(),
      fireRate: (json['fire_rate'] as num?)?.toDouble(),
      ammoSpeed: (json['ammo_speed'] as num?)?.toDouble(),
      fireRateOverride: (json['fire_rate_override'] as num?)?.toDouble(),
      pelletsOverride: (json['pellets_override'] as num?)?.toInt(),
      burstShotsOverride: (json['burst_shots_override'] as num?)?.toInt(),
      heatMultiplier: (json['heat_multiplier'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$PersonalWeaponChargeModifierToJson(
        PersonalWeaponChargeModifier instance) =>
    <String, dynamic>{
      'damage': instance.damage,
      'fire_rate': instance.fireRate,
      'ammo_speed': instance.ammoSpeed,
      'fire_rate_override': instance.fireRateOverride,
      'pellets_override': instance.pelletsOverride,
      'burst_shots_override': instance.burstShotsOverride,
      'heat_multiplier': instance.heatMultiplier,
    };

PersonalWeapon _$PersonalWeaponFromJson(Map<String, dynamic> json) =>
    PersonalWeapon(
      $class: json['class'] as String?,
      type: json['type'] as String?,
      magazineType: json['magazine_type'] as String?,
      magazineSize: (json['magazine_size'] as num?)?.toInt(),
      effectiveRange: (json['effective_range'] as num?)?.toDouble(),
      capacity: (json['capacity'] as num?)?.toInt(),
      range: (json['range'] as num?)?.toDouble(),
      damagePerShot: (json['damage_per_shot'] as num?)?.toDouble(),
      pelletsPerShot: (json['pellets_per_shot'] as num?)?.toInt(),
      rof: (json['rof'] as num?)?.toDouble(),
      rpm: (json['rpm'] as num?)?.toDouble(),
      damages: (json['damages'] as List<dynamic>?)
              ?.map(
                  (e) => WeaponDamageEntry.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      modes: (json['modes'] as List<dynamic>?)
              ?.map(
                  (e) => PersonalWeaponMode.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      fireMode: json['fire_mode'] as String?,
      damage: json['damage'] == null
          ? null
          : PersonalWeaponDamage.fromJson(
              json['damage'] as Map<String, dynamic>),
      spread: json['spread'],
      adsSpread: json['ads_spread'],
      charge: json['charge'],
      chargeModifier: json['charge_modifier'],
      ammunition: json['ammunition'],
    );

Map<String, dynamic> _$PersonalWeaponToJson(PersonalWeapon instance) =>
    <String, dynamic>{
      'class': instance.$class,
      'type': instance.type,
      'magazine_type': instance.magazineType,
      'magazine_size': instance.magazineSize,
      'effective_range': instance.effectiveRange,
      'capacity': instance.capacity,
      'range': instance.range,
      'damage_per_shot': instance.damagePerShot,
      'pellets_per_shot': instance.pelletsPerShot,
      'rof': instance.rof,
      'rpm': instance.rpm,
      'damages': instance.damages?.map((e) => e.toJson()).toList(),
      'modes': instance.modes?.map((e) => e.toJson()).toList(),
      'fire_mode': instance.fireMode,
      'damage': instance.damage?.toJson(),
      'spread': instance.spread,
      'ads_spread': instance.adsSpread,
      'charge': instance.charge,
      'charge_modifier': instance.chargeModifier,
      'ammunition': instance.ammunition,
    };

WeaponDamageEntry _$WeaponDamageEntryFromJson(Map<String, dynamic> json) =>
    WeaponDamageEntry(
      type: json['type'] as String?,
      name: json['name'] as String?,
      damage: (json['damage'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$WeaponDamageEntryToJson(WeaponDamageEntry instance) =>
    <String, dynamic>{
      'type': instance.type,
      'name': instance.name,
      'damage': instance.damage,
    };

PowerPlant _$PowerPlantFromJson(Map<String, dynamic> json) => PowerPlant(
      powerOutput: (json['power_output'] as num?)?.toDouble(),
      powerSegmentGeneration:
          (json['power_segment_generation'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$PowerPlantToJson(PowerPlant instance) =>
    <String, dynamic>{
      'power_output': instance.powerOutput,
      'power_segment_generation': instance.powerSegmentGeneration,
    };

QuantumDriveJumpProfile _$QuantumDriveJumpProfileFromJson(
        Map<String, dynamic> json) =>
    QuantumDriveJumpProfile(
      driveSpeed: (json['drive_speed'] as num?)?.toDouble(),
      cooldownTime: (json['cooldown_time'] as num?)?.toDouble(),
      stageOneAccelRate: (json['stage_one_accel_rate'] as num?)?.toDouble(),
      stageTwoAccelRate: (json['stage_two_accel_rate'] as num?)?.toDouble(),
      engageSpeed: (json['engage_speed'] as num?)?.toDouble(),
      interdictionEffectTime:
          (json['interdiction_effect_time'] as num?)?.toDouble(),
      calibrationRate: (json['calibration_rate'] as num?)?.toDouble(),
      minCalibrationRequirement:
          (json['min_calibration_requirement'] as num?)?.toDouble(),
      maxCalibrationRequirement:
          (json['max_calibration_requirement'] as num?)?.toDouble(),
      calibrationProcessAngleLimit:
          (json['calibration_process_angle_limit'] as num?)?.toDouble(),
      calibrationWarningAngleLimit:
          (json['calibration_warning_angle_limit'] as num?)?.toDouble(),
      calibrationDelayInSeconds:
          (json['calibration_delay_in_seconds'] as num?)?.toDouble(),
      spoolUpTime: (json['spool_up_time'] as num?)?.toDouble(),
      driveSpeedFormatted: json['drive_speed_formatted'] as String?,
      stageOneAccelRateFormatted:
          json['stage_one_accel_rate_formatted'] as String?,
      stageTwoAccelRateFormatted:
          json['stage_two_accel_rate_formatted'] as String?,
      engageSpeedFormatted: json['engage_speed_formatted'] as String?,
    );

Map<String, dynamic> _$QuantumDriveJumpProfileToJson(
        QuantumDriveJumpProfile instance) =>
    <String, dynamic>{
      'drive_speed': instance.driveSpeed,
      'cooldown_time': instance.cooldownTime,
      'stage_one_accel_rate': instance.stageOneAccelRate,
      'stage_two_accel_rate': instance.stageTwoAccelRate,
      'engage_speed': instance.engageSpeed,
      'interdiction_effect_time': instance.interdictionEffectTime,
      'calibration_rate': instance.calibrationRate,
      'min_calibration_requirement': instance.minCalibrationRequirement,
      'max_calibration_requirement': instance.maxCalibrationRequirement,
      'calibration_process_angle_limit': instance.calibrationProcessAngleLimit,
      'calibration_warning_angle_limit': instance.calibrationWarningAngleLimit,
      'calibration_delay_in_seconds': instance.calibrationDelayInSeconds,
      'spool_up_time': instance.spoolUpTime,
      'drive_speed_formatted': instance.driveSpeedFormatted,
      'stage_one_accel_rate_formatted': instance.stageOneAccelRateFormatted,
      'stage_two_accel_rate_formatted': instance.stageTwoAccelRateFormatted,
      'engage_speed_formatted': instance.engageSpeedFormatted,
    };

QuantumDriveThermalEnergyDraw _$QuantumDriveThermalEnergyDrawFromJson(
        Map<String, dynamic> json) =>
    QuantumDriveThermalEnergyDraw(
      preRampUp: (json['pre_ramp_up'] as num?)?.toDouble(),
      rampUp: (json['ramp_up'] as num?)?.toDouble(),
      inFlight: (json['in_flight'] as num?)?.toDouble(),
      rampDown: (json['ramp_down'] as num?)?.toDouble(),
      postRampDown: (json['post_ramp_down'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$QuantumDriveThermalEnergyDrawToJson(
        QuantumDriveThermalEnergyDraw instance) =>
    <String, dynamic>{
      'pre_ramp_up': instance.preRampUp,
      'ramp_up': instance.rampUp,
      'in_flight': instance.inFlight,
      'ramp_down': instance.rampDown,
      'post_ramp_down': instance.postRampDown,
    };

QuantumDriveTravelTime10gm _$QuantumDriveTravelTime10gmFromJson(
        Map<String, dynamic> json) =>
    QuantumDriveTravelTime10gm(
      seconds: (json['seconds'] as num?)?.toDouble(),
      formatted: json['formatted'] as String?,
    );

Map<String, dynamic> _$QuantumDriveTravelTime10gmToJson(
        QuantumDriveTravelTime10gm instance) =>
    <String, dynamic>{
      'seconds': instance.seconds,
      'formatted': instance.formatted,
    };

QuantumDrive _$QuantumDriveFromJson(Map<String, dynamic> json) => QuantumDrive(
      quantumFuelRequirement:
          (json['quantum_fuel_requirement'] as num?)?.toDouble(),
      fuelRate: (json['fuel_rate'] as num?)?.toDouble(),
      jumpRange: (json['jump_range'] as num?)?.toDouble(),
      jumpRangeFormatted: json['jump_range_formatted'] as String?,
      disconnectRange: (json['disconnect_range'] as num?)?.toDouble(),
      disconnectRangeFormatted: json['disconnect_range_formatted'] as String?,
      thermalEnergyDraw: json['thermal_energy_draw'] == null
          ? null
          : QuantumDriveThermalEnergyDraw.fromJson(
              json['thermal_energy_draw'] as Map<String, dynamic>),
      standardJump: json['standard_jump'] == null
          ? null
          : QuantumDriveJumpProfile.fromJson(
              json['standard_jump'] as Map<String, dynamic>),
      splineJump: json['spline_jump'] == null
          ? null
          : QuantumDriveJumpProfile.fromJson(
              json['spline_jump'] as Map<String, dynamic>),
      modes: (json['modes'] as List<dynamic>?)
              ?.map((e) =>
                  QuantumDriveJumpProfile.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      fuelConsumptionScuPerGm:
          (json['fuel_consumption_scu_per_gm'] as num?)?.toDouble(),
      fuelEfficiency: (json['fuel_efficiency'] as num?)?.toDouble(),
      travelTime10gm: json['travel_time_10gm'] == null
          ? null
          : QuantumDriveTravelTime10gm.fromJson(
              json['travel_time_10gm'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$QuantumDriveToJson(QuantumDrive instance) =>
    <String, dynamic>{
      'quantum_fuel_requirement': instance.quantumFuelRequirement,
      'fuel_rate': instance.fuelRate,
      'jump_range': instance.jumpRange,
      'jump_range_formatted': instance.jumpRangeFormatted,
      'disconnect_range': instance.disconnectRange,
      'disconnect_range_formatted': instance.disconnectRangeFormatted,
      'thermal_energy_draw': instance.thermalEnergyDraw?.toJson(),
      'standard_jump': instance.standardJump?.toJson(),
      'spline_jump': instance.splineJump?.toJson(),
      'modes': instance.modes?.map((e) => e.toJson()).toList(),
      'fuel_consumption_scu_per_gm': instance.fuelConsumptionScuPerGm,
      'fuel_efficiency': instance.fuelEfficiency,
      'travel_time_10gm': instance.travelTime10gm?.toJson(),
    };

QuantumInterdictionGeneratorPowerFractions
    _$QuantumInterdictionGeneratorPowerFractionsFromJson(
            Map<String, dynamic> json) =>
        QuantumInterdictionGeneratorPowerFractions(
          base: (json['base'] as num?)?.toDouble(),
          pulse: (json['pulse'] as num?)?.toDouble(),
          jammer: (json['jammer'] as num?)?.toDouble(),
        );

Map<String, dynamic> _$QuantumInterdictionGeneratorPowerFractionsToJson(
        QuantumInterdictionGeneratorPowerFractions instance) =>
    <String, dynamic>{
      'base': instance.base,
      'pulse': instance.pulse,
      'jammer': instance.jammer,
    };

QuantumInterdictionGeneratorJamming
    _$QuantumInterdictionGeneratorJammingFromJson(Map<String, dynamic> json) =>
        QuantumInterdictionGeneratorJamming(
          range: (json['range'] as num?)?.toDouble(),
          maxPowerDraw: (json['max_power_draw'] as num?)?.toDouble(),
          greenZoneCheckRange:
              (json['green_zone_check_range'] as num?)?.toDouble(),
        );

Map<String, dynamic> _$QuantumInterdictionGeneratorJammingToJson(
        QuantumInterdictionGeneratorJamming instance) =>
    <String, dynamic>{
      'range': instance.range,
      'max_power_draw': instance.maxPowerDraw,
      'green_zone_check_range': instance.greenZoneCheckRange,
    };

QuantumInterdictionGeneratorPulse _$QuantumInterdictionGeneratorPulseFromJson(
        Map<String, dynamic> json) =>
    QuantumInterdictionGeneratorPulse(
      chargeTime: (json['charge_time'] as num?)?.toDouble(),
      dischargeTime: (json['discharge_time'] as num?)?.toDouble(),
      cooldownTime: (json['cooldown_time'] as num?)?.toDouble(),
      radius: (json['radius'] as num?)?.toDouble(),
      decreaseChargeRateTime:
          (json['decrease_charge_rate_time'] as num?)?.toDouble(),
      increaseChargeRateTime:
          (json['increase_charge_rate_time'] as num?)?.toDouble(),
      activationPhaseDuration:
          (json['activation_phase_duration'] as num?)?.toDouble(),
      disperseChargeTime: (json['disperse_charge_time'] as num?)?.toDouble(),
      maxPowerDraw: (json['max_power_draw'] as num?)?.toDouble(),
      stopChargingPowerFraction:
          (json['stop_charging_power_fraction'] as num?)?.toDouble(),
      maxChargeRatePowerFraction:
          (json['max_charge_rate_power_fraction'] as num?)?.toDouble(),
      activePowerFraction: (json['active_power_fraction'] as num?)?.toDouble(),
      tetheringPowerFraction:
          (json['tethering_power_fraction'] as num?)?.toDouble(),
      greenZoneCheckRange: (json['green_zone_check_range'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$QuantumInterdictionGeneratorPulseToJson(
        QuantumInterdictionGeneratorPulse instance) =>
    <String, dynamic>{
      'charge_time': instance.chargeTime,
      'discharge_time': instance.dischargeTime,
      'cooldown_time': instance.cooldownTime,
      'radius': instance.radius,
      'decrease_charge_rate_time': instance.decreaseChargeRateTime,
      'increase_charge_rate_time': instance.increaseChargeRateTime,
      'activation_phase_duration': instance.activationPhaseDuration,
      'disperse_charge_time': instance.disperseChargeTime,
      'max_power_draw': instance.maxPowerDraw,
      'stop_charging_power_fraction': instance.stopChargingPowerFraction,
      'max_charge_rate_power_fraction': instance.maxChargeRatePowerFraction,
      'active_power_fraction': instance.activePowerFraction,
      'tethering_power_fraction': instance.tetheringPowerFraction,
      'green_zone_check_range': instance.greenZoneCheckRange,
    };

QuantumInterdictionGenerator _$QuantumInterdictionGeneratorFromJson(
        Map<String, dynamic> json) =>
    QuantumInterdictionGenerator(
      powerFractions: json['power_fractions'],
      jamming: json['jamming'],
      pulse: json['pulse'],
      interdictionRange: (json['interdiction_range'] as num?)?.toDouble(),
      jammerRange: (json['jammer_range'] as num?)?.toDouble(),
      chargeDuration: (json['charge_duration'] as num?)?.toDouble(),
      activationDuration: (json['activation_duration'] as num?)?.toDouble(),
      dischargeDuration: (json['discharge_duration'] as num?)?.toDouble(),
      cooldownDuration: (json['cooldown_duration'] as num?)?.toDouble(),
      disperseChargeDuration:
          (json['disperse_charge_duration'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$QuantumInterdictionGeneratorToJson(
        QuantumInterdictionGenerator instance) =>
    <String, dynamic>{
      'power_fractions': instance.powerFractions,
      'jamming': instance.jamming,
      'pulse': instance.pulse,
      'interdiction_range': instance.interdictionRange,
      'jammer_range': instance.jammerRange,
      'charge_duration': instance.chargeDuration,
      'activation_duration': instance.activationDuration,
      'discharge_duration': instance.dischargeDuration,
      'cooldown_duration': instance.cooldownDuration,
      'disperse_charge_duration': instance.disperseChargeDuration,
    };

RadarSensitivityBlock _$RadarSensitivityBlockFromJson(
        Map<String, dynamic> json) =>
    RadarSensitivityBlock(
      infrared: (json['infrared'] as num?)?.toDouble(),
      crossSection: (json['cross_section'] as num?)?.toDouble(),
      electromagnetic: (json['electromagnetic'] as num?)?.toDouble(),
      resource: (json['resource'] as num?)?.toDouble(),
      db: (json['db'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$RadarSensitivityBlockToJson(
        RadarSensitivityBlock instance) =>
    <String, dynamic>{
      'infrared': instance.infrared,
      'cross_section': instance.crossSection,
      'electromagnetic': instance.electromagnetic,
      'resource': instance.resource,
      'db': instance.db,
    };

RadarAimAssistBlock _$RadarAimAssistBlockFromJson(Map<String, dynamic> json) =>
    RadarAimAssistBlock(
      distanceMinAssignment:
          (json['distance_min_assignment'] as num?)?.toDouble(),
      distanceMaxAssignment:
          (json['distance_max_assignment'] as num?)?.toDouble(),
      outsideRangeBufferDistance:
          (json['outside_range_buffer_distance'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$RadarAimAssistBlockToJson(
        RadarAimAssistBlock instance) =>
    <String, dynamic>{
      'distance_min_assignment': instance.distanceMinAssignment,
      'distance_max_assignment': instance.distanceMaxAssignment,
      'outside_range_buffer_distance': instance.outsideRangeBufferDistance,
    };

Radar _$RadarFromJson(Map<String, dynamic> json) => Radar(
      detectionLifetime: (json['detection_lifetime'] as num?)?.toDouble(),
      altitudeCeiling: (json['altitude_ceiling'] as num?)?.toDouble(),
      enableCrossSectionOcclusion:
          json['enable_cross_section_occlusion'] as bool?,
      cooldown: (json['cooldown'] as num?)?.toDouble(),
      sensitivity: json['sensitivity'],
      groundVehicleSensitivity: json['ground_vehicle_sensitivity'],
      piercing: json['piercing'],
      aimAssist: json['aim_assist'],
    );

Map<String, dynamic> _$RadarToJson(Radar instance) => <String, dynamic>{
      'detection_lifetime': instance.detectionLifetime,
      'altitude_ceiling': instance.altitudeCeiling,
      'enable_cross_section_occlusion': instance.enableCrossSectionOcclusion,
      'cooldown': instance.cooldown,
      'sensitivity': instance.sensitivity,
      'ground_vehicle_sensitivity': instance.groundVehicleSensitivity,
      'piercing': instance.piercing,
      'aim_assist': instance.aimAssist,
    };

RadiationResistance _$RadiationResistanceFromJson(Map<String, dynamic> json) =>
    RadiationResistance(
      maximumRadiationCapacity:
          (json['maximum_radiation_capacity'] as num?)?.toDouble(),
      radiationDissipationRate:
          (json['radiation_dissipation_rate'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$RadiationResistanceToJson(
        RadiationResistance instance) =>
    <String, dynamic>{
      'maximum_radiation_capacity': instance.maximumRadiationCapacity,
      'radiation_dissipation_rate': instance.radiationDissipationRate,
    };

SalvageModifier _$SalvageModifierFromJson(Map<String, dynamic> json) =>
    SalvageModifier(
      salvageSpeedMultiplier:
          (json['salvage_speed_multiplier'] as num?)?.toDouble(),
      radiusMultiplier: (json['radius_multiplier'] as num?)?.toDouble(),
      extractionEfficiency: (json['extraction_efficiency'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$SalvageModifierToJson(SalvageModifier instance) =>
    <String, dynamic>{
      'salvage_speed_multiplier': instance.salvageSpeedMultiplier,
      'radius_multiplier': instance.radiusMultiplier,
      'extraction_efficiency': instance.extractionEfficiency,
    };

SeatAxis _$SeatAxisFromJson(Map<String, dynamic> json) => SeatAxis(
      min: (json['min'] as num?)?.toDouble(),
      max: (json['max'] as num?)?.toDouble(),
      minimum: (json['minimum'] as num?)?.toDouble(),
      maximum: (json['maximum'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$SeatAxisToJson(SeatAxis instance) => <String, dynamic>{
      'min': instance.min,
      'max': instance.max,
      'minimum': instance.minimum,
      'maximum': instance.maximum,
    };

SeatEjection _$SeatEjectionFromJson(Map<String, dynamic> json) => SeatEjection(
      maxLinearVelocity: (json['max_linear_velocity'] as num?)?.toDouble(),
      maxLinearAcceleration:
          (json['max_linear_acceleration'] as num?)?.toDouble(),
      maxAngularVelocity: (json['max_angular_velocity'] as num?)?.toDouble(),
      maxAngularAcceleration:
          (json['max_angular_acceleration'] as num?)?.toDouble(),
      ejectionLoopTime: (json['ejection_loop_time'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$SeatEjectionToJson(SeatEjection instance) =>
    <String, dynamic>{
      'max_linear_velocity': instance.maxLinearVelocity,
      'max_linear_acceleration': instance.maxLinearAcceleration,
      'max_angular_velocity': instance.maxAngularVelocity,
      'max_angular_acceleration': instance.maxAngularAcceleration,
      'ejection_loop_time': instance.ejectionLoopTime,
    };

Seat _$SeatFromJson(Map<String, dynamic> json) => Seat(
      seatType: json['seat_type'] as String?,
      yaw: json['yaw'],
      pitch: json['pitch'],
      setYawPitchLimits: json['set_yaw_pitch_limits'] as bool?,
      hasEjection: json['has_ejection'] as bool?,
      ejection: json['ejection'],
    );

Map<String, dynamic> _$SeatToJson(Seat instance) => <String, dynamic>{
      'seat_type': instance.seatType,
      'yaw': instance.yaw,
      'pitch': instance.pitch,
      'set_yaw_pitch_limits': instance.setYawPitchLimits,
      'has_ejection': instance.hasEjection,
      'ejection': instance.ejection,
    };

SelfDestruct _$SelfDestructFromJson(Map<String, dynamic> json) => SelfDestruct(
      damage: (json['damage'] as num?)?.toDouble(),
      radius: (json['radius'] as num?)?.toDouble(),
      minRadius: (json['min_radius'] as num?)?.toDouble(),
      physRadius: (json['phys_radius'] as num?)?.toDouble(),
      minPhysRadius: (json['min_phys_radius'] as num?)?.toDouble(),
      time: (json['time'] as num?)?.toDouble(),
      countdown: (json['countdown'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$SelfDestructToJson(SelfDestruct instance) =>
    <String, dynamic>{
      'damage': instance.damage,
      'radius': instance.radius,
      'min_radius': instance.minRadius,
      'phys_radius': instance.physRadius,
      'min_phys_radius': instance.minPhysRadius,
      'time': instance.time,
      'countdown': instance.countdown,
    };

ShieldController _$ShieldControllerFromJson(Map<String, dynamic> json) =>
    ShieldController(
      faceType: json['face_type'] as String?,
      maxReallocation: (json['max_reallocation'] as num?)?.toDouble(),
      reconfigurationCooldown:
          (json['reconfiguration_cooldown'] as num?)?.toDouble(),
      maxElectricalChargeDamageRate:
          (json['max_electrical_charge_damage_rate'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ShieldControllerToJson(ShieldController instance) =>
    <String, dynamic>{
      'face_type': instance.faceType,
      'max_reallocation': instance.maxReallocation,
      'reconfiguration_cooldown': instance.reconfigurationCooldown,
      'max_electrical_charge_damage_rate':
          instance.maxElectricalChargeDamageRate,
    };

ShieldDamageRange _$ShieldDamageRangeFromJson(Map<String, dynamic> json) =>
    ShieldDamageRange(
      min: (json['min'] as num?)?.toDouble(),
      max: (json['max'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ShieldDamageRangeToJson(ShieldDamageRange instance) =>
    <String, dynamic>{
      'min': instance.min,
      'max': instance.max,
    };

ShieldDamageMap _$ShieldDamageMapFromJson(Map<String, dynamic> json) =>
    ShieldDamageMap(
      physical: json['physical'],
      energy: json['energy'],
      distortion: json['distortion'],
      thermal: json['thermal'],
      biochemical: json['biochemical'],
      stun: json['stun'],
    );

Map<String, dynamic> _$ShieldDamageMapToJson(ShieldDamageMap instance) =>
    <String, dynamic>{
      'physical': instance.physical,
      'energy': instance.energy,
      'distortion': instance.distortion,
      'thermal': instance.thermal,
      'biochemical': instance.biochemical,
      'stun': instance.stun,
    };

ShieldReservePool _$ShieldReservePoolFromJson(Map<String, dynamic> json) =>
    ShieldReservePool(
      regenRate: (json['regen_rate'] as num?)?.toDouble(),
      regenTime: (json['regen_time'] as num?)?.toDouble(),
      initialHealthRatio: (json['initial_health_ratio'] as num?)?.toDouble(),
      maxHealthRatio: (json['max_health_ratio'] as num?)?.toDouble(),
      regenRateRatio: (json['regen_rate_ratio'] as num?)?.toDouble(),
      drainRateRatio: (json['drain_rate_ratio'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ShieldReservePoolToJson(ShieldReservePool instance) =>
    <String, dynamic>{
      'regen_rate': instance.regenRate,
      'regen_time': instance.regenTime,
      'initial_health_ratio': instance.initialHealthRatio,
      'max_health_ratio': instance.maxHealthRatio,
      'regen_rate_ratio': instance.regenRateRatio,
      'drain_rate_ratio': instance.drainRateRatio,
    };

ShieldRegenDelay _$ShieldRegenDelayFromJson(Map<String, dynamic> json) =>
    ShieldRegenDelay(
      downed: (json['downed'] as num?)?.toDouble(),
      damage: (json['damage'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ShieldRegenDelayToJson(ShieldRegenDelay instance) =>
    <String, dynamic>{
      'downed': instance.downed,
      'damage': instance.damage,
    };

Shield _$ShieldFromJson(Map<String, dynamic> json) => Shield(
      maxHealth: (json['max_health'] as num?)?.toDouble(),
      regenRate: (json['regen_rate'] as num?)?.toDouble(),
      regenTime: (json['regen_time'] as num?)?.toDouble(),
      decayRatio: (json['decay_ratio'] as num?)?.toDouble(),
      reservePool: json['reserve_pool'] == null
          ? null
          : ShieldReservePool.fromJson(
              json['reserve_pool'] as Map<String, dynamic>),
      regenDelay: json['regen_delay'] == null
          ? null
          : ShieldRegenDelay.fromJson(
              json['regen_delay'] as Map<String, dynamic>),
      electricalChargeDamageResistance:
          (json['electrical_charge_damage_resistance'] as num?)?.toDouble(),
      absorption: json['absorption'],
      resistance: json['resistance'],
      maxShieldHealth: (json['max_shield_health'] as num?)?.toDouble(),
      maxShieldRegen: (json['max_shield_regen'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ShieldToJson(Shield instance) => <String, dynamic>{
      'max_health': instance.maxHealth,
      'regen_rate': instance.regenRate,
      'regen_time': instance.regenTime,
      'decay_ratio': instance.decayRatio,
      'reserve_pool': instance.reservePool?.toJson(),
      'regen_delay': instance.regenDelay?.toJson(),
      'electrical_charge_damage_resistance':
          instance.electricalChargeDamageResistance,
      'absorption': instance.absorption,
      'resistance': instance.resistance,
      'max_shield_health': instance.maxShieldHealth,
      'max_shield_regen': instance.maxShieldRegen,
    };

SuitArmorTypeResistance _$SuitArmorTypeResistanceFromJson(
        Map<String, dynamic> json) =>
    SuitArmorTypeResistance(
      type: json['type'] as String?,
      multiplier: (json['multiplier'] as num?)?.toDouble(),
      threshold: (json['threshold'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$SuitArmorTypeResistanceToJson(
        SuitArmorTypeResistance instance) =>
    <String, dynamic>{
      'type': instance.type,
      'multiplier': instance.multiplier,
      'threshold': instance.threshold,
    };

SuitArmorDamageResistance _$SuitArmorDamageResistanceFromJson(
        Map<String, dynamic> json) =>
    SuitArmorDamageResistance(
      impact: (json['impact'] as num?)?.toDouble(),
      physical: json['physical'],
      energy: json['energy'],
      distortion: json['distortion'],
      thermal: json['thermal'],
      biochemical: json['biochemical'],
      stun: json['stun'],
    );

Map<String, dynamic> _$SuitArmorDamageResistanceToJson(
        SuitArmorDamageResistance instance) =>
    <String, dynamic>{
      'impact': instance.impact,
      'physical': instance.physical,
      'energy': instance.energy,
      'distortion': instance.distortion,
      'thermal': instance.thermal,
      'biochemical': instance.biochemical,
      'stun': instance.stun,
    };

SuitArmorDamageResistanceMap _$SuitArmorDamageResistanceMapFromJson(
        Map<String, dynamic> json) =>
    SuitArmorDamageResistanceMap(
      impact: (json['impact'] as num?)?.toDouble(),
      impactChange: (json['impact_change'] as num?)?.toDouble(),
      physical: (json['physical'] as num?)?.toDouble(),
      physicalChange: (json['physical_change'] as num?)?.toDouble(),
      energy: (json['energy'] as num?)?.toDouble(),
      energyChange: (json['energy_change'] as num?)?.toDouble(),
      distortion: (json['distortion'] as num?)?.toDouble(),
      distortionChange: (json['distortion_change'] as num?)?.toDouble(),
      thermal: (json['thermal'] as num?)?.toDouble(),
      thermalChange: (json['thermal_change'] as num?)?.toDouble(),
      biochemical: (json['biochemical'] as num?)?.toDouble(),
      biochemicalChange: (json['biochemical_change'] as num?)?.toDouble(),
      stun: (json['stun'] as num?)?.toDouble(),
      stunChange: (json['stun_change'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$SuitArmorDamageResistanceMapToJson(
        SuitArmorDamageResistanceMap instance) =>
    <String, dynamic>{
      'impact': instance.impact,
      'impact_change': instance.impactChange,
      'physical': instance.physical,
      'physical_change': instance.physicalChange,
      'energy': instance.energy,
      'energy_change': instance.energyChange,
      'distortion': instance.distortion,
      'distortion_change': instance.distortionChange,
      'thermal': instance.thermal,
      'thermal_change': instance.thermalChange,
      'biochemical': instance.biochemical,
      'biochemical_change': instance.biochemicalChange,
      'stun': instance.stun,
      'stun_change': instance.stunChange,
    };

SuitArmorSignature _$SuitArmorSignatureFromJson(Map<String, dynamic> json) =>
    SuitArmorSignature();

Map<String, dynamic> _$SuitArmorSignatureToJson(SuitArmorSignature instance) =>
    <String, dynamic>{};

SuitArmor _$SuitArmorFromJson(Map<String, dynamic> json) => SuitArmor(
      slot: json['slot'] as String?,
      armorType: json['armor_type'] as String?,
      damageResistance: json['damage_resistance'],
      damageResistanceMap: json['damage_resistance_map'],
      protectedBodyParts: (json['protected_body_parts'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      signature: json['signature'],
      tempResistanceMin: (json['temp_resistance_min'] as num?)?.toDouble(),
      tempResistanceMax: (json['temp_resistance_max'] as num?)?.toDouble(),
      radiationResistance: json['radiation_resistance'],
      gforceResistance: (json['gforce_resistance'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$SuitArmorToJson(SuitArmor instance) => <String, dynamic>{
      'slot': instance.slot,
      'armor_type': instance.armorType,
      'damage_resistance': instance.damageResistance,
      'damage_resistance_map': instance.damageResistanceMap,
      'protected_body_parts': instance.protectedBodyParts,
      'signature': instance.signature,
      'temp_resistance_min': instance.tempResistanceMin,
      'temp_resistance_max': instance.tempResistanceMax,
      'radiation_resistance': instance.radiationResistance,
      'gforce_resistance': instance.gforceResistance,
    };

TemperatureResistance _$TemperatureResistanceFromJson(
        Map<String, dynamic> json) =>
    TemperatureResistance(
      min: (json['min'] as num?)?.toDouble(),
      max: (json['max'] as num?)?.toDouble(),
      minimum: (json['minimum'] as num?)?.toDouble(),
      maximum: (json['maximum'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$TemperatureResistanceToJson(
        TemperatureResistance instance) =>
    <String, dynamic>{
      'min': instance.min,
      'max': instance.max,
      'minimum': instance.minimum,
      'maximum': instance.maximum,
    };

ThrusterPerformance _$ThrusterPerformanceFromJson(Map<String, dynamic> json) =>
    ThrusterPerformance(
      thrustCapacity: (json['thrust_capacity'] as num?)?.toDouble(),
      maxSupportedAtmosphericEfficiency:
          (json['max_supported_atmospheric_efficiency'] as num?)?.toDouble(),
      minHealthThrustMultiplier:
          (json['min_health_thrust_multiplier'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ThrusterPerformanceToJson(
        ThrusterPerformance instance) =>
    <String, dynamic>{
      'thrust_capacity': instance.thrustCapacity,
      'max_supported_atmospheric_efficiency':
          instance.maxSupportedAtmosphericEfficiency,
      'min_health_thrust_multiplier': instance.minHealthThrustMultiplier,
    };

ThrusterFuel _$ThrusterFuelFromJson(Map<String, dynamic> json) => ThrusterFuel(
      burnRatePer10kNewton:
          (json['burn_rate_per_10k_newton'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ThrusterFuelToJson(ThrusterFuel instance) =>
    <String, dynamic>{
      'burn_rate_per_10k_newton': instance.burnRatePer10kNewton,
    };

ThrusterBackwash _$ThrusterBackwashFromJson(Map<String, dynamic> json) =>
    ThrusterBackwash(
      enabled: json['enabled'] as bool?,
      automateSize: json['automate_size'] as bool?,
      maxSpeed: (json['max_speed'] as num?)?.toDouble(),
      maxDensity: (json['max_density'] as num?)?.toDouble(),
      maxResistance: (json['max_resistance'] as num?)?.toDouble(),
      afterburnerMultiplier:
          (json['afterburner_multiplier'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ThrusterBackwashToJson(ThrusterBackwash instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
      'automate_size': instance.automateSize,
      'max_speed': instance.maxSpeed,
      'max_density': instance.maxDensity,
      'max_resistance': instance.maxResistance,
      'afterburner_multiplier': instance.afterburnerMultiplier,
    };

ThrusterHandling _$ThrusterHandlingFromJson(Map<String, dynamic> json) =>
    ThrusterHandling(
      strengthSmoothing: (json['strength_smoothing'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ThrusterHandlingToJson(ThrusterHandling instance) =>
    <String, dynamic>{
      'strength_smoothing': instance.strengthSmoothing,
    };

Thruster _$ThrusterFromJson(Map<String, dynamic> json) => Thruster(
      performance: json['performance'],
      fuel: json['fuel'],
      role: json['role'] as String?,
      vtolOnly: json['vtol_only'] as bool?,
      backwash: json['backwash'],
      handling: json['handling'],
      thrustCapacity: (json['thrust_capacity'] as num?)?.toDouble(),
      minHealthThrustMultiplier:
          (json['min_health_thrust_multiplier'] as num?)?.toDouble(),
      fuelBurnPer10kNewton:
          (json['fuel_burn_per_10k_newton'] as num?)?.toDouble(),
      type: json['type'] as String?,
    );

Map<String, dynamic> _$ThrusterToJson(Thruster instance) => <String, dynamic>{
      'performance': instance.performance,
      'fuel': instance.fuel,
      'role': instance.role,
      'vtol_only': instance.vtolOnly,
      'backwash': instance.backwash,
      'handling': instance.handling,
      'thrust_capacity': instance.thrustCapacity,
      'min_health_thrust_multiplier': instance.minHealthThrustMultiplier,
      'fuel_burn_per_10k_newton': instance.fuelBurnPer10kNewton,
      'type': instance.type,
    };

TractorBeamForce _$TractorBeamForceFromJson(Map<String, dynamic> json) =>
    TractorBeamForce(
      min: (json['min'] as num?)?.toDouble(),
      max: (json['max'] as num?)?.toDouble(),
      maxVolume: (json['max_volume'] as num?)?.toDouble(),
      volumeForceCoefficient:
          (json['volume_force_coefficient'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$TractorBeamForceToJson(TractorBeamForce instance) =>
    <String, dynamic>{
      'min': instance.min,
      'max': instance.max,
      'max_volume': instance.maxVolume,
      'volume_force_coefficient': instance.volumeForceCoefficient,
    };

TractorBeamRange _$TractorBeamRangeFromJson(Map<String, dynamic> json) =>
    TractorBeamRange(
      min: (json['min'] as num?)?.toDouble(),
      max: (json['max'] as num?)?.toDouble(),
      fullStrengthDistance:
          (json['full_strength_distance'] as num?)?.toDouble(),
      maxAngle: (json['max_angle'] as num?)?.toDouble(),
      hitRadius: (json['hit_radius'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$TractorBeamRangeToJson(TractorBeamRange instance) =>
    <String, dynamic>{
      'min': instance.min,
      'max': instance.max,
      'full_strength_distance': instance.fullStrengthDistance,
      'max_angle': instance.maxAngle,
      'hit_radius': instance.hitRadius,
    };

TractorBeamTether _$TractorBeamTetherFromJson(Map<String, dynamic> json) =>
    TractorBeamTether(
      tetherBreakTime: (json['tether_break_time'] as num?)?.toDouble(),
      safeRangeValueFactor:
          (json['safe_range_value_factor'] as num?)?.toDouble(),
      allowScrollingIntoBreakingRange:
          json['allow_scrolling_into_breaking_range'] as bool?,
    );

Map<String, dynamic> _$TractorBeamTetherToJson(TractorBeamTether instance) =>
    <String, dynamic>{
      'tether_break_time': instance.tetherBreakTime,
      'safe_range_value_factor': instance.safeRangeValueFactor,
      'allow_scrolling_into_breaking_range':
          instance.allowScrollingIntoBreakingRange,
    };

TractorBeamCargoModeOverride _$TractorBeamCargoModeOverrideFromJson(
        Map<String, dynamic> json) =>
    TractorBeamCargoModeOverride(
      minForce: (json['min_force'] as num?)?.toDouble(),
      maxForce: (json['max_force'] as num?)?.toDouble(),
      minAcceleration: (json['min_acceleration'] as num?)?.toDouble(),
      maxAcceleration: (json['max_acceleration'] as num?)?.toDouble(),
      minSpeed: (json['min_speed'] as num?)?.toDouble(),
      maxSpeed: (json['max_speed'] as num?)?.toDouble(),
      accelerationFactor: (json['acceleration_factor'] as num?)?.toDouble(),
      degreesPerAction: (json['degrees_per_action'] as num?)?.toDouble(),
      maxAngularAcceleration:
          (json['max_angular_acceleration'] as num?)?.toDouble(),
      maxAngularVelocity: (json['max_angular_velocity'] as num?)?.toDouble(),
      degreesPerActionScrollWheel:
          (json['degrees_per_action_scroll_wheel'] as num?)?.toDouble(),
      forceFractionRotation:
          (json['force_fraction_rotation'] as num?)?.toDouble(),
      minDistance: (json['min_distance'] as num?)?.toDouble(),
      maxDistance: (json['max_distance'] as num?)?.toDouble(),
      fullStrengthDistance:
          (json['full_strength_distance'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$TractorBeamCargoModeOverrideToJson(
        TractorBeamCargoModeOverride instance) =>
    <String, dynamic>{
      'min_force': instance.minForce,
      'max_force': instance.maxForce,
      'min_acceleration': instance.minAcceleration,
      'max_acceleration': instance.maxAcceleration,
      'min_speed': instance.minSpeed,
      'max_speed': instance.maxSpeed,
      'acceleration_factor': instance.accelerationFactor,
      'degrees_per_action': instance.degreesPerAction,
      'max_angular_acceleration': instance.maxAngularAcceleration,
      'max_angular_velocity': instance.maxAngularVelocity,
      'degrees_per_action_scroll_wheel': instance.degreesPerActionScrollWheel,
      'force_fraction_rotation': instance.forceFractionRotation,
      'min_distance': instance.minDistance,
      'max_distance': instance.maxDistance,
      'full_strength_distance': instance.fullStrengthDistance,
    };

TractorBeamTowing _$TractorBeamTowingFromJson(Map<String, dynamic> json) =>
    TractorBeamTowing(
      force: (json['force'] as num?)?.toDouble(),
      maxAcceleration: (json['max_acceleration'] as num?)?.toDouble(),
      maxDistance: (json['max_distance'] as num?)?.toDouble(),
      qtMassLimit: (json['qt_mass_limit'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$TractorBeamTowingToJson(TractorBeamTowing instance) =>
    <String, dynamic>{
      'force': instance.force,
      'max_acceleration': instance.maxAcceleration,
      'max_distance': instance.maxDistance,
      'qt_mass_limit': instance.qtMassLimit,
    };

TractorBeam _$TractorBeamFromJson(Map<String, dynamic> json) => TractorBeam(
      force: json['force'],
      range: json['range'],
      tether: json['tether'],
      cargoModeOverride: json['cargo_mode_override'],
      towing: json['towing'],
      minForce: (json['min_force'] as num?)?.toDouble(),
      maxForce: (json['max_force'] as num?)?.toDouble(),
      minDistance: (json['min_distance'] as num?)?.toDouble(),
      maxDistance: (json['max_distance'] as num?)?.toDouble(),
      fullStrengthDistance:
          (json['full_strength_distance'] as num?)?.toDouble(),
      maxAngle: (json['max_angle'] as num?)?.toDouble(),
      maxVolume: (json['max_volume'] as num?)?.toDouble(),
      volumeForceCoefficient:
          (json['volume_force_coefficient'] as num?)?.toDouble(),
      tetherBreakTime: (json['tether_break_time'] as num?)?.toDouble(),
      safeRangeValueFactor:
          (json['safe_range_value_factor'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$TractorBeamToJson(TractorBeam instance) =>
    <String, dynamic>{
      'force': instance.force,
      'range': instance.range,
      'tether': instance.tether,
      'cargo_mode_override': instance.cargoModeOverride,
      'towing': instance.towing,
      'min_force': instance.minForce,
      'max_force': instance.maxForce,
      'min_distance': instance.minDistance,
      'max_distance': instance.maxDistance,
      'full_strength_distance': instance.fullStrengthDistance,
      'max_angle': instance.maxAngle,
      'max_volume': instance.maxVolume,
      'volume_force_coefficient': instance.volumeForceCoefficient,
      'tether_break_time': instance.tetherBreakTime,
      'safe_range_value_factor': instance.safeRangeValueFactor,
    };

TurretAxis _$TurretAxisFromJson(Map<String, dynamic> json) => TurretAxis(
      slavedOnly: json['slaved_only'] as bool?,
      speed: (json['speed'] as num?)?.toDouble(),
      timeToFullSpeed: (json['time_to_full_speed'] as num?)?.toDouble(),
      accelerationDecay: (json['acceleration_decay'] as num?)?.toDouble(),
      angleLimitMin: (json['angle_limit_min'] as num?)?.toDouble(),
      angleLimitMax: (json['angle_limit_max'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$TurretAxisToJson(TurretAxis instance) =>
    <String, dynamic>{
      'slaved_only': instance.slavedOnly,
      'speed': instance.speed,
      'time_to_full_speed': instance.timeToFullSpeed,
      'acceleration_decay': instance.accelerationDecay,
      'angle_limit_min': instance.angleLimitMin,
      'angle_limit_max': instance.angleLimitMax,
    };

Turret _$TurretFromJson(Map<String, dynamic> json) => Turret(
      rotationStyle: json['rotation_style'] as String?,
      mounts: (json['mounts'] as num?)?.toInt(),
      minSize: (json['min_size'] as num?)?.toInt(),
      maxSize: (json['max_size'] as num?)?.toInt(),
      yawAxis: json['yaw_axis'],
      pitchAxis: json['pitch_axis'],
    );

Map<String, dynamic> _$TurretToJson(Turret instance) => <String, dynamic>{
      'rotation_style': instance.rotationStyle,
      'mounts': instance.mounts,
      'min_size': instance.minSize,
      'max_size': instance.maxSize,
      'yaw_axis': instance.yawAxis,
      'pitch_axis': instance.pitchAxis,
    };

VehicleWeaponDamageEntry _$VehicleWeaponDamageEntryFromJson(
        Map<String, dynamic> json) =>
    VehicleWeaponDamageEntry(
      type: json['type'] as String?,
      name: json['name'] as String?,
      damage: (json['damage'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$VehicleWeaponDamageEntryToJson(
        VehicleWeaponDamageEntry instance) =>
    <String, dynamic>{
      'type': instance.type,
      'name': instance.name,
      'damage': instance.damage,
    };

VehicleWeaponMode _$VehicleWeaponModeFromJson(Map<String, dynamic> json) =>
    VehicleWeaponMode(
      mode: json['mode'] as String?,
      localised: json['localised'] as String?,
      type: json['type'] as String?,
      rpm: (json['rpm'] as num?)?.toDouble(),
      roundsPerMinute: (json['rounds_per_minute'] as num?)?.toDouble(),
      ammoPerShot: (json['ammo_per_shot'] as num?)?.toInt(),
      pelletsPerShot: (json['pellets_per_shot'] as num?)?.toInt(),
      damagePerSecond: (json['damage_per_second'] as num?)?.toDouble(),
      heatPerShot: (json['heat_per_shot'] as num?)?.toDouble(),
      wearPerShot: (json['wear_per_shot'] as num?)?.toDouble(),
      heatPerSecond: (json['heat_per_second'] as num?)?.toDouble(),
      wearPerSecond: (json['wear_per_second'] as num?)?.toDouble(),
      fireDuringSpinUp: json['fire_during_spin_up'] as bool?,
      shotCount: (json['shot_count'] as num?)?.toInt(),
      cooldownTime: (json['cooldown_time'] as num?)?.toDouble(),
      sequenceMode: json['sequence_mode'] as String?,
      chargeUpTime: (json['charge_up_time'] as num?)?.toDouble(),
      chargeDownTime: (json['charge_down_time'] as num?)?.toDouble(),
      fullDamageRange: (json['full_damage_range'] as num?)?.toDouble(),
      zeroDamageRange: (json['zero_damage_range'] as num?)?.toDouble(),
      hitType: json['hit_type'] as String?,
      hitRadius: (json['hit_radius'] as num?)?.toDouble(),
      minEnergyDraw: (json['min_energy_draw'] as num?)?.toDouble(),
      maxEnergyDraw: (json['max_energy_draw'] as num?)?.toDouble(),
      healingMode: json['healing_mode'] as String?,
      healingPerSecond: (json['healing_per_second'] as num?)?.toDouble(),
      ammoPerMscu: (json['ammo_per_mscu'] as num?)?.toDouble(),
      medicalAmmoType: json['medical_ammo_type'] as String?,
      externalHealing: json['external_healing'] as String?,
      toggle: json['toggle'] as bool?,
      maxDistance: (json['max_distance'] as num?)?.toDouble(),
      maxSensorDistance: (json['max_sensor_distance'] as num?)?.toDouble(),
      autoDosageModifier: (json['auto_dosage_modifier'] as num?)?.toDouble(),
      healingBreakTime: (json['healing_break_time'] as num?)?.toDouble(),
      maxDoseForAutoAdjustment:
          (json['max_dose_for_auto_adjustment'] as num?)?.toDouble(),
      batteryDrainPerSecond:
          (json['battery_drain_per_second'] as num?)?.toDouble(),
      materialEfficiency: (json['material_efficiency'] as num?)?.toDouble(),
      maxHealthRepairRate: (json['max_health_repair_rate'] as num?)?.toDouble(),
      maxDamageMapRepairRate:
          (json['max_damage_map_repair_rate'] as num?)?.toDouble(),
      healthToAmmoRatio: (json['health_to_ammo_ratio'] as num?)?.toDouble(),
      rampUpTime: (json['ramp_up_time'] as num?)?.toDouble(),
      rampDownTime: (json['ramp_down_time'] as num?)?.toDouble(),
      maxVehicleDamageRatio:
          (json['max_vehicle_damage_ratio'] as num?)?.toDouble(),
      repairedMaterialRatio:
          (json['repaired_material_ratio'] as num?)?.toDouble(),
      salvageCanFireOnFull: json['salvage_can_fire_on_full'] as bool?,
      damageThreshold: (json['damage_threshold'] as num?)?.toDouble(),
      minimumDistance: (json['minimum_distance'] as num?)?.toDouble(),
      maximumDistance: (json['maximum_distance'] as num?)?.toDouble(),
      beamRadius: (json['beam_radius'] as num?)?.toDouble(),
      collectionRate: (json['collection_rate'] as num?)?.toDouble(),
      energyDraw: (json['energy_draw'] as num?)?.toDouble(),
      miningExtractorTag: json['mining_extractor_tag'] as String?,
      toggleMode: json['toggle_mode'] as bool?,
    );

Map<String, dynamic> _$VehicleWeaponModeToJson(VehicleWeaponMode instance) =>
    <String, dynamic>{
      'mode': instance.mode,
      'localised': instance.localised,
      'type': instance.type,
      'rpm': instance.rpm,
      'rounds_per_minute': instance.roundsPerMinute,
      'ammo_per_shot': instance.ammoPerShot,
      'pellets_per_shot': instance.pelletsPerShot,
      'damage_per_second': instance.damagePerSecond,
      'heat_per_shot': instance.heatPerShot,
      'wear_per_shot': instance.wearPerShot,
      'heat_per_second': instance.heatPerSecond,
      'wear_per_second': instance.wearPerSecond,
      'fire_during_spin_up': instance.fireDuringSpinUp,
      'shot_count': instance.shotCount,
      'cooldown_time': instance.cooldownTime,
      'sequence_mode': instance.sequenceMode,
      'charge_up_time': instance.chargeUpTime,
      'charge_down_time': instance.chargeDownTime,
      'full_damage_range': instance.fullDamageRange,
      'zero_damage_range': instance.zeroDamageRange,
      'hit_type': instance.hitType,
      'hit_radius': instance.hitRadius,
      'min_energy_draw': instance.minEnergyDraw,
      'max_energy_draw': instance.maxEnergyDraw,
      'healing_mode': instance.healingMode,
      'healing_per_second': instance.healingPerSecond,
      'ammo_per_mscu': instance.ammoPerMscu,
      'medical_ammo_type': instance.medicalAmmoType,
      'external_healing': instance.externalHealing,
      'toggle': instance.toggle,
      'max_distance': instance.maxDistance,
      'max_sensor_distance': instance.maxSensorDistance,
      'auto_dosage_modifier': instance.autoDosageModifier,
      'healing_break_time': instance.healingBreakTime,
      'max_dose_for_auto_adjustment': instance.maxDoseForAutoAdjustment,
      'battery_drain_per_second': instance.batteryDrainPerSecond,
      'material_efficiency': instance.materialEfficiency,
      'max_health_repair_rate': instance.maxHealthRepairRate,
      'max_damage_map_repair_rate': instance.maxDamageMapRepairRate,
      'health_to_ammo_ratio': instance.healthToAmmoRatio,
      'ramp_up_time': instance.rampUpTime,
      'ramp_down_time': instance.rampDownTime,
      'max_vehicle_damage_ratio': instance.maxVehicleDamageRatio,
      'repaired_material_ratio': instance.repairedMaterialRatio,
      'salvage_can_fire_on_full': instance.salvageCanFireOnFull,
      'damage_threshold': instance.damageThreshold,
      'minimum_distance': instance.minimumDistance,
      'maximum_distance': instance.maximumDistance,
      'beam_radius': instance.beamRadius,
      'collection_rate': instance.collectionRate,
      'energy_draw': instance.energyDraw,
      'mining_extractor_tag': instance.miningExtractorTag,
      'toggle_mode': instance.toggleMode,
    };

VehicleWeaponDamageTypes _$VehicleWeaponDamageTypesFromJson(
        Map<String, dynamic> json) =>
    VehicleWeaponDamageTypes(
      physical: (json['physical'] as num?)?.toDouble(),
      energy: (json['energy'] as num?)?.toDouble(),
      distortion: (json['distortion'] as num?)?.toDouble(),
      thermal: (json['thermal'] as num?)?.toDouble(),
      biochemical: (json['biochemical'] as num?)?.toDouble(),
      stun: (json['stun'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$VehicleWeaponDamageTypesToJson(
        VehicleWeaponDamageTypes instance) =>
    <String, dynamic>{
      'physical': instance.physical,
      'energy': instance.energy,
      'distortion': instance.distortion,
      'thermal': instance.thermal,
      'biochemical': instance.biochemical,
      'stun': instance.stun,
    };

VehicleWeaponDamage _$VehicleWeaponDamageFromJson(Map<String, dynamic> json) =>
    VehicleWeaponDamage(
      sustained60s: (json['sustained_60s'] as num?)?.toDouble(),
      burst: (json['burst'] as num?)?.toDouble(),
      alphaTotal: (json['alpha_total'] as num?)?.toDouble(),
      max: (json['max'] as num?)?.toDouble(),
      maximum: (json['maximum'] as num?)?.toDouble(),
      alpha: json['alpha'],
    );

Map<String, dynamic> _$VehicleWeaponDamageToJson(
        VehicleWeaponDamage instance) =>
    <String, dynamic>{
      'sustained_60s': instance.sustained60s,
      'burst': instance.burst,
      'alpha_total': instance.alphaTotal,
      'max': instance.max,
      'maximum': instance.maximum,
      'alpha': instance.alpha,
    };

VehicleWeaponSpread _$VehicleWeaponSpreadFromJson(Map<String, dynamic> json) =>
    VehicleWeaponSpread(
      min: (json['min'] as num?)?.toDouble(),
      max: (json['max'] as num?)?.toDouble(),
      minimum: (json['minimum'] as num?)?.toDouble(),
      maximum: (json['maximum'] as num?)?.toDouble(),
      firstAttack: (json['first_attack'] as num?)?.toDouble(),
      perAttack: (json['per_attack'] as num?)?.toDouble(),
      decay: (json['decay'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$VehicleWeaponSpreadToJson(
        VehicleWeaponSpread instance) =>
    <String, dynamic>{
      'min': instance.min,
      'max': instance.max,
      'minimum': instance.minimum,
      'maximum': instance.maximum,
      'first_attack': instance.firstAttack,
      'per_attack': instance.perAttack,
      'decay': instance.decay,
    };

VehicleWeaponBarrelSpinTime _$VehicleWeaponBarrelSpinTimeFromJson(
        Map<String, dynamic> json) =>
    VehicleWeaponBarrelSpinTime(
      up: (json['up'] as num?)?.toDouble(),
      down: (json['down'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$VehicleWeaponBarrelSpinTimeToJson(
        VehicleWeaponBarrelSpinTime instance) =>
    <String, dynamic>{
      'up': instance.up,
      'down': instance.down,
    };

VehicleWeaponHeat _$VehicleWeaponHeatFromJson(Map<String, dynamic> json) =>
    VehicleWeaponHeat(
      perShot: (json['per_shot'] as num?)?.toDouble(),
      coolingDelay: (json['cooling_delay'] as num?)?.toDouble(),
      coolingPerSecond: (json['cooling_per_second'] as num?)?.toDouble(),
      overheatMaxShots: (json['overheat_max_shots'] as num?)?.toDouble(),
      overheatMaxTime: (json['overheat_max_time'] as num?)?.toDouble(),
      overheatCooldown: (json['overheat_cooldown'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$VehicleWeaponHeatToJson(VehicleWeaponHeat instance) =>
    <String, dynamic>{
      'per_shot': instance.perShot,
      'cooling_delay': instance.coolingDelay,
      'cooling_per_second': instance.coolingPerSecond,
      'overheat_max_shots': instance.overheatMaxShots,
      'overheat_max_time': instance.overheatMaxTime,
      'overheat_cooldown': instance.overheatCooldown,
    };

VehicleWeaponCapacitor _$VehicleWeaponCapacitorFromJson(
        Map<String, dynamic> json) =>
    VehicleWeaponCapacitor(
      maxAmmoLoad: (json['max_ammo_load'] as num?)?.toDouble(),
      regenPerSecond: (json['regen_per_second'] as num?)?.toDouble(),
      cooldown: (json['cooldown'] as num?)?.toDouble(),
      requestedAmmoLoad: (json['requested_ammo_load'] as num?)?.toDouble(),
      costsPerShot: (json['costs_per_shot'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$VehicleWeaponCapacitorToJson(
        VehicleWeaponCapacitor instance) =>
    <String, dynamic>{
      'max_ammo_load': instance.maxAmmoLoad,
      'regen_per_second': instance.regenPerSecond,
      'cooldown': instance.cooldown,
      'requested_ammo_load': instance.requestedAmmoLoad,
      'costs_per_shot': instance.costsPerShot,
    };

VehicleWeaponCharge _$VehicleWeaponChargeFromJson(Map<String, dynamic> json) =>
    VehicleWeaponCharge(
      time: (json['time'] as num?)?.toDouble(),
      overchargeTime: (json['overcharge_time'] as num?)?.toDouble(),
      overchargedTime: (json['overcharged_time'] as num?)?.toDouble(),
      cooldownTime: (json['cooldown_time'] as num?)?.toDouble(),
      autoFire: json['auto_fire'] as bool?,
      requireFullCharge: json['require_full_charge'] as bool?,
      autoCharge: json['auto_charge'] as bool?,
      interpolateBonus: json['interpolate_bonus'] as bool?,
    );

Map<String, dynamic> _$VehicleWeaponChargeToJson(
        VehicleWeaponCharge instance) =>
    <String, dynamic>{
      'time': instance.time,
      'overcharge_time': instance.overchargeTime,
      'overcharged_time': instance.overchargedTime,
      'cooldown_time': instance.cooldownTime,
      'auto_fire': instance.autoFire,
      'require_full_charge': instance.requireFullCharge,
      'auto_charge': instance.autoCharge,
      'interpolate_bonus': instance.interpolateBonus,
    };

VehicleWeaponChargeModifier _$VehicleWeaponChargeModifierFromJson(
        Map<String, dynamic> json) =>
    VehicleWeaponChargeModifier(
      damage: (json['damage'] as num?)?.toDouble(),
      fireRate: (json['fire_rate'] as num?)?.toDouble(),
      ammoSpeed: (json['ammo_speed'] as num?)?.toDouble(),
      fireRateOverride: (json['fire_rate_override'] as num?)?.toDouble(),
      pelletsOverride: (json['pellets_override'] as num?)?.toInt(),
      burstShotsOverride: (json['burst_shots_override'] as num?)?.toInt(),
      heatMultiplier: (json['heat_multiplier'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$VehicleWeaponChargeModifierToJson(
        VehicleWeaponChargeModifier instance) =>
    <String, dynamic>{
      'damage': instance.damage,
      'fire_rate': instance.fireRate,
      'ammo_speed': instance.ammoSpeed,
      'fire_rate_override': instance.fireRateOverride,
      'pellets_override': instance.pelletsOverride,
      'burst_shots_override': instance.burstShotsOverride,
      'heat_multiplier': instance.heatMultiplier,
    };

VehicleWeapon _$VehicleWeaponFromJson(Map<String, dynamic> json) =>
    VehicleWeapon(
      $class: json['class'] as String?,
      type: json['type'] as String?,
      capacity: (json['capacity'] as num?)?.toInt(),
      range: (json['range'] as num?)?.toDouble(),
      rpm: (json['rpm'] as num?)?.toDouble(),
      damage: json['damage'],
      modes: (json['modes'] as List<dynamic>?)
              ?.map(
                  (e) => VehicleWeaponMode.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      damagePerShot: (json['damage_per_shot'] as num?)?.toDouble(),
      damages: (json['damages'] as List<dynamic>?)
              ?.map((e) =>
                  VehicleWeaponDamageEntry.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      regeneration: (json['regeneration'] as num?)?.toDouble(),
      ammunition: json['ammunition'],
      spread: json['spread'],
      barrelSpinTime: json['barrel_spin_time'],
      heat: json['heat'],
      capacitor: json['capacitor'],
      charge: json['charge'],
      chargeModifier: json['charge_modifier'],
      magazineVolume: json['magazine_volume'] == null
          ? null
          : VehicleWeapon$MagazineVolume.fromJson(
              json['magazine_volume'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VehicleWeaponToJson(VehicleWeapon instance) =>
    <String, dynamic>{
      'class': instance.$class,
      'type': instance.type,
      'capacity': instance.capacity,
      'range': instance.range,
      'rpm': instance.rpm,
      'damage': instance.damage,
      'modes': instance.modes?.map((e) => e.toJson()).toList(),
      'damage_per_shot': instance.damagePerShot,
      'damages': instance.damages?.map((e) => e.toJson()).toList(),
      'regeneration': instance.regeneration,
      'ammunition': instance.ammunition,
      'spread': instance.spread,
      'barrel_spin_time': instance.barrelSpinTime,
      'heat': instance.heat,
      'capacitor': instance.capacitor,
      'charge': instance.charge,
      'charge_modifier': instance.chargeModifier,
      'magazine_volume': instance.magazineVolume?.toJson(),
    };

WeaponAttachmentRgbColor _$WeaponAttachmentRgbColorFromJson(
        Map<String, dynamic> json) =>
    WeaponAttachmentRgbColor(
      r: (json['r'] as num?)?.toDouble(),
      g: (json['g'] as num?)?.toDouble(),
      b: (json['b'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$WeaponAttachmentRgbColorToJson(
        WeaponAttachmentRgbColor instance) =>
    <String, dynamic>{
      'r': instance.r,
      'g': instance.g,
      'b': instance.b,
    };

WeaponAttachmentIronSight _$WeaponAttachmentIronSightFromJson(
        Map<String, dynamic> json) =>
    WeaponAttachmentIronSight(
      defaultRange: (json['default_range'] as num?)?.toDouble(),
      maxRange: (json['max_range'] as num?)?.toDouble(),
      rangeIncrement: (json['range_increment'] as num?)?.toDouble(),
      autoZeroingTime: (json['auto_zeroing_time'] as num?)?.toDouble(),
      zoomScale: (json['zoom_scale'] as num?)?.toDouble(),
      zoomTimeScale: (json['zoom_time_scale'] as num?)?.toDouble(),
      zoomTimeChange: (json['zoom_time_change'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$WeaponAttachmentIronSightToJson(
        WeaponAttachmentIronSight instance) =>
    <String, dynamic>{
      'default_range': instance.defaultRange,
      'max_range': instance.maxRange,
      'range_increment': instance.rangeIncrement,
      'auto_zeroing_time': instance.autoZeroingTime,
      'zoom_scale': instance.zoomScale,
      'zoom_time_scale': instance.zoomTimeScale,
      'zoom_time_change': instance.zoomTimeChange,
    };

WeaponAttachmentMagazine _$WeaponAttachmentMagazineFromJson(
        Map<String, dynamic> json) =>
    WeaponAttachmentMagazine(
      initialAmmoCount: (json['initial_ammo_count'] as num?)?.toInt(),
      maxAmmoCount: (json['max_ammo_count'] as num?)?.toInt(),
      maxRestockCount: (json['max_restock_count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$WeaponAttachmentMagazineToJson(
        WeaponAttachmentMagazine instance) =>
    <String, dynamic>{
      'initial_ammo_count': instance.initialAmmoCount,
      'max_ammo_count': instance.maxAmmoCount,
      'max_restock_count': instance.maxRestockCount,
    };

WeaponAttachmentLaserPointer _$WeaponAttachmentLaserPointerFromJson(
        Map<String, dynamic> json) =>
    WeaponAttachmentLaserPointer(
      range: (json['range'] as num?)?.toDouble(),
      color: json['color'],
      colorCss: json['color_css'] as String?,
    );

Map<String, dynamic> _$WeaponAttachmentLaserPointerToJson(
        WeaponAttachmentLaserPointer instance) =>
    <String, dynamic>{
      'range': instance.range,
      'color': instance.color,
      'color_css': instance.colorCss,
    };

WeaponAttachmentFlashlightProfile _$WeaponAttachmentFlashlightProfileFromJson(
        Map<String, dynamic> json) =>
    WeaponAttachmentFlashlightProfile(
      portName: json['port_name'] as String?,
      name: json['name'] as String?,
      lightType: json['light_type'] as String?,
      lightRadius: (json['light_radius'] as num?)?.toDouble(),
      intensity: (json['intensity'] as num?)?.toDouble(),
      color: json['color'],
      colorCss: json['color_css'] as String?,
    );

Map<String, dynamic> _$WeaponAttachmentFlashlightProfileToJson(
        WeaponAttachmentFlashlightProfile instance) =>
    <String, dynamic>{
      'port_name': instance.portName,
      'name': instance.name,
      'light_type': instance.lightType,
      'light_radius': instance.lightRadius,
      'intensity': instance.intensity,
      'color': instance.color,
      'color_css': instance.colorCss,
    };

WeaponAttachmentFlashlight _$WeaponAttachmentFlashlightFromJson(
        Map<String, dynamic> json) =>
    WeaponAttachmentFlashlight();

Map<String, dynamic> _$WeaponAttachmentFlashlightToJson(
        WeaponAttachmentFlashlight instance) =>
    <String, dynamic>{};

WeaponAttachmentBarrelAttachment _$WeaponAttachmentBarrelAttachmentFromJson(
        Map<String, dynamic> json) =>
    WeaponAttachmentBarrelAttachment(
      attachmentPoint: json['attachment_point'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$WeaponAttachmentBarrelAttachmentToJson(
        WeaponAttachmentBarrelAttachment instance) =>
    <String, dynamic>{
      'attachment_point': instance.attachmentPoint,
      'type': instance.type,
    };

WeaponAttachment _$WeaponAttachmentFromJson(Map<String, dynamic> json) =>
    WeaponAttachment(
      ironSight: json['iron_sight'],
      laserPointer: json['laser_pointer'],
      flashlight: json['flashlight'],
      magazine: json['magazine'],
      compensator: json['compensator'],
      flashHider: json['flash_hider'],
    );

Map<String, dynamic> _$WeaponAttachmentToJson(WeaponAttachment instance) =>
    <String, dynamic>{
      'iron_sight': instance.ironSight,
      'laser_pointer': instance.laserPointer,
      'flashlight': instance.flashlight,
      'magazine': instance.magazine,
      'compensator': instance.compensator,
      'flash_hider': instance.flashHider,
    };

WeaponModifierBase _$WeaponModifierBaseFromJson(Map<String, dynamic> json) =>
    WeaponModifierBase(
      muzzleFlashMultiplier:
          (json['muzzle_flash_multiplier'] as num?)?.toDouble(),
      muzzleFlashChange: (json['muzzle_flash_change'] as num?)?.toDouble(),
      fireRateMultiplier: (json['fire_rate_multiplier'] as num?)?.toDouble(),
      fireRateChange: (json['fire_rate_change'] as num?)?.toDouble(),
      damageMultiplier: (json['damage_multiplier'] as num?)?.toDouble(),
      damageChange: (json['damage_change'] as num?)?.toDouble(),
      projectileSpeedMultiplier:
          (json['projectile_speed_multiplier'] as num?)?.toDouble(),
      projectileSpeedChange:
          (json['projectile_speed_change'] as num?)?.toDouble(),
      ammoCostMultiplier: (json['ammo_cost_multiplier'] as num?)?.toDouble(),
      ammoCostChange: (json['ammo_cost_change'] as num?)?.toDouble(),
      heatGenerationMultiplier:
          (json['heat_generation_multiplier'] as num?)?.toDouble(),
      heatGenerationChange:
          (json['heat_generation_change'] as num?)?.toDouble(),
      soundRadiusMultiplier:
          (json['sound_radius_multiplier'] as num?)?.toDouble(),
      soundRadiusChange: (json['sound_radius_change'] as num?)?.toDouble(),
      chargeTimeMultiplier:
          (json['charge_time_multiplier'] as num?)?.toDouble(),
      chargeTimeChange: (json['charge_time_change'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$WeaponModifierBaseToJson(WeaponModifierBase instance) =>
    <String, dynamic>{
      'muzzle_flash_multiplier': instance.muzzleFlashMultiplier,
      'muzzle_flash_change': instance.muzzleFlashChange,
      'fire_rate_multiplier': instance.fireRateMultiplier,
      'fire_rate_change': instance.fireRateChange,
      'damage_multiplier': instance.damageMultiplier,
      'damage_change': instance.damageChange,
      'projectile_speed_multiplier': instance.projectileSpeedMultiplier,
      'projectile_speed_change': instance.projectileSpeedChange,
      'ammo_cost_multiplier': instance.ammoCostMultiplier,
      'ammo_cost_change': instance.ammoCostChange,
      'heat_generation_multiplier': instance.heatGenerationMultiplier,
      'heat_generation_change': instance.heatGenerationChange,
      'sound_radius_multiplier': instance.soundRadiusMultiplier,
      'sound_radius_change': instance.soundRadiusChange,
      'charge_time_multiplier': instance.chargeTimeMultiplier,
      'charge_time_change': instance.chargeTimeChange,
    };

WeaponModifierRecoil _$WeaponModifierRecoilFromJson(
        Map<String, dynamic> json) =>
    WeaponModifierRecoil(
      decayMultiplier: (json['decay_multiplier'] as num?)?.toDouble(),
      decayChange: (json['decay_change'] as num?)?.toDouble(),
      multiplier: (json['multiplier'] as num?)?.toDouble(),
      multiplierChange: (json['multiplier_change'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$WeaponModifierRecoilToJson(
        WeaponModifierRecoil instance) =>
    <String, dynamic>{
      'decay_multiplier': instance.decayMultiplier,
      'decay_change': instance.decayChange,
      'multiplier': instance.multiplier,
      'multiplier_change': instance.multiplierChange,
    };

WeaponModifierSpread _$WeaponModifierSpreadFromJson(
        Map<String, dynamic> json) =>
    WeaponModifierSpread(
      minMultiplier: (json['min_multiplier'] as num?)?.toDouble(),
      minChange: (json['min_change'] as num?)?.toDouble(),
      maxMultiplier: (json['max_multiplier'] as num?)?.toDouble(),
      maxChange: (json['max_change'] as num?)?.toDouble(),
      firstAttackMultiplier:
          (json['first_attack_multiplier'] as num?)?.toDouble(),
      firstAttackChange: (json['first_attack_change'] as num?)?.toDouble(),
      perAttackMultiplier: (json['per_attack_multiplier'] as num?)?.toDouble(),
      perAttackChange: (json['per_attack_change'] as num?)?.toDouble(),
      decayMultiplier: (json['decay_multiplier'] as num?)?.toDouble(),
      decayChange: (json['decay_change'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$WeaponModifierSpreadToJson(
        WeaponModifierSpread instance) =>
    <String, dynamic>{
      'min_multiplier': instance.minMultiplier,
      'min_change': instance.minChange,
      'max_multiplier': instance.maxMultiplier,
      'max_change': instance.maxChange,
      'first_attack_multiplier': instance.firstAttackMultiplier,
      'first_attack_change': instance.firstAttackChange,
      'per_attack_multiplier': instance.perAttackMultiplier,
      'per_attack_change': instance.perAttackChange,
      'decay_multiplier': instance.decayMultiplier,
      'decay_change': instance.decayChange,
    };

WeaponModifierAim _$WeaponModifierAimFromJson(Map<String, dynamic> json) =>
    WeaponModifierAim(
      zoomScale: (json['zoom_scale'] as num?)?.toDouble(),
      secondZoomScale: (json['second_zoom_scale'] as num?)?.toDouble(),
      zoomTimeScale: (json['zoom_time_scale'] as num?)?.toDouble(),
      zoomTimeChange: (json['zoom_time_change'] as num?)?.toDouble(),
      hideWeaponInAds: json['hide_weapon_in_ads'] as bool?,
      fstopMultiplier: (json['fstop_multiplier'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$WeaponModifierAimToJson(WeaponModifierAim instance) =>
    <String, dynamic>{
      'zoom_scale': instance.zoomScale,
      'second_zoom_scale': instance.secondZoomScale,
      'zoom_time_scale': instance.zoomTimeScale,
      'zoom_time_change': instance.zoomTimeChange,
      'hide_weapon_in_ads': instance.hideWeaponInAds,
      'fstop_multiplier': instance.fstopMultiplier,
    };

WeaponModifierRegen _$WeaponModifierRegenFromJson(Map<String, dynamic> json) =>
    WeaponModifierRegen(
      powerRatioMultiplier:
          (json['power_ratio_multiplier'] as num?)?.toDouble(),
      maxAmmoLoadMultiplier:
          (json['max_ammo_load_multiplier'] as num?)?.toDouble(),
      maxRegenPerSecMultiplier:
          (json['max_regen_per_sec_multiplier'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$WeaponModifierRegenToJson(
        WeaponModifierRegen instance) =>
    <String, dynamic>{
      'power_ratio_multiplier': instance.powerRatioMultiplier,
      'max_ammo_load_multiplier': instance.maxAmmoLoadMultiplier,
      'max_regen_per_sec_multiplier': instance.maxRegenPerSecMultiplier,
    };

WeaponModifierSalvage _$WeaponModifierSalvageFromJson(
        Map<String, dynamic> json) =>
    WeaponModifierSalvage(
      salvageSpeedMultiplier:
          (json['salvage_speed_multiplier'] as num?)?.toDouble(),
      radiusMultiplier: (json['radius_multiplier'] as num?)?.toDouble(),
      extractionEfficiency: (json['extraction_efficiency'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$WeaponModifierSalvageToJson(
        WeaponModifierSalvage instance) =>
    <String, dynamic>{
      'salvage_speed_multiplier': instance.salvageSpeedMultiplier,
      'radius_multiplier': instance.radiusMultiplier,
      'extraction_efficiency': instance.extractionEfficiency,
    };

WeaponModifierZeroing _$WeaponModifierZeroingFromJson(
        Map<String, dynamic> json) =>
    WeaponModifierZeroing(
      defaultRange: (json['default_range'] as num?)?.toDouble(),
      maxRange: (json['max_range'] as num?)?.toDouble(),
      rangeIncrement: (json['range_increment'] as num?)?.toDouble(),
      autoZeroingTime: (json['auto_zeroing_time'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$WeaponModifierZeroingToJson(
        WeaponModifierZeroing instance) =>
    <String, dynamic>{
      'default_range': instance.defaultRange,
      'max_range': instance.maxRange,
      'range_increment': instance.rangeIncrement,
      'auto_zeroing_time': instance.autoZeroingTime,
    };

WeaponModifier _$WeaponModifierFromJson(Map<String, dynamic> json) =>
    WeaponModifier(
      activateOnAttach: json['activate_on_attach'] as bool?,
      ignoreWear: json['ignore_wear'] as bool?,
      base: json['base'],
      recoil: json['recoil'],
      spread: json['spread'],
      aim: json['aim'],
      regen: json['regen'],
      salvage: json['salvage'],
      zeroing: json['zeroing'],
      fireRateMultiplier: (json['fire_rate_multiplier'] as num?)?.toDouble(),
      damageMultiplier: (json['damage_multiplier'] as num?)?.toDouble(),
      damageOverTimeMultiplier:
          (json['damage_over_time_multiplier'] as num?)?.toDouble(),
      projectileSpeedMultiplier:
          (json['projectile_speed_multiplier'] as num?)?.toDouble(),
      ammoCostMultiplier: (json['ammo_cost_multiplier'] as num?)?.toDouble(),
      heatGenerationMultiplier:
          (json['heat_generation_multiplier'] as num?)?.toDouble(),
      soundRadiusMultiplier:
          (json['sound_radius_multiplier'] as num?)?.toDouble(),
      chargeTimeMultiplier:
          (json['charge_time_multiplier'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$WeaponModifierToJson(WeaponModifier instance) =>
    <String, dynamic>{
      'activate_on_attach': instance.activateOnAttach,
      'ignore_wear': instance.ignoreWear,
      'base': instance.base,
      'recoil': instance.recoil,
      'spread': instance.spread,
      'aim': instance.aim,
      'regen': instance.regen,
      'salvage': instance.salvage,
      'zeroing': instance.zeroing,
      'fire_rate_multiplier': instance.fireRateMultiplier,
      'damage_multiplier': instance.damageMultiplier,
      'damage_over_time_multiplier': instance.damageOverTimeMultiplier,
      'projectile_speed_multiplier': instance.projectileSpeedMultiplier,
      'ammo_cost_multiplier': instance.ammoCostMultiplier,
      'heat_generation_multiplier': instance.heatGenerationMultiplier,
      'sound_radius_multiplier': instance.soundRadiusMultiplier,
      'charge_time_multiplier': instance.chargeTimeMultiplier,
    };

WeaponRack _$WeaponRackFromJson(Map<String, dynamic> json) => WeaponRack(
      pistols: (json['pistols'] as num?)?.toInt(),
      rifles: (json['rifles'] as num?)?.toInt(),
      gadgets: (json['gadgets'] as num?)?.toInt(),
      totalWeaponSlots: (json['total_weapon_slots'] as num?)?.toInt(),
    );

Map<String, dynamic> _$WeaponRackToJson(WeaponRack instance) =>
    <String, dynamic>{
      'pistols': instance.pistols,
      'rifles': instance.rifles,
      'gadgets': instance.gadgets,
      'total_weapon_slots': instance.totalWeaponSlots,
    };

ManufacturerLink _$ManufacturerLinkFromJson(Map<String, dynamic> json) =>
    ManufacturerLink(
      name: json['name'] as String?,
      code: json['code'] as String?,
      uuid: json['uuid'] as String?,
      link: json['link'] as String?,
    );

Map<String, dynamic> _$ManufacturerLinkToJson(ManufacturerLink instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
      'uuid': instance.uuid,
      'link': instance.link,
    };

Manufacturer _$ManufacturerFromJson(Map<String, dynamic> json) => Manufacturer(
      name: json['name'] as String?,
      code: json['code'] as String?,
      uuid: json['uuid'] as String?,
      link: json['link'] as String?,
    );

Map<String, dynamic> _$ManufacturerToJson(Manufacturer instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
      'uuid': instance.uuid,
      'link': instance.link,
    };

MissionCompletionTag _$MissionCompletionTagFromJson(
        Map<String, dynamic> json) =>
    MissionCompletionTag(
      name: json['name'] as String?,
      unlocksMissions: (json['unlocks_missions'] as List<dynamic>?)
              ?.map((e) => MissionCompletionTagMission.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$MissionCompletionTagToJson(
        MissionCompletionTag instance) =>
    <String, dynamic>{
      'name': instance.name,
      'unlocks_missions':
          instance.unlocksMissions?.map((e) => e.toJson()).toList(),
    };

MissionCompletionTagMission _$MissionCompletionTagMissionFromJson(
        Map<String, dynamic> json) =>
    MissionCompletionTagMission(
      uuid: json['uuid'] as String?,
      title: json['title'] as String?,
      link: json['link'] as String?,
      webUrl: json['web_url'] as String?,
    );

Map<String, dynamic> _$MissionCompletionTagMissionToJson(
        MissionCompletionTagMission instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'title': instance.title,
      'link': instance.link,
      'web_url': instance.webUrl,
    };

MissionPrerequisiteGroup _$MissionPrerequisiteGroupFromJson(
        Map<String, dynamic> json) =>
    MissionPrerequisiteGroup(
      requiredCount: (json['required_count'] as num?)?.toInt(),
      requiredTags: (json['required_tags'] as List<dynamic>?)
          ?.map((e) => MissionPrerequisiteGroup$RequiredTags$Item.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      excludedTags: (json['excluded_tags'] as List<dynamic>?)
          ?.map((e) => MissionPrerequisiteGroup$ExcludedTags$Item.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      missions: (json['missions'] as List<dynamic>?)
              ?.map((e) => MissionChainLink.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$MissionPrerequisiteGroupToJson(
        MissionPrerequisiteGroup instance) =>
    <String, dynamic>{
      'required_count': instance.requiredCount,
      'required_tags': instance.requiredTags?.map((e) => e.toJson()).toList(),
      'excluded_tags': instance.excludedTags?.map((e) => e.toJson()).toList(),
      'missions': instance.missions?.map((e) => e.toJson()).toList(),
    };

MissionUnlockGroup _$MissionUnlockGroupFromJson(Map<String, dynamic> json) =>
    MissionUnlockGroup(
      tagName: json['tag_name'] as String?,
      tagUuid: json['tag_uuid'] as String?,
      missions: (json['missions'] as List<dynamic>?)
              ?.map((e) => MissionChainLink.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$MissionUnlockGroupToJson(MissionUnlockGroup instance) =>
    <String, dynamic>{
      'tag_name': instance.tagName,
      'tag_uuid': instance.tagUuid,
      'missions': instance.missions?.map((e) => e.toJson()).toList(),
    };

MissionChainLink _$MissionChainLinkFromJson(Map<String, dynamic> json) =>
    MissionChainLink(
      uuid: json['uuid'] as String?,
      title: json['title'] as String?,
      missionType: json['mission_type'] as String?,
      variantCount: (json['variant_count'] as num?)?.toInt(),
      variants: (json['variants'] as List<dynamic>?)
              ?.map((e) =>
                  MissionChainVariant.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      link: json['link'] as String?,
      webUrl: json['web_url'] as String?,
    );

Map<String, dynamic> _$MissionChainLinkToJson(MissionChainLink instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'title': instance.title,
      'mission_type': instance.missionType,
      'variant_count': instance.variantCount,
      'variants': instance.variants?.map((e) => e.toJson()).toList(),
      'link': instance.link,
      'web_url': instance.webUrl,
    };

MissionChainVariant _$MissionChainVariantFromJson(Map<String, dynamic> json) =>
    MissionChainVariant(
      uuid: json['uuid'] as String?,
      link: json['link'] as String?,
      webUrl: json['web_url'] as String?,
    );

Map<String, dynamic> _$MissionChainVariantToJson(
        MissionChainVariant instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'link': instance.link,
      'web_url': instance.webUrl,
    };

MissionCombat _$MissionCombatFromJson(Map<String, dynamic> json) =>
    MissionCombat(
      summary: json['summary'] == null
          ? null
          : MissionCombat$Summary.fromJson(
              json['summary'] as Map<String, dynamic>),
      spawns: (json['spawns'] as List<dynamic>?)
          ?.map((e) =>
              MissionCombat$Spawns$Item.fromJson(e as Map<String, dynamic>))
          .toList(),
      aggregatedSpawns: (json['aggregated_spawns'] as List<dynamic>?)
          ?.map((e) => MissionCombat$AggregatedSpawns$Item.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MissionCombatToJson(MissionCombat instance) =>
    <String, dynamic>{
      'summary': instance.summary?.toJson(),
      'spawns': instance.spawns?.map((e) => e.toJson()).toList(),
      'aggregated_spawns':
          instance.aggregatedSpawns?.map((e) => e.toJson()).toList(),
    };

MissionCooldown _$MissionCooldownFromJson(Map<String, dynamic> json) =>
    MissionCooldown(
      label: json['label'] as String?,
      personalSeconds: (json['personal_seconds'] as num?)?.toInt(),
      abandonedSeconds: (json['abandoned_seconds'] as num?)?.toInt(),
      personalVariationSeconds:
          (json['personal_variation_seconds'] as num?)?.toInt(),
      abandonedVariationSeconds:
          (json['abandoned_variation_seconds'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MissionCooldownToJson(MissionCooldown instance) =>
    <String, dynamic>{
      'label': instance.label,
      'personal_seconds': instance.personalSeconds,
      'abandoned_seconds': instance.abandonedSeconds,
      'personal_variation_seconds': instance.personalVariationSeconds,
      'abandoned_variation_seconds': instance.abandonedVariationSeconds,
    };

MissionHaulingOrder _$MissionHaulingOrderFromJson(Map<String, dynamic> json) =>
    MissionHaulingOrder(
      kind: json['kind'] as String?,
      name: json['name'] as String?,
      uuid: json['uuid'] as String?,
      items: (json['items'] as List<dynamic>?)
              ?.map((e) =>
                  MissionHaulingOrderItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      maxScu: (json['max_scu'] as num?)?.toInt(),
      minScu: (json['min_scu'] as num?)?.toInt(),
      maxAmount: (json['max_amount'] as num?)?.toInt(),
      minAmount: (json['min_amount'] as num?)?.toInt(),
      maxContainerSize: (json['max_container_size'] as num?)?.toInt(),
      link: json['link'] as String?,
      webUrl: json['web_url'] as String?,
      orOptions: (json['or_options'] as List<dynamic>?)
              ?.map((e) => (e as List<dynamic>)
                  .map((e) => e == null
                      ? null
                      : MissionHaulingOrder.fromJson(e as Map<String, dynamic>))
                  .toList())
              .toList() ??
          [],
    );

Map<String, dynamic> _$MissionHaulingOrderToJson(
        MissionHaulingOrder instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'name': instance.name,
      'uuid': instance.uuid,
      'items': instance.items?.map((e) => e.toJson()).toList(),
      'max_scu': instance.maxScu,
      'min_scu': instance.minScu,
      'max_amount': instance.maxAmount,
      'min_amount': instance.minAmount,
      'max_container_size': instance.maxContainerSize,
      'link': instance.link,
      'web_url': instance.webUrl,
      'or_options': instance.orOptions
          ?.map((e) => e.map((e) => e?.toJson()).toList())
          .toList(),
    };

MissionHaulingOrderItem _$MissionHaulingOrderItemFromJson(
        Map<String, dynamic> json) =>
    MissionHaulingOrderItem(
      name: json['name'] as String?,
      uuid: json['uuid'] as String?,
      link: json['link'] as String?,
      webUrl: json['web_url'] as String?,
    );

Map<String, dynamic> _$MissionHaulingOrderItemToJson(
        MissionHaulingOrderItem instance) =>
    <String, dynamic>{
      'name': instance.name,
      'uuid': instance.uuid,
      'link': instance.link,
      'web_url': instance.webUrl,
    };

MissionIndex _$MissionIndexFromJson(Map<String, dynamic> json) => MissionIndex(
      uuid: json['uuid'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      missionGiver: json['mission_giver'] as String?,
      debugName: json['debug_name'] as String?,
      faction: json['faction'] == null
          ? null
          : MissionIndex$Faction.fromJson(
              json['faction'] as Map<String, dynamic>),
      rankIndex: (json['rank_index'] as num?)?.toInt(),
      illegal: json['illegal'] as bool?,
      legalityLabel: json['legality_label'] as String?,
      shareable: json['shareable'] as bool?,
      onceOnly: json['once_only'] as bool?,
      hasCombat: json['has_combat'] as bool?,
      hasDefendObjective: json['has_defend_objective'] as bool?,
      enemyCountMin: (json['enemy_count_min'] as num?)?.toInt(),
      enemyCountMax: (json['enemy_count_max'] as num?)?.toInt(),
      rewardMin: (json['reward_min'] as num?)?.toInt(),
      rewardMax: (json['reward_max'] as num?)?.toInt(),
      rewardCurrency: json['reward_currency'] as String?,
      timeToCompleteMinutes:
          (json['time_to_complete_minutes'] as num?)?.toDouble(),
      starSystems: (json['star_systems'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      variantCount: (json['variant_count'] as num?)?.toInt(),
      variants: (json['variants'] as List<dynamic>?)
          ?.map((e) =>
              MissionIndex$Variants$Item.fromJson(e as Map<String, dynamic>))
          .toList(),
      hasBlueprints: json['has_blueprints'] as bool?,
      blueprints: (json['blueprints'] as List<dynamic>?)
              ?.map((e) =>
                  MissionIndexBlueprint.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      hasChain: json['has_chain'] as bool?,
      hasPrerequisites: json['has_prerequisites'] as bool?,
      hasHauling: json['has_hauling'] as bool?,
      minStanding: json['min_standing'] == null
          ? null
          : MissionIndex$MinStanding.fromJson(
              json['min_standing'] as Map<String, dynamic>),
      maxStanding: json['max_standing'] == null
          ? null
          : MissionIndex$MaxStanding.fromJson(
              json['max_standing'] as Map<String, dynamic>),
      minStandingName: json['min_standing_name'] as String?,
      maxStandingName: json['max_standing_name'] as String?,
      cost: (json['cost'] as num?)?.toInt(),
      minCrimeStat: (json['min_crime_stat'] as num?)?.toInt(),
      maxCrimeStat: (json['max_crime_stat'] as num?)?.toInt(),
      availableInPrison: json['available_in_prison'] as bool?,
      notForRelease: json['not_for_release'] as bool?,
      workInProgress: json['work_in_progress'] as bool?,
      reputationGained: (json['reputation_gained'] as List<dynamic>?)
          ?.map((e) => MissionIndex$ReputationGained$Item.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      maxPlayersPerInstance:
          (json['max_players_per_instance'] as num?)?.toInt(),
      maxInstancesPerPlayer:
          (json['max_instances_per_player'] as num?)?.toInt(),
      cooldown: json['cooldown'],
      cooldownSeconds: (json['cooldown_seconds'] as num?)?.toInt(),
      cooldownLabel: json['cooldown_label'] as String?,
      reacceptAfterAbandoning: json['reaccept_after_abandoning'] as bool?,
      reacceptAfterFailing: json['reaccept_after_failing'] as bool?,
      failIfBecameCriminal: json['fail_if_became_criminal'] as bool?,
      haulingSummary: (json['hauling_summary'] as List<dynamic>?)
          ?.map((e) => MissionIndex$HaulingSummary$Item.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      rewardScope: json['reward_scope'] as String?,
      reputationAmount: (json['reputation_amount'] as num?)?.toInt(),
      gameVersion: json['game_version'] as String?,
      link: json['link'] as String?,
      webUrl: json['web_url'] as String?,
    );

Map<String, dynamic> _$MissionIndexToJson(MissionIndex instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'title': instance.title,
      'description': instance.description,
      'mission_giver': instance.missionGiver,
      'debug_name': instance.debugName,
      'faction': instance.faction?.toJson(),
      'rank_index': instance.rankIndex,
      'illegal': instance.illegal,
      'legality_label': instance.legalityLabel,
      'shareable': instance.shareable,
      'once_only': instance.onceOnly,
      'has_combat': instance.hasCombat,
      'has_defend_objective': instance.hasDefendObjective,
      'enemy_count_min': instance.enemyCountMin,
      'enemy_count_max': instance.enemyCountMax,
      'reward_min': instance.rewardMin,
      'reward_max': instance.rewardMax,
      'reward_currency': instance.rewardCurrency,
      'time_to_complete_minutes': instance.timeToCompleteMinutes,
      'star_systems': instance.starSystems,
      'variant_count': instance.variantCount,
      'variants': instance.variants?.map((e) => e.toJson()).toList(),
      'has_blueprints': instance.hasBlueprints,
      'blueprints': instance.blueprints?.map((e) => e.toJson()).toList(),
      'has_chain': instance.hasChain,
      'has_prerequisites': instance.hasPrerequisites,
      'has_hauling': instance.hasHauling,
      'min_standing': instance.minStanding?.toJson(),
      'max_standing': instance.maxStanding?.toJson(),
      'min_standing_name': instance.minStandingName,
      'max_standing_name': instance.maxStandingName,
      'cost': instance.cost,
      'min_crime_stat': instance.minCrimeStat,
      'max_crime_stat': instance.maxCrimeStat,
      'available_in_prison': instance.availableInPrison,
      'not_for_release': instance.notForRelease,
      'work_in_progress': instance.workInProgress,
      'reputation_gained':
          instance.reputationGained?.map((e) => e.toJson()).toList(),
      'max_players_per_instance': instance.maxPlayersPerInstance,
      'max_instances_per_player': instance.maxInstancesPerPlayer,
      'cooldown': instance.cooldown,
      'cooldown_seconds': instance.cooldownSeconds,
      'cooldown_label': instance.cooldownLabel,
      'reaccept_after_abandoning': instance.reacceptAfterAbandoning,
      'reaccept_after_failing': instance.reacceptAfterFailing,
      'fail_if_became_criminal': instance.failIfBecameCriminal,
      'hauling_summary':
          instance.haulingSummary?.map((e) => e.toJson()).toList(),
      'reward_scope': instance.rewardScope,
      'reputation_amount': instance.reputationAmount,
      'game_version': instance.gameVersion,
      'link': instance.link,
      'web_url': instance.webUrl,
    };

MissionIndexBlueprint _$MissionIndexBlueprintFromJson(
        Map<String, dynamic> json) =>
    MissionIndexBlueprint(
      name: json['name'] as String?,
      uuid: json['uuid'] as String?,
      link: json['link'] as String?,
    );

Map<String, dynamic> _$MissionIndexBlueprintToJson(
        MissionIndexBlueprint instance) =>
    <String, dynamic>{
      'name': instance.name,
      'uuid': instance.uuid,
      'link': instance.link,
    };

MissionLifetime _$MissionLifetimeFromJson(Map<String, dynamic> json) =>
    MissionLifetime(
      label: json['label'] as String?,
      respawnTimeSeconds: (json['respawn_time_seconds'] as num?)?.toInt(),
      maxInstances: (json['max_instances'] as num?)?.toInt(),
      respawnTimeVariationSeconds:
          (json['respawn_time_variation_seconds'] as num?)?.toInt(),
      maxInstancesPerPlayer:
          (json['max_instances_per_player'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MissionLifetimeToJson(MissionLifetime instance) =>
    <String, dynamic>{
      'label': instance.label,
      'respawn_time_seconds': instance.respawnTimeSeconds,
      'max_instances': instance.maxInstances,
      'respawn_time_variation_seconds': instance.respawnTimeVariationSeconds,
      'max_instances_per_player': instance.maxInstancesPerPlayer,
    };

MissionStarmapLocationGroup _$MissionStarmapLocationGroupFromJson(
        Map<String, dynamic> json) =>
    MissionStarmapLocationGroup(
      purpose: json['purpose'] as String?,
      locations: (json['locations'] as List<dynamic>?)
              ?.map((e) =>
                  MissionStarmapLocation.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$MissionStarmapLocationGroupToJson(
        MissionStarmapLocationGroup instance) =>
    <String, dynamic>{
      'purpose': instance.purpose,
      'locations': instance.locations?.map((e) => e.toJson()).toList(),
    };

MissionStarmapLocation _$MissionStarmapLocationFromJson(
        Map<String, dynamic> json) =>
    MissionStarmapLocation(
      uuid: json['uuid'] as String?,
      name: json['name'] as String?,
      system: json['system'] as String?,
      type: json['type'] as String?,
      link: json['link'] as String?,
      webUrl: json['web_url'] as String?,
    );

Map<String, dynamic> _$MissionStarmapLocationToJson(
        MissionStarmapLocation instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'system': instance.system,
      'type': instance.type,
      'link': instance.link,
      'web_url': instance.webUrl,
    };

Mission _$MissionFromJson(Map<String, dynamic> json) => Mission(
      uuid: json['uuid'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      descriptionHtml: json['description_html'] as String?,
      descriptionVariants: (json['description_variants'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      missionType: json['mission_type'] as String?,
      missionGiver: json['mission_giver'] as String?,
      faction: json['faction'] == null
          ? null
          : Mission$Faction.fromJson(json['faction'] as Map<String, dynamic>),
      rankIndex: (json['rank_index'] as num?)?.toInt(),
      illegal: json['illegal'] as bool?,
      legalityLabel: json['legality_label'] as String?,
      shareable: json['shareable'] as bool?,
      onceOnly: json['once_only'] as bool?,
      availableInPrison: json['available_in_prison'] as bool?,
      notForRelease: json['not_for_release'] as bool?,
      workInProgress: json['work_in_progress'] as bool?,
      hasCombat: json['has_combat'] as bool?,
      hasDefendObjective: json['has_defend_objective'] as bool?,
      enemyCountMin: (json['enemy_count_min'] as num?)?.toInt(),
      enemyCountMax: (json['enemy_count_max'] as num?)?.toInt(),
      minCrimeStat: (json['min_crime_stat'] as num?)?.toInt(),
      maxCrimeStat: (json['max_crime_stat'] as num?)?.toInt(),
      rewardMin: (json['reward_min'] as num?)?.toInt(),
      rewardMax: (json['reward_max'] as num?)?.toInt(),
      rewardCurrency: json['reward_currency'] as String?,
      timeToCompleteMinutes:
          (json['time_to_complete_minutes'] as num?)?.toDouble(),
      starSystems: (json['star_systems'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      cooldown: json['cooldown'],
      lifetime: json['lifetime'],
      reacceptAfterFailing: json['reaccept_after_failing'] as bool?,
      reacceptAfterAbandoning: json['reaccept_after_abandoning'] as bool?,
      blueprints: json['blueprints'],
      rewardItems: (json['reward_items'] as List<dynamic>?)
              ?.map(
                  (e) => MissionRewardItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      combat: json['combat'],
      completionTags: (json['completion_tags'] as List<dynamic>?)
              ?.map((e) =>
                  MissionCompletionTag.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      reputationGained: (json['reputation_gained'] as List<dynamic>?)
              ?.map(
                  (e) => MissionReputation.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      reputationLost: (json['reputation_lost'] as List<dynamic>?)
              ?.map(
                  (e) => MissionReputation.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      haulingOrders: (json['hauling_orders'] as List<dynamic>?)
              ?.map((e) =>
                  MissionHaulingOrder.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      cost: (json['cost'] as num?)?.toInt(),
      maxPlayersPerInstance:
          (json['max_players_per_instance'] as num?)?.toInt(),
      failIfBecameCriminal: json['fail_if_became_criminal'] as bool?,
      minStanding: json['min_standing'] == null
          ? null
          : Mission$MinStanding.fromJson(
              json['min_standing'] as Map<String, dynamic>),
      maxStanding: json['max_standing'] == null
          ? null
          : Mission$MaxStanding.fromJson(
              json['max_standing'] as Map<String, dynamic>),
      missionTokens: json['mission_tokens'] as Map<String, dynamic>?,
      deadline: json['deadline'] == null
          ? null
          : Mission$Deadline.fromJson(json['deadline'] as Map<String, dynamic>),
      brokerReputationPrerequisites: json['broker_reputation_prerequisites'] ==
              null
          ? null
          : Mission$BrokerReputationPrerequisites.fromJson(
              json['broker_reputation_prerequisites'] as Map<String, dynamic>),
      itemCounts: json['item_counts'] == null
          ? null
          : Mission$ItemCounts.fromJson(
              json['item_counts'] as Map<String, dynamic>),
      entitySpawns: (json['entity_spawns'] as List<dynamic>?)
          ?.map((e) =>
              Mission$EntitySpawns$Item.fromJson(e as Map<String, dynamic>))
          .toList(),
      hiddenInMobiglas: json['hidden_in_mobiglas'] as bool?,
      notifyOnAvailable: json['notify_on_available'] as bool?,
      rewardScope: json['reward_scope'] as String?,
      reputationAmount: (json['reputation_amount'] as num?)?.toInt(),
      gameVersion: json['game_version'] as String?,
      starmapLocations: (json['starmap_locations'] as List<dynamic>?)
              ?.map((e) => MissionStarmapLocationGroup.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          [],
      prerequisiteGroups: (json['prerequisite_groups'] as List<dynamic>?)
              ?.map((e) =>
                  MissionPrerequisiteGroup.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      unlockGroups: (json['unlock_groups'] as List<dynamic>?)
              ?.map(
                  (e) => MissionUnlockGroup.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      mergedLocations: json['merged_locations'],
      hasRewards: json['has_rewards'] as bool?,
      hasCombatSection: json['has_combat_section'] as bool?,
      hasLocations: json['has_locations'] as bool?,
      hasChain: json['has_chain'] as bool?,
      hasBlueprints: json['has_blueprints'] as bool?,
      released: json['released'] as bool?,
      link: json['link'] as String?,
    );

Map<String, dynamic> _$MissionToJson(Mission instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'title': instance.title,
      'description': instance.description,
      'description_html': instance.descriptionHtml,
      'description_variants': instance.descriptionVariants,
      'mission_type': instance.missionType,
      'mission_giver': instance.missionGiver,
      'faction': instance.faction?.toJson(),
      'rank_index': instance.rankIndex,
      'illegal': instance.illegal,
      'legality_label': instance.legalityLabel,
      'shareable': instance.shareable,
      'once_only': instance.onceOnly,
      'available_in_prison': instance.availableInPrison,
      'not_for_release': instance.notForRelease,
      'work_in_progress': instance.workInProgress,
      'has_combat': instance.hasCombat,
      'has_defend_objective': instance.hasDefendObjective,
      'enemy_count_min': instance.enemyCountMin,
      'enemy_count_max': instance.enemyCountMax,
      'min_crime_stat': instance.minCrimeStat,
      'max_crime_stat': instance.maxCrimeStat,
      'reward_min': instance.rewardMin,
      'reward_max': instance.rewardMax,
      'reward_currency': instance.rewardCurrency,
      'time_to_complete_minutes': instance.timeToCompleteMinutes,
      'star_systems': instance.starSystems,
      'cooldown': instance.cooldown,
      'lifetime': instance.lifetime,
      'reaccept_after_failing': instance.reacceptAfterFailing,
      'reaccept_after_abandoning': instance.reacceptAfterAbandoning,
      'blueprints': instance.blueprints,
      'reward_items': instance.rewardItems?.map((e) => e.toJson()).toList(),
      'combat': instance.combat,
      'completion_tags':
          instance.completionTags?.map((e) => e.toJson()).toList(),
      'reputation_gained':
          instance.reputationGained?.map((e) => e.toJson()).toList(),
      'reputation_lost':
          instance.reputationLost?.map((e) => e.toJson()).toList(),
      'hauling_orders': instance.haulingOrders?.map((e) => e.toJson()).toList(),
      'cost': instance.cost,
      'max_players_per_instance': instance.maxPlayersPerInstance,
      'fail_if_became_criminal': instance.failIfBecameCriminal,
      'min_standing': instance.minStanding?.toJson(),
      'max_standing': instance.maxStanding?.toJson(),
      'mission_tokens': instance.missionTokens,
      'deadline': instance.deadline?.toJson(),
      'broker_reputation_prerequisites':
          instance.brokerReputationPrerequisites?.toJson(),
      'item_counts': instance.itemCounts?.toJson(),
      'entity_spawns': instance.entitySpawns?.map((e) => e.toJson()).toList(),
      'hidden_in_mobiglas': instance.hiddenInMobiglas,
      'notify_on_available': instance.notifyOnAvailable,
      'reward_scope': instance.rewardScope,
      'reputation_amount': instance.reputationAmount,
      'game_version': instance.gameVersion,
      'starmap_locations':
          instance.starmapLocations?.map((e) => e.toJson()).toList(),
      'prerequisite_groups':
          instance.prerequisiteGroups?.map((e) => e.toJson()).toList(),
      'unlock_groups': instance.unlockGroups?.map((e) => e.toJson()).toList(),
      'merged_locations': instance.mergedLocations,
      'has_rewards': instance.hasRewards,
      'has_combat_section': instance.hasCombatSection,
      'has_locations': instance.hasLocations,
      'has_chain': instance.hasChain,
      'has_blueprints': instance.hasBlueprints,
      'released': instance.released,
      'link': instance.link,
    };

MissionBlueprintPool _$MissionBlueprintPoolFromJson(
        Map<String, dynamic> json) =>
    MissionBlueprintPool(
      dropChance: (json['drop_chance'] as num?)?.toDouble(),
      dropChancePercent: (json['drop_chance_percent'] as num?)?.toDouble(),
      poolUuid: json['pool_uuid'] as String?,
      items: (json['items'] as List<dynamic>?)
              ?.map((e) =>
                  MissionBlueprintItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$MissionBlueprintPoolToJson(
        MissionBlueprintPool instance) =>
    <String, dynamic>{
      'drop_chance': instance.dropChance,
      'drop_chance_percent': instance.dropChancePercent,
      'pool_uuid': instance.poolUuid,
      'items': instance.items?.map((e) => e.toJson()).toList(),
    };

MissionBlueprintItem _$MissionBlueprintItemFromJson(
        Map<String, dynamic> json) =>
    MissionBlueprintItem(
      name: json['name'] as String?,
      uuid: json['uuid'] as String?,
      itemLink: json['item_link'] as String?,
      blueprintLink: json['blueprint_link'] as String?,
      webItemLink: json['web_item_link'] as String?,
      webBlueprintLink: json['web_blueprint_link'] as String?,
    );

Map<String, dynamic> _$MissionBlueprintItemToJson(
        MissionBlueprintItem instance) =>
    <String, dynamic>{
      'name': instance.name,
      'uuid': instance.uuid,
      'item_link': instance.itemLink,
      'blueprint_link': instance.blueprintLink,
      'web_item_link': instance.webItemLink,
      'web_blueprint_link': instance.webBlueprintLink,
    };

MissionRewardItem _$MissionRewardItemFromJson(Map<String, dynamic> json) =>
    MissionRewardItem(
      name: json['name'] as String?,
      uuid: json['uuid'] as String?,
      amount: (json['amount'] as num?)?.toInt(),
      sendToHome: json['send_to_home'] as bool?,
      link: json['link'] as String?,
      webUrl: json['web_url'] as String?,
    );

Map<String, dynamic> _$MissionRewardItemToJson(MissionRewardItem instance) =>
    <String, dynamic>{
      'name': instance.name,
      'uuid': instance.uuid,
      'amount': instance.amount,
      'send_to_home': instance.sendToHome,
      'link': instance.link,
      'web_url': instance.webUrl,
    };

MissionReputation _$MissionReputationFromJson(Map<String, dynamic> json) =>
    MissionReputation(
      tier: json['tier'] as String?,
      scope: json['scope'] as String?,
      amount: (json['amount'] as num?)?.toInt(),
      faction: json['faction'] as String?,
      factionUuid: json['faction_uuid'] as String?,
    );

Map<String, dynamic> _$MissionReputationToJson(MissionReputation instance) =>
    <String, dynamic>{
      'tier': instance.tier,
      'scope': instance.scope,
      'amount': instance.amount,
      'faction': instance.faction,
      'faction_uuid': instance.factionUuid,
    };

MissionFactionReputationScope _$MissionFactionReputationScopeFromJson(
        Map<String, dynamic> json) =>
    MissionFactionReputationScope(
      scopeName: json['scope_name'] as String?,
      standings: (json['standings'] as List<dynamic>?)
              ?.map((e) =>
                  MissionFactionStanding.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$MissionFactionReputationScopeToJson(
        MissionFactionReputationScope instance) =>
    <String, dynamic>{
      'scope_name': instance.scopeName,
      'standings': instance.standings?.map((e) => e.toJson()).toList(),
    };

MissionFactionStanding _$MissionFactionStandingFromJson(
        Map<String, dynamic> json) =>
    MissionFactionStanding(
      name: json['name'] as String?,
      displayName: json['display_name'] as String?,
      minReputation: (json['min_reputation'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MissionFactionStandingToJson(
        MissionFactionStanding instance) =>
    <String, dynamic>{
      'name': instance.name,
      'display_name': instance.displayName,
      'min_reputation': instance.minReputation,
    };

MissionSummary _$MissionSummaryFromJson(Map<String, dynamic> json) =>
    MissionSummary(
      uuid: json['uuid'] as String?,
      title: json['title'] as String?,
      missionType: json['mission_type'] as String?,
      illegal: json['illegal'] as bool?,
      hasCombat: json['has_combat'] as bool?,
      faction: json['faction'] == null
          ? null
          : MissionSummary$Faction.fromJson(
              json['faction'] as Map<String, dynamic>),
      link: json['link'] as String?,
      webUrl: json['web_url'] as String?,
    );

Map<String, dynamic> _$MissionSummaryToJson(MissionSummary instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'title': instance.title,
      'mission_type': instance.missionType,
      'illegal': instance.illegal,
      'has_combat': instance.hasCombat,
      'faction': instance.faction?.toJson(),
      'link': instance.link,
      'web_url': instance.webUrl,
    };

StarmapLocationLink _$StarmapLocationLinkFromJson(Map<String, dynamic> json) =>
    StarmapLocationLink(
      uuid: json['uuid'] as String?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      typeName: json['type_name'] as String?,
      parentName: json['parent_name'] as String?,
      starSystemName: json['star_system_name'] as String?,
      link: json['link'] as String?,
      webUrl: json['web_url'] as String?,
    );

Map<String, dynamic> _$StarmapLocationLinkToJson(
        StarmapLocationLink instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'slug': instance.slug,
      'type_name': instance.typeName,
      'parent_name': instance.parentName,
      'star_system_name': instance.starSystemName,
      'link': instance.link,
      'web_url': instance.webUrl,
    };

GameStarmapLocationLinkedSummary _$GameStarmapLocationLinkedSummaryFromJson(
        Map<String, dynamic> json) =>
    GameStarmapLocationLinkedSummary(
      uuid: json['uuid'] as String?,
      name: json['name'] as String?,
      typeName: json['type_name'] as String?,
      slug: json['slug'] as String?,
    );

Map<String, dynamic> _$GameStarmapLocationLinkedSummaryToJson(
        GameStarmapLocationLinkedSummary instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'type_name': instance.typeName,
      'slug': instance.slug,
    };

GameStarmapLocationType _$GameStarmapLocationTypeFromJson(
        Map<String, dynamic> json) =>
    GameStarmapLocationType(
      uuid: json['uuid'] as String?,
      name: json['name'] as String?,
      classification: json['classification'] as String?,
      spawnNavPoints: json['spawn_nav_points'] as bool?,
      validQuantumTravelDestination:
          json['valid_quantum_travel_destination'] as bool?,
    );

Map<String, dynamic> _$GameStarmapLocationTypeToJson(
        GameStarmapLocationType instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'classification': instance.classification,
      'spawn_nav_points': instance.spawnNavPoints,
      'valid_quantum_travel_destination':
          instance.validQuantumTravelDestination,
    };

GameStarmapLocationJurisdiction _$GameStarmapLocationJurisdictionFromJson(
        Map<String, dynamic> json) =>
    GameStarmapLocationJurisdiction(
      uuid: json['uuid'] as String?,
      name: json['name'] as String?,
      baseFine: (json['base_fine'] as num?)?.toInt(),
      maxStolenGoodsPossessionScu:
          (json['max_stolen_goods_possession_scu'] as num?)?.toInt(),
      isPrison: json['is_prison'] as bool?,
    );

Map<String, dynamic> _$GameStarmapLocationJurisdictionToJson(
        GameStarmapLocationJurisdiction instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'base_fine': instance.baseFine,
      'max_stolen_goods_possession_scu': instance.maxStolenGoodsPossessionScu,
      'is_prison': instance.isPrison,
    };

GameStarmapLocationAffiliation _$GameStarmapLocationAffiliationFromJson(
        Map<String, dynamic> json) =>
    GameStarmapLocationAffiliation(
      uuid: json['uuid'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$GameStarmapLocationAffiliationToJson(
        GameStarmapLocationAffiliation instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
    };

GameStarmapLocationAmenity _$GameStarmapLocationAmenityFromJson(
        Map<String, dynamic> json) =>
    GameStarmapLocationAmenity(
      uuid: json['uuid'] as String?,
      name: json['name'] as String?,
      displayName: json['display_name'] as String?,
    );

Map<String, dynamic> _$GameStarmapLocationAmenityToJson(
        GameStarmapLocationAmenity instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'display_name': instance.displayName,
    };

GameStarmapLocationTag _$GameStarmapLocationTagFromJson(
        Map<String, dynamic> json) =>
    GameStarmapLocationTag(
      uuid: json['uuid'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$GameStarmapLocationTagToJson(
        GameStarmapLocationTag instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
    };

GameStarmapLocationRadarContactType
    _$GameStarmapLocationRadarContactTypeFromJson(Map<String, dynamic> json) =>
        GameStarmapLocationRadarContactType(
          uuid: json['uuid'] as String?,
          name: json['name'] as String?,
          displayName: json['display_name'] as String?,
          tagUuid: json['tag_uuid'] as String?,
          tagName: json['tag_name'] as String?,
          isObjectOfInterest: json['is_object_of_interest'] as bool?,
        );

Map<String, dynamic> _$GameStarmapLocationRadarContactTypeToJson(
        GameStarmapLocationRadarContactType instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'display_name': instance.displayName,
      'tag_uuid': instance.tagUuid,
      'tag_name': instance.tagName,
      'is_object_of_interest': instance.isObjectOfInterest,
    };

GameStarmapLocationQuantumTravel _$GameStarmapLocationQuantumTravelFromJson(
        Map<String, dynamic> json) =>
    GameStarmapLocationQuantumTravel(
      obstructionRadius: (json['obstruction_radius'] as num?)?.toDouble(),
      obstructionRadiusFormatted:
          json['obstruction_radius_formatted'] as String?,
      arrivalRadius: (json['arrival_radius'] as num?)?.toDouble(),
      arrivalRadiusFormatted: json['arrival_radius_formatted'] as String?,
      arrivalPointDetectionOffset:
          (json['arrival_point_detection_offset'] as num?)?.toDouble(),
      adoptionRadius: (json['adoption_radius'] as num?)?.toDouble(),
      adoptionRadiusFormatted: json['adoption_radius_formatted'] as String?,
      subPointRadiusMultiplier:
          (json['sub_point_radius_multiplier'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$GameStarmapLocationQuantumTravelToJson(
        GameStarmapLocationQuantumTravel instance) =>
    <String, dynamic>{
      'obstruction_radius': instance.obstructionRadius,
      'obstruction_radius_formatted': instance.obstructionRadiusFormatted,
      'arrival_radius': instance.arrivalRadius,
      'arrival_radius_formatted': instance.arrivalRadiusFormatted,
      'arrival_point_detection_offset': instance.arrivalPointDetectionOffset,
      'adoption_radius': instance.adoptionRadius,
      'adoption_radius_formatted': instance.adoptionRadiusFormatted,
      'sub_point_radius_multiplier': instance.subPointRadiusMultiplier,
    };

GameStarmapLocationAsteroidRing _$GameStarmapLocationAsteroidRingFromJson(
        Map<String, dynamic> json) =>
    GameStarmapLocationAsteroidRing(
      densityScale: (json['density_scale'] as num?)?.toDouble(),
      sizeScale: (json['size_scale'] as num?)?.toDouble(),
      innerRadius: (json['inner_radius'] as num?)?.toDouble(),
      outerRadius: (json['outer_radius'] as num?)?.toDouble(),
      depth: (json['depth'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$GameStarmapLocationAsteroidRingToJson(
        GameStarmapLocationAsteroidRing instance) =>
    <String, dynamic>{
      'density_scale': instance.densityScale,
      'size_scale': instance.sizeScale,
      'inner_radius': instance.innerRadius,
      'outer_radius': instance.outerRadius,
      'depth': instance.depth,
    };

GameStarmapLocationChildSummary _$GameStarmapLocationChildSummaryFromJson(
        Map<String, dynamic> json) =>
    GameStarmapLocationChildSummary(
      uuid: json['uuid'] as String?,
      name: json['name'] as String?,
      designation: json['designation'] as String?,
      webUrl: json['web_url'] as String?,
      typeName: json['type_name'] as String?,
      typeClassification: json['type_classification'] as String?,
      respawnLocationType: json['respawn_location_type'] as String?,
      amenities: (json['amenities'] as List<dynamic>?)
              ?.map((e) => GameStarmapLocationAmenity.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          [],
      amenityLabels: (json['amenity_labels'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      hasResources: json['has_resources'] as bool?,
    );

Map<String, dynamic> _$GameStarmapLocationChildSummaryToJson(
        GameStarmapLocationChildSummary instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'designation': instance.designation,
      'web_url': instance.webUrl,
      'type_name': instance.typeName,
      'type_classification': instance.typeClassification,
      'respawn_location_type': instance.respawnLocationType,
      'amenities': instance.amenities?.map((e) => e.toJson()).toList(),
      'amenity_labels': instance.amenityLabels,
      'has_resources': instance.hasResources,
    };

StarmapLocationResource _$StarmapLocationResourceFromJson(
        Map<String, dynamic> json) =>
    StarmapLocationResource(
      name: json['name'] as String?,
      uuid: json['uuid'] as String?,
      tier: json['tier'] as String?,
      link: json['link'] as String?,
      webUrl: json['web_url'] as String?,
    );

Map<String, dynamic> _$StarmapLocationResourceToJson(
        StarmapLocationResource instance) =>
    <String, dynamic>{
      'name': instance.name,
      'uuid': instance.uuid,
      'tier': instance.tier,
      'link': instance.link,
      'web_url': instance.webUrl,
    };

StarmapLocationMiningTypeGroup _$StarmapLocationMiningTypeGroupFromJson(
        Map<String, dynamic> json) =>
    StarmapLocationMiningTypeGroup(
      groupName: json['group_name'] as String?,
      miningType: json['mining_type'] as String?,
      miningTypeSortOrder: (json['mining_type_sort_order'] as num?)?.toInt(),
      resourceKind: json['resource_kind'] as String?,
      groupProbabilityMin: (json['group_probability_min'] as num?)?.toDouble(),
      groupProbabilityMax: (json['group_probability_max'] as num?)?.toDouble(),
      groupProbabilityMinPercent:
          (json['group_probability_min_percent'] as num?)?.toDouble(),
      groupProbabilityMaxPercent:
          (json['group_probability_max_percent'] as num?)?.toDouble(),
      resources: (json['resources'] as List<dynamic>?)
              ?.map((e) =>
                  StarmapLocationResource.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$StarmapLocationMiningTypeGroupToJson(
        StarmapLocationMiningTypeGroup instance) =>
    <String, dynamic>{
      'group_name': instance.groupName,
      'mining_type': instance.miningType,
      'mining_type_sort_order': instance.miningTypeSortOrder,
      'resource_kind': instance.resourceKind,
      'group_probability_min': instance.groupProbabilityMin,
      'group_probability_max': instance.groupProbabilityMax,
      'group_probability_min_percent': instance.groupProbabilityMinPercent,
      'group_probability_max_percent': instance.groupProbabilityMaxPercent,
      'resources': instance.resources?.map((e) => e.toJson()).toList(),
    };

GameStarmapLocationMissionGroup _$GameStarmapLocationMissionGroupFromJson(
        Map<String, dynamic> json) =>
    GameStarmapLocationMissionGroup(
      purpose: json['purpose'] as String?,
      missions: (json['missions'] as List<dynamic>?)
              ?.map((e) => MissionSummary.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$GameStarmapLocationMissionGroupToJson(
        GameStarmapLocationMissionGroup instance) =>
    <String, dynamic>{
      'purpose': instance.purpose,
      'missions': instance.missions?.map((e) => e.toJson()).toList(),
    };

GameStarmapLocation _$GameStarmapLocationFromJson(Map<String, dynamic> json) =>
    GameStarmapLocation(
      uuid: json['uuid'] as String?,
      slug: json['slug'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      size: (json['size'] as num?)?.toDouble(),
      respawnLocationType: json['respawn_location_type'] as String?,
      childCount: (json['child_count'] as num?)?.toInt(),
      hasResources: json['has_resources'] as bool?,
      missionCount: (json['mission_count'] as num?)?.toInt(),
      isScannable: json['is_scannable'] as bool?,
      hideInStarmap: json['hide_in_starmap'] as bool?,
      hideInWorld: json['hide_in_world'] as bool?,
      blockTravel: json['block_travel'] as bool?,
      quantumTravel: json['quantum_travel'],
      asteroidRing: json['asteroid_ring'],
      system: json['system'] as String?,
      parent: json['parent'],
      star: json['star'],
      children: (json['children'] as List<dynamic>?)
              ?.map((e) => GameStarmapLocationChildSummary.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          [],
      type: json['type'] == null
          ? null
          : GameStarmapLocationType.fromJson(
              json['type'] as Map<String, dynamic>),
      jurisdiction: json['jurisdiction'],
      affiliation: json['affiliation'],
      amenities: (json['amenities'] as List<dynamic>?)
              ?.map((e) => GameStarmapLocationAmenity.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          [],
      tag: json['tag'],
      designation: json['designation'] as String?,
      radarContactType: json['radar_contact_type'],
      link: json['link'] as String?,
      webUrl: json['web_url'] as String?,
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      version: json['version'] as String?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => GameStarmapLocation$Images$Item.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      areaBoosts: (json['area_boosts'] as List<dynamic>?)
              ?.map((e) => AreaBoost.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      resources: (json['resources'] as List<dynamic>?)
              ?.map((e) => StarmapLocationMiningTypeGroup.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          [],
      missions: (json['missions'] as List<dynamic>?)
              ?.map((e) => GameStarmapLocationMissionGroup.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$GameStarmapLocationToJson(
        GameStarmapLocation instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'slug': instance.slug,
      'name': instance.name,
      'description': instance.description,
      'size': instance.size,
      'respawn_location_type': instance.respawnLocationType,
      'child_count': instance.childCount,
      'has_resources': instance.hasResources,
      'mission_count': instance.missionCount,
      'is_scannable': instance.isScannable,
      'hide_in_starmap': instance.hideInStarmap,
      'hide_in_world': instance.hideInWorld,
      'block_travel': instance.blockTravel,
      'quantum_travel': instance.quantumTravel,
      'asteroid_ring': instance.asteroidRing,
      'system': instance.system,
      'parent': instance.parent,
      'star': instance.star,
      'children': instance.children?.map((e) => e.toJson()).toList(),
      'type': instance.type?.toJson(),
      'jurisdiction': instance.jurisdiction,
      'affiliation': instance.affiliation,
      'amenities': instance.amenities?.map((e) => e.toJson()).toList(),
      'tag': instance.tag,
      'designation': instance.designation,
      'radar_contact_type': instance.radarContactType,
      'link': instance.link,
      'web_url': instance.webUrl,
      'updated_at': instance.updatedAt?.toIso8601String(),
      'version': instance.version,
      'images': instance.images?.map((e) => e.toJson()).toList(),
      'area_boosts': instance.areaBoosts?.map((e) => e.toJson()).toList(),
      'resources': instance.resources?.map((e) => e.toJson()).toList(),
      'missions': instance.missions?.map((e) => e.toJson()).toList(),
    };

UexPrice _$UexPriceFromJson(Map<String, dynamic> json) => UexPrice(
      priceBuy: (json['price_buy'] as num?)?.toDouble(),
      priceSell: (json['price_sell'] as num?)?.toDouble(),
      priceRent: (json['price_rent'] as num?)?.toDouble(),
      terminalId: (json['terminal_id'] as num?)?.toInt(),
      terminalCode: json['terminal_code'] as String?,
      terminalName: json['terminal_name'] as String?,
      starmapLocation: json['starmap_location'],
      dateUpdated: json['date_updated'] as String?,
      gameVersion: json['game_version'] as String?,
      uexLink: json['uex_link'] as String?,
    );

Map<String, dynamic> _$UexPriceToJson(UexPrice instance) => <String, dynamic>{
      'price_buy': instance.priceBuy,
      'price_sell': instance.priceSell,
      'price_rent': instance.priceRent,
      'terminal_id': instance.terminalId,
      'terminal_code': instance.terminalCode,
      'terminal_name': instance.terminalName,
      'starmap_location': instance.starmapLocation,
      'date_updated': instance.dateUpdated,
      'game_version': instance.gameVersion,
      'uex_link': instance.uexLink,
    };

GameVehicleHardpointItem _$GameVehicleHardpointItemFromJson(
        Map<String, dynamic> json) =>
    GameVehicleHardpointItem(
      uuid: json['uuid'] as String?,
      name: json['name'] as String?,
      className: json['class_name'] as String?,
      link: json['link'] as String?,
      size: (json['size'] as num?)?.toInt(),
      mass: (json['mass'] as num?)?.toDouble(),
      grade: json['grade'] as String?,
      $class: json['class'] as String?,
      manufacturer: json['manufacturer'] == null
          ? null
          : ManufacturerLink.fromJson(
              json['manufacturer'] as Map<String, dynamic>),
      type: json['type'] as String?,
      typeLabel: json['type_label'] as String?,
      subType: json['sub_type'] as String?,
      subTypeLabel: json['sub_type_label'] as String?,
      inventory: json['inventory'],
      ports: (json['ports'] as List<dynamic>?)
              ?.map((e) => ItemPort.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      version: json['version'] as String?,
    );

Map<String, dynamic> _$GameVehicleHardpointItemToJson(
        GameVehicleHardpointItem instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'class_name': instance.className,
      'link': instance.link,
      'size': instance.size,
      'mass': instance.mass,
      'grade': instance.grade,
      'class': instance.$class,
      'manufacturer': instance.manufacturer?.toJson(),
      'type': instance.type,
      'type_label': instance.typeLabel,
      'sub_type': instance.subType,
      'sub_type_label': instance.subTypeLabel,
      'inventory': instance.inventory,
      'ports': instance.ports?.map((e) => e.toJson()).toList(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'version': instance.version,
    };

GameVehicleHardpoint _$GameVehicleHardpointFromJson(
        Map<String, dynamic> json) =>
    GameVehicleHardpoint(
      name: json['name'] as String?,
      position: json['position'] as String?,
      minSize: (json['min_size'] as num?)?.toInt(),
      maxSize: (json['max_size'] as num?)?.toInt(),
      className: json['class_name'] as String?,
      health: (json['health'] as num?)?.toDouble(),
      type: json['type'] as String?,
      subType: json['sub_type'] as String?,
      pilotSlaveable: json['pilot_slaveable'] as bool?,
      item: json['item'],
      children: (json['children'] as List<dynamic>?)
              ?.map((e) =>
                  GameVehicleHardpoint.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      version: json['version'] as String?,
    );

Map<String, dynamic> _$GameVehicleHardpointToJson(
        GameVehicleHardpoint instance) =>
    <String, dynamic>{
      'name': instance.name,
      'position': instance.position,
      'min_size': instance.minSize,
      'max_size': instance.maxSize,
      'class_name': instance.className,
      'health': instance.health,
      'type': instance.type,
      'sub_type': instance.subType,
      'pilot_slaveable': instance.pilotSlaveable,
      'item': instance.item,
      'children': instance.children?.map((e) => e.toJson()).toList(),
      'version': instance.version,
    };

GameVehiclePart _$GameVehiclePartFromJson(Map<String, dynamic> json) =>
    GameVehiclePart(
      name: json['name'] as String?,
      displayName: json['display_name'] as String?,
      damageMax: (json['damage_max'] as num?)?.toDouble(),
      destructionDamage: (json['destruction_damage'] as num?)?.toDouble(),
      detachDamage: (json['detach_damage'] as num?)?.toDouble(),
      children: (json['children'] as List<dynamic>?)
              ?.map((e) => GameVehiclePart.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      version: json['version'] as String?,
    );

Map<String, dynamic> _$GameVehiclePartToJson(GameVehiclePart instance) =>
    <String, dynamic>{
      'name': instance.name,
      'display_name': instance.displayName,
      'damage_max': instance.damageMax,
      'destruction_damage': instance.destructionDamage,
      'detach_damage': instance.detachDamage,
      'children': instance.children?.map((e) => e.toJson()).toList(),
      'version': instance.version,
    };

GameVehiclePort _$GameVehiclePortFromJson(Map<String, dynamic> json) =>
    GameVehiclePort(
      name: json['name'] as String?,
      position: json['position'] as String?,
      sizes: json['sizes'] == null
          ? null
          : GameVehiclePort$Sizes.fromJson(
              json['sizes'] as Map<String, dynamic>),
      className: json['class_name'] as String?,
      health: (json['health'] as num?)?.toDouble(),
      editable: json['editable'] as bool?,
      editableChildren: json['editable_children'] as bool?,
      equippedItemUuid: json['equipped_item_uuid'] as String?,
      type: json['type'] as String?,
      subType: json['sub_type'] as String?,
      subtype: json['subtype'] as String?,
      categoryLabel: json['category_label'] as String?,
      compatibleTypes: (json['compatible_types'] as List<dynamic>?)
          ?.map((e) => GameVehiclePort$CompatibleTypes$Item.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      equippedItem: json['equipped_item'],
      ports: (json['ports'] as List<dynamic>?)
              ?.map((e) => GameVehiclePort.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      requiredTags: (json['required_tags'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      portTags: (json['port_tags'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      version: json['version'] as String?,
      attachedVehicle: json['attached_vehicle'] == null
          ? null
          : GameVehiclePort$AttachedVehicle.fromJson(
              json['attached_vehicle'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GameVehiclePortToJson(GameVehiclePort instance) =>
    <String, dynamic>{
      'name': instance.name,
      'position': instance.position,
      'sizes': instance.sizes?.toJson(),
      'class_name': instance.className,
      'health': instance.health,
      'editable': instance.editable,
      'editable_children': instance.editableChildren,
      'equipped_item_uuid': instance.equippedItemUuid,
      'type': instance.type,
      'sub_type': instance.subType,
      'subtype': instance.subtype,
      'category_label': instance.categoryLabel,
      'compatible_types':
          instance.compatibleTypes?.map((e) => e.toJson()).toList(),
      'equipped_item': instance.equippedItem,
      'ports': instance.ports?.map((e) => e.toJson()).toList(),
      'required_tags': instance.requiredTags,
      'port_tags': instance.portTags,
      'version': instance.version,
      'attached_vehicle': instance.attachedVehicle?.toJson(),
    };

VehicleRelayEntry _$VehicleRelayEntryFromJson(Map<String, dynamic> json) =>
    VehicleRelayEntry(
      hardpoint: json['hardpoint'] as String?,
      className: json['class_name'] as String?,
      fuseSlots: (json['fuse_slots'] as num?)?.toInt(),
      room: json['room'] as String?,
      connectionCount: (json['connection_count'] as num?)?.toInt(),
      connectedHardpoints: (json['connected_hardpoints'] as List<dynamic>?)
          ?.map((e) => VehicleRelayEntry$ConnectedHardpoints$Item.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VehicleRelayEntryToJson(VehicleRelayEntry instance) =>
    <String, dynamic>{
      'hardpoint': instance.hardpoint,
      'class_name': instance.className,
      'fuse_slots': instance.fuseSlots,
      'room': instance.room,
      'connection_count': instance.connectionCount,
      'connected_hardpoints':
          instance.connectedHardpoints?.map((e) => e.toJson()).toList(),
    };

VehicleRelayNetwork _$VehicleRelayNetworkFromJson(Map<String, dynamic> json) =>
    VehicleRelayNetwork(
      totalFuses: (json['total_fuses'] as num?)?.toInt(),
      relays: (json['relays'] as List<dynamic>?)
              ?.map(
                  (e) => VehicleRelayEntry.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      links: (json['links'] as List<dynamic>?)
          ?.map((e) => VehicleRelayNetwork$Links$Item.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VehicleRelayNetworkToJson(
        VehicleRelayNetwork instance) =>
    <String, dynamic>{
      'total_fuses': instance.totalFuses,
      'relays': instance.relays?.map((e) => e.toJson()).toList(),
      'links': instance.links?.map((e) => e.toJson()).toList(),
    };

VehicleSuitStorage _$VehicleSuitStorageFromJson(Map<String, dynamic> json) =>
    VehicleSuitStorage(
      lockers: (json['lockers'] as num?)?.toInt(),
      slotsTotal: (json['slots_total'] as num?)?.toInt(),
      byLocker: (json['by_locker'] as List<dynamic>?)
          ?.map((e) => VehicleSuitStorage$ByLocker$Item.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VehicleSuitStorageToJson(VehicleSuitStorage instance) =>
    <String, dynamic>{
      'lockers': instance.lockers,
      'slots_total': instance.slotsTotal,
      'by_locker': instance.byLocker?.map((e) => e.toJson()).toList(),
    };

GameVehicleTurret _$GameVehicleTurretFromJson(Map<String, dynamic> json) =>
    GameVehicleTurret(
      category: json['category'] as String?,
      displayName: json['display_name'] as String?,
      hardpointName: json['hardpoint_name'] as String?,
      partName: json['part_name'] as String?,
      turretType: json['turret_type'] as String?,
      className: json['class_name'] as String?,
      size: (json['size'] as num?)?.toInt(),
      turret: json['turret'] as bool?,
      gimballed: json['gimballed'] as bool?,
      fixed: json['fixed'] as bool?,
      mountCount: (json['mount_count'] as num?)?.toInt(),
      weaponSizes: (json['weapon_sizes'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          [],
      payloadSizes: (json['payload_sizes'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          [],
      payloadTypes: (json['payload_types'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      payloadClassNames: (json['payload_class_names'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      mounts: (json['mounts'] as List<dynamic>?)
          ?.map((e) =>
              GameVehicleTurret$Mounts$Item.fromJson(e as Map<String, dynamic>))
          .toList(),
      dpsTotal: (json['dps_total'] as num?)?.toDouble(),
      sustainedDpsTotal: (json['sustained_dps_total'] as num?)?.toDouble(),
      alphaTotal: (json['alpha_total'] as num?)?.toDouble(),
      isPilotSlaveable: json['is_pilot_slaveable'] as bool?,
      weapons: (json['weapons'] as List<dynamic>?)
          ?.map((e) => GameVehicleTurret$Weapons$Item.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      version: json['version'] as String?,
    );

Map<String, dynamic> _$GameVehicleTurretToJson(GameVehicleTurret instance) =>
    <String, dynamic>{
      'category': instance.category,
      'display_name': instance.displayName,
      'hardpoint_name': instance.hardpointName,
      'part_name': instance.partName,
      'turret_type': instance.turretType,
      'class_name': instance.className,
      'size': instance.size,
      'turret': instance.turret,
      'gimballed': instance.gimballed,
      'fixed': instance.fixed,
      'mount_count': instance.mountCount,
      'weapon_sizes': instance.weaponSizes,
      'payload_sizes': instance.payloadSizes,
      'payload_types': instance.payloadTypes,
      'payload_class_names': instance.payloadClassNames,
      'mounts': instance.mounts?.map((e) => e.toJson()).toList(),
      'dps_total': instance.dpsTotal,
      'sustained_dps_total': instance.sustainedDpsTotal,
      'alpha_total': instance.alphaTotal,
      'is_pilot_slaveable': instance.isPilotSlaveable,
      'weapons': instance.weapons?.map((e) => e.toJson()).toList(),
      'version': instance.version,
    };

VehicleLink _$VehicleLinkFromJson(Map<String, dynamic> json) => VehicleLink(
      uuid: json['uuid'] as String?,
      name: json['name'] as String?,
      className: json['class_name'] as String?,
      career: json['career'] as String?,
      role: json['role'] as String?,
      sizeClass: (json['size_class'] as num?)?.toInt(),
      size: (json['size'] as num?)?.toInt(),
      isVehicle: json['is_vehicle'] as bool?,
      isGravlev: json['is_gravlev'] as bool?,
      isSpaceship: json['is_spaceship'] as bool?,
      manufacturer: json['manufacturer'] == null
          ? null
          : ManufacturerLink.fromJson(
              json['manufacturer'] as Map<String, dynamic>),
      link: json['link'] as String?,
      webUrl: json['web_url'] as String?,
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      version: json['version'] as String?,
    );

Map<String, dynamic> _$VehicleLinkToJson(VehicleLink instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'class_name': instance.className,
      'career': instance.career,
      'role': instance.role,
      'size_class': instance.sizeClass,
      'size': instance.size,
      'is_vehicle': instance.isVehicle,
      'is_gravlev': instance.isGravlev,
      'is_spaceship': instance.isSpaceship,
      'manufacturer': instance.manufacturer?.toJson(),
      'link': instance.link,
      'web_url': instance.webUrl,
      'updated_at': instance.updatedAt?.toIso8601String(),
      'version': instance.version,
    };

GameVehicle _$GameVehicleFromJson(Map<String, dynamic> json) => GameVehicle(
      uuid: json['uuid'] as String?,
      name: json['name'] as String?,
      gameName: json['game_name'] as String?,
      slug: json['slug'] as String?,
      className: json['class_name'] as String?,
      portTags: (json['port_tags'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      manufacturer: json['manufacturer'] == null
          ? null
          : ManufacturerLink.fromJson(
              json['manufacturer'] as Map<String, dynamic>),
      sizeClass: (json['size_class'] as num?)?.toInt(),
      dimension: json['dimension'] == null
          ? null
          : GameVehicle$Dimension.fromJson(
              json['dimension'] as Map<String, dynamic>),
      sizes: json['sizes'] == null
          ? null
          : GameVehicle$Sizes.fromJson(json['sizes'] as Map<String, dynamic>),
      emission: json['emission'] == null
          ? null
          : GameVehicle$Emission.fromJson(
              json['emission'] as Map<String, dynamic>),
      mass: (json['mass'] as num?)?.toDouble(),
      massHull: (json['mass_hull'] as num?)?.toDouble(),
      massLoadout: (json['mass_loadout'] as num?)?.toDouble(),
      massTotal: (json['mass_total'] as num?)?.toDouble(),
      cargoCapacity: (json['cargo_capacity'] as num?)?.toDouble(),
      oreCapacity: (json['ore_capacity'] as num?)?.toDouble(),
      cargoGrids: (json['cargo_grids'] as List<dynamic>?)
              ?.map((e) => ItemInventory.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      cargoLimits: json['cargo_limits'] == null
          ? null
          : GameVehicle$CargoLimits.fromJson(
              json['cargo_limits'] as Map<String, dynamic>),
      maxScuBox: (json['max_scu_box'] as num?)?.toInt(),
      vehicleInventory: (json['vehicle_inventory'] as num?)?.toDouble(),
      inventoryContainers: (json['inventory_containers'] as List<dynamic>?)
              ?.map((e) => ItemInventory.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      weaponStorage: json['weapon_storage'],
      suitStorage: json['suit_storage'],
      crew: json['crew'] == null
          ? null
          : GameVehicle$Crew.fromJson(json['crew'] as Map<String, dynamic>),
      maxMedicalTier: json['max_medical_tier'] as String?,
      seating: json['seating'] == null
          ? null
          : GameVehicle$Seating.fromJson(
              json['seating'] as Map<String, dynamic>),
      isVehicle: json['is_vehicle'] as bool?,
      isGravlev: json['is_gravlev'] as bool?,
      isSpaceship: json['is_spaceship'] as bool?,
      health: (json['health'] as num?)?.toDouble(),
      shieldHp: (json['shield_hp'] as num?)?.toDouble(),
      shieldFaceType: json['shield_face_type'] as String?,
      shield: json['shield'] == null
          ? null
          : GameVehicle$Shield.fromJson(json['shield'] as Map<String, dynamic>),
      weaponSnapshot: json['weapon_snapshot'] == null
          ? null
          : GameVehicle$WeaponSnapshot.fromJson(
              json['weapon_snapshot'] as Map<String, dynamic>),
      speed: json['speed'] == null
          ? null
          : GameVehicle$Speed.fromJson(json['speed'] as Map<String, dynamic>),
      agility: json['agility'] == null
          ? null
          : GameVehicle$Agility.fromJson(
              json['agility'] as Map<String, dynamic>),
      noFuelParams: json['no_fuel_params'],
      afterburner: json['afterburner'] == null
          ? null
          : GameVehicle$Afterburner.fromJson(
              json['afterburner'] as Map<String, dynamic>),
      fuel: json['fuel'] == null
          ? null
          : GameVehicle$Fuel.fromJson(json['fuel'] as Map<String, dynamic>),
      quantum: json['quantum'] == null
          ? null
          : GameVehicle$Quantum.fromJson(
              json['quantum'] as Map<String, dynamic>),
      drive: json['drive'] == null
          ? null
          : GameVehicle$Drive.fromJson(json['drive'] as Map<String, dynamic>),
      armor: json['armor'],
      propulsion: json['propulsion'] == null
          ? null
          : GameVehicle$Propulsion.fromJson(
              json['propulsion'] as Map<String, dynamic>),
      weaponry: json['weaponry'] == null
          ? null
          : GameVehicle$Weaponry.fromJson(
              json['weaponry'] as Map<String, dynamic>),
      insurance: json['insurance'] == null
          ? null
          : GameVehicle$Insurance.fromJson(
              json['insurance'] as Map<String, dynamic>),
      damageLimits: json['damage_limits'] == null
          ? null
          : GameVehicle$DamageLimits.fromJson(
              json['damage_limits'] as Map<String, dynamic>),
      ports: (json['ports'] as List<dynamic>?)
              ?.map((e) => GameVehiclePort.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      hardpoints: (json['hardpoints'] as List<dynamic>?)
              ?.map((e) =>
                  GameVehicleHardpoint.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      parts: (json['parts'] as List<dynamic>?)
              ?.map((e) => GameVehiclePart.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      turrets: json['turrets'] == null
          ? null
          : GameVehicle$Turrets.fromJson(
              json['turrets'] as Map<String, dynamic>),
      crossSection: json['cross_section'] == null
          ? null
          : GameVehicle$CrossSection.fromJson(
              json['cross_section'] as Map<String, dynamic>),
      crossSectionMax: (json['cross_section_max'] as num?)?.toDouble(),
      signature: json['signature'] == null
          ? null
          : GameVehicle$Signature.fromJson(
              json['signature'] as Map<String, dynamic>),
      cooling: json['cooling'] == null
          ? null
          : GameVehicle$Cooling.fromJson(
              json['cooling'] as Map<String, dynamic>),
      power: json['power'] == null
          ? null
          : GameVehicle$Power.fromJson(json['power'] as Map<String, dynamic>),
      powerPools: json['power_pools'] as Map<String, dynamic>?,
      penetrationMultiplier: json['penetration_multiplier'] == null
          ? null
          : GameVehicle$PenetrationMultiplier.fromJson(
              json['penetration_multiplier'] as Map<String, dynamic>),
      relayNetwork: json['relay_network'],
      career: json['career'] as String?,
      role: json['role'] as String?,
      gameDescription: json['game_description'],
      webUrl: json['web_url'] as String?,
      link: json['link'] as String?,
      description: json['description'],
      id: (json['id'] as num?)?.toInt(),
      chassisId: (json['chassis_id'] as num?)?.toInt(),
      shipmatrixName: json['shipmatrix_name'] as String?,
      foci: (json['foci'] as List<dynamic>?)
              ?.map((e) => Translation.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      productionStatus: json['production_status'],
      productionNote: json['production_note'],
      type: json['type'],
      msrp: (json['msrp'] as num?)?.toDouble(),
      pledgeUrl: json['pledge_url'] as String?,
      loaner: (json['loaner'] as List<dynamic>?)
              ?.map((e) => VehicleLoaner.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      skus: (json['skus'] as List<dynamic>?)
              ?.map((e) => VehicleSku.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      components: (json['components'] as List<dynamic>?)
              ?.map((e) => VehicleComponent.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      uexPrices: json['uex_prices'] == null
          ? null
          : GameVehicle$UexPrices.fromJson(
              json['uex_prices'] as Map<String, dynamic>),
      images: (json['images'] as List<dynamic>?)
          ?.map((e) =>
              GameVehicle$Images$Item.fromJson(e as Map<String, dynamic>))
          .toList(),
      updatedAt: json['updated_at'] as String?,
      version: json['version'] as String?,
    );

Map<String, dynamic> _$GameVehicleToJson(GameVehicle instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'game_name': instance.gameName,
      'slug': instance.slug,
      'class_name': instance.className,
      'port_tags': instance.portTags,
      'manufacturer': instance.manufacturer?.toJson(),
      'size_class': instance.sizeClass,
      'dimension': instance.dimension?.toJson(),
      'sizes': instance.sizes?.toJson(),
      'emission': instance.emission?.toJson(),
      'mass': instance.mass,
      'mass_hull': instance.massHull,
      'mass_loadout': instance.massLoadout,
      'mass_total': instance.massTotal,
      'cargo_capacity': instance.cargoCapacity,
      'ore_capacity': instance.oreCapacity,
      'cargo_grids': instance.cargoGrids?.map((e) => e.toJson()).toList(),
      'cargo_limits': instance.cargoLimits?.toJson(),
      'max_scu_box': instance.maxScuBox,
      'vehicle_inventory': instance.vehicleInventory,
      'inventory_containers':
          instance.inventoryContainers?.map((e) => e.toJson()).toList(),
      'weapon_storage': instance.weaponStorage,
      'suit_storage': instance.suitStorage,
      'crew': instance.crew?.toJson(),
      'max_medical_tier': instance.maxMedicalTier,
      'seating': instance.seating?.toJson(),
      'is_vehicle': instance.isVehicle,
      'is_gravlev': instance.isGravlev,
      'is_spaceship': instance.isSpaceship,
      'health': instance.health,
      'shield_hp': instance.shieldHp,
      'shield_face_type': instance.shieldFaceType,
      'shield': instance.shield?.toJson(),
      'weapon_snapshot': instance.weaponSnapshot?.toJson(),
      'speed': instance.speed?.toJson(),
      'agility': instance.agility?.toJson(),
      'no_fuel_params': instance.noFuelParams,
      'afterburner': instance.afterburner?.toJson(),
      'fuel': instance.fuel?.toJson(),
      'quantum': instance.quantum?.toJson(),
      'drive': instance.drive?.toJson(),
      'armor': instance.armor,
      'propulsion': instance.propulsion?.toJson(),
      'weaponry': instance.weaponry?.toJson(),
      'insurance': instance.insurance?.toJson(),
      'damage_limits': instance.damageLimits?.toJson(),
      'ports': instance.ports?.map((e) => e.toJson()).toList(),
      'hardpoints': instance.hardpoints?.map((e) => e.toJson()).toList(),
      'parts': instance.parts?.map((e) => e.toJson()).toList(),
      'turrets': instance.turrets?.toJson(),
      'cross_section': instance.crossSection?.toJson(),
      'cross_section_max': instance.crossSectionMax,
      'signature': instance.signature?.toJson(),
      'cooling': instance.cooling?.toJson(),
      'power': instance.power?.toJson(),
      'power_pools': instance.powerPools,
      'penetration_multiplier': instance.penetrationMultiplier?.toJson(),
      'relay_network': instance.relayNetwork,
      'career': instance.career,
      'role': instance.role,
      'game_description': instance.gameDescription,
      'web_url': instance.webUrl,
      'link': instance.link,
      'description': instance.description,
      'id': instance.id,
      'chassis_id': instance.chassisId,
      'shipmatrix_name': instance.shipmatrixName,
      'foci': instance.foci?.map((e) => e.toJson()).toList(),
      'production_status': instance.productionStatus,
      'production_note': instance.productionNote,
      'type': instance.type,
      'msrp': instance.msrp,
      'pledge_url': instance.pledgeUrl,
      'loaner': instance.loaner?.map((e) => e.toJson()).toList(),
      'skus': instance.skus?.map((e) => e.toJson()).toList(),
      'components': instance.components?.map((e) => e.toJson()).toList(),
      'uex_prices': instance.uexPrices?.toJson(),
      'images': instance.images?.map((e) => e.toJson()).toList(),
      'updated_at': instance.updatedAt,
      'version': instance.version,
    };

VehicleWeaponStorage _$VehicleWeaponStorageFromJson(
        Map<String, dynamic> json) =>
    VehicleWeaponStorage(
      lockers: (json['lockers'] as num?)?.toInt(),
      slotsTotal: (json['slots_total'] as num?)?.toInt(),
      slotsRifle: (json['slots_rifle'] as num?)?.toInt(),
      slotsPistol: (json['slots_pistol'] as num?)?.toInt(),
      byLocker: (json['by_locker'] as List<dynamic>?)
          ?.map((e) => VehicleWeaponStorage$ByLocker$Item.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VehicleWeaponStorageToJson(
        VehicleWeaponStorage instance) =>
    <String, dynamic>{
      'lockers': instance.lockers,
      'slots_total': instance.slotsTotal,
      'slots_rifle': instance.slotsRifle,
      'slots_pistol': instance.slotsPistol,
      'by_locker': instance.byLocker?.map((e) => e.toJson()).toList(),
    };

VersionChangelog _$VersionChangelogFromJson(Map<String, dynamic> json) =>
    VersionChangelog(
      fromVersion: json['from_version'] == null
          ? null
          : GameVersion.fromJson(json['from_version'] as Map<String, dynamic>),
      toVersion: json['to_version'] == null
          ? null
          : GameVersion.fromJson(json['to_version'] as Map<String, dynamic>),
      summary: json['summary'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$VersionChangelogToJson(VersionChangelog instance) =>
    <String, dynamic>{
      'from_version': instance.fromVersion?.toJson(),
      'to_version': instance.toVersion?.toJson(),
      'summary': instance.summary,
    };

VersionDiffEntry _$VersionDiffEntryFromJson(Map<String, dynamic> json) =>
    VersionDiffEntry(
      entityType: json['entity_type'] as String?,
      entityId: (json['entity_id'] as num?)?.toInt(),
      changeType: json['change_type'] as String?,
      columnChanges: json['column_changes'],
      dataChanges: json['data_changes'],
    );

Map<String, dynamic> _$VersionDiffEntryToJson(VersionDiffEntry instance) =>
    <String, dynamic>{
      'entity_type': instance.entityType,
      'entity_id': instance.entityId,
      'change_type': instance.changeType,
      'column_changes': instance.columnChanges,
      'data_changes': instance.dataChanges,
    };

WeaponDamage _$WeaponDamageFromJson(Map<String, dynamic> json) => WeaponDamage(
      type: json['type'] as String?,
      name: json['name'] as String?,
      damage: (json['damage'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$WeaponDamageToJson(WeaponDamage instance) =>
    <String, dynamic>{
      'type': instance.type,
      'name': instance.name,
      'damage': instance.damage,
    };

Metadata _$MetadataFromJson(Map<String, dynamic> json) => Metadata(
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      version: json['version'] as String?,
      deprecatedFields: json['deprecated_fields'] as String?,
      resource: json['resource'] == null
          ? null
          : CanonicalResourceMeta.fromJson(
              json['resource'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MetadataToJson(Metadata instance) => <String, dynamic>{
      'updated_at': instance.updatedAt?.toIso8601String(),
      'version': instance.version,
      'deprecated_fields': instance.deprecatedFields,
      'resource': instance.resource?.toJson(),
    };

CanonicalResourceMeta _$CanonicalResourceMetaFromJson(
        Map<String, dynamic> json) =>
    CanonicalResourceMeta(
      type: canonicalResourceMetaTypeNullableFromJson(json['type']),
      uuid: json['uuid'] as String?,
      slug: json['slug'] as String?,
      apiUrl: json['api_url'] as String?,
      webUrl: json['web_url'] as String?,
      version: json['version'] as String?,
    );

Map<String, dynamic> _$CanonicalResourceMetaToJson(
        CanonicalResourceMeta instance) =>
    <String, dynamic>{
      'type': canonicalResourceMetaTypeNullableToJson(instance.type),
      'uuid': instance.uuid,
      'slug': instance.slug,
      'api_url': instance.apiUrl,
      'web_url': instance.webUrl,
      'version': instance.version,
    };

PaginationLinks _$PaginationLinksFromJson(Map<String, dynamic> json) =>
    PaginationLinks(
      first: json['first'] as String?,
      last: json['last'] as String?,
      prev: json['prev'] as String?,
      next: json['next'] as String?,
    );

Map<String, dynamic> _$PaginationLinksToJson(PaginationLinks instance) =>
    <String, dynamic>{
      'first': instance.first,
      'last': instance.last,
      'prev': instance.prev,
      'next': instance.next,
    };

PaginationMeta _$PaginationMetaFromJson(Map<String, dynamic> json) =>
    PaginationMeta(
      currentPage: (json['current_page'] as num?)?.toInt(),
      from: (json['from'] as num?)?.toInt(),
      lastPage: (json['last_page'] as num?)?.toInt(),
      perPage: (json['per_page'] as num?)?.toInt(),
      to: (json['to'] as num?)?.toInt(),
      total: (json['total'] as num?)?.toInt(),
      links: (json['links'] as List<dynamic>?)
          ?.map((e) =>
              PaginationMeta$Links$Item.fromJson(e as Map<String, dynamic>))
          .toList(),
      path: json['path'] as String?,
    );

Map<String, dynamic> _$PaginationMetaToJson(PaginationMeta instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'from': instance.from,
      'last_page': instance.lastPage,
      'per_page': instance.perPage,
      'to': instance.to,
      'total': instance.total,
      'links': instance.links?.map((e) => e.toJson()).toList(),
      'path': instance.path,
    };

ErrorResponse _$ErrorResponseFromJson(Map<String, dynamic> json) =>
    ErrorResponse(
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ErrorResponseToJson(ErrorResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
    };

ValidationErrorResponse _$ValidationErrorResponseFromJson(
        Map<String, dynamic> json) =>
    ValidationErrorResponse(
      message: json['message'] as String?,
      errors: json['errors'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$ValidationErrorResponseToJson(
        ValidationErrorResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'errors': instance.errors,
    };

UnauthenticatedErrorResponse _$UnauthenticatedErrorResponseFromJson(
        Map<String, dynamic> json) =>
    UnauthenticatedErrorResponse(
      message: json['message'] as String?,
    );

Map<String, dynamic> _$UnauthenticatedErrorResponseToJson(
        UnauthenticatedErrorResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
    };

RateLimitErrorResponse _$RateLimitErrorResponseFromJson(
        Map<String, dynamic> json) =>
    RateLimitErrorResponse(
      message: json['message'] as String?,
    );

Map<String, dynamic> _$RateLimitErrorResponseToJson(
        RateLimitErrorResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
    };

NotFoundErrorResponse _$NotFoundErrorResponseFromJson(
        Map<String, dynamic> json) =>
    NotFoundErrorResponse(
      message: json['message'] as String?,
    );

Map<String, dynamic> _$NotFoundErrorResponseToJson(
        NotFoundErrorResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
    };

CommLinkLink _$CommLinkLinkFromJson(Map<String, dynamic> json) => CommLinkLink(
      href: json['href'] as String?,
      text: json['text'] as String?,
    );

Map<String, dynamic> _$CommLinkLinkToJson(CommLinkLink instance) =>
    <String, dynamic>{
      'href': instance.href,
      'text': instance.text,
    };

CommLink _$CommLinkFromJson(Map<String, dynamic> json) => CommLink(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      rsiUrl: json['rsi_url'] as String?,
      apiUrl: json['api_url'] as String?,
      apiPublicUrl: json['api_public_url'] as String?,
      channel: json['channel'] as String?,
      category: json['category'] as String?,
      series: json['series'] as String?,
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => CommLinkImage.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      imagesCount: (json['images_count'] as num?)?.toInt(),
      links: (json['links'] as List<dynamic>?)
              ?.map((e) => CommLinkLink.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      linksCount: (json['links_count'] as num?)?.toInt(),
      commentCount: (json['comment_count'] as num?)?.toInt(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      translations: json['translations'] == null
          ? null
          : Translation.fromJson(json['translations'] as Map<String, dynamic>),
      createdAtHuman: json['created_at_human'] as String?,
    );

Map<String, dynamic> _$CommLinkToJson(CommLink instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'rsi_url': instance.rsiUrl,
      'api_url': instance.apiUrl,
      'api_public_url': instance.apiPublicUrl,
      'channel': instance.channel,
      'category': instance.category,
      'series': instance.series,
      'images': instance.images?.map((e) => e.toJson()).toList(),
      'images_count': instance.imagesCount,
      'links': instance.links?.map((e) => e.toJson()).toList(),
      'links_count': instance.linksCount,
      'comment_count': instance.commentCount,
      'created_at': instance.createdAt?.toIso8601String(),
      'translations': instance.translations?.toJson(),
      'created_at_human': instance.createdAtHuman,
    };

CommLinkImage _$CommLinkImageFromJson(Map<String, dynamic> json) =>
    CommLinkImage(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      rsiUrl: json['rsi_url'] as String?,
      apiUrl: json['api_url'] as String?,
      alt: json['alt'] as String?,
      size: (json['size'] as num?)?.toInt(),
      mimeType: json['mime_type'] as String?,
      lastModified: json['last_modified'] == null
          ? null
          : DateTime.parse(json['last_modified'] as String),
      tags: (json['tags'] as List<dynamic>?)
          ?.map((e) =>
              CommLinkImage$Tags$Item.fromJson(e as Map<String, dynamic>))
          .toList(),
      similarUrl: json['similar_url'] as String?,
      commLinks: (json['comm_links'] as List<dynamic>?)
          ?.map((e) =>
              CommLinkImage$CommLinks$Item.fromJson(e as Map<String, dynamic>))
          .toList(),
      duplicates: (json['duplicates'] as List<dynamic>?)
          ?.map((e) =>
              CommLinkImage$Duplicates$Item.fromJson(e as Map<String, dynamic>))
          .toList(),
      baseImage: json['base_image'] == null
          ? null
          : CommLinkImage$BaseImage.fromJson(
              json['base_image'] as Map<String, dynamic>),
      similarity: (json['similarity'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CommLinkImageToJson(CommLinkImage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'rsi_url': instance.rsiUrl,
      'api_url': instance.apiUrl,
      'alt': instance.alt,
      'size': instance.size,
      'mime_type': instance.mimeType,
      'last_modified': instance.lastModified?.toIso8601String(),
      'tags': instance.tags?.map((e) => e.toJson()).toList(),
      'similar_url': instance.similarUrl,
      'comm_links': instance.commLinks?.map((e) => e.toJson()).toList(),
      'duplicates': instance.duplicates?.map((e) => e.toJson()).toList(),
      'base_image': instance.baseImage?.toJson(),
      'similarity': instance.similarity,
    };

GalactapediaArticle _$GalactapediaArticleFromJson(Map<String, dynamic> json) =>
    GalactapediaArticle(
      id: json['id'] as String?,
      title: json['title'] as String?,
      slug: json['slug'] as String?,
      thumbnail: json['thumbnail'] as String?,
      type: json['type'] as String?,
      template: json['template'] as String?,
      category: json['category'] as String?,
      tag: json['tag'] as String?,
      rsiUrl: json['rsi_url'] as String?,
      apiUrl: json['api_url'] as String?,
      webUrl: json['web_url'] as String?,
      createdAt: json['created_at'] as String?,
      categories: (json['categories'] as List<dynamic>?)
              ?.map((e) =>
                  GalactapediaCategory.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      categoriesCount: (json['categories_count'] as num?)?.toInt(),
      tags: (json['tags'] as List<dynamic>?)
              ?.map((e) => GalactapediaTag.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      tagsCount: (json['tags_count'] as num?)?.toInt(),
      properties: (json['properties'] as List<dynamic>?)
              ?.map((e) =>
                  GalactapediaProperty.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      relatedArticles: (json['related_articles'] as List<dynamic>?)
              ?.map((e) => GalactapediaRelatedArticle.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          [],
      relatedArticlesCount: (json['related_articles_count'] as num?)?.toInt(),
      translations: json['translations'],
      createdAtHuman: json['created_at_human'] as String?,
    );

Map<String, dynamic> _$GalactapediaArticleToJson(
        GalactapediaArticle instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'slug': instance.slug,
      'thumbnail': instance.thumbnail,
      'type': instance.type,
      'template': instance.template,
      'category': instance.category,
      'tag': instance.tag,
      'rsi_url': instance.rsiUrl,
      'api_url': instance.apiUrl,
      'web_url': instance.webUrl,
      'created_at': instance.createdAt,
      'categories': instance.categories?.map((e) => e.toJson()).toList(),
      'categories_count': instance.categoriesCount,
      'tags': instance.tags?.map((e) => e.toJson()).toList(),
      'tags_count': instance.tagsCount,
      'properties': instance.properties?.map((e) => e.toJson()).toList(),
      'related_articles':
          instance.relatedArticles?.map((e) => e.toJson()).toList(),
      'related_articles_count': instance.relatedArticlesCount,
      'translations': instance.translations,
      'created_at_human': instance.createdAtHuman,
    };

GalactapediaCategory _$GalactapediaCategoryFromJson(
        Map<String, dynamic> json) =>
    GalactapediaCategory(
      id: json['id'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$GalactapediaCategoryToJson(
        GalactapediaCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

GalactapediaProperty _$GalactapediaPropertyFromJson(
        Map<String, dynamic> json) =>
    GalactapediaProperty(
      name: json['name'] as String?,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$GalactapediaPropertyToJson(
        GalactapediaProperty instance) =>
    <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
    };

GalactapediaRelatedArticle _$GalactapediaRelatedArticleFromJson(
        Map<String, dynamic> json) =>
    GalactapediaRelatedArticle(
      id: json['id'] as String?,
      title: json['title'] as String?,
      url: json['url'] as String?,
      apiUrl: json['api_url'] as String?,
    );

Map<String, dynamic> _$GalactapediaRelatedArticleToJson(
        GalactapediaRelatedArticle instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'url': instance.url,
      'api_url': instance.apiUrl,
    };

GalactapediaTag _$GalactapediaTagFromJson(Map<String, dynamic> json) =>
    GalactapediaTag(
      id: json['id'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$GalactapediaTagToJson(GalactapediaTag instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

ShipmatrixManufacturerLink _$ShipmatrixManufacturerLinkFromJson(
        Map<String, dynamic> json) =>
    ShipmatrixManufacturerLink(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      code: json['code'] as String?,
    );

Map<String, dynamic> _$ShipmatrixManufacturerLinkToJson(
        ShipmatrixManufacturerLink instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
    };

Affiliation _$AffiliationFromJson(Map<String, dynamic> json) => Affiliation(
      id: json['id'] as String?,
      name: json['name'] as String?,
      code: json['code'] as String?,
      color: json['color'] as String?,
    );

Map<String, dynamic> _$AffiliationToJson(Affiliation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'color': instance.color,
    };

CelestialObject _$CelestialObjectFromJson(Map<String, dynamic> json) =>
    CelestialObject(
      id: (json['id'] as num?)?.toInt(),
      code: json['code'] as String?,
      systemId: (json['system_id'] as num?)?.toInt(),
      celestialObjectApiUrl: json['celestial_object_api_url'] as String?,
      webUrl: json['web_url'] as String?,
      name: json['name'] as String?,
      type: json['type'] as String?,
      age: (json['age'] as num?)?.toInt(),
      habitable: json['habitable'] as bool?,
      fairchanceact: json['fairchanceact'] as bool?,
      appearance: json['appearance'] as String?,
      designation: json['designation'] as String?,
      distance: (json['distance'] as num?)?.toDouble(),
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      axialTilt: (json['axial_tilt'] as num?)?.toDouble(),
      orbitPeriod: (json['orbit_period'] as num?)?.toDouble(),
      infoUrl: json['info_url'] as String?,
      description: json['description'],
      sensor: json['sensor'] == null
          ? null
          : CelestialObject$Sensor.fromJson(
              json['sensor'] as Map<String, dynamic>),
      size: (json['size'] as num?)?.toDouble(),
      parentId: (json['parent_id'] as num?)?.toInt(),
      starsystem: json['starsystem'] == null
          ? null
          : CelestialObject$Starsystem.fromJson(
              json['starsystem'] as Map<String, dynamic>),
      timeModified: json['time_modified'] as String?,
    );

Map<String, dynamic> _$CelestialObjectToJson(CelestialObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'system_id': instance.systemId,
      'celestial_object_api_url': instance.celestialObjectApiUrl,
      'web_url': instance.webUrl,
      'name': instance.name,
      'type': instance.type,
      'age': instance.age,
      'habitable': instance.habitable,
      'fairchanceact': instance.fairchanceact,
      'appearance': instance.appearance,
      'designation': instance.designation,
      'distance': instance.distance,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'axial_tilt': instance.axialTilt,
      'orbit_period': instance.orbitPeriod,
      'info_url': instance.infoUrl,
      'description': instance.description,
      'sensor': instance.sensor?.toJson(),
      'size': instance.size,
      'parent_id': instance.parentId,
      'starsystem': instance.starsystem?.toJson(),
      'time_modified': instance.timeModified,
    };

Jumppoint _$JumppointFromJson(Map<String, dynamic> json) => Jumppoint(
      id: (json['id'] as num?)?.toInt(),
      size: json['size'] as String?,
      direction: json['direction'] as String?,
      entry: json['entry'] == null
          ? null
          : Jumppoint$Entry.fromJson(json['entry'] as Map<String, dynamic>),
      exit: json['exit'] == null
          ? null
          : Jumppoint$Exit.fromJson(json['exit'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$JumppointToJson(Jumppoint instance) => <String, dynamic>{
      'id': instance.id,
      'size': instance.size,
      'direction': instance.direction,
      'entry': instance.entry?.toJson(),
      'exit': instance.exit?.toJson(),
    };

Starsystem _$StarsystemFromJson(Map<String, dynamic> json) => Starsystem(
      id: (json['id'] as num?)?.toInt(),
      code: json['code'] as String?,
      systemApiUrl: json['system_api_url'] as String?,
      name: json['name'] as String?,
      status: json['status'] as String?,
      type: json['type'] as String?,
      webUrl: json['web_url'] as String?,
      position: json['position'] == null
          ? null
          : Starsystem$Position.fromJson(
              json['position'] as Map<String, dynamic>),
      frostLine: (json['frost_line'] as num?)?.toDouble(),
      habitableZoneInner: (json['habitable_zone_inner'] as num?)?.toDouble(),
      habitableZoneOuter: (json['habitable_zone_outer'] as num?)?.toDouble(),
      infoUrl: json['info_url'] as String?,
      description: json['description'],
      aggregated: json['aggregated'] == null
          ? null
          : Starsystem$Aggregated.fromJson(
              json['aggregated'] as Map<String, dynamic>),
      timeModified: json['time_modified'] as String?,
      celestialObject: json['celestial_object'] == null
          ? null
          : Starsystem$CelestialObject.fromJson(
              json['celestial_object'] as Map<String, dynamic>),
      jumppoints: json['jumppoints'] == null
          ? null
          : Starsystem$Jumppoints.fromJson(
              json['jumppoints'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StarsystemToJson(Starsystem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'system_api_url': instance.systemApiUrl,
      'name': instance.name,
      'status': instance.status,
      'type': instance.type,
      'web_url': instance.webUrl,
      'position': instance.position?.toJson(),
      'frost_line': instance.frostLine,
      'habitable_zone_inner': instance.habitableZoneInner,
      'habitable_zone_outer': instance.habitableZoneOuter,
      'info_url': instance.infoUrl,
      'description': instance.description,
      'aggregated': instance.aggregated?.toJson(),
      'time_modified': instance.timeModified,
      'celestial_object': instance.celestialObject?.toJson(),
      'jumppoints': instance.jumppoints?.toJson(),
    };

Stat _$StatFromJson(Map<String, dynamic> json) => Stat(
      funds: (json['funds'] as num?)?.toDouble(),
      fans: (json['fans'] as num?)?.toInt(),
      fleet: (json['fleet'] as num?)?.toInt(),
      timestamp: json['timestamp'] == null
          ? null
          : DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$StatToJson(Stat instance) => <String, dynamic>{
      'funds': instance.funds,
      'fans': instance.fans,
      'fleet': instance.fleet,
      'timestamp': instance.timestamp?.toIso8601String(),
    };

VehicleComponent _$VehicleComponentFromJson(Map<String, dynamic> json) =>
    VehicleComponent(
      type: json['type'] as String?,
      name: json['name'] as String?,
      mounts: (json['mounts'] as num?)?.toInt(),
      componentSize: (json['component_size'] as num?)?.toInt(),
      category: json['category'] as String?,
      size: (json['size'] as num?)?.toInt(),
      details: json['details'] as String?,
      quantity: (json['quantity'] as num?)?.toInt(),
      manufacturer: json['manufacturer'] as String?,
      componentClass: json['component_class'] as String?,
    );

Map<String, dynamic> _$VehicleComponentToJson(VehicleComponent instance) =>
    <String, dynamic>{
      'type': instance.type,
      'name': instance.name,
      'mounts': instance.mounts,
      'component_size': instance.componentSize,
      'category': instance.category,
      'size': instance.size,
      'details': instance.details,
      'quantity': instance.quantity,
      'manufacturer': instance.manufacturer,
      'component_class': instance.componentClass,
    };

ShipmatrixVehicleLink _$ShipmatrixVehicleLinkFromJson(
        Map<String, dynamic> json) =>
    ShipmatrixVehicleLink(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      size: json['size'] == null
          ? null
          : Translation.fromJson(json['size'] as Map<String, dynamic>),
      type: json['type'] == null
          ? null
          : Translation.fromJson(json['type'] as Map<String, dynamic>),
      manufacturer: json['manufacturer'] == null
          ? null
          : ShipmatrixManufacturerLink.fromJson(
              json['manufacturer'] as Map<String, dynamic>),
      productionStatus: json['production_status'] == null
          ? null
          : Translation.fromJson(
              json['production_status'] as Map<String, dynamic>),
      link: json['link'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$ShipmatrixVehicleLinkToJson(
        ShipmatrixVehicleLink instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'size': instance.size?.toJson(),
      'type': instance.type?.toJson(),
      'manufacturer': instance.manufacturer?.toJson(),
      'production_status': instance.productionStatus?.toJson(),
      'link': instance.link,
      'updated_at': instance.updatedAt,
    };

VehicleLoaner _$VehicleLoanerFromJson(Map<String, dynamic> json) =>
    VehicleLoaner(
      uuid: json['uuid'] as String?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      link: json['link'] as String?,
      version: json['version'] as String?,
    );

Map<String, dynamic> _$VehicleLoanerToJson(VehicleLoaner instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'slug': instance.slug,
      'link': instance.link,
      'version': instance.version,
    };

ShipMatrixVehicle _$ShipMatrixVehicleFromJson(Map<String, dynamic> json) =>
    ShipMatrixVehicle(
      id: (json['id'] as num?)?.toInt(),
      chassisId: (json['chassis_id'] as num?)?.toInt(),
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      sizes: json['sizes'] == null
          ? null
          : ShipMatrixVehicle$Sizes.fromJson(
              json['sizes'] as Map<String, dynamic>),
      dimension: json['dimension'] == null
          ? null
          : ShipMatrixVehicle$Dimension.fromJson(
              json['dimension'] as Map<String, dynamic>),
      mass: (json['mass'] as num?)?.toDouble(),
      cargoCapacity: (json['cargo_capacity'] as num?)?.toDouble(),
      crew: json['crew'] == null
          ? null
          : ShipMatrixVehicle$Crew.fromJson(
              json['crew'] as Map<String, dynamic>),
      speed: json['speed'] == null
          ? null
          : ShipMatrixVehicle$Speed.fromJson(
              json['speed'] as Map<String, dynamic>),
      agility: json['agility'] == null
          ? null
          : ShipMatrixVehicle$Agility.fromJson(
              json['agility'] as Map<String, dynamic>),
      foci: (json['foci'] as List<dynamic>?)
              ?.map((e) => Translation.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      productionStatus: json['production_status'] == null
          ? null
          : Translation.fromJson(
              json['production_status'] as Map<String, dynamic>),
      productionNote: json['production_note'] == null
          ? null
          : Translation.fromJson(
              json['production_note'] as Map<String, dynamic>),
      type: json['type'] == null
          ? null
          : Translation.fromJson(json['type'] as Map<String, dynamic>),
      description: json['description'] == null
          ? null
          : Translation.fromJson(json['description'] as Map<String, dynamic>),
      size: json['size'] == null
          ? null
          : Translation.fromJson(json['size'] as Map<String, dynamic>),
      msrp: (json['msrp'] as num?)?.toDouble(),
      pledgeUrl: json['pledge_url'] as String?,
      skus: (json['skus'] as List<dynamic>?)
              ?.map((e) => VehicleSku.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      manufacturer: json['manufacturer'] == null
          ? null
          : ShipMatrixVehicle$Manufacturer.fromJson(
              json['manufacturer'] as Map<String, dynamic>),
      updatedAt: json['updated_at'] as String?,
      components: (json['components'] as List<dynamic>?)
              ?.map((e) => VehicleComponent.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      loaner: (json['loaner'] as List<dynamic>?)
              ?.map((e) => VehicleLoaner.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      link: json['link'] as String?,
    );

Map<String, dynamic> _$ShipMatrixVehicleToJson(ShipMatrixVehicle instance) =>
    <String, dynamic>{
      'id': instance.id,
      'chassis_id': instance.chassisId,
      'name': instance.name,
      'slug': instance.slug,
      'sizes': instance.sizes?.toJson(),
      'dimension': instance.dimension?.toJson(),
      'mass': instance.mass,
      'cargo_capacity': instance.cargoCapacity,
      'crew': instance.crew?.toJson(),
      'speed': instance.speed?.toJson(),
      'agility': instance.agility?.toJson(),
      'foci': instance.foci?.map((e) => e.toJson()).toList(),
      'production_status': instance.productionStatus?.toJson(),
      'production_note': instance.productionNote?.toJson(),
      'type': instance.type?.toJson(),
      'description': instance.description?.toJson(),
      'size': instance.size?.toJson(),
      'msrp': instance.msrp,
      'pledge_url': instance.pledgeUrl,
      'skus': instance.skus?.map((e) => e.toJson()).toList(),
      'manufacturer': instance.manufacturer?.toJson(),
      'updated_at': instance.updatedAt,
      'components': instance.components?.map((e) => e.toJson()).toList(),
      'loaner': instance.loaner?.map((e) => e.toJson()).toList(),
      'link': instance.link,
    };

VehicleSku _$VehicleSkuFromJson(Map<String, dynamic> json) => VehicleSku(
      title: json['title'] as String?,
      price: (json['price'] as num?)?.toInt(),
      available: json['available'] as bool?,
      importedAt: json['imported_at'] == null
          ? null
          : DateTime.parse(json['imported_at'] as String),
    );

Map<String, dynamic> _$VehicleSkuToJson(VehicleSku instance) =>
    <String, dynamic>{
      'title': instance.title,
      'price': instance.price,
      'available': instance.available,
      'imported_at': instance.importedAt?.toIso8601String(),
    };

Translation _$TranslationFromJson(Map<String, dynamic> json) => Translation(
      en: json['en'] as String?,
      de: json['de'] as String?,
      zh: json['zh'] as String?,
      fr: json['fr'] as String?,
    );

Map<String, dynamic> _$TranslationToJson(Translation instance) =>
    <String, dynamic>{
      'en': instance.en,
      'de': instance.de,
      'zh': instance.zh,
      'fr': instance.fr,
    };

ApiCommLinksSearchPost$RequestBody _$ApiCommLinksSearchPost$RequestBodyFromJson(
        Map<String, dynamic> json) =>
    ApiCommLinksSearchPost$RequestBody(
      keyword: json['keyword'] as String?,
      query: json['query'] as String?,
    );

Map<String, dynamic> _$ApiCommLinksSearchPost$RequestBodyToJson(
        ApiCommLinksSearchPost$RequestBody instance) =>
    <String, dynamic>{
      'keyword': instance.keyword,
      'query': instance.query,
    };

ApiCommLinksReverseImageLinkSearchPost$RequestBody
    _$ApiCommLinksReverseImageLinkSearchPost$RequestBodyFromJson(
            Map<String, dynamic> json) =>
        ApiCommLinksReverseImageLinkSearchPost$RequestBody(
          url: json['url'] as String,
        );

Map<String, dynamic> _$ApiCommLinksReverseImageLinkSearchPost$RequestBodyToJson(
        ApiCommLinksReverseImageLinkSearchPost$RequestBody instance) =>
    <String, dynamic>{
      'url': instance.url,
    };

ApiCommLinksReverseImageSearchPost$RequestBody
    _$ApiCommLinksReverseImageSearchPost$RequestBodyFromJson(
            Map<String, dynamic> json) =>
        ApiCommLinksReverseImageSearchPost$RequestBody(
          image: json['image'] as String,
          similarity: (json['similarity'] as num?)?.toInt(),
        );

Map<String, dynamic> _$ApiCommLinksReverseImageSearchPost$RequestBodyToJson(
        ApiCommLinksReverseImageSearchPost$RequestBody instance) =>
    <String, dynamic>{
      'image': instance.image,
      'similarity': instance.similarity,
    };

ApiCommLinkImagesSearchPost$RequestBody
    _$ApiCommLinkImagesSearchPost$RequestBodyFromJson(
            Map<String, dynamic> json) =>
        ApiCommLinkImagesSearchPost$RequestBody(
          query: json['query'] as String,
        );

Map<String, dynamic> _$ApiCommLinkImagesSearchPost$RequestBodyToJson(
        ApiCommLinkImagesSearchPost$RequestBody instance) =>
    <String, dynamic>{
      'query': instance.query,
    };

ApiCelestialObjectsSearchPost$RequestBody
    _$ApiCelestialObjectsSearchPost$RequestBodyFromJson(
            Map<String, dynamic> json) =>
        ApiCelestialObjectsSearchPost$RequestBody(
          query: json['query'] as String?,
        );

Map<String, dynamic> _$ApiCelestialObjectsSearchPost$RequestBodyToJson(
        ApiCelestialObjectsSearchPost$RequestBody instance) =>
    <String, dynamic>{
      'query': instance.query,
    };

ApiStarsystemsSearchPost$RequestBody
    _$ApiStarsystemsSearchPost$RequestBodyFromJson(Map<String, dynamic> json) =>
        ApiStarsystemsSearchPost$RequestBody(
          query: json['query'] as String?,
        );

Map<String, dynamic> _$ApiStarsystemsSearchPost$RequestBodyToJson(
        ApiStarsystemsSearchPost$RequestBody instance) =>
    <String, dynamic>{
      'query': instance.query,
    };

ApiBlueprintsGet$Response _$ApiBlueprintsGet$ResponseFromJson(
        Map<String, dynamic> json) =>
    ApiBlueprintsGet$Response(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => Blueprint.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      links: json['links'] == null
          ? null
          : PaginationLinks.fromJson(json['links'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : PaginationMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiBlueprintsGet$ResponseToJson(
        ApiBlueprintsGet$Response instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'links': instance.links?.toJson(),
      'meta': instance.meta?.toJson(),
    };

ApiBlueprintsBlueprintGet$Response _$ApiBlueprintsBlueprintGet$ResponseFromJson(
        Map<String, dynamic> json) =>
    ApiBlueprintsBlueprintGet$Response(
      data: json['data'] == null
          ? null
          : Blueprint.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiBlueprintsBlueprintGet$ResponseToJson(
        ApiBlueprintsBlueprintGet$Response instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
    };

ApiBlueprintsFiltersGet$Response _$ApiBlueprintsFiltersGet$ResponseFromJson(
        Map<String, dynamic> json) =>
    ApiBlueprintsFiltersGet$Response(
      filters: json['filters'] == null
          ? null
          : ApiBlueprintsFiltersGet$Response$Filters.fromJson(
              json['filters'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiBlueprintsFiltersGet$ResponseToJson(
        ApiBlueprintsFiltersGet$Response instance) =>
    <String, dynamic>{
      'filters': instance.filters?.toJson(),
    };

ApiCommoditiesGet$Response _$ApiCommoditiesGet$ResponseFromJson(
        Map<String, dynamic> json) =>
    ApiCommoditiesGet$Response(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => CommodityLink.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      links: json['links'] == null
          ? null
          : PaginationLinks.fromJson(json['links'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : PaginationMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiCommoditiesGet$ResponseToJson(
        ApiCommoditiesGet$Response instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'links': instance.links?.toJson(),
      'meta': instance.meta?.toJson(),
    };

ApiCommoditiesCommodityGet$Response
    _$ApiCommoditiesCommodityGet$ResponseFromJson(Map<String, dynamic> json) =>
        ApiCommoditiesCommodityGet$Response(
          data: json['data'] == null
              ? null
              : CommodityShow.fromJson(json['data'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$ApiCommoditiesCommodityGet$ResponseToJson(
        ApiCommoditiesCommodityGet$Response instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
    };

ApiCommoditiesFiltersGet$Response _$ApiCommoditiesFiltersGet$ResponseFromJson(
        Map<String, dynamic> json) =>
    ApiCommoditiesFiltersGet$Response(
      filters: json['filters'] == null
          ? null
          : ApiCommoditiesFiltersGet$Response$Filters.fromJson(
              json['filters'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiCommoditiesFiltersGet$ResponseToJson(
        ApiCommoditiesFiltersGet$Response instance) =>
    <String, dynamic>{
      'filters': instance.filters?.toJson(),
    };

ApiFactionsGet$Response _$ApiFactionsGet$ResponseFromJson(
        Map<String, dynamic> json) =>
    ApiFactionsGet$Response(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => FactionIndex.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      links: json['links'] == null
          ? null
          : PaginationLinks.fromJson(json['links'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : PaginationMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiFactionsGet$ResponseToJson(
        ApiFactionsGet$Response instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'links': instance.links?.toJson(),
      'meta': instance.meta?.toJson(),
    };

ApiFactionsFactionGet$Response _$ApiFactionsFactionGet$ResponseFromJson(
        Map<String, dynamic> json) =>
    ApiFactionsFactionGet$Response(
      data: json['data'] == null
          ? null
          : Faction.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiFactionsFactionGet$ResponseToJson(
        ApiFactionsFactionGet$Response instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
    };

ApiGameVersionsGet$Response _$ApiGameVersionsGet$ResponseFromJson(
        Map<String, dynamic> json) =>
    ApiGameVersionsGet$Response(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => GameVersion.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      links: json['links'] == null
          ? null
          : PaginationLinks.fromJson(json['links'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : PaginationMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiGameVersionsGet$ResponseToJson(
        ApiGameVersionsGet$Response instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'links': instance.links?.toJson(),
      'meta': instance.meta?.toJson(),
    };

ApiGameVersionsDefaultGet$Response _$ApiGameVersionsDefaultGet$ResponseFromJson(
        Map<String, dynamic> json) =>
    ApiGameVersionsDefaultGet$Response(
      data: json['data'] == null
          ? null
          : GameVersion.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiGameVersionsDefaultGet$ResponseToJson(
        ApiGameVersionsDefaultGet$Response instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
    };

ApiGameVersionsIdentifierGet$Response
    _$ApiGameVersionsIdentifierGet$ResponseFromJson(
            Map<String, dynamic> json) =>
        ApiGameVersionsIdentifierGet$Response(
          data: json['data'] == null
              ? null
              : GameVersion.fromJson(json['data'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$ApiGameVersionsIdentifierGet$ResponseToJson(
        ApiGameVersionsIdentifierGet$Response instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
    };

ApiWeaponsGet$Response _$ApiWeaponsGet$ResponseFromJson(
        Map<String, dynamic> json) =>
    ApiWeaponsGet$Response(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => GameItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      links: json['links'] == null
          ? null
          : PaginationLinks.fromJson(json['links'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : PaginationMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiWeaponsGet$ResponseToJson(
        ApiWeaponsGet$Response instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'links': instance.links?.toJson(),
      'meta': instance.meta?.toJson(),
    };

ApiWeaponAttachmentsGet$Response _$ApiWeaponAttachmentsGet$ResponseFromJson(
        Map<String, dynamic> json) =>
    ApiWeaponAttachmentsGet$Response(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => GameItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      links: json['links'] == null
          ? null
          : PaginationLinks.fromJson(json['links'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : PaginationMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiWeaponAttachmentsGet$ResponseToJson(
        ApiWeaponAttachmentsGet$Response instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'links': instance.links?.toJson(),
      'meta': instance.meta?.toJson(),
    };

ApiClothesGet$Response _$ApiClothesGet$ResponseFromJson(
        Map<String, dynamic> json) =>
    ApiClothesGet$Response(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => GameItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      links: json['links'] == null
          ? null
          : PaginationLinks.fromJson(json['links'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : PaginationMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiClothesGet$ResponseToJson(
        ApiClothesGet$Response instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'links': instance.links?.toJson(),
      'meta': instance.meta?.toJson(),
    };

ApiArmorGet$Response _$ApiArmorGet$ResponseFromJson(
        Map<String, dynamic> json) =>
    ApiArmorGet$Response(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => GameItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      links: json['links'] == null
          ? null
          : PaginationLinks.fromJson(json['links'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : PaginationMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiArmorGet$ResponseToJson(
        ApiArmorGet$Response instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'links': instance.links?.toJson(),
      'meta': instance.meta?.toJson(),
    };

ApiFoodGet$Response _$ApiFoodGet$ResponseFromJson(Map<String, dynamic> json) =>
    ApiFoodGet$Response(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => GameItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      links: json['links'] == null
          ? null
          : PaginationLinks.fromJson(json['links'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : PaginationMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiFoodGet$ResponseToJson(
        ApiFoodGet$Response instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'links': instance.links?.toJson(),
      'meta': instance.meta?.toJson(),
    };

ApiVehicleWeaponsGet$Response _$ApiVehicleWeaponsGet$ResponseFromJson(
        Map<String, dynamic> json) =>
    ApiVehicleWeaponsGet$Response(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => GameItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      links: json['links'] == null
          ? null
          : PaginationLinks.fromJson(json['links'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : PaginationMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiVehicleWeaponsGet$ResponseToJson(
        ApiVehicleWeaponsGet$Response instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'links': instance.links?.toJson(),
      'meta': instance.meta?.toJson(),
    };

ApiVehicleItemsGet$Response _$ApiVehicleItemsGet$ResponseFromJson(
        Map<String, dynamic> json) =>
    ApiVehicleItemsGet$Response(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => GameItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      links: json['links'] == null
          ? null
          : PaginationLinks.fromJson(json['links'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : PaginationMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiVehicleItemsGet$ResponseToJson(
        ApiVehicleItemsGet$Response instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'links': instance.links?.toJson(),
      'meta': instance.meta?.toJson(),
    };

ApiItemsGet$Response _$ApiItemsGet$ResponseFromJson(
        Map<String, dynamic> json) =>
    ApiItemsGet$Response(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => GameItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      links: json['links'] == null
          ? null
          : PaginationLinks.fromJson(json['links'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : PaginationMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiItemsGet$ResponseToJson(
        ApiItemsGet$Response instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'links': instance.links?.toJson(),
      'meta': instance.meta?.toJson(),
    };

ApiWeaponsIdentifierGet$Response _$ApiWeaponsIdentifierGet$ResponseFromJson(
        Map<String, dynamic> json) =>
    ApiWeaponsIdentifierGet$Response(
      data: json['data'] == null
          ? null
          : GameItem.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiWeaponsIdentifierGet$ResponseToJson(
        ApiWeaponsIdentifierGet$Response instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
    };

ApiWeaponAttachmentsIdentifierGet$Response
    _$ApiWeaponAttachmentsIdentifierGet$ResponseFromJson(
            Map<String, dynamic> json) =>
        ApiWeaponAttachmentsIdentifierGet$Response(
          data: json['data'] == null
              ? null
              : GameItem.fromJson(json['data'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$ApiWeaponAttachmentsIdentifierGet$ResponseToJson(
        ApiWeaponAttachmentsIdentifierGet$Response instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
    };

ApiClothesIdentifierGet$Response _$ApiClothesIdentifierGet$ResponseFromJson(
        Map<String, dynamic> json) =>
    ApiClothesIdentifierGet$Response(
      data: json['data'] == null
          ? null
          : GameItem.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiClothesIdentifierGet$ResponseToJson(
        ApiClothesIdentifierGet$Response instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
    };

ApiArmorIdentifierGet$Response _$ApiArmorIdentifierGet$ResponseFromJson(
        Map<String, dynamic> json) =>
    ApiArmorIdentifierGet$Response(
      data: json['data'] == null
          ? null
          : GameItem.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiArmorIdentifierGet$ResponseToJson(
        ApiArmorIdentifierGet$Response instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
    };

ApiFoodIdentifierGet$Response _$ApiFoodIdentifierGet$ResponseFromJson(
        Map<String, dynamic> json) =>
    ApiFoodIdentifierGet$Response(
      data: json['data'] == null
          ? null
          : GameItem.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiFoodIdentifierGet$ResponseToJson(
        ApiFoodIdentifierGet$Response instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
    };

ApiVehicleWeaponsIdentifierGet$Response
    _$ApiVehicleWeaponsIdentifierGet$ResponseFromJson(
            Map<String, dynamic> json) =>
        ApiVehicleWeaponsIdentifierGet$Response(
          data: json['data'] == null
              ? null
              : GameItem.fromJson(json['data'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$ApiVehicleWeaponsIdentifierGet$ResponseToJson(
        ApiVehicleWeaponsIdentifierGet$Response instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
    };

ApiVehicleItemsIdentifierGet$Response
    _$ApiVehicleItemsIdentifierGet$ResponseFromJson(
            Map<String, dynamic> json) =>
        ApiVehicleItemsIdentifierGet$Response(
          data: json['data'] == null
              ? null
              : GameItem.fromJson(json['data'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$ApiVehicleItemsIdentifierGet$ResponseToJson(
        ApiVehicleItemsIdentifierGet$Response instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
    };

ApiItemsIdentifierGet$Response _$ApiItemsIdentifierGet$ResponseFromJson(
        Map<String, dynamic> json) =>
    ApiItemsIdentifierGet$Response(
      data: json['data'] == null
          ? null
          : GameItem.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiItemsIdentifierGet$ResponseToJson(
        ApiItemsIdentifierGet$Response instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
    };

ApiItemsSearchPost$Response _$ApiItemsSearchPost$ResponseFromJson(
        Map<String, dynamic> json) =>
    ApiItemsSearchPost$Response(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => GameItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      links: json['links'] == null
          ? null
          : PaginationLinks.fromJson(json['links'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : PaginationMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiItemsSearchPost$ResponseToJson(
        ApiItemsSearchPost$Response instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'links': instance.links?.toJson(),
      'meta': instance.meta?.toJson(),
    };

ApiItemsFiltersGet$Response _$ApiItemsFiltersGet$ResponseFromJson(
        Map<String, dynamic> json) =>
    ApiItemsFiltersGet$Response(
      filters: json['filters'] == null
          ? null
          : ApiItemsFiltersGet$Response$Filters.fromJson(
              json['filters'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiItemsFiltersGet$ResponseToJson(
        ApiItemsFiltersGet$Response instance) =>
    <String, dynamic>{
      'filters': instance.filters?.toJson(),
    };

ApiManufacturersGet$Response _$ApiManufacturersGet$ResponseFromJson(
        Map<String, dynamic> json) =>
    ApiManufacturersGet$Response(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => ManufacturerLink.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      links: json['links'] == null
          ? null
          : PaginationLinks.fromJson(json['links'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : PaginationMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiManufacturersGet$ResponseToJson(
        ApiManufacturersGet$Response instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'links': instance.links?.toJson(),
      'meta': instance.meta?.toJson(),
    };

ApiManufacturersManufacturerGet$Response
    _$ApiManufacturersManufacturerGet$ResponseFromJson(
            Map<String, dynamic> json) =>
        ApiManufacturersManufacturerGet$Response(
          data: json['data'] == null
              ? null
              : Manufacturer.fromJson(json['data'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$ApiManufacturersManufacturerGet$ResponseToJson(
        ApiManufacturersManufacturerGet$Response instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
    };

ApiManufacturersSearchPost$Response
    _$ApiManufacturersSearchPost$ResponseFromJson(Map<String, dynamic> json) =>
        ApiManufacturersSearchPost$Response(
          data: (json['data'] as List<dynamic>?)
                  ?.map((e) =>
                      ManufacturerLink.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
          links: json['links'] == null
              ? null
              : PaginationLinks.fromJson(json['links'] as Map<String, dynamic>),
          meta: json['meta'] == null
              ? null
              : PaginationMeta.fromJson(json['meta'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$ApiManufacturersSearchPost$ResponseToJson(
        ApiManufacturersSearchPost$Response instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'links': instance.links?.toJson(),
      'meta': instance.meta?.toJson(),
    };

ApiMissionsGet$Response _$ApiMissionsGet$ResponseFromJson(
        Map<String, dynamic> json) =>
    ApiMissionsGet$Response(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => MissionIndex.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      links: json['links'] == null
          ? null
          : PaginationLinks.fromJson(json['links'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : PaginationMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiMissionsGet$ResponseToJson(
        ApiMissionsGet$Response instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'links': instance.links?.toJson(),
      'meta': instance.meta?.toJson(),
    };

ApiMissionsMissionGet$Response _$ApiMissionsMissionGet$ResponseFromJson(
        Map<String, dynamic> json) =>
    ApiMissionsMissionGet$Response(
      data: json['data'] == null
          ? null
          : Mission.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiMissionsMissionGet$ResponseToJson(
        ApiMissionsMissionGet$Response instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
    };

ApiMissionsFiltersGet$Response _$ApiMissionsFiltersGet$ResponseFromJson(
        Map<String, dynamic> json) =>
    ApiMissionsFiltersGet$Response(
      filters: json['filters'] == null
          ? null
          : ApiMissionsFiltersGet$Response$Filters.fromJson(
              json['filters'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiMissionsFiltersGet$ResponseToJson(
        ApiMissionsFiltersGet$Response instance) =>
    <String, dynamic>{
      'filters': instance.filters?.toJson(),
    };

ApiLocationsGet$Response _$ApiLocationsGet$ResponseFromJson(
        Map<String, dynamic> json) =>
    ApiLocationsGet$Response(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) =>
                  GameStarmapLocation.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      links: json['links'] == null
          ? null
          : PaginationLinks.fromJson(json['links'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : PaginationMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiLocationsGet$ResponseToJson(
        ApiLocationsGet$Response instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'links': instance.links?.toJson(),
      'meta': instance.meta?.toJson(),
    };

ApiLocationsIdentifierGet$Response _$ApiLocationsIdentifierGet$ResponseFromJson(
        Map<String, dynamic> json) =>
    ApiLocationsIdentifierGet$Response(
      data: json['data'] == null
          ? null
          : GameStarmapLocation.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiLocationsIdentifierGet$ResponseToJson(
        ApiLocationsIdentifierGet$Response instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
    };

ApiLocationsFiltersGet$Response _$ApiLocationsFiltersGet$ResponseFromJson(
        Map<String, dynamic> json) =>
    ApiLocationsFiltersGet$Response(
      filters: json['filters'] == null
          ? null
          : ApiLocationsFiltersGet$Response$Filters.fromJson(
              json['filters'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiLocationsFiltersGet$ResponseToJson(
        ApiLocationsFiltersGet$Response instance) =>
    <String, dynamic>{
      'filters': instance.filters?.toJson(),
    };

ApiLocationsPositionsGet$Response _$ApiLocationsPositionsGet$ResponseFromJson(
        Map<String, dynamic> json) =>
    ApiLocationsPositionsGet$Response(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ApiLocationsPositionsGet$Response$Data$Item.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      connections: (json['connections'] as List<dynamic>?)
          ?.map((e) =>
              ApiLocationsPositionsGet$Response$Connections$Item.fromJson(
                  e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ApiLocationsPositionsGet$ResponseToJson(
        ApiLocationsPositionsGet$Response instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'connections': instance.connections?.map((e) => e.toJson()).toList(),
    };

ApiSearchGet$Response _$ApiSearchGet$ResponseFromJson(
        Map<String, dynamic> json) =>
    ApiSearchGet$Response(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ApiSearchGet$Response$Data$Item.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ApiSearchGet$ResponseToJson(
        ApiSearchGet$Response instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };

ApiGroundVehiclesGet$Response _$ApiGroundVehiclesGet$ResponseFromJson(
        Map<String, dynamic> json) =>
    ApiGroundVehiclesGet$Response(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => GameVehicle.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      links: json['links'] == null
          ? null
          : PaginationLinks.fromJson(json['links'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : PaginationMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiGroundVehiclesGet$ResponseToJson(
        ApiGroundVehiclesGet$Response instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'links': instance.links?.toJson(),
      'meta': instance.meta?.toJson(),
    };

ApiGravlevVehiclesGet$Response _$ApiGravlevVehiclesGet$ResponseFromJson(
        Map<String, dynamic> json) =>
    ApiGravlevVehiclesGet$Response(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => GameVehicle.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      links: json['links'] == null
          ? null
          : PaginationLinks.fromJson(json['links'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : PaginationMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiGravlevVehiclesGet$ResponseToJson(
        ApiGravlevVehiclesGet$Response instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'links': instance.links?.toJson(),
      'meta': instance.meta?.toJson(),
    };

ApiVehiclesGet$Response _$ApiVehiclesGet$ResponseFromJson(
        Map<String, dynamic> json) =>
    ApiVehiclesGet$Response(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => GameVehicle.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      links: json['links'] == null
          ? null
          : PaginationLinks.fromJson(json['links'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : PaginationMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiVehiclesGet$ResponseToJson(
        ApiVehiclesGet$Response instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'links': instance.links?.toJson(),
      'meta': instance.meta?.toJson(),
    };

ApiGroundVehiclesIdentifierGet$Response
    _$ApiGroundVehiclesIdentifierGet$ResponseFromJson(
            Map<String, dynamic> json) =>
        ApiGroundVehiclesIdentifierGet$Response(
          data: json['data'],
        );

Map<String, dynamic> _$ApiGroundVehiclesIdentifierGet$ResponseToJson(
        ApiGroundVehiclesIdentifierGet$Response instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

ApiGravlevVehiclesIdentifierGet$Response
    _$ApiGravlevVehiclesIdentifierGet$ResponseFromJson(
            Map<String, dynamic> json) =>
        ApiGravlevVehiclesIdentifierGet$Response(
          data: json['data'],
        );

Map<String, dynamic> _$ApiGravlevVehiclesIdentifierGet$ResponseToJson(
        ApiGravlevVehiclesIdentifierGet$Response instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

ApiVehiclesIdentifierGet$Response _$ApiVehiclesIdentifierGet$ResponseFromJson(
        Map<String, dynamic> json) =>
    ApiVehiclesIdentifierGet$Response(
      data: json['data'],
    );

Map<String, dynamic> _$ApiVehiclesIdentifierGet$ResponseToJson(
        ApiVehiclesIdentifierGet$Response instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

ApiGroundVehiclesSearchPost$Response
    _$ApiGroundVehiclesSearchPost$ResponseFromJson(Map<String, dynamic> json) =>
        ApiGroundVehiclesSearchPost$Response(
          data: (json['data'] as List<dynamic>?)
                  ?.map((e) => GameVehicle.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
          links: json['links'] == null
              ? null
              : PaginationLinks.fromJson(json['links'] as Map<String, dynamic>),
          meta: json['meta'] == null
              ? null
              : PaginationMeta.fromJson(json['meta'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$ApiGroundVehiclesSearchPost$ResponseToJson(
        ApiGroundVehiclesSearchPost$Response instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'links': instance.links?.toJson(),
      'meta': instance.meta?.toJson(),
    };

ApiGravlevVehiclesSearchPost$Response
    _$ApiGravlevVehiclesSearchPost$ResponseFromJson(
            Map<String, dynamic> json) =>
        ApiGravlevVehiclesSearchPost$Response(
          data: (json['data'] as List<dynamic>?)
                  ?.map((e) => GameVehicle.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
          links: json['links'] == null
              ? null
              : PaginationLinks.fromJson(json['links'] as Map<String, dynamic>),
          meta: json['meta'] == null
              ? null
              : PaginationMeta.fromJson(json['meta'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$ApiGravlevVehiclesSearchPost$ResponseToJson(
        ApiGravlevVehiclesSearchPost$Response instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'links': instance.links?.toJson(),
      'meta': instance.meta?.toJson(),
    };

ApiVehiclesSearchPost$Response _$ApiVehiclesSearchPost$ResponseFromJson(
        Map<String, dynamic> json) =>
    ApiVehiclesSearchPost$Response(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => GameVehicle.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      links: json['links'] == null
          ? null
          : PaginationLinks.fromJson(json['links'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : PaginationMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiVehiclesSearchPost$ResponseToJson(
        ApiVehiclesSearchPost$Response instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'links': instance.links?.toJson(),
      'meta': instance.meta?.toJson(),
    };

ApiVehiclesFiltersGet$Response _$ApiVehiclesFiltersGet$ResponseFromJson(
        Map<String, dynamic> json) =>
    ApiVehiclesFiltersGet$Response(
      filters: json['filters'] == null
          ? null
          : ApiVehiclesFiltersGet$Response$Filters.fromJson(
              json['filters'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiVehiclesFiltersGet$ResponseToJson(
        ApiVehiclesFiltersGet$Response instance) =>
    <String, dynamic>{
      'filters': instance.filters?.toJson(),
    };

ApiGameVersionsVersionChangelogGet$Response
    _$ApiGameVersionsVersionChangelogGet$ResponseFromJson(
            Map<String, dynamic> json) =>
        ApiGameVersionsVersionChangelogGet$Response(
          data: json['data'] == null
              ? null
              : VersionChangelog.fromJson(json['data'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$ApiGameVersionsVersionChangelogGet$ResponseToJson(
        ApiGameVersionsVersionChangelogGet$Response instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
    };

ApiGameVersionsVersionChangelogChangesGet$Response
    _$ApiGameVersionsVersionChangelogChangesGet$ResponseFromJson(
            Map<String, dynamic> json) =>
        ApiGameVersionsVersionChangelogChangesGet$Response(
          data: (json['data'] as List<dynamic>?)
                  ?.map((e) =>
                      VersionDiffEntry.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
          links: json['links'] == null
              ? null
              : PaginationLinks.fromJson(json['links'] as Map<String, dynamic>),
          meta: json['meta'] == null
              ? null
              : PaginationMeta.fromJson(json['meta'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$ApiGameVersionsVersionChangelogChangesGet$ResponseToJson(
        ApiGameVersionsVersionChangelogChangesGet$Response instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'links': instance.links?.toJson(),
      'meta': instance.meta?.toJson(),
    };

ApiCommLinksGet$Response _$ApiCommLinksGet$ResponseFromJson(
        Map<String, dynamic> json) =>
    ApiCommLinksGet$Response(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => CommLink.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      links: json['links'] == null
          ? null
          : PaginationLinks.fromJson(json['links'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : PaginationMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiCommLinksGet$ResponseToJson(
        ApiCommLinksGet$Response instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'links': instance.links?.toJson(),
      'meta': instance.meta?.toJson(),
    };

ApiCommLinksFiltersGet$Response _$ApiCommLinksFiltersGet$ResponseFromJson(
        Map<String, dynamic> json) =>
    ApiCommLinksFiltersGet$Response(
      filters: json['filters'] == null
          ? null
          : ApiCommLinksFiltersGet$Response$Filters.fromJson(
              json['filters'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiCommLinksFiltersGet$ResponseToJson(
        ApiCommLinksFiltersGet$Response instance) =>
    <String, dynamic>{
      'filters': instance.filters?.toJson(),
    };

ApiCommLinksIdGet$Response _$ApiCommLinksIdGet$ResponseFromJson(
        Map<String, dynamic> json) =>
    ApiCommLinksIdGet$Response(
      data: json['data'] == null
          ? null
          : CommLink.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiCommLinksIdGet$ResponseToJson(
        ApiCommLinksIdGet$Response instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
    };

ApiCommLinksSearchPost$Response _$ApiCommLinksSearchPost$ResponseFromJson(
        Map<String, dynamic> json) =>
    ApiCommLinksSearchPost$Response(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => CommLink.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      links: json['links'] == null
          ? null
          : PaginationLinks.fromJson(json['links'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : PaginationMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiCommLinksSearchPost$ResponseToJson(
        ApiCommLinksSearchPost$Response instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'links': instance.links?.toJson(),
      'meta': instance.meta?.toJson(),
    };

ApiCommLinksReverseImageLinkSearchPost$Response
    _$ApiCommLinksReverseImageLinkSearchPost$ResponseFromJson(
            Map<String, dynamic> json) =>
        ApiCommLinksReverseImageLinkSearchPost$Response(
          data: (json['data'] as List<dynamic>?)
                  ?.map((e) => CommLink.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
        );

Map<String, dynamic> _$ApiCommLinksReverseImageLinkSearchPost$ResponseToJson(
        ApiCommLinksReverseImageLinkSearchPost$Response instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };

ApiCommLinksReverseImageSearchPost$Response
    _$ApiCommLinksReverseImageSearchPost$ResponseFromJson(
            Map<String, dynamic> json) =>
        ApiCommLinksReverseImageSearchPost$Response(
          data: (json['data'] as List<dynamic>?)
                  ?.map(
                      (e) => CommLinkImage.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
        );

Map<String, dynamic> _$ApiCommLinksReverseImageSearchPost$ResponseToJson(
        ApiCommLinksReverseImageSearchPost$Response instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };

ApiCommLinkImagesImageSimilarGet$Response
    _$ApiCommLinkImagesImageSimilarGet$ResponseFromJson(
            Map<String, dynamic> json) =>
        ApiCommLinkImagesImageSimilarGet$Response(
          data: (json['data'] as List<dynamic>?)
                  ?.map(
                      (e) => CommLinkImage.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
        );

Map<String, dynamic> _$ApiCommLinkImagesImageSimilarGet$ResponseToJson(
        ApiCommLinkImagesImageSimilarGet$Response instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };

ApiCommLinkImagesGet$Response _$ApiCommLinkImagesGet$ResponseFromJson(
        Map<String, dynamic> json) =>
    ApiCommLinkImagesGet$Response(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => CommLinkImage.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      links: json['links'] == null
          ? null
          : PaginationLinks.fromJson(json['links'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : PaginationMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiCommLinkImagesGet$ResponseToJson(
        ApiCommLinkImagesGet$Response instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'links': instance.links?.toJson(),
      'meta': instance.meta?.toJson(),
    };

ApiCommLinkImagesImageGet$Response _$ApiCommLinkImagesImageGet$ResponseFromJson(
        Map<String, dynamic> json) =>
    ApiCommLinkImagesImageGet$Response(
      data: json['data'] == null
          ? null
          : CommLinkImage.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiCommLinkImagesImageGet$ResponseToJson(
        ApiCommLinkImagesImageGet$Response instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
    };

ApiCommLinkImagesRandomGet$Response
    _$ApiCommLinkImagesRandomGet$ResponseFromJson(Map<String, dynamic> json) =>
        ApiCommLinkImagesRandomGet$Response(
          data: (json['data'] as List<dynamic>?)
                  ?.map(
                      (e) => CommLinkImage.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
        );

Map<String, dynamic> _$ApiCommLinkImagesRandomGet$ResponseToJson(
        ApiCommLinkImagesRandomGet$Response instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };

ApiCommLinkImagesSearchPost$Response
    _$ApiCommLinkImagesSearchPost$ResponseFromJson(Map<String, dynamic> json) =>
        ApiCommLinkImagesSearchPost$Response(
          data: (json['data'] as List<dynamic>?)
                  ?.map(
                      (e) => CommLinkImage.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
        );

Map<String, dynamic> _$ApiCommLinkImagesSearchPost$ResponseToJson(
        ApiCommLinkImagesSearchPost$Response instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };

ApiGalactapediaGet$Response _$ApiGalactapediaGet$ResponseFromJson(
        Map<String, dynamic> json) =>
    ApiGalactapediaGet$Response(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) =>
                  GalactapediaArticle.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      links: json['links'] == null
          ? null
          : PaginationLinks.fromJson(json['links'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : PaginationMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiGalactapediaGet$ResponseToJson(
        ApiGalactapediaGet$Response instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'links': instance.links?.toJson(),
      'meta': instance.meta?.toJson(),
    };

ApiGalactapediaFiltersGet$Response _$ApiGalactapediaFiltersGet$ResponseFromJson(
        Map<String, dynamic> json) =>
    ApiGalactapediaFiltersGet$Response(
      filters: json['filters'] == null
          ? null
          : ApiGalactapediaFiltersGet$Response$Filters.fromJson(
              json['filters'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiGalactapediaFiltersGet$ResponseToJson(
        ApiGalactapediaFiltersGet$Response instance) =>
    <String, dynamic>{
      'filters': instance.filters?.toJson(),
    };

ApiGalactapediaIdGet$Response _$ApiGalactapediaIdGet$ResponseFromJson(
        Map<String, dynamic> json) =>
    ApiGalactapediaIdGet$Response(
      data: json['data'] == null
          ? null
          : GalactapediaArticle.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiGalactapediaIdGet$ResponseToJson(
        ApiGalactapediaIdGet$Response instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
    };

ApiGalactapediaSearchPost$Response _$ApiGalactapediaSearchPost$ResponseFromJson(
        Map<String, dynamic> json) =>
    ApiGalactapediaSearchPost$Response(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) =>
                  GalactapediaArticle.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$ApiGalactapediaSearchPost$ResponseToJson(
        ApiGalactapediaSearchPost$Response instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };

ApiCelestialObjectsGet$Response _$ApiCelestialObjectsGet$ResponseFromJson(
        Map<String, dynamic> json) =>
    ApiCelestialObjectsGet$Response(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => CelestialObject.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      links: json['links'] == null
          ? null
          : PaginationLinks.fromJson(json['links'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : PaginationMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiCelestialObjectsGet$ResponseToJson(
        ApiCelestialObjectsGet$Response instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'links': instance.links?.toJson(),
      'meta': instance.meta?.toJson(),
    };

ApiCelestialObjectsCodeGet$Response
    _$ApiCelestialObjectsCodeGet$ResponseFromJson(Map<String, dynamic> json) =>
        ApiCelestialObjectsCodeGet$Response(
          data: json['data'] == null
              ? null
              : CelestialObject.fromJson(json['data'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$ApiCelestialObjectsCodeGet$ResponseToJson(
        ApiCelestialObjectsCodeGet$Response instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
    };

ApiCelestialObjectsSearchPost$Response
    _$ApiCelestialObjectsSearchPost$ResponseFromJson(
            Map<String, dynamic> json) =>
        ApiCelestialObjectsSearchPost$Response(
          data: (json['data'] as List<dynamic>?)
                  ?.map((e) =>
                      CelestialObject.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
        );

Map<String, dynamic> _$ApiCelestialObjectsSearchPost$ResponseToJson(
        ApiCelestialObjectsSearchPost$Response instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };

ApiStarsystemsGet$Response _$ApiStarsystemsGet$ResponseFromJson(
        Map<String, dynamic> json) =>
    ApiStarsystemsGet$Response(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => Starsystem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      links: json['links'] == null
          ? null
          : PaginationLinks.fromJson(json['links'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : PaginationMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiStarsystemsGet$ResponseToJson(
        ApiStarsystemsGet$Response instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'links': instance.links?.toJson(),
      'meta': instance.meta?.toJson(),
    };

ApiStarsystemsCodeGet$Response _$ApiStarsystemsCodeGet$ResponseFromJson(
        Map<String, dynamic> json) =>
    ApiStarsystemsCodeGet$Response(
      data: json['data'] == null
          ? null
          : Starsystem.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiStarsystemsCodeGet$ResponseToJson(
        ApiStarsystemsCodeGet$Response instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
    };

ApiStarsystemsSearchPost$Response _$ApiStarsystemsSearchPost$ResponseFromJson(
        Map<String, dynamic> json) =>
    ApiStarsystemsSearchPost$Response(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => Starsystem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$ApiStarsystemsSearchPost$ResponseToJson(
        ApiStarsystemsSearchPost$Response instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };

ApiStarsystemsFiltersGet$Response _$ApiStarsystemsFiltersGet$ResponseFromJson(
        Map<String, dynamic> json) =>
    ApiStarsystemsFiltersGet$Response(
      filters: json['filters'] == null
          ? null
          : ApiStarsystemsFiltersGet$Response$Filters.fromJson(
              json['filters'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiStarsystemsFiltersGet$ResponseToJson(
        ApiStarsystemsFiltersGet$Response instance) =>
    <String, dynamic>{
      'filters': instance.filters?.toJson(),
    };

ApiStatsLatestGet$Response _$ApiStatsLatestGet$ResponseFromJson(
        Map<String, dynamic> json) =>
    ApiStatsLatestGet$Response(
      data: json['data'] == null
          ? null
          : Stat.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiStatsLatestGet$ResponseToJson(
        ApiStatsLatestGet$Response instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
    };

ApiStatsGet$Response _$ApiStatsGet$ResponseFromJson(
        Map<String, dynamic> json) =>
    ApiStatsGet$Response(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => Stat.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      links: json['links'] == null
          ? null
          : PaginationLinks.fromJson(json['links'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : PaginationMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiStatsGet$ResponseToJson(
        ApiStatsGet$Response instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'links': instance.links?.toJson(),
      'meta': instance.meta?.toJson(),
    };

ApiShipmatrixVehiclesGet$Response _$ApiShipmatrixVehiclesGet$ResponseFromJson(
        Map<String, dynamic> json) =>
    ApiShipmatrixVehiclesGet$Response(
      data: (json['data'] as List<dynamic>?)
              ?.map(
                  (e) => ShipMatrixVehicle.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      links: json['links'] == null
          ? null
          : PaginationLinks.fromJson(json['links'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : PaginationMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiShipmatrixVehiclesGet$ResponseToJson(
        ApiShipmatrixVehiclesGet$Response instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'links': instance.links?.toJson(),
      'meta': instance.meta?.toJson(),
    };

ApiShipmatrixVehiclesFiltersGet$Response
    _$ApiShipmatrixVehiclesFiltersGet$ResponseFromJson(
            Map<String, dynamic> json) =>
        ApiShipmatrixVehiclesFiltersGet$Response(
          filters: json['filters'] == null
              ? null
              : ApiShipmatrixVehiclesFiltersGet$Response$Filters.fromJson(
                  json['filters'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$ApiShipmatrixVehiclesFiltersGet$ResponseToJson(
        ApiShipmatrixVehiclesFiltersGet$Response instance) =>
    <String, dynamic>{
      'filters': instance.filters?.toJson(),
    };

ApiShipmatrixVehiclesSlugGet$Response
    _$ApiShipmatrixVehiclesSlugGet$ResponseFromJson(
            Map<String, dynamic> json) =>
        ApiShipmatrixVehiclesSlugGet$Response(
          data: json['data'] == null
              ? null
              : ShipMatrixVehicle.fromJson(
                  json['data'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$ApiShipmatrixVehiclesSlugGet$ResponseToJson(
        ApiShipmatrixVehiclesSlugGet$Response instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
    };

ApiShipmatrixVehiclesSearchPost$Response
    _$ApiShipmatrixVehiclesSearchPost$ResponseFromJson(
            Map<String, dynamic> json) =>
        ApiShipmatrixVehiclesSearchPost$Response(
          data: (json['data'] as List<dynamic>?)
                  ?.map((e) =>
                      ShipMatrixVehicle.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
        );

Map<String, dynamic> _$ApiShipmatrixVehiclesSearchPost$ResponseToJson(
        ApiShipmatrixVehiclesSearchPost$Response instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };

ApiUserGet$Response _$ApiUserGet$ResponseFromJson(Map<String, dynamic> json) =>
    ApiUserGet$Response(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      email: json['email'] as String?,
      emailVerifiedAt: json['email_verified_at'] == null
          ? null
          : DateTime.parse(json['email_verified_at'] as String),
      isAdmin: json['is_admin'] as bool?,
      languageId: (json['language_id'] as num?)?.toInt(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$ApiUserGet$ResponseToJson(
        ApiUserGet$Response instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'email_verified_at': instance.emailVerifiedAt?.toIso8601String(),
      'is_admin': instance.isAdmin,
      'language_id': instance.languageId,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

BlueprintModifier$ValueSegments$Item
    _$BlueprintModifier$ValueSegments$ItemFromJson(Map<String, dynamic> json) =>
        BlueprintModifier$ValueSegments$Item(
          qualityMin: (json['quality_min'] as num?)?.toInt(),
          qualityMax: (json['quality_max'] as num?)?.toInt(),
          modifierAtStart: (json['modifier_at_start'] as num?)?.toDouble(),
          modifierAtEnd: (json['modifier_at_end'] as num?)?.toDouble(),
        );

Map<String, dynamic> _$BlueprintModifier$ValueSegments$ItemToJson(
        BlueprintModifier$ValueSegments$Item instance) =>
    <String, dynamic>{
      'quality_min': instance.qualityMin,
      'quality_max': instance.qualityMax,
      'modifier_at_start': instance.modifierAtStart,
      'modifier_at_end': instance.modifierAtEnd,
    };

CommodityLink$RefinedVersion _$CommodityLink$RefinedVersionFromJson(
        Map<String, dynamic> json) =>
    CommodityLink$RefinedVersion(
      name: json['name'] as String?,
      uuid: json['uuid'] as String?,
      webUrl: json['web_url'] as String?,
      link: json['link'] as String?,
    );

Map<String, dynamic> _$CommodityLink$RefinedVersionToJson(
        CommodityLink$RefinedVersion instance) =>
    <String, dynamic>{
      'name': instance.name,
      'uuid': instance.uuid,
      'web_url': instance.webUrl,
      'link': instance.link,
    };

CommodityLink$Images$Item _$CommodityLink$Images$ItemFromJson(
        Map<String, dynamic> json) =>
    CommodityLink$Images$Item(
      source: json['source'] as String?,
      thumbnailUrl: json['thumbnail_url'] as String?,
      thumbnailWidth: (json['thumbnail_width'] as num?)?.toInt(),
      thumbnailHeight: (json['thumbnail_height'] as num?)?.toInt(),
      originalUrl: json['original_url'] as String?,
      originalWidth: (json['original_width'] as num?)?.toInt(),
      originalHeight: (json['original_height'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CommodityLink$Images$ItemToJson(
        CommodityLink$Images$Item instance) =>
    <String, dynamic>{
      'source': instance.source,
      'thumbnail_url': instance.thumbnailUrl,
      'thumbnail_width': instance.thumbnailWidth,
      'thumbnail_height': instance.thumbnailHeight,
      'original_url': instance.originalUrl,
      'original_width': instance.originalWidth,
      'original_height': instance.originalHeight,
    };

CommodityShow$RefinedVersion _$CommodityShow$RefinedVersionFromJson(
        Map<String, dynamic> json) =>
    CommodityShow$RefinedVersion(
      name: json['name'] as String?,
      uuid: json['uuid'] as String?,
      webUrl: json['web_url'] as String?,
      link: json['link'] as String?,
    );

Map<String, dynamic> _$CommodityShow$RefinedVersionToJson(
        CommodityShow$RefinedVersion instance) =>
    <String, dynamic>{
      'name': instance.name,
      'uuid': instance.uuid,
      'web_url': instance.webUrl,
      'link': instance.link,
    };

CommodityShow$Blueprints$Item _$CommodityShow$Blueprints$ItemFromJson(
        Map<String, dynamic> json) =>
    CommodityShow$Blueprints$Item(
      key: json['key'] as String?,
      outputName: json['output_name'] as String?,
      outputItemUuid: json['output_item_uuid'] as String?,
      craftTimeLabel: json['craft_time_label'] as String?,
      webUrl: json['web_url'] as String?,
      link: json['link'] as String?,
    );

Map<String, dynamic> _$CommodityShow$Blueprints$ItemToJson(
        CommodityShow$Blueprints$Item instance) =>
    <String, dynamic>{
      'key': instance.key,
      'output_name': instance.outputName,
      'output_item_uuid': instance.outputItemUuid,
      'craft_time_label': instance.craftTimeLabel,
      'web_url': instance.webUrl,
      'link': instance.link,
    };

CommodityShow$Items$Item _$CommodityShow$Items$ItemFromJson(
        Map<String, dynamic> json) =>
    CommodityShow$Items$Item(
      name: json['name'] as String?,
      uuid: json['uuid'] as String?,
      type: json['type'] as String?,
      typeLabel: json['type_label'] as String?,
      subType: json['sub_type'] as String?,
      subTypeLabel: json['sub_type_label'] as String?,
      size: (json['size'] as num?)?.toInt(),
      webUrl: json['web_url'] as String?,
      link: json['link'] as String?,
    );

Map<String, dynamic> _$CommodityShow$Items$ItemToJson(
        CommodityShow$Items$Item instance) =>
    <String, dynamic>{
      'name': instance.name,
      'uuid': instance.uuid,
      'type': instance.type,
      'type_label': instance.typeLabel,
      'sub_type': instance.subType,
      'sub_type_label': instance.subTypeLabel,
      'size': instance.size,
      'web_url': instance.webUrl,
      'link': instance.link,
    };

CommodityShow$UexPrices _$CommodityShow$UexPricesFromJson(
        Map<String, dynamic> json) =>
    CommodityShow$UexPrices(
      purchase: (json['purchase'] as List<dynamic>?)
              ?.map((e) => UexPrice.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$CommodityShow$UexPricesToJson(
        CommodityShow$UexPrices instance) =>
    <String, dynamic>{
      'purchase': instance.purchase?.map((e) => e.toJson()).toList(),
    };

ItemDimension$TrueDimension _$ItemDimension$TrueDimensionFromJson(
        Map<String, dynamic> json) =>
    ItemDimension$TrueDimension(
      width: (json['width'] as num?)?.toDouble(),
      height: (json['height'] as num?)?.toDouble(),
      length: (json['length'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ItemDimension$TrueDimensionToJson(
        ItemDimension$TrueDimension instance) =>
    <String, dynamic>{
      'width': instance.width,
      'height': instance.height,
      'length': instance.length,
    };

ItemDurability$Resistance _$ItemDurability$ResistanceFromJson(
        Map<String, dynamic> json) =>
    ItemDurability$Resistance(
      physical: (json['physical'] as num?)?.toDouble(),
      energy: (json['energy'] as num?)?.toDouble(),
      distortion: (json['distortion'] as num?)?.toDouble(),
      thermal: (json['thermal'] as num?)?.toDouble(),
      biochemical: (json['biochemical'] as num?)?.toDouble(),
      stun: (json['stun'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ItemDurability$ResistanceToJson(
        ItemDurability$Resistance instance) =>
    <String, dynamic>{
      'physical': instance.physical,
      'energy': instance.energy,
      'distortion': instance.distortion,
      'thermal': instance.thermal,
      'biochemical': instance.biochemical,
      'stun': instance.stun,
    };

ItemInventory$MinSize _$ItemInventory$MinSizeFromJson(
        Map<String, dynamic> json) =>
    ItemInventory$MinSize(
      x: (json['x'] as num?)?.toDouble(),
      y: (json['y'] as num?)?.toDouble(),
      z: (json['z'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ItemInventory$MinSizeToJson(
        ItemInventory$MinSize instance) =>
    <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
      'z': instance.z,
    };

ItemInventory$MaxSize _$ItemInventory$MaxSizeFromJson(
        Map<String, dynamic> json) =>
    ItemInventory$MaxSize(
      x: (json['x'] as num?)?.toDouble(),
      y: (json['y'] as num?)?.toDouble(),
      z: (json['z'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ItemInventory$MaxSizeToJson(
        ItemInventory$MaxSize instance) =>
    <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
      'z': instance.z,
    };

ItemPort$Sizes _$ItemPort$SizesFromJson(Map<String, dynamic> json) =>
    ItemPort$Sizes(
      min: (json['min'] as num?)?.toInt(),
      max: (json['max'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ItemPort$SizesToJson(ItemPort$Sizes instance) =>
    <String, dynamic>{
      'min': instance.min,
      'max': instance.max,
    };

GameItem$EntityTagMap$Item _$GameItem$EntityTagMap$ItemFromJson(
        Map<String, dynamic> json) =>
    GameItem$EntityTagMap$Item(
      uuid: json['uuid'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$GameItem$EntityTagMap$ItemToJson(
        GameItem$EntityTagMap$Item instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
    };

GameItem$Images$Item _$GameItem$Images$ItemFromJson(
        Map<String, dynamic> json) =>
    GameItem$Images$Item(
      source: json['source'] as String?,
      thumbnailUrl: json['thumbnail_url'] as String?,
      thumbnailWidth: (json['thumbnail_width'] as num?)?.toInt(),
      thumbnailHeight: (json['thumbnail_height'] as num?)?.toInt(),
      originalUrl: json['original_url'] as String?,
      originalWidth: (json['original_width'] as num?)?.toInt(),
      originalHeight: (json['original_height'] as num?)?.toInt(),
    );

Map<String, dynamic> _$GameItem$Images$ItemToJson(
        GameItem$Images$Item instance) =>
    <String, dynamic>{
      'source': instance.source,
      'thumbnail_url': instance.thumbnailUrl,
      'thumbnail_width': instance.thumbnailWidth,
      'thumbnail_height': instance.thumbnailHeight,
      'original_url': instance.originalUrl,
      'original_width': instance.originalWidth,
      'original_height': instance.originalHeight,
    };

GameItem$UexPrices _$GameItem$UexPricesFromJson(Map<String, dynamic> json) =>
    GameItem$UexPrices(
      purchase: (json['purchase'] as List<dynamic>?)
              ?.map((e) => UexPrice.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$GameItem$UexPricesToJson(GameItem$UexPrices instance) =>
    <String, dynamic>{
      'purchase': instance.purchase?.map((e) => e.toJson()).toList(),
    };

ItemRelatedLink$Manufacturer _$ItemRelatedLink$ManufacturerFromJson(
        Map<String, dynamic> json) =>
    ItemRelatedLink$Manufacturer(
      code: json['code'] as String?,
      name: json['name'] as String?,
      link: json['link'] as String?,
    );

Map<String, dynamic> _$ItemRelatedLink$ManufacturerToJson(
        ItemRelatedLink$Manufacturer instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'link': instance.link,
    };

GamePortItemSummary$Manufacturer _$GamePortItemSummary$ManufacturerFromJson(
        Map<String, dynamic> json) =>
    GamePortItemSummary$Manufacturer(
      name: json['name'] as String?,
    );

Map<String, dynamic> _$GamePortItemSummary$ManufacturerToJson(
        GamePortItemSummary$Manufacturer instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

ResourceContainer$Capacity _$ResourceContainer$CapacityFromJson(
        Map<String, dynamic> json) =>
    ResourceContainer$Capacity(
      value: (json['value'] as num?)?.toDouble(),
      unit: json['unit'] as String?,
      unitName: json['unit_name'] as String?,
      scu: (json['scu'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ResourceContainer$CapacityToJson(
        ResourceContainer$Capacity instance) =>
    <String, dynamic>{
      'value': instance.value,
      'unit': instance.unit,
      'unit_name': instance.unitName,
      'scu': instance.scu,
    };

ResourceNetworkDelta$Composition$Item
    _$ResourceNetworkDelta$Composition$ItemFromJson(
            Map<String, dynamic> json) =>
        ResourceNetworkDelta$Composition$Item(
          containerResource: json['container_resource'] as String?,
          ratio: (json['ratio'] as num?)?.toDouble(),
        );

Map<String, dynamic> _$ResourceNetworkDelta$Composition$ItemToJson(
        ResourceNetworkDelta$Composition$Item instance) =>
    <String, dynamic>{
      'container_resource': instance.containerResource,
      'ratio': instance.ratio,
    };

ResourceNetworkState$Signature _$ResourceNetworkState$SignatureFromJson(
        Map<String, dynamic> json) =>
    ResourceNetworkState$Signature(
      em: (json['em'] as num?)?.toDouble(),
      ir: (json['ir'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ResourceNetworkState$SignatureToJson(
        ResourceNetworkState$Signature instance) =>
    <String, dynamic>{
      'em': instance.em,
      'ir': instance.ir,
    };

ResourceNetworkState$PowerRanges$Item
    _$ResourceNetworkState$PowerRanges$ItemFromJson(
            Map<String, dynamic> json) =>
        ResourceNetworkState$PowerRanges$Item(
          start: (json['start'] as num?)?.toDouble(),
          modifier: (json['modifier'] as num?)?.toDouble(),
          registerRange: json['register_range'] as bool?,
        );

Map<String, dynamic> _$ResourceNetworkState$PowerRanges$ItemToJson(
        ResourceNetworkState$PowerRanges$Item instance) =>
    <String, dynamic>{
      'start': instance.start,
      'modifier': instance.modifier,
      'register_range': instance.registerRange,
    };

ResourceNetwork$Repair _$ResourceNetwork$RepairFromJson(
        Map<String, dynamic> json) =>
    ResourceNetwork$Repair(
      maxRepairCount: (json['max_repair_count'] as num?)?.toInt(),
      timeToRepair: (json['time_to_repair'] as num?)?.toDouble(),
      healthRatio: (json['health_ratio'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ResourceNetwork$RepairToJson(
        ResourceNetwork$Repair instance) =>
    <String, dynamic>{
      'max_repair_count': instance.maxRepairCount,
      'time_to_repair': instance.timeToRepair,
      'health_ratio': instance.healthRatio,
    };

ResourceNetwork$Usage _$ResourceNetwork$UsageFromJson(
        Map<String, dynamic> json) =>
    ResourceNetwork$Usage(
      power: json['power'] == null
          ? null
          : ResourceNetwork$Usage$Power.fromJson(
              json['power'] as Map<String, dynamic>),
      coolant: json['coolant'] == null
          ? null
          : ResourceNetwork$Usage$Coolant.fromJson(
              json['coolant'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResourceNetwork$UsageToJson(
        ResourceNetwork$Usage instance) =>
    <String, dynamic>{
      'power': instance.power?.toJson(),
      'coolant': instance.coolant?.toJson(),
    };

ResourceNetwork$Generation _$ResourceNetwork$GenerationFromJson(
        Map<String, dynamic> json) =>
    ResourceNetwork$Generation(
      coolant: (json['coolant'] as num?)?.toDouble(),
      power: (json['power'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ResourceNetwork$GenerationToJson(
        ResourceNetwork$Generation instance) =>
    <String, dynamic>{
      'coolant': instance.coolant,
      'power': instance.power,
    };

Ammunition$Penetration _$Ammunition$PenetrationFromJson(
        Map<String, dynamic> json) =>
    Ammunition$Penetration(
      baseDistance: (json['base_distance'] as num?)?.toDouble(),
      nearRadius: (json['near_radius'] as num?)?.toDouble(),
      farRadius: (json['far_radius'] as num?)?.toDouble(),
      angle: (json['angle'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$Ammunition$PenetrationToJson(
        Ammunition$Penetration instance) =>
    <String, dynamic>{
      'base_distance': instance.baseDistance,
      'near_radius': instance.nearRadius,
      'far_radius': instance.farRadius,
      'angle': instance.angle,
    };

Ammunition$ImpactDamageMap _$Ammunition$ImpactDamageMapFromJson(
        Map<String, dynamic> json) =>
    Ammunition$ImpactDamageMap(
      physical: (json['physical'] as num?)?.toDouble(),
      energy: (json['energy'] as num?)?.toDouble(),
      distortion: (json['distortion'] as num?)?.toDouble(),
      thermal: (json['thermal'] as num?)?.toDouble(),
      biochemical: (json['biochemical'] as num?)?.toDouble(),
      stun: (json['stun'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$Ammunition$ImpactDamageMapToJson(
        Ammunition$ImpactDamageMap instance) =>
    <String, dynamic>{
      'physical': instance.physical,
      'energy': instance.energy,
      'distortion': instance.distortion,
      'thermal': instance.thermal,
      'biochemical': instance.biochemical,
      'stun': instance.stun,
    };

Ammunition$DetonationDamageMap _$Ammunition$DetonationDamageMapFromJson(
        Map<String, dynamic> json) =>
    Ammunition$DetonationDamageMap(
      physical: (json['physical'] as num?)?.toDouble(),
      energy: (json['energy'] as num?)?.toDouble(),
      distortion: (json['distortion'] as num?)?.toDouble(),
      thermal: (json['thermal'] as num?)?.toDouble(),
      biochemical: (json['biochemical'] as num?)?.toDouble(),
      stun: (json['stun'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$Ammunition$DetonationDamageMapToJson(
        Ammunition$DetonationDamageMap instance) =>
    <String, dynamic>{
      'physical': instance.physical,
      'energy': instance.energy,
      'distortion': instance.distortion,
      'thermal': instance.thermal,
      'biochemical': instance.biochemical,
      'stun': instance.stun,
    };

Ammunition$ExplosionRadius _$Ammunition$ExplosionRadiusFromJson(
        Map<String, dynamic> json) =>
    Ammunition$ExplosionRadius(
      min: (json['min'] as num?)?.toDouble(),
      max: (json['max'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$Ammunition$ExplosionRadiusToJson(
        Ammunition$ExplosionRadius instance) =>
    <String, dynamic>{
      'min': instance.min,
      'max': instance.max,
    };

Ammunition$DamageDropMinDistance _$Ammunition$DamageDropMinDistanceFromJson(
        Map<String, dynamic> json) =>
    Ammunition$DamageDropMinDistance(
      physical: (json['physical'] as num?)?.toDouble(),
      energy: (json['energy'] as num?)?.toDouble(),
      distortion: (json['distortion'] as num?)?.toDouble(),
      thermal: (json['thermal'] as num?)?.toDouble(),
      biochemical: (json['biochemical'] as num?)?.toDouble(),
      stun: (json['stun'] as num?)?.toDouble(),
      total: (json['total'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$Ammunition$DamageDropMinDistanceToJson(
        Ammunition$DamageDropMinDistance instance) =>
    <String, dynamic>{
      'physical': instance.physical,
      'energy': instance.energy,
      'distortion': instance.distortion,
      'thermal': instance.thermal,
      'biochemical': instance.biochemical,
      'stun': instance.stun,
      'total': instance.total,
    };

Ammunition$DamageDropPerMeter _$Ammunition$DamageDropPerMeterFromJson(
        Map<String, dynamic> json) =>
    Ammunition$DamageDropPerMeter(
      physical: (json['physical'] as num?)?.toDouble(),
      energy: (json['energy'] as num?)?.toDouble(),
      distortion: (json['distortion'] as num?)?.toDouble(),
      thermal: (json['thermal'] as num?)?.toDouble(),
      biochemical: (json['biochemical'] as num?)?.toDouble(),
      stun: (json['stun'] as num?)?.toDouble(),
      total: (json['total'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$Ammunition$DamageDropPerMeterToJson(
        Ammunition$DamageDropPerMeter instance) =>
    <String, dynamic>{
      'physical': instance.physical,
      'energy': instance.energy,
      'distortion': instance.distortion,
      'thermal': instance.thermal,
      'biochemical': instance.biochemical,
      'stun': instance.stun,
      'total': instance.total,
    };

Ammunition$DamageDropMinDamage _$Ammunition$DamageDropMinDamageFromJson(
        Map<String, dynamic> json) =>
    Ammunition$DamageDropMinDamage(
      physical: (json['physical'] as num?)?.toDouble(),
      energy: (json['energy'] as num?)?.toDouble(),
      distortion: (json['distortion'] as num?)?.toDouble(),
      thermal: (json['thermal'] as num?)?.toDouble(),
      biochemical: (json['biochemical'] as num?)?.toDouble(),
      stun: (json['stun'] as num?)?.toDouble(),
      total: (json['total'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$Ammunition$DamageDropMinDamageToJson(
        Ammunition$DamageDropMinDamage instance) =>
    <String, dynamic>{
      'physical': instance.physical,
      'energy': instance.energy,
      'distortion': instance.distortion,
      'thermal': instance.thermal,
      'biochemical': instance.biochemical,
      'stun': instance.stun,
      'total': instance.total,
    };

Ammunition$BulletImpulseFalloff _$Ammunition$BulletImpulseFalloffFromJson(
        Map<String, dynamic> json) =>
    Ammunition$BulletImpulseFalloff(
      minDistance: (json['min_distance'] as num?)?.toDouble(),
      dropFalloff: (json['drop_falloff'] as num?)?.toDouble(),
      maxFalloff: (json['max_falloff'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$Ammunition$BulletImpulseFalloffToJson(
        Ammunition$BulletImpulseFalloff instance) =>
    <String, dynamic>{
      'min_distance': instance.minDistance,
      'drop_falloff': instance.dropFalloff,
      'max_falloff': instance.maxFalloff,
    };

Ammunition$BulletElectron _$Ammunition$BulletElectronFromJson(
        Map<String, dynamic> json) =>
    Ammunition$BulletElectron(
      jumpRange: (json['jump_range'] as num?)?.toDouble(),
      maximumJumps: (json['maximum_jumps'] as num?)?.toInt(),
      residualChargeMultiplier:
          (json['residual_charge_multiplier'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$Ammunition$BulletElectronToJson(
        Ammunition$BulletElectron instance) =>
    <String, dynamic>{
      'jump_range': instance.jumpRange,
      'maximum_jumps': instance.maximumJumps,
      'residual_charge_multiplier': instance.residualChargeMultiplier,
    };

Ammunition$DamageFalloffs _$Ammunition$DamageFalloffsFromJson(
        Map<String, dynamic> json) =>
    Ammunition$DamageFalloffs(
      minDistance: json['min_distance'],
      perMeter: json['per_meter'],
      minDamage: json['min_damage'],
    );

Map<String, dynamic> _$Ammunition$DamageFalloffsToJson(
        Ammunition$DamageFalloffs instance) =>
    <String, dynamic>{
      'min_distance': instance.minDistance,
      'per_meter': instance.perMeter,
      'min_damage': instance.minDamage,
    };

VehicleArmor$SignalMultiplier _$VehicleArmor$SignalMultiplierFromJson(
        Map<String, dynamic> json) =>
    VehicleArmor$SignalMultiplier(
      crossSection: (json['cross_section'] as num?)?.toDouble(),
      crossSectionChange: (json['cross_section_change'] as num?)?.toDouble(),
      infrared: (json['infrared'] as num?)?.toDouble(),
      infraredChange: (json['infrared_change'] as num?)?.toDouble(),
      electromagnetic: (json['electromagnetic'] as num?)?.toDouble(),
      electromagneticChange:
          (json['electromagnetic_change'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$VehicleArmor$SignalMultiplierToJson(
        VehicleArmor$SignalMultiplier instance) =>
    <String, dynamic>{
      'cross_section': instance.crossSection,
      'cross_section_change': instance.crossSectionChange,
      'infrared': instance.infrared,
      'infrared_change': instance.infraredChange,
      'electromagnetic': instance.electromagnetic,
      'electromagnetic_change': instance.electromagneticChange,
    };

VehicleArmor$DamageMultiplier _$VehicleArmor$DamageMultiplierFromJson(
        Map<String, dynamic> json) =>
    VehicleArmor$DamageMultiplier(
      physical: (json['physical'] as num?)?.toDouble(),
      physicalChange: (json['physical_change'] as num?)?.toDouble(),
      energy: (json['energy'] as num?)?.toDouble(),
      energyChange: (json['energy_change'] as num?)?.toDouble(),
      distortion: (json['distortion'] as num?)?.toDouble(),
      distortionChange: (json['distortion_change'] as num?)?.toDouble(),
      thermal: (json['thermal'] as num?)?.toDouble(),
      thermalChange: (json['thermal_change'] as num?)?.toDouble(),
      biochemical: (json['biochemical'] as num?)?.toDouble(),
      biochemicalChange: (json['biochemical_change'] as num?)?.toDouble(),
      stun: (json['stun'] as num?)?.toDouble(),
      stunChange: (json['stun_change'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$VehicleArmor$DamageMultiplierToJson(
        VehicleArmor$DamageMultiplier instance) =>
    <String, dynamic>{
      'physical': instance.physical,
      'physical_change': instance.physicalChange,
      'energy': instance.energy,
      'energy_change': instance.energyChange,
      'distortion': instance.distortion,
      'distortion_change': instance.distortionChange,
      'thermal': instance.thermal,
      'thermal_change': instance.thermalChange,
      'biochemical': instance.biochemical,
      'biochemical_change': instance.biochemicalChange,
      'stun': instance.stun,
      'stun_change': instance.stunChange,
    };

VehicleArmor$ResistanceMultiplier _$VehicleArmor$ResistanceMultiplierFromJson(
        Map<String, dynamic> json) =>
    VehicleArmor$ResistanceMultiplier(
      physical: (json['physical'] as num?)?.toDouble(),
      physicalChange: (json['physical_change'] as num?)?.toDouble(),
      energy: (json['energy'] as num?)?.toDouble(),
      energyChange: (json['energy_change'] as num?)?.toDouble(),
      distortion: (json['distortion'] as num?)?.toDouble(),
      distortionChange: (json['distortion_change'] as num?)?.toDouble(),
      thermal: (json['thermal'] as num?)?.toDouble(),
      thermalChange: (json['thermal_change'] as num?)?.toDouble(),
      biochemical: (json['biochemical'] as num?)?.toDouble(),
      biochemicalChange: (json['biochemical_change'] as num?)?.toDouble(),
      stun: (json['stun'] as num?)?.toDouble(),
      stunChange: (json['stun_change'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$VehicleArmor$ResistanceMultiplierToJson(
        VehicleArmor$ResistanceMultiplier instance) =>
    <String, dynamic>{
      'physical': instance.physical,
      'physical_change': instance.physicalChange,
      'energy': instance.energy,
      'energy_change': instance.energyChange,
      'distortion': instance.distortion,
      'distortion_change': instance.distortionChange,
      'thermal': instance.thermal,
      'thermal_change': instance.thermalChange,
      'biochemical': instance.biochemical,
      'biochemical_change': instance.biochemicalChange,
      'stun': instance.stun,
      'stun_change': instance.stunChange,
    };

VehicleArmor$Deflection _$VehicleArmor$DeflectionFromJson(
        Map<String, dynamic> json) =>
    VehicleArmor$Deflection(
      physical: (json['physical'] as num?)?.toDouble(),
      energy: (json['energy'] as num?)?.toDouble(),
      distortion: (json['distortion'] as num?)?.toDouble(),
      thermal: (json['thermal'] as num?)?.toDouble(),
      biochemical: (json['biochemical'] as num?)?.toDouble(),
      stun: (json['stun'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$VehicleArmor$DeflectionToJson(
        VehicleArmor$Deflection instance) =>
    <String, dynamic>{
      'physical': instance.physical,
      'energy': instance.energy,
      'distortion': instance.distortion,
      'thermal': instance.thermal,
      'biochemical': instance.biochemical,
      'stun': instance.stun,
    };

VehicleArmor$PenetrationResistance _$VehicleArmor$PenetrationResistanceFromJson(
        Map<String, dynamic> json) =>
    VehicleArmor$PenetrationResistance(
      base: (json['base'] as num?)?.toDouble(),
      physical: (json['physical'] as num?)?.toDouble(),
      energy: (json['energy'] as num?)?.toDouble(),
      distortion: (json['distortion'] as num?)?.toDouble(),
      thermal: (json['thermal'] as num?)?.toDouble(),
      biochemical: (json['biochemical'] as num?)?.toDouble(),
      stun: (json['stun'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$VehicleArmor$PenetrationResistanceToJson(
        VehicleArmor$PenetrationResistance instance) =>
    <String, dynamic>{
      'base': instance.base,
      'physical': instance.physical,
      'energy': instance.energy,
      'distortion': instance.distortion,
      'thermal': instance.thermal,
      'biochemical': instance.biochemical,
      'stun': instance.stun,
    };

Bomb$Explosion _$Bomb$ExplosionFromJson(Map<String, dynamic> json) =>
    Bomb$Explosion(
      requiresLauncher: json['requires_launcher'] as bool?,
      radiusMin: (json['radius_min'] as num?)?.toDouble(),
      radiusMax: (json['radius_max'] as num?)?.toDouble(),
      safetyDistance: (json['safety_distance'] as num?)?.toDouble(),
      proximity: (json['proximity'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$Bomb$ExplosionToJson(Bomb$Explosion instance) =>
    <String, dynamic>{
      'requires_launcher': instance.requiresLauncher,
      'radius_min': instance.radiusMin,
      'radius_max': instance.radiusMax,
      'safety_distance': instance.safetyDistance,
      'proximity': instance.proximity,
    };

Bomb$Delays _$Bomb$DelaysFromJson(Map<String, dynamic> json) => Bomb$Delays(
      armTime: (json['arm_time'] as num?)?.toDouble(),
      igniteTime: (json['ignite_time'] as num?)?.toDouble(),
      collisionDelayTime: (json['collision_delay_time'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$Bomb$DelaysToJson(Bomb$Delays instance) =>
    <String, dynamic>{
      'arm_time': instance.armTime,
      'ignite_time': instance.igniteTime,
      'collision_delay_time': instance.collisionDelayTime,
    };

Bomb$DamageMap _$Bomb$DamageMapFromJson(Map<String, dynamic> json) =>
    Bomb$DamageMap(
      physical: (json['physical'] as num?)?.toDouble(),
      energy: (json['energy'] as num?)?.toDouble(),
      distortion: (json['distortion'] as num?)?.toDouble(),
      thermal: (json['thermal'] as num?)?.toDouble(),
      biochemical: (json['biochemical'] as num?)?.toDouble(),
      stun: (json['stun'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$Bomb$DamageMapToJson(Bomb$DamageMap instance) =>
    <String, dynamic>{
      'physical': instance.physical,
      'energy': instance.energy,
      'distortion': instance.distortion,
      'thermal': instance.thermal,
      'biochemical': instance.biochemical,
      'stun': instance.stun,
    };

Clothing$Resistances$Item _$Clothing$Resistances$ItemFromJson(
        Map<String, dynamic> json) =>
    Clothing$Resistances$Item(
      type: json['type'] as String?,
      multiplier: (json['multiplier'] as num?)?.toDouble(),
      threshold: (json['threshold'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$Clothing$Resistances$ItemToJson(
        Clothing$Resistances$Item instance) =>
    <String, dynamic>{
      'type': instance.type,
      'multiplier': instance.multiplier,
      'threshold': instance.threshold,
    };

CounterMeasure$Signature _$CounterMeasure$SignatureFromJson(
        Map<String, dynamic> json) =>
    CounterMeasure$Signature(
      infrared: (json['infrared'] as num?)?.toDouble(),
      crossSection: (json['cross_section'] as num?)?.toDouble(),
      electromagnetic: (json['electromagnetic'] as num?)?.toDouble(),
      decibel: (json['decibel'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CounterMeasure$SignatureToJson(
        CounterMeasure$Signature instance) =>
    <String, dynamic>{
      'infrared': instance.infrared,
      'cross_section': instance.crossSection,
      'electromagnetic': instance.electromagnetic,
      'decibel': instance.decibel,
    };

Medicine$Container _$Medicine$ContainerFromJson(Map<String, dynamic> json) =>
    Medicine$Container(
      type: json['type'] as String?,
      closed: json['closed'] as bool?,
      canBeReclosed: json['can_be_reclosed'] as bool?,
      discardWhenConsumed: json['discard_when_consumed'] as bool?,
    );

Map<String, dynamic> _$Medicine$ContainerToJson(Medicine$Container instance) =>
    <String, dynamic>{
      'type': instance.type,
      'closed': instance.closed,
      'can_be_reclosed': instance.canBeReclosed,
      'discard_when_consumed': instance.discardWhenConsumed,
    };

Medicine$Consumption _$Medicine$ConsumptionFromJson(
        Map<String, dynamic> json) =>
    Medicine$Consumption(
      volume: (json['volume'] as num?)?.toDouble(),
      oneShotConsume: json['one_shot_consume'] as bool?,
    );

Map<String, dynamic> _$Medicine$ConsumptionToJson(
        Medicine$Consumption instance) =>
    <String, dynamic>{
      'volume': instance.volume,
      'one_shot_consume': instance.oneShotConsume,
    };

MiningModule$Usage _$MiningModule$UsageFromJson(Map<String, dynamic> json) =>
    MiningModule$Usage(
      charges: (json['charges'] as num?)?.toInt(),
      lifetimeSeconds: (json['lifetime_seconds'] as num?)?.toDouble(),
      uses: (json['uses'] as num?)?.toInt(),
      durationSeconds: (json['duration_seconds'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$MiningModule$UsageToJson(MiningModule$Usage instance) =>
    <String, dynamic>{
      'charges': instance.charges,
      'lifetime_seconds': instance.lifetimeSeconds,
      'uses': instance.uses,
      'duration_seconds': instance.durationSeconds,
    };

MiningModule$Modifiers _$MiningModule$ModifiersFromJson(
        Map<String, dynamic> json) =>
    MiningModule$Modifiers(
      miningLaserPowerPercent:
          (json['mining_laser_power_percent'] as num?)?.toDouble(),
      extractionLaserPowerPercent:
          (json['extraction_laser_power_percent'] as num?)?.toDouble(),
      optimalChargeWindowPercent:
          (json['optimal_charge_window_percent'] as num?)?.toDouble(),
      optimalChargeRatePercent:
          (json['optimal_charge_rate_percent'] as num?)?.toDouble(),
      allChargeRatesPercent:
          (json['all_charge_rates_percent'] as num?)?.toDouble(),
      inertMaterialModifierPercent:
          (json['inert_material_modifier_percent'] as num?)?.toDouble(),
      resistancePercent: (json['resistance_percent'] as num?)?.toDouble(),
      instabilityPercent: (json['instability_percent'] as num?)?.toDouble(),
      shatterDamagePercent:
          (json['shatter_damage_percent'] as num?)?.toDouble(),
      overchargeRatePercent:
          (json['overcharge_rate_percent'] as num?)?.toDouble(),
      clusterFactor: (json['cluster_factor'] as num?)?.toDouble(),
      damageMultiplier: (json['damage_multiplier'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$MiningModule$ModifiersToJson(
        MiningModule$Modifiers instance) =>
    <String, dynamic>{
      'mining_laser_power_percent': instance.miningLaserPowerPercent,
      'extraction_laser_power_percent': instance.extractionLaserPowerPercent,
      'optimal_charge_window_percent': instance.optimalChargeWindowPercent,
      'optimal_charge_rate_percent': instance.optimalChargeRatePercent,
      'all_charge_rates_percent': instance.allChargeRatesPercent,
      'inert_material_modifier_percent': instance.inertMaterialModifierPercent,
      'resistance_percent': instance.resistancePercent,
      'instability_percent': instance.instabilityPercent,
      'shatter_damage_percent': instance.shatterDamagePercent,
      'overcharge_rate_percent': instance.overchargeRatePercent,
      'cluster_factor': instance.clusterFactor,
      'damage_multiplier': instance.damageMultiplier,
    };

VehicleWeapon$MagazineVolume _$VehicleWeapon$MagazineVolumeFromJson(
        Map<String, dynamic> json) =>
    VehicleWeapon$MagazineVolume(
      microScu: (json['micro_scu'] as num?)?.toInt(),
      scu: (json['scu'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$VehicleWeapon$MagazineVolumeToJson(
        VehicleWeapon$MagazineVolume instance) =>
    <String, dynamic>{
      'micro_scu': instance.microScu,
      'scu': instance.scu,
    };

MissionPrerequisiteGroup$RequiredTags$Item
    _$MissionPrerequisiteGroup$RequiredTags$ItemFromJson(
            Map<String, dynamic> json) =>
        MissionPrerequisiteGroup$RequiredTags$Item(
          name: json['name'] as String?,
          uuid: json['uuid'] as String?,
        );

Map<String, dynamic> _$MissionPrerequisiteGroup$RequiredTags$ItemToJson(
        MissionPrerequisiteGroup$RequiredTags$Item instance) =>
    <String, dynamic>{
      'name': instance.name,
      'uuid': instance.uuid,
    };

MissionPrerequisiteGroup$ExcludedTags$Item
    _$MissionPrerequisiteGroup$ExcludedTags$ItemFromJson(
            Map<String, dynamic> json) =>
        MissionPrerequisiteGroup$ExcludedTags$Item(
          name: json['name'] as String?,
          uuid: json['uuid'] as String?,
        );

Map<String, dynamic> _$MissionPrerequisiteGroup$ExcludedTags$ItemToJson(
        MissionPrerequisiteGroup$ExcludedTags$Item instance) =>
    <String, dynamic>{
      'name': instance.name,
      'uuid': instance.uuid,
    };

MissionCombat$Summary _$MissionCombat$SummaryFromJson(
        Map<String, dynamic> json) =>
    MissionCombat$Summary(
      total: json['total'] == null
          ? null
          : MissionCombat$Summary$Total.fromJson(
              json['total'] as Map<String, dynamic>),
      byGroup: (json['by_group'] as List<dynamic>?)
          ?.map((e) => MissionCombat$Summary$ByGroup$Item.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MissionCombat$SummaryToJson(
        MissionCombat$Summary instance) =>
    <String, dynamic>{
      'total': instance.total?.toJson(),
      'by_group': instance.byGroup?.map((e) => e.toJson()).toList(),
    };

MissionCombat$Spawns$Item _$MissionCombat$Spawns$ItemFromJson(
        Map<String, dynamic> json) =>
    MissionCombat$Spawns$Item(
      role: json['role'] as String?,
      weight: (json['weight'] as num?)?.toInt(),
      groupName: json['group_name'] as String?,
      spawnKind: json['spawn_kind'] as String?,
      concurrentAmount: (json['concurrent_amount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MissionCombat$Spawns$ItemToJson(
        MissionCombat$Spawns$Item instance) =>
    <String, dynamic>{
      'role': instance.role,
      'weight': instance.weight,
      'group_name': instance.groupName,
      'spawn_kind': instance.spawnKind,
      'concurrent_amount': instance.concurrentAmount,
    };

MissionCombat$AggregatedSpawns$Item
    _$MissionCombat$AggregatedSpawns$ItemFromJson(Map<String, dynamic> json) =>
        MissionCombat$AggregatedSpawns$Item(
          role: json['role'] as String?,
          groupName: json['group_name'] as String?,
          spawnKind: json['spawn_kind'] as String?,
          concurrentMin: (json['concurrent_min'] as num?)?.toInt(),
          concurrentMax: (json['concurrent_max'] as num?)?.toInt(),
          weight: (json['weight'] as num?)?.toInt(),
        );

Map<String, dynamic> _$MissionCombat$AggregatedSpawns$ItemToJson(
        MissionCombat$AggregatedSpawns$Item instance) =>
    <String, dynamic>{
      'role': instance.role,
      'group_name': instance.groupName,
      'spawn_kind': instance.spawnKind,
      'concurrent_min': instance.concurrentMin,
      'concurrent_max': instance.concurrentMax,
      'weight': instance.weight,
    };

MissionIndex$Faction _$MissionIndex$FactionFromJson(
        Map<String, dynamic> json) =>
    MissionIndex$Faction(
      name: json['name'] as String?,
      uuid: json['uuid'] as String?,
      link: json['link'] as String?,
    );

Map<String, dynamic> _$MissionIndex$FactionToJson(
        MissionIndex$Faction instance) =>
    <String, dynamic>{
      'name': instance.name,
      'uuid': instance.uuid,
      'link': instance.link,
    };

MissionIndex$Variants$Item _$MissionIndex$Variants$ItemFromJson(
        Map<String, dynamic> json) =>
    MissionIndex$Variants$Item(
      uuid: json['uuid'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$MissionIndex$Variants$ItemToJson(
        MissionIndex$Variants$Item instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'title': instance.title,
    };

MissionIndex$MinStanding _$MissionIndex$MinStandingFromJson(
        Map<String, dynamic> json) =>
    MissionIndex$MinStanding(
      name: json['name'] as String?,
      minReputation: (json['min_reputation'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MissionIndex$MinStandingToJson(
        MissionIndex$MinStanding instance) =>
    <String, dynamic>{
      'name': instance.name,
      'min_reputation': instance.minReputation,
    };

MissionIndex$MaxStanding _$MissionIndex$MaxStandingFromJson(
        Map<String, dynamic> json) =>
    MissionIndex$MaxStanding(
      name: json['name'] as String?,
      minReputation: (json['min_reputation'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MissionIndex$MaxStandingToJson(
        MissionIndex$MaxStanding instance) =>
    <String, dynamic>{
      'name': instance.name,
      'min_reputation': instance.minReputation,
    };

MissionIndex$ReputationGained$Item _$MissionIndex$ReputationGained$ItemFromJson(
        Map<String, dynamic> json) =>
    MissionIndex$ReputationGained$Item(
      faction: json['faction'] as String?,
      factionUuid: json['faction_uuid'] as String?,
      scope: json['scope'] as String?,
      tier: json['tier'] as String?,
      amount: (json['amount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MissionIndex$ReputationGained$ItemToJson(
        MissionIndex$ReputationGained$Item instance) =>
    <String, dynamic>{
      'faction': instance.faction,
      'faction_uuid': instance.factionUuid,
      'scope': instance.scope,
      'tier': instance.tier,
      'amount': instance.amount,
    };

MissionIndex$HaulingSummary$Item _$MissionIndex$HaulingSummary$ItemFromJson(
        Map<String, dynamic> json) =>
    MissionIndex$HaulingSummary$Item(
      name: json['name'] as String?,
      minAmount: (json['min_amount'] as num?)?.toInt(),
      maxAmount: (json['max_amount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MissionIndex$HaulingSummary$ItemToJson(
        MissionIndex$HaulingSummary$Item instance) =>
    <String, dynamic>{
      'name': instance.name,
      'min_amount': instance.minAmount,
      'max_amount': instance.maxAmount,
    };

Mission$Faction _$Mission$FactionFromJson(Map<String, dynamic> json) =>
    Mission$Faction(
      name: json['name'] as String?,
      uuid: json['uuid'] as String?,
      factionType: json['faction_type'] as String?,
      lawful: json['lawful'] as bool?,
      isNpc: json['is_npc'] as bool?,
      hasReputation: json['has_reputation'] as bool?,
      headquarters: json['headquarters'] as String?,
      area: json['area'] as String?,
      focus: json['focus'] as String?,
      founded: json['founded'] as String?,
      leadership: json['leadership'] as String?,
      link: json['link'] as String?,
      reputationLadder: json['reputation_ladder'],
    );

Map<String, dynamic> _$Mission$FactionToJson(Mission$Faction instance) =>
    <String, dynamic>{
      'name': instance.name,
      'uuid': instance.uuid,
      'faction_type': instance.factionType,
      'lawful': instance.lawful,
      'is_npc': instance.isNpc,
      'has_reputation': instance.hasReputation,
      'headquarters': instance.headquarters,
      'area': instance.area,
      'focus': instance.focus,
      'founded': instance.founded,
      'leadership': instance.leadership,
      'link': instance.link,
      'reputation_ladder': instance.reputationLadder,
    };

Mission$MinStanding _$Mission$MinStandingFromJson(Map<String, dynamic> json) =>
    Mission$MinStanding(
      name: json['name'] as String?,
      minReputation: (json['min_reputation'] as num?)?.toInt(),
    );

Map<String, dynamic> _$Mission$MinStandingToJson(
        Mission$MinStanding instance) =>
    <String, dynamic>{
      'name': instance.name,
      'min_reputation': instance.minReputation,
    };

Mission$MaxStanding _$Mission$MaxStandingFromJson(Map<String, dynamic> json) =>
    Mission$MaxStanding(
      name: json['name'] as String?,
      minReputation: (json['min_reputation'] as num?)?.toInt(),
    );

Map<String, dynamic> _$Mission$MaxStandingToJson(
        Mission$MaxStanding instance) =>
    <String, dynamic>{
      'name': instance.name,
      'min_reputation': instance.minReputation,
    };

Mission$Deadline _$Mission$DeadlineFromJson(Map<String, dynamic> json) =>
    Mission$Deadline(
      autoEnd: json['auto_end'] as bool?,
      endReason: json['end_reason'] as String?,
      completionTimeMinutes: (json['completion_time_minutes'] as num?)?.toInt(),
      resultAfterTimer: json['result_after_timer'] as String?,
    );

Map<String, dynamic> _$Mission$DeadlineToJson(Mission$Deadline instance) =>
    <String, dynamic>{
      'auto_end': instance.autoEnd,
      'end_reason': instance.endReason,
      'completion_time_minutes': instance.completionTimeMinutes,
      'result_after_timer': instance.resultAfterTimer,
    };

Mission$BrokerReputationPrerequisites
    _$Mission$BrokerReputationPrerequisitesFromJson(
            Map<String, dynamic> json) =>
        Mission$BrokerReputationPrerequisites(
          maxWantedLevel: (json['max_wanted_level'] as num?)?.toInt(),
          minWantedLevel: (json['min_wanted_level'] as num?)?.toInt(),
        );

Map<String, dynamic> _$Mission$BrokerReputationPrerequisitesToJson(
        Mission$BrokerReputationPrerequisites instance) =>
    <String, dynamic>{
      'max_wanted_level': instance.maxWantedLevel,
      'min_wanted_level': instance.minWantedLevel,
    };

Mission$ItemCounts _$Mission$ItemCountsFromJson(Map<String, dynamic> json) =>
    Mission$ItemCounts(
      maxItems: (json['max_items'] as num?)?.toInt(),
      minItems: (json['min_items'] as num?)?.toInt(),
    );

Map<String, dynamic> _$Mission$ItemCountsToJson(Mission$ItemCounts instance) =>
    <String, dynamic>{
      'max_items': instance.maxItems,
      'min_items': instance.minItems,
    };

Mission$EntitySpawns$Item _$Mission$EntitySpawns$ItemFromJson(
        Map<String, dynamic> json) =>
    Mission$EntitySpawns$Item(
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as Object).toList() ??
              [],
      amount: (json['amount'] as num?)?.toInt(),
      weight: (json['weight'] as num?)?.toInt(),
      groupName: json['group_name'] as String?,
      markupTags: (json['markup_tags'] as List<dynamic>?)
              ?.map((e) => e as Object)
              .toList() ??
          [],
      negativeTags: (json['negative_tags'] as List<dynamic>?)
              ?.map((e) => e as Object)
              .toList() ??
          [],
      mergedTags: (json['merged_tags'] as List<dynamic>?)
              ?.map((e) => e as Object)
              .toList() ??
          [],
    );

Map<String, dynamic> _$Mission$EntitySpawns$ItemToJson(
        Mission$EntitySpawns$Item instance) =>
    <String, dynamic>{
      'tags': instance.tags,
      'amount': instance.amount,
      'weight': instance.weight,
      'group_name': instance.groupName,
      'markup_tags': instance.markupTags,
      'negative_tags': instance.negativeTags,
      'merged_tags': instance.mergedTags,
    };

MissionSummary$Faction _$MissionSummary$FactionFromJson(
        Map<String, dynamic> json) =>
    MissionSummary$Faction(
      name: json['name'] as String?,
      uuid: json['uuid'] as String?,
      link: json['link'] as String?,
    );

Map<String, dynamic> _$MissionSummary$FactionToJson(
        MissionSummary$Faction instance) =>
    <String, dynamic>{
      'name': instance.name,
      'uuid': instance.uuid,
      'link': instance.link,
    };

GameStarmapLocation$Images$Item _$GameStarmapLocation$Images$ItemFromJson(
        Map<String, dynamic> json) =>
    GameStarmapLocation$Images$Item(
      source: json['source'] as String?,
      thumbnailUrl: json['thumbnail_url'] as String?,
      thumbnailWidth: (json['thumbnail_width'] as num?)?.toInt(),
      thumbnailHeight: (json['thumbnail_height'] as num?)?.toInt(),
      originalUrl: json['original_url'] as String?,
      originalWidth: (json['original_width'] as num?)?.toInt(),
      originalHeight: (json['original_height'] as num?)?.toInt(),
    );

Map<String, dynamic> _$GameStarmapLocation$Images$ItemToJson(
        GameStarmapLocation$Images$Item instance) =>
    <String, dynamic>{
      'source': instance.source,
      'thumbnail_url': instance.thumbnailUrl,
      'thumbnail_width': instance.thumbnailWidth,
      'thumbnail_height': instance.thumbnailHeight,
      'original_url': instance.originalUrl,
      'original_width': instance.originalWidth,
      'original_height': instance.originalHeight,
    };

GameVehiclePort$Sizes _$GameVehiclePort$SizesFromJson(
        Map<String, dynamic> json) =>
    GameVehiclePort$Sizes(
      min: (json['min'] as num?)?.toInt(),
      max: (json['max'] as num?)?.toInt(),
    );

Map<String, dynamic> _$GameVehiclePort$SizesToJson(
        GameVehiclePort$Sizes instance) =>
    <String, dynamic>{
      'min': instance.min,
      'max': instance.max,
    };

GameVehiclePort$CompatibleTypes$Item
    _$GameVehiclePort$CompatibleTypes$ItemFromJson(Map<String, dynamic> json) =>
        GameVehiclePort$CompatibleTypes$Item(
          type: json['type'] as String?,
          subTypes: (json['sub_types'] as List<dynamic>?)
                  ?.map((e) => e as Object)
                  .toList() ??
              [],
        );

Map<String, dynamic> _$GameVehiclePort$CompatibleTypes$ItemToJson(
        GameVehiclePort$CompatibleTypes$Item instance) =>
    <String, dynamic>{
      'type': instance.type,
      'sub_types': instance.subTypes,
    };

GameVehiclePort$AttachedVehicle _$GameVehiclePort$AttachedVehicleFromJson(
        Map<String, dynamic> json) =>
    GameVehiclePort$AttachedVehicle(
      uuid: json['uuid'] as String?,
      name: json['name'] as String?,
      className: json['class_name'] as String?,
      sizeClass: (json['size_class'] as num?)?.toInt(),
      isSpaceship: json['is_spaceship'] as bool?,
      isVehicle: json['is_vehicle'] as bool?,
      isGravlev: json['is_gravlev'] as bool?,
      link: json['link'] as String?,
      webUrl: json['web_url'] as String?,
    );

Map<String, dynamic> _$GameVehiclePort$AttachedVehicleToJson(
        GameVehiclePort$AttachedVehicle instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'class_name': instance.className,
      'size_class': instance.sizeClass,
      'is_spaceship': instance.isSpaceship,
      'is_vehicle': instance.isVehicle,
      'is_gravlev': instance.isGravlev,
      'link': instance.link,
      'web_url': instance.webUrl,
    };

VehicleRelayEntry$ConnectedHardpoints$Item
    _$VehicleRelayEntry$ConnectedHardpoints$ItemFromJson(
            Map<String, dynamic> json) =>
        VehicleRelayEntry$ConnectedHardpoints$Item(
          category: json['category'] as String?,
          count: (json['count'] as num?)?.toInt(),
          items: (json['items'] as List<dynamic>?)
              ?.map((e) => VehicleRelayEntry$ConnectedHardpoints$Item$Items$Item
                  .fromJson(e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$VehicleRelayEntry$ConnectedHardpoints$ItemToJson(
        VehicleRelayEntry$ConnectedHardpoints$Item instance) =>
    <String, dynamic>{
      'category': instance.category,
      'count': instance.count,
      'items': instance.items?.map((e) => e.toJson()).toList(),
    };

VehicleRelayNetwork$Links$Item _$VehicleRelayNetwork$Links$ItemFromJson(
        Map<String, dynamic> json) =>
    VehicleRelayNetwork$Links$Item(
      from: json['from'] as String?,
      to: json['to'] as String?,
    );

Map<String, dynamic> _$VehicleRelayNetwork$Links$ItemToJson(
        VehicleRelayNetwork$Links$Item instance) =>
    <String, dynamic>{
      'from': instance.from,
      'to': instance.to,
    };

VehicleSuitStorage$ByLocker$Item _$VehicleSuitStorage$ByLocker$ItemFromJson(
        Map<String, dynamic> json) =>
    VehicleSuitStorage$ByLocker$Item(
      count: (json['count'] as num?)?.toInt(),
      name: json['name'] as String?,
      className: json['class_name'] as String?,
      port: json['port'] as String?,
      slotsTotal: (json['slots_total'] as num?)?.toInt(),
    );

Map<String, dynamic> _$VehicleSuitStorage$ByLocker$ItemToJson(
        VehicleSuitStorage$ByLocker$Item instance) =>
    <String, dynamic>{
      'count': instance.count,
      'name': instance.name,
      'class_name': instance.className,
      'port': instance.port,
      'slots_total': instance.slotsTotal,
    };

GameVehicleTurret$Mounts$Item _$GameVehicleTurret$Mounts$ItemFromJson(
        Map<String, dynamic> json) =>
    GameVehicleTurret$Mounts$Item(
      displayName: json['display_name'] as String?,
      hardpointName: json['hardpoint_name'] as String?,
      mountType: json['mount_type'] as String?,
      className: json['class_name'] as String?,
      size: (json['size'] as num?)?.toInt(),
      weaponSizes: (json['weapon_sizes'] as List<dynamic>?)
              ?.map((e) => e as Object)
              .toList() ??
          [],
      payloadSizes: (json['payload_sizes'] as List<dynamic>?)
              ?.map((e) => e as Object)
              .toList() ??
          [],
      payloadTypes: (json['payload_types'] as List<dynamic>?)
              ?.map((e) => e as Object)
              .toList() ??
          [],
      payloadClassNames: (json['payload_class_names'] as List<dynamic>?)
              ?.map((e) => e as Object)
              .toList() ??
          [],
    );

Map<String, dynamic> _$GameVehicleTurret$Mounts$ItemToJson(
        GameVehicleTurret$Mounts$Item instance) =>
    <String, dynamic>{
      'display_name': instance.displayName,
      'hardpoint_name': instance.hardpointName,
      'mount_type': instance.mountType,
      'class_name': instance.className,
      'size': instance.size,
      'weapon_sizes': instance.weaponSizes,
      'payload_sizes': instance.payloadSizes,
      'payload_types': instance.payloadTypes,
      'payload_class_names': instance.payloadClassNames,
    };

GameVehicleTurret$Weapons$Item _$GameVehicleTurret$Weapons$ItemFromJson(
        Map<String, dynamic> json) =>
    GameVehicleTurret$Weapons$Item(
      uuid: json['uuid'] as String?,
      className: json['class_name'] as String?,
      name: json['name'] as String?,
      link: json['link'] as String?,
      webUrl: json['web_url'] as String?,
      dps: (json['dps'] as num?)?.toDouble(),
      sustainedDps: (json['sustained_dps'] as num?)?.toDouble(),
      alpha: (json['alpha'] as num?)?.toDouble(),
      isPilotSlaveable: json['is_pilot_slaveable'] as bool?,
    );

Map<String, dynamic> _$GameVehicleTurret$Weapons$ItemToJson(
        GameVehicleTurret$Weapons$Item instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'class_name': instance.className,
      'name': instance.name,
      'link': instance.link,
      'web_url': instance.webUrl,
      'dps': instance.dps,
      'sustained_dps': instance.sustainedDps,
      'alpha': instance.alpha,
      'is_pilot_slaveable': instance.isPilotSlaveable,
    };

GameVehicle$Dimension _$GameVehicle$DimensionFromJson(
        Map<String, dynamic> json) =>
    GameVehicle$Dimension(
      length: (json['length'] as num?)?.toDouble(),
      width: (json['width'] as num?)?.toDouble(),
      height: (json['height'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$GameVehicle$DimensionToJson(
        GameVehicle$Dimension instance) =>
    <String, dynamic>{
      'length': instance.length,
      'width': instance.width,
      'height': instance.height,
    };

GameVehicle$Sizes _$GameVehicle$SizesFromJson(Map<String, dynamic> json) =>
    GameVehicle$Sizes(
      length: (json['length'] as num?)?.toDouble(),
      beam: (json['beam'] as num?)?.toDouble(),
      height: (json['height'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$GameVehicle$SizesToJson(GameVehicle$Sizes instance) =>
    <String, dynamic>{
      'length': instance.length,
      'beam': instance.beam,
      'height': instance.height,
    };

GameVehicle$Emission _$GameVehicle$EmissionFromJson(
        Map<String, dynamic> json) =>
    GameVehicle$Emission(
      ir: (json['ir'] as num?)?.toDouble(),
      emIdle: (json['em_idle'] as num?)?.toDouble(),
      emMax: (json['em_max'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$GameVehicle$EmissionToJson(
        GameVehicle$Emission instance) =>
    <String, dynamic>{
      'ir': instance.ir,
      'em_idle': instance.emIdle,
      'em_max': instance.emMax,
    };

GameVehicle$CargoLimits _$GameVehicle$CargoLimitsFromJson(
        Map<String, dynamic> json) =>
    GameVehicle$CargoLimits(
      min: json['min'] == null
          ? null
          : GameVehicle$CargoLimits$Min.fromJson(
              json['min'] as Map<String, dynamic>),
      minScuBox: (json['min_scu_box'] as num?)?.toDouble(),
      max: json['max'] == null
          ? null
          : GameVehicle$CargoLimits$Max.fromJson(
              json['max'] as Map<String, dynamic>),
      maxScuBox: (json['max_scu_box'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$GameVehicle$CargoLimitsToJson(
        GameVehicle$CargoLimits instance) =>
    <String, dynamic>{
      'min': instance.min?.toJson(),
      'min_scu_box': instance.minScuBox,
      'max': instance.max?.toJson(),
      'max_scu_box': instance.maxScuBox,
    };

GameVehicle$Crew _$GameVehicle$CrewFromJson(Map<String, dynamic> json) =>
    GameVehicle$Crew(
      min: (json['min'] as num?)?.toInt(),
      max: (json['max'] as num?)?.toInt(),
      weapon: (json['weapon'] as num?)?.toInt(),
      operation: (json['operation'] as num?)?.toInt(),
    );

Map<String, dynamic> _$GameVehicle$CrewToJson(GameVehicle$Crew instance) =>
    <String, dynamic>{
      'min': instance.min,
      'max': instance.max,
      'weapon': instance.weapon,
      'operation': instance.operation,
    };

GameVehicle$Seating _$GameVehicle$SeatingFromJson(Map<String, dynamic> json) =>
    GameVehicle$Seating(
      crewStations: (json['crew_stations'] as num?)?.toInt(),
      ejectionSeats: (json['ejection_seats'] as num?)?.toInt(),
      escapePods: (json['escape_pods'] as num?)?.toInt(),
      jumpSeats: (json['jump_seats'] as num?)?.toInt(),
      beds: (json['beds'] as num?)?.toInt(),
      medicalBeds: json['medical_beds'],
    );

Map<String, dynamic> _$GameVehicle$SeatingToJson(
        GameVehicle$Seating instance) =>
    <String, dynamic>{
      'crew_stations': instance.crewStations,
      'ejection_seats': instance.ejectionSeats,
      'escape_pods': instance.escapePods,
      'jump_seats': instance.jumpSeats,
      'beds': instance.beds,
      'medical_beds': instance.medicalBeds,
    };

GameVehicle$Shield _$GameVehicle$ShieldFromJson(Map<String, dynamic> json) =>
    GameVehicle$Shield(
      hp: (json['hp'] as num?)?.toDouble(),
      regeneration: (json['regeneration'] as num?)?.toDouble(),
      regenerationTime: (json['regeneration_time'] as num?)?.toDouble(),
      faceType: json['face_type'] as String?,
      maxReallocation: (json['max_reallocation'] as num?)?.toDouble(),
      reconfigurationCooldown:
          (json['reconfiguration_cooldown'] as num?)?.toDouble(),
      maxElectricalChargeDamageRate:
          (json['max_electrical_charge_damage_rate'] as num?)?.toDouble(),
      resistance: json['resistance'] == null
          ? null
          : GameVehicle$Shield$Resistance.fromJson(
              json['resistance'] as Map<String, dynamic>),
      absorption: json['absorption'] == null
          ? null
          : GameVehicle$Shield$Absorption.fromJson(
              json['absorption'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GameVehicle$ShieldToJson(GameVehicle$Shield instance) =>
    <String, dynamic>{
      'hp': instance.hp,
      'regeneration': instance.regeneration,
      'regeneration_time': instance.regenerationTime,
      'face_type': instance.faceType,
      'max_reallocation': instance.maxReallocation,
      'reconfiguration_cooldown': instance.reconfigurationCooldown,
      'max_electrical_charge_damage_rate':
          instance.maxElectricalChargeDamageRate,
      'resistance': instance.resistance?.toJson(),
      'absorption': instance.absorption?.toJson(),
    };

GameVehicle$WeaponSnapshot _$GameVehicle$WeaponSnapshotFromJson(
        Map<String, dynamic> json) =>
    GameVehicle$WeaponSnapshot(
      pilotGunsCount: (json['pilot_guns_count'] as num?)?.toInt(),
      turretsMannedCount: (json['turrets_manned_count'] as num?)?.toInt(),
      turretsRemoteCount: (json['turrets_remote_count'] as num?)?.toInt(),
      turretWeaponGunsCount:
          (json['turret_weapon_guns_count'] as num?)?.toInt(),
      missileRackCount: (json['missile_rack_count'] as num?)?.toInt(),
      missileCount: (json['missile_count'] as num?)?.toInt(),
      countermeasuresCount: (json['countermeasures_count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$GameVehicle$WeaponSnapshotToJson(
        GameVehicle$WeaponSnapshot instance) =>
    <String, dynamic>{
      'pilot_guns_count': instance.pilotGunsCount,
      'turrets_manned_count': instance.turretsMannedCount,
      'turrets_remote_count': instance.turretsRemoteCount,
      'turret_weapon_guns_count': instance.turretWeaponGunsCount,
      'missile_rack_count': instance.missileRackCount,
      'missile_count': instance.missileCount,
      'countermeasures_count': instance.countermeasuresCount,
    };

GameVehicle$Speed _$GameVehicle$SpeedFromJson(Map<String, dynamic> json) =>
    GameVehicle$Speed(
      scm: (json['scm'] as num?)?.toDouble(),
      max: (json['max'] as num?)?.toDouble(),
      boostForward: (json['boost_forward'] as num?)?.toDouble(),
      boostBackward: (json['boost_backward'] as num?)?.toDouble(),
      zeroToScm: (json['zero_to_scm'] as num?)?.toDouble(),
      zeroToMax: (json['zero_to_max'] as num?)?.toDouble(),
      scmToZero: (json['scm_to_zero'] as num?)?.toDouble(),
      maxToZero: (json['max_to_zero'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$GameVehicle$SpeedToJson(GameVehicle$Speed instance) =>
    <String, dynamic>{
      'scm': instance.scm,
      'max': instance.max,
      'boost_forward': instance.boostForward,
      'boost_backward': instance.boostBackward,
      'zero_to_scm': instance.zeroToScm,
      'zero_to_max': instance.zeroToMax,
      'scm_to_zero': instance.scmToZero,
      'max_to_zero': instance.maxToZero,
    };

GameVehicle$Agility _$GameVehicle$AgilityFromJson(Map<String, dynamic> json) =>
    GameVehicle$Agility(
      pitch: (json['pitch'] as num?)?.toDouble(),
      yaw: (json['yaw'] as num?)?.toDouble(),
      roll: (json['roll'] as num?)?.toDouble(),
      pitchBoosted: (json['pitch_boosted'] as num?)?.toDouble(),
      yawBoosted: (json['yaw_boosted'] as num?)?.toDouble(),
      rollBoosted: (json['roll_boosted'] as num?)?.toDouble(),
      acceleration: json['acceleration'] == null
          ? null
          : GameVehicle$Agility$Acceleration.fromJson(
              json['acceleration'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GameVehicle$AgilityToJson(
        GameVehicle$Agility instance) =>
    <String, dynamic>{
      'pitch': instance.pitch,
      'yaw': instance.yaw,
      'roll': instance.roll,
      'pitch_boosted': instance.pitchBoosted,
      'yaw_boosted': instance.yawBoosted,
      'roll_boosted': instance.rollBoosted,
      'acceleration': instance.acceleration?.toJson(),
    };

GameVehicle$Afterburner _$GameVehicle$AfterburnerFromJson(
        Map<String, dynamic> json) =>
    GameVehicle$Afterburner(
      pitchBoostMultiplier:
          (json['pitch_boost_multiplier'] as num?)?.toDouble(),
      rollBoostMultiplier: (json['roll_boost_multiplier'] as num?)?.toDouble(),
      yawBoostMultiplier: (json['yaw_boost_multiplier'] as num?)?.toDouble(),
      capacitor: (json['capacitor'] as num?)?.toDouble(),
      idleCost: (json['idle_cost'] as num?)?.toDouble(),
      linearCost: (json['linear_cost'] as num?)?.toDouble(),
      angularCost: (json['angular_cost'] as num?)?.toDouble(),
      regenPerSecond: (json['regen_per_second'] as num?)?.toDouble(),
      regenDelayAfterUse: (json['regen_delay_after_use'] as num?)?.toDouble(),
      preDelayTime: (json['pre_delay_time'] as num?)?.toDouble(),
      rampUpTime: (json['ramp_up_time'] as num?)?.toDouble(),
      rampDownTime: (json['ramp_down_time'] as num?)?.toDouble(),
      regenTime: (json['regen_time'] as num?)?.toDouble(),
      regenDelay: (json['regen_delay'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$GameVehicle$AfterburnerToJson(
        GameVehicle$Afterburner instance) =>
    <String, dynamic>{
      'pitch_boost_multiplier': instance.pitchBoostMultiplier,
      'roll_boost_multiplier': instance.rollBoostMultiplier,
      'yaw_boost_multiplier': instance.yawBoostMultiplier,
      'capacitor': instance.capacitor,
      'idle_cost': instance.idleCost,
      'linear_cost': instance.linearCost,
      'angular_cost': instance.angularCost,
      'regen_per_second': instance.regenPerSecond,
      'regen_delay_after_use': instance.regenDelayAfterUse,
      'pre_delay_time': instance.preDelayTime,
      'ramp_up_time': instance.rampUpTime,
      'ramp_down_time': instance.rampDownTime,
      'regen_time': instance.regenTime,
      'regen_delay': instance.regenDelay,
    };

GameVehicle$Fuel _$GameVehicle$FuelFromJson(Map<String, dynamic> json) =>
    GameVehicle$Fuel(
      capacity: (json['capacity'] as num?)?.toDouble(),
      intakeRate: (json['intake_rate'] as num?)?.toDouble(),
      usage: json['usage'] == null
          ? null
          : GameVehicle$Fuel$Usage.fromJson(
              json['usage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GameVehicle$FuelToJson(GameVehicle$Fuel instance) =>
    <String, dynamic>{
      'capacity': instance.capacity,
      'intake_rate': instance.intakeRate,
      'usage': instance.usage?.toJson(),
    };

GameVehicle$Quantum _$GameVehicle$QuantumFromJson(Map<String, dynamic> json) =>
    GameVehicle$Quantum(
      quantumSpeed: (json['quantum_speed'] as num?)?.toDouble(),
      quantumSpoolTime: (json['quantum_spool_time'] as num?)?.toDouble(),
      quantumFuelCapacity: (json['quantum_fuel_capacity'] as num?)?.toDouble(),
      quantumRange: (json['quantum_range'] as num?)?.toDouble(),
      portOlisarToArccorpTime:
          (json['port_olisar_to_arccorp_time'] as num?)?.toDouble(),
      portOlisarToArccorpFuel:
          (json['port_olisar_to_arccorp_fuel'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$GameVehicle$QuantumToJson(
        GameVehicle$Quantum instance) =>
    <String, dynamic>{
      'quantum_speed': instance.quantumSpeed,
      'quantum_spool_time': instance.quantumSpoolTime,
      'quantum_fuel_capacity': instance.quantumFuelCapacity,
      'quantum_range': instance.quantumRange,
      'port_olisar_to_arccorp_time': instance.portOlisarToArccorpTime,
      'port_olisar_to_arccorp_fuel': instance.portOlisarToArccorpFuel,
    };

GameVehicle$Drive _$GameVehicle$DriveFromJson(Map<String, dynamic> json) =>
    GameVehicle$Drive(
      maxSpeedKph: (json['max_speed_kph'] as num?)?.toDouble(),
      maxSpeedMs: (json['max_speed_ms'] as num?)?.toDouble(),
      reverseSpeedKph: (json['reverse_speed_kph'] as num?)?.toDouble(),
      reverseSpeedMs: (json['reverse_speed_ms'] as num?)?.toDouble(),
      isTracked: json['is_tracked'] as bool?,
      wheels: json['wheels'] == null
          ? null
          : GameVehicle$Drive$Wheels.fromJson(
              json['wheels'] as Map<String, dynamic>),
      agility: json['agility'] == null
          ? null
          : GameVehicle$Drive$Agility.fromJson(
              json['agility'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GameVehicle$DriveToJson(GameVehicle$Drive instance) =>
    <String, dynamic>{
      'max_speed_kph': instance.maxSpeedKph,
      'max_speed_ms': instance.maxSpeedMs,
      'reverse_speed_kph': instance.reverseSpeedKph,
      'reverse_speed_ms': instance.reverseSpeedMs,
      'is_tracked': instance.isTracked,
      'wheels': instance.wheels?.toJson(),
      'agility': instance.agility?.toJson(),
    };

GameVehicle$Propulsion _$GameVehicle$PropulsionFromJson(
        Map<String, dynamic> json) =>
    GameVehicle$Propulsion(
      thrusters: (json['thrusters'] as List<dynamic>?)
          ?.map((e) => GameVehicle$Propulsion$Thrusters$Item.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      thrustCapacity: json['thrust_capacity'] == null
          ? null
          : GameVehicle$Propulsion$ThrustCapacity.fromJson(
              json['thrust_capacity'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GameVehicle$PropulsionToJson(
        GameVehicle$Propulsion instance) =>
    <String, dynamic>{
      'thrusters': instance.thrusters?.map((e) => e.toJson()).toList(),
      'thrust_capacity': instance.thrustCapacity?.toJson(),
    };

GameVehicle$Weaponry _$GameVehicle$WeaponryFromJson(
        Map<String, dynamic> json) =>
    GameVehicle$Weaponry(
      pilotDps: (json['pilot_dps'] as num?)?.toDouble(),
      pilotAlpha: (json['pilot_alpha'] as num?)?.toDouble(),
      pilotSustainedDps: (json['pilot_sustained_dps'] as num?)?.toDouble(),
      turretDps: (json['turret_dps'] as num?)?.toDouble(),
      turretAlpha: (json['turret_alpha'] as num?)?.toDouble(),
      turretSustainedDps: (json['turret_sustained_dps'] as num?)?.toDouble(),
      fixedWeapons: json['fixed_weapons'] == null
          ? null
          : GameVehicle$Weaponry$FixedWeapons.fromJson(
              json['fixed_weapons'] as Map<String, dynamic>),
      missiles: json['missiles'] == null
          ? null
          : GameVehicle$Weaponry$Missiles.fromJson(
              json['missiles'] as Map<String, dynamic>),
      totalMissileDamage: (json['total_missile_damage'] as num?)?.toInt(),
    );

Map<String, dynamic> _$GameVehicle$WeaponryToJson(
        GameVehicle$Weaponry instance) =>
    <String, dynamic>{
      'pilot_dps': instance.pilotDps,
      'pilot_alpha': instance.pilotAlpha,
      'pilot_sustained_dps': instance.pilotSustainedDps,
      'turret_dps': instance.turretDps,
      'turret_alpha': instance.turretAlpha,
      'turret_sustained_dps': instance.turretSustainedDps,
      'fixed_weapons': instance.fixedWeapons?.toJson(),
      'missiles': instance.missiles?.toJson(),
      'total_missile_damage': instance.totalMissileDamage,
    };

GameVehicle$Insurance _$GameVehicle$InsuranceFromJson(
        Map<String, dynamic> json) =>
    GameVehicle$Insurance(
      claimTime: (json['claim_time'] as num?)?.toDouble(),
      expediteTime: (json['expedite_time'] as num?)?.toDouble(),
      expediteCost: (json['expedite_cost'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$GameVehicle$InsuranceToJson(
        GameVehicle$Insurance instance) =>
    <String, dynamic>{
      'claim_time': instance.claimTime,
      'expedite_time': instance.expediteTime,
      'expedite_cost': instance.expediteCost,
    };

GameVehicle$DamageLimits _$GameVehicle$DamageLimitsFromJson(
        Map<String, dynamic> json) =>
    GameVehicle$DamageLimits(
      beforeDestruction: json['before_destruction'],
      beforeDetach: json['before_detach'],
    );

Map<String, dynamic> _$GameVehicle$DamageLimitsToJson(
        GameVehicle$DamageLimits instance) =>
    <String, dynamic>{
      'before_destruction': instance.beforeDestruction,
      'before_detach': instance.beforeDetach,
    };

GameVehicle$Turrets _$GameVehicle$TurretsFromJson(Map<String, dynamic> json) =>
    GameVehicle$Turrets(
      manned: (json['manned'] as List<dynamic>?)
              ?.map(
                  (e) => GameVehicleTurret.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      remote: (json['remote'] as List<dynamic>?)
              ?.map(
                  (e) => GameVehicleTurret.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      pdc: (json['pdc'] as List<dynamic>?)
              ?.map(
                  (e) => GameVehicleTurret.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$GameVehicle$TurretsToJson(
        GameVehicle$Turrets instance) =>
    <String, dynamic>{
      'manned': instance.manned?.map((e) => e.toJson()).toList(),
      'remote': instance.remote?.map((e) => e.toJson()).toList(),
      'pdc': instance.pdc?.map((e) => e.toJson()).toList(),
    };

GameVehicle$CrossSection _$GameVehicle$CrossSectionFromJson(
        Map<String, dynamic> json) =>
    GameVehicle$CrossSection(
      length: (json['length'] as num?)?.toDouble(),
      width: (json['width'] as num?)?.toDouble(),
      height: (json['height'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$GameVehicle$CrossSectionToJson(
        GameVehicle$CrossSection instance) =>
    <String, dynamic>{
      'length': instance.length,
      'width': instance.width,
      'height': instance.height,
    };

GameVehicle$Signature _$GameVehicle$SignatureFromJson(
        Map<String, dynamic> json) =>
    GameVehicle$Signature(
      irQuantum: (json['ir_quantum'] as num?)?.toDouble(),
      irShields: (json['ir_shields'] as num?)?.toDouble(),
      emQuantum: (json['em_quantum'] as num?)?.toDouble(),
      emShields: (json['em_shields'] as num?)?.toDouble(),
      emGroupsQuantum: (json['em_groups_quantum'] as List<dynamic>?)
              ?.map((e) => (e as num).toDouble())
              .toList() ??
          [],
      emGroupsShields: (json['em_groups_shields'] as List<dynamic>?)
              ?.map((e) => (e as num).toDouble())
              .toList() ??
          [],
      emSegmentGroupsQuantum:
          (json['em_segment_groups_quantum'] as List<dynamic>?)
                  ?.map((e) => (e as num).toDouble())
                  .toList() ??
              [],
      emSegmentGroupsShields:
          (json['em_segment_groups_shields'] as List<dynamic>?)
                  ?.map((e) => (e as num).toDouble())
                  .toList() ??
              [],
      emPerSegment: (json['em_per_segment'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$GameVehicle$SignatureToJson(
        GameVehicle$Signature instance) =>
    <String, dynamic>{
      'ir_quantum': instance.irQuantum,
      'ir_shields': instance.irShields,
      'em_quantum': instance.emQuantum,
      'em_shields': instance.emShields,
      'em_groups_quantum': instance.emGroupsQuantum,
      'em_groups_shields': instance.emGroupsShields,
      'em_segment_groups_quantum': instance.emSegmentGroupsQuantum,
      'em_segment_groups_shields': instance.emSegmentGroupsShields,
      'em_per_segment': instance.emPerSegment,
    };

GameVehicle$Cooling _$GameVehicle$CoolingFromJson(Map<String, dynamic> json) =>
    GameVehicle$Cooling(
      generationSegments: (json['generation_segments'] as num?)?.toDouble(),
      usageShieldsPct: (json['usage_shields_pct'] as num?)?.toDouble(),
      usageQuantumPct: (json['usage_quantum_pct'] as num?)?.toDouble(),
      usedSegmentsShields: (json['used_segments_shields'] as num?)?.toDouble(),
      usedSegmentsQuantum: (json['used_segments_quantum'] as num?)?.toDouble(),
      usedSegmentsShieldsGrouped:
          (json['used_segments_shields_grouped'] as List<dynamic>?)
                  ?.map((e) => (e as num).toDouble())
                  .toList() ??
              [],
      usedSegmentsQuantumGrouped:
          (json['used_segments_quantum_grouped'] as List<dynamic>?)
                  ?.map((e) => (e as num).toDouble())
                  .toList() ??
              [],
    );

Map<String, dynamic> _$GameVehicle$CoolingToJson(
        GameVehicle$Cooling instance) =>
    <String, dynamic>{
      'generation_segments': instance.generationSegments,
      'usage_shields_pct': instance.usageShieldsPct,
      'usage_quantum_pct': instance.usageQuantumPct,
      'used_segments_shields': instance.usedSegmentsShields,
      'used_segments_quantum': instance.usedSegmentsQuantum,
      'used_segments_shields_grouped': instance.usedSegmentsShieldsGrouped,
      'used_segments_quantum_grouped': instance.usedSegmentsQuantumGrouped,
    };

GameVehicle$Power _$GameVehicle$PowerFromJson(Map<String, dynamic> json) =>
    GameVehicle$Power(
      generationSegments: (json['generation_segments'] as num?)?.toDouble(),
      usedSegmentsShields: (json['used_segments_shields'] as num?)?.toDouble(),
      usedSegmentsQuantum: (json['used_segments_quantum'] as num?)?.toDouble(),
      usedSegmentsGrouped: (json['used_segments_grouped'] as List<dynamic>?)
              ?.map((e) => (e as num).toDouble())
              .toList() ??
          [],
    );

Map<String, dynamic> _$GameVehicle$PowerToJson(GameVehicle$Power instance) =>
    <String, dynamic>{
      'generation_segments': instance.generationSegments,
      'used_segments_shields': instance.usedSegmentsShields,
      'used_segments_quantum': instance.usedSegmentsQuantum,
      'used_segments_grouped': instance.usedSegmentsGrouped,
    };

GameVehicle$PenetrationMultiplier _$GameVehicle$PenetrationMultiplierFromJson(
        Map<String, dynamic> json) =>
    GameVehicle$PenetrationMultiplier(
      fuse: (json['fuse'] as num?)?.toDouble(),
      components: (json['components'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$GameVehicle$PenetrationMultiplierToJson(
        GameVehicle$PenetrationMultiplier instance) =>
    <String, dynamic>{
      'fuse': instance.fuse,
      'components': instance.components,
    };

GameVehicle$UexPrices _$GameVehicle$UexPricesFromJson(
        Map<String, dynamic> json) =>
    GameVehicle$UexPrices(
      purchase: (json['purchase'] as List<dynamic>?)
              ?.map((e) => UexPrice.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      rental: (json['rental'] as List<dynamic>?)
              ?.map((e) => UexPrice.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$GameVehicle$UexPricesToJson(
        GameVehicle$UexPrices instance) =>
    <String, dynamic>{
      'purchase': instance.purchase?.map((e) => e.toJson()).toList(),
      'rental': instance.rental?.map((e) => e.toJson()).toList(),
    };

GameVehicle$Images$Item _$GameVehicle$Images$ItemFromJson(
        Map<String, dynamic> json) =>
    GameVehicle$Images$Item(
      source: json['source'] as String?,
      thumbnailUrl: json['thumbnail_url'] as String?,
      thumbnailWidth: (json['thumbnail_width'] as num?)?.toInt(),
      thumbnailHeight: (json['thumbnail_height'] as num?)?.toInt(),
      originalUrl: json['original_url'] as String?,
      originalWidth: (json['original_width'] as num?)?.toInt(),
      originalHeight: (json['original_height'] as num?)?.toInt(),
    );

Map<String, dynamic> _$GameVehicle$Images$ItemToJson(
        GameVehicle$Images$Item instance) =>
    <String, dynamic>{
      'source': instance.source,
      'thumbnail_url': instance.thumbnailUrl,
      'thumbnail_width': instance.thumbnailWidth,
      'thumbnail_height': instance.thumbnailHeight,
      'original_url': instance.originalUrl,
      'original_width': instance.originalWidth,
      'original_height': instance.originalHeight,
    };

VehicleWeaponStorage$ByLocker$Item _$VehicleWeaponStorage$ByLocker$ItemFromJson(
        Map<String, dynamic> json) =>
    VehicleWeaponStorage$ByLocker$Item(
      count: (json['count'] as num?)?.toInt(),
      name: json['name'] as String?,
      className: json['class_name'] as String?,
      port: json['port'] as String?,
      slotsTotal: (json['slots_total'] as num?)?.toInt(),
      slotsRifle: (json['slots_rifle'] as num?)?.toInt(),
      slotsPistol: (json['slots_pistol'] as num?)?.toInt(),
    );

Map<String, dynamic> _$VehicleWeaponStorage$ByLocker$ItemToJson(
        VehicleWeaponStorage$ByLocker$Item instance) =>
    <String, dynamic>{
      'count': instance.count,
      'name': instance.name,
      'class_name': instance.className,
      'port': instance.port,
      'slots_total': instance.slotsTotal,
      'slots_rifle': instance.slotsRifle,
      'slots_pistol': instance.slotsPistol,
    };

PaginationMeta$Links$Item _$PaginationMeta$Links$ItemFromJson(
        Map<String, dynamic> json) =>
    PaginationMeta$Links$Item(
      url: json['url'] as String?,
      label: json['label'] as String?,
      active: json['active'] as bool?,
    );

Map<String, dynamic> _$PaginationMeta$Links$ItemToJson(
        PaginationMeta$Links$Item instance) =>
    <String, dynamic>{
      'url': instance.url,
      'label': instance.label,
      'active': instance.active,
    };

CommLinkImage$Tags$Item _$CommLinkImage$Tags$ItemFromJson(
        Map<String, dynamic> json) =>
    CommLinkImage$Tags$Item(
      name: json['name'] as String?,
      translatedName: json['translated_name'] as String?,
      imagesCount: (json['images_count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CommLinkImage$Tags$ItemToJson(
        CommLinkImage$Tags$Item instance) =>
    <String, dynamic>{
      'name': instance.name,
      'translated_name': instance.translatedName,
      'images_count': instance.imagesCount,
    };

CommLinkImage$CommLinks$Item _$CommLinkImage$CommLinks$ItemFromJson(
        Map<String, dynamic> json) =>
    CommLinkImage$CommLinks$Item(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      apiUrl: json['api_url'] as String?,
      webUrl: json['web_url'] as String?,
    );

Map<String, dynamic> _$CommLinkImage$CommLinks$ItemToJson(
        CommLinkImage$CommLinks$Item instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'api_url': instance.apiUrl,
      'web_url': instance.webUrl,
    };

CommLinkImage$Duplicates$Item _$CommLinkImage$Duplicates$ItemFromJson(
        Map<String, dynamic> json) =>
    CommLinkImage$Duplicates$Item(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$CommLinkImage$Duplicates$ItemToJson(
        CommLinkImage$Duplicates$Item instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

CommLinkImage$BaseImage _$CommLinkImage$BaseImageFromJson(
        Map<String, dynamic> json) =>
    CommLinkImage$BaseImage(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$CommLinkImage$BaseImageToJson(
        CommLinkImage$BaseImage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

CelestialObject$Sensor _$CelestialObject$SensorFromJson(
        Map<String, dynamic> json) =>
    CelestialObject$Sensor(
      population: (json['population'] as num?)?.toDouble(),
      economy: (json['economy'] as num?)?.toDouble(),
      danger: (json['danger'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CelestialObject$SensorToJson(
        CelestialObject$Sensor instance) =>
    <String, dynamic>{
      'population': instance.population,
      'economy': instance.economy,
      'danger': instance.danger,
    };

CelestialObject$Starsystem _$CelestialObject$StarsystemFromJson(
        Map<String, dynamic> json) =>
    CelestialObject$Starsystem(
      id: (json['id'] as num?)?.toInt(),
      code: json['code'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$CelestialObject$StarsystemToJson(
        CelestialObject$Starsystem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
    };

Jumppoint$Entry _$Jumppoint$EntryFromJson(Map<String, dynamic> json) =>
    Jumppoint$Entry(
      id: (json['id'] as num?)?.toInt(),
      systemId: json['system_id'] as String?,
      systemApiUrl: json['system_api_url'] as String?,
      celestialObjectApiUrl: json['celestial_object_api_url'] as String?,
      status: json['status'] as String?,
      code: json['code'] as String?,
      designation: json['designation'] as String?,
    );

Map<String, dynamic> _$Jumppoint$EntryToJson(Jumppoint$Entry instance) =>
    <String, dynamic>{
      'id': instance.id,
      'system_id': instance.systemId,
      'system_api_url': instance.systemApiUrl,
      'celestial_object_api_url': instance.celestialObjectApiUrl,
      'status': instance.status,
      'code': instance.code,
      'designation': instance.designation,
    };

Jumppoint$Exit _$Jumppoint$ExitFromJson(Map<String, dynamic> json) =>
    Jumppoint$Exit(
      id: (json['id'] as num?)?.toInt(),
      systemId: json['system_id'] as String?,
      systemApiUrl: json['system_api_url'] as String?,
      celestialObjectApiUrl: json['celestial_object_api_url'] as String?,
      status: json['status'] as String?,
      code: json['code'] as String?,
      designation: json['designation'] as String?,
    );

Map<String, dynamic> _$Jumppoint$ExitToJson(Jumppoint$Exit instance) =>
    <String, dynamic>{
      'id': instance.id,
      'system_id': instance.systemId,
      'system_api_url': instance.systemApiUrl,
      'celestial_object_api_url': instance.celestialObjectApiUrl,
      'status': instance.status,
      'code': instance.code,
      'designation': instance.designation,
    };

Starsystem$Position _$Starsystem$PositionFromJson(Map<String, dynamic> json) =>
    Starsystem$Position(
      x: (json['x'] as num?)?.toDouble(),
      y: (json['y'] as num?)?.toDouble(),
      z: (json['z'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$Starsystem$PositionToJson(
        Starsystem$Position instance) =>
    <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
      'z': instance.z,
    };

Starsystem$Aggregated _$Starsystem$AggregatedFromJson(
        Map<String, dynamic> json) =>
    Starsystem$Aggregated(
      size: (json['size'] as num?)?.toDouble(),
      population: (json['population'] as num?)?.toDouble(),
      economy: (json['economy'] as num?)?.toDouble(),
      danger: (json['danger'] as num?)?.toDouble(),
      stars: (json['stars'] as num?)?.toInt(),
      planets: (json['planets'] as num?)?.toInt(),
      moons: (json['moons'] as num?)?.toInt(),
      stations: (json['stations'] as num?)?.toInt(),
    );

Map<String, dynamic> _$Starsystem$AggregatedToJson(
        Starsystem$Aggregated instance) =>
    <String, dynamic>{
      'size': instance.size,
      'population': instance.population,
      'economy': instance.economy,
      'danger': instance.danger,
      'stars': instance.stars,
      'planets': instance.planets,
      'moons': instance.moons,
      'stations': instance.stations,
    };

Starsystem$CelestialObject _$Starsystem$CelestialObjectFromJson(
        Map<String, dynamic> json) =>
    Starsystem$CelestialObject(
      celestialObject: json['celestial_object'] == null
          ? null
          : Starsystem$CelestialObject$CelestialObject.fromJson(
              json['celestial_object'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$Starsystem$CelestialObjectToJson(
        Starsystem$CelestialObject instance) =>
    <String, dynamic>{
      'celestial_object': instance.celestialObject?.toJson(),
    };

Starsystem$Jumppoints _$Starsystem$JumppointsFromJson(
        Map<String, dynamic> json) =>
    Starsystem$Jumppoints(
      jumppoints: json['jumppoints'] == null
          ? null
          : Starsystem$Jumppoints$Jumppoints.fromJson(
              json['jumppoints'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$Starsystem$JumppointsToJson(
        Starsystem$Jumppoints instance) =>
    <String, dynamic>{
      'jumppoints': instance.jumppoints?.toJson(),
    };

ShipMatrixVehicle$Sizes _$ShipMatrixVehicle$SizesFromJson(
        Map<String, dynamic> json) =>
    ShipMatrixVehicle$Sizes(
      length: (json['length'] as num?)?.toDouble(),
      beam: (json['beam'] as num?)?.toDouble(),
      height: (json['height'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ShipMatrixVehicle$SizesToJson(
        ShipMatrixVehicle$Sizes instance) =>
    <String, dynamic>{
      'length': instance.length,
      'beam': instance.beam,
      'height': instance.height,
    };

ShipMatrixVehicle$Dimension _$ShipMatrixVehicle$DimensionFromJson(
        Map<String, dynamic> json) =>
    ShipMatrixVehicle$Dimension(
      length: (json['length'] as num?)?.toDouble(),
      width: (json['width'] as num?)?.toDouble(),
      height: (json['height'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ShipMatrixVehicle$DimensionToJson(
        ShipMatrixVehicle$Dimension instance) =>
    <String, dynamic>{
      'length': instance.length,
      'width': instance.width,
      'height': instance.height,
    };

ShipMatrixVehicle$Crew _$ShipMatrixVehicle$CrewFromJson(
        Map<String, dynamic> json) =>
    ShipMatrixVehicle$Crew(
      min: (json['min'] as num?)?.toInt(),
      max: (json['max'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ShipMatrixVehicle$CrewToJson(
        ShipMatrixVehicle$Crew instance) =>
    <String, dynamic>{
      'min': instance.min,
      'max': instance.max,
    };

ShipMatrixVehicle$Speed _$ShipMatrixVehicle$SpeedFromJson(
        Map<String, dynamic> json) =>
    ShipMatrixVehicle$Speed(
      scm: (json['scm'] as num?)?.toDouble(),
      max: (json['max'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ShipMatrixVehicle$SpeedToJson(
        ShipMatrixVehicle$Speed instance) =>
    <String, dynamic>{
      'scm': instance.scm,
      'max': instance.max,
    };

ShipMatrixVehicle$Agility _$ShipMatrixVehicle$AgilityFromJson(
        Map<String, dynamic> json) =>
    ShipMatrixVehicle$Agility(
      pitch: (json['pitch'] as num?)?.toDouble(),
      yaw: (json['yaw'] as num?)?.toDouble(),
      roll: (json['roll'] as num?)?.toDouble(),
      acceleration: json['acceleration'] == null
          ? null
          : ShipMatrixVehicle$Agility$Acceleration.fromJson(
              json['acceleration'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ShipMatrixVehicle$AgilityToJson(
        ShipMatrixVehicle$Agility instance) =>
    <String, dynamic>{
      'pitch': instance.pitch,
      'yaw': instance.yaw,
      'roll': instance.roll,
      'acceleration': instance.acceleration?.toJson(),
    };

ShipMatrixVehicle$Manufacturer _$ShipMatrixVehicle$ManufacturerFromJson(
        Map<String, dynamic> json) =>
    ShipMatrixVehicle$Manufacturer(
      code: json['code'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$ShipMatrixVehicle$ManufacturerToJson(
        ShipMatrixVehicle$Manufacturer instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
    };

ApiBlueprintsFiltersGet$Response$Filters
    _$ApiBlueprintsFiltersGet$Response$FiltersFromJson(
            Map<String, dynamic> json) =>
        ApiBlueprintsFiltersGet$Response$Filters(
          outputType: (json['output.type'] as List<dynamic>?)
                  ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
          ingredientUuid: (json['ingredient.uuid'] as List<dynamic>?)
                  ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
          resourceUuid: (json['resource.uuid'] as List<dynamic>?)
                  ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
        );

Map<String, dynamic> _$ApiBlueprintsFiltersGet$Response$FiltersToJson(
        ApiBlueprintsFiltersGet$Response$Filters instance) =>
    <String, dynamic>{
      'output.type': instance.outputType?.map((e) => e.toJson()).toList(),
      'ingredient.uuid':
          instance.ingredientUuid?.map((e) => e.toJson()).toList(),
      'resource.uuid': instance.resourceUuid?.map((e) => e.toJson()).toList(),
    };

ApiCommoditiesFiltersGet$Response$Filters
    _$ApiCommoditiesFiltersGet$Response$FiltersFromJson(
            Map<String, dynamic> json) =>
        ApiCommoditiesFiltersGet$Response$Filters(
          system: (json['system'] as List<dynamic>?)
                  ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
          type: (json['type'] as List<dynamic>?)
                  ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
          rarity: (json['rarity'] as List<dynamic>?)
                  ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
          kind: (json['kind'] as List<dynamic>?)
                  ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
          refinedVersion: (json['refined_version'] as List<dynamic>?)
                  ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
          group: (json['group'] as List<dynamic>?)
                  ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
          location: (json['location'] as List<dynamic>?)
                  ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
        );

Map<String, dynamic> _$ApiCommoditiesFiltersGet$Response$FiltersToJson(
        ApiCommoditiesFiltersGet$Response$Filters instance) =>
    <String, dynamic>{
      'system': instance.system?.map((e) => e.toJson()).toList(),
      'type': instance.type?.map((e) => e.toJson()).toList(),
      'rarity': instance.rarity?.map((e) => e.toJson()).toList(),
      'kind': instance.kind?.map((e) => e.toJson()).toList(),
      'refined_version':
          instance.refinedVersion?.map((e) => e.toJson()).toList(),
      'group': instance.group?.map((e) => e.toJson()).toList(),
      'location': instance.location?.map((e) => e.toJson()).toList(),
    };

ApiItemsFiltersGet$Response$Filters
    _$ApiItemsFiltersGet$Response$FiltersFromJson(Map<String, dynamic> json) =>
        ApiItemsFiltersGet$Response$Filters(
          type: (json['type'] as List<dynamic>?)
                  ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
          subType: (json['sub_type'] as List<dynamic>?)
                  ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
          classification: (json['classification'] as List<dynamic>?)
                  ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
          size: (json['size'] as List<dynamic>?)
                  ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
          grade: (json['grade'] as List<dynamic>?)
                  ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
          $class: (json['class'] as List<dynamic>?)
                  ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
          manufacturer: (json['manufacturer'] as List<dynamic>?)
                  ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
          rarity: (json['rarity'] as List<dynamic>?)
                  ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
          eventSource: (json['event_source'] as List<dynamic>?)
                  ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
        );

Map<String, dynamic> _$ApiItemsFiltersGet$Response$FiltersToJson(
        ApiItemsFiltersGet$Response$Filters instance) =>
    <String, dynamic>{
      'type': instance.type?.map((e) => e.toJson()).toList(),
      'sub_type': instance.subType?.map((e) => e.toJson()).toList(),
      'classification':
          instance.classification?.map((e) => e.toJson()).toList(),
      'size': instance.size?.map((e) => e.toJson()).toList(),
      'grade': instance.grade?.map((e) => e.toJson()).toList(),
      'class': instance.$class?.map((e) => e.toJson()).toList(),
      'manufacturer': instance.manufacturer?.map((e) => e.toJson()).toList(),
      'rarity': instance.rarity?.map((e) => e.toJson()).toList(),
      'event_source': instance.eventSource?.map((e) => e.toJson()).toList(),
    };

ApiMissionsFiltersGet$Response$Filters
    _$ApiMissionsFiltersGet$Response$FiltersFromJson(
            Map<String, dynamic> json) =>
        ApiMissionsFiltersGet$Response$Filters(
          missionGiver: (json['mission_giver'] as List<dynamic>?)
                  ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
          starSystem: (json['star_system'] as List<dynamic>?)
                  ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
          faction: (json['faction'] as List<dynamic>?)
                  ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
          hasCombat: (json['has_combat'] as List<dynamic>?)
                  ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
          hasDefendObjective: (json['has_defend_objective'] as List<dynamic>?)
                  ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
          rankIndex: (json['rank_index'] as List<dynamic>?)
                  ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
          illegal: (json['illegal'] as List<dynamic>?)
                  ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
          shareable: (json['shareable'] as List<dynamic>?)
                  ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
          hasPrerequisites: (json['has_prerequisites'] as List<dynamic>?)
                  ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
          rewardScope: (json['reward_scope'] as List<dynamic>?)
                  ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
          hasBlueprints: (json['has_blueprints'] as List<dynamic>?)
                  ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
          reputationScope: (json['reputation_scope'] as List<dynamic>?)
                  ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
          blueprintName: (json['blueprint_name'] as List<dynamic>?)
                  ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
        );

Map<String, dynamic> _$ApiMissionsFiltersGet$Response$FiltersToJson(
        ApiMissionsFiltersGet$Response$Filters instance) =>
    <String, dynamic>{
      'mission_giver': instance.missionGiver?.map((e) => e.toJson()).toList(),
      'star_system': instance.starSystem?.map((e) => e.toJson()).toList(),
      'faction': instance.faction?.map((e) => e.toJson()).toList(),
      'has_combat': instance.hasCombat?.map((e) => e.toJson()).toList(),
      'has_defend_objective':
          instance.hasDefendObjective?.map((e) => e.toJson()).toList(),
      'rank_index': instance.rankIndex?.map((e) => e.toJson()).toList(),
      'illegal': instance.illegal?.map((e) => e.toJson()).toList(),
      'shareable': instance.shareable?.map((e) => e.toJson()).toList(),
      'has_prerequisites':
          instance.hasPrerequisites?.map((e) => e.toJson()).toList(),
      'reward_scope': instance.rewardScope?.map((e) => e.toJson()).toList(),
      'has_blueprints': instance.hasBlueprints?.map((e) => e.toJson()).toList(),
      'reputation_scope':
          instance.reputationScope?.map((e) => e.toJson()).toList(),
      'blueprint_name': instance.blueprintName?.map((e) => e.toJson()).toList(),
    };

ApiLocationsFiltersGet$Response$Filters
    _$ApiLocationsFiltersGet$Response$FiltersFromJson(
            Map<String, dynamic> json) =>
        ApiLocationsFiltersGet$Response$Filters(
          typeName: (json['type_name'] as List<dynamic>?)
                  ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
          typeClassification: (json['type_classification'] as List<dynamic>?)
                  ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
          respawnLocationType: (json['respawn_location_type'] as List<dynamic>?)
                  ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
          jurisdictionName: (json['jurisdiction_name'] as List<dynamic>?)
                  ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
          affiliationName: (json['affiliation_name'] as List<dynamic>?)
                  ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
          system: (json['system'] as List<dynamic>?)
                  ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
          parentName: (json['parent_name'] as List<dynamic>?)
                  ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
          amenity: (json['amenity'] as List<dynamic>?)
                  ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
          resource: (json['resource'] as List<dynamic>?)
                  ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
        );

Map<String, dynamic> _$ApiLocationsFiltersGet$Response$FiltersToJson(
        ApiLocationsFiltersGet$Response$Filters instance) =>
    <String, dynamic>{
      'type_name': instance.typeName?.map((e) => e.toJson()).toList(),
      'type_classification':
          instance.typeClassification?.map((e) => e.toJson()).toList(),
      'respawn_location_type':
          instance.respawnLocationType?.map((e) => e.toJson()).toList(),
      'jurisdiction_name':
          instance.jurisdictionName?.map((e) => e.toJson()).toList(),
      'affiliation_name':
          instance.affiliationName?.map((e) => e.toJson()).toList(),
      'system': instance.system?.map((e) => e.toJson()).toList(),
      'parent_name': instance.parentName?.map((e) => e.toJson()).toList(),
      'amenity': instance.amenity?.map((e) => e.toJson()).toList(),
      'resource': instance.resource?.map((e) => e.toJson()).toList(),
    };

ApiLocationsPositionsGet$Response$Data$Item
    _$ApiLocationsPositionsGet$Response$Data$ItemFromJson(
            Map<String, dynamic> json) =>
        ApiLocationsPositionsGet$Response$Data$Item(
          uuid: json['uuid'] as String?,
          name: json['name'] as String?,
          type: json['type'] as String?,
          system: json['system'] as String?,
          parentUuid: json['parent_uuid'] as String?,
          x: (json['x'] as num?)?.toDouble(),
          y: (json['y'] as num?)?.toDouble(),
          z: (json['z'] as num?)?.toDouble(),
        );

Map<String, dynamic> _$ApiLocationsPositionsGet$Response$Data$ItemToJson(
        ApiLocationsPositionsGet$Response$Data$Item instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'type': instance.type,
      'system': instance.system,
      'parent_uuid': instance.parentUuid,
      'x': instance.x,
      'y': instance.y,
      'z': instance.z,
    };

ApiLocationsPositionsGet$Response$Connections$Item
    _$ApiLocationsPositionsGet$Response$Connections$ItemFromJson(
            Map<String, dynamic> json) =>
        ApiLocationsPositionsGet$Response$Connections$Item(
          entryUuid: json['entry_uuid'] as String?,
          exitUuid: json['exit_uuid'] as String?,
          entrySystem: json['entry_system'] as String?,
          exitSystem: json['exit_system'] as String?,
          fuelCost: (json['fuel_cost'] as num?)?.toDouble(),
          sizeClass:
              apiLocationsPositionsGet$Response$Connections$ItemSizeClassNullableFromJson(
                  json['size_class']),
        );

Map<String, dynamic> _$ApiLocationsPositionsGet$Response$Connections$ItemToJson(
        ApiLocationsPositionsGet$Response$Connections$Item instance) =>
    <String, dynamic>{
      'entry_uuid': instance.entryUuid,
      'exit_uuid': instance.exitUuid,
      'entry_system': instance.entrySystem,
      'exit_system': instance.exitSystem,
      'fuel_cost': instance.fuelCost,
      'size_class':
          apiLocationsPositionsGet$Response$Connections$ItemSizeClassNullableToJson(
              instance.sizeClass),
    };

ApiSearchGet$Response$Data$Item _$ApiSearchGet$Response$Data$ItemFromJson(
        Map<String, dynamic> json) =>
    ApiSearchGet$Response$Data$Item(
      type: json['type'] as String?,
      label: json['label'] as String?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => ApiSearchGet$Response$Data$Item$Results$Item.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ApiSearchGet$Response$Data$ItemToJson(
        ApiSearchGet$Response$Data$Item instance) =>
    <String, dynamic>{
      'type': instance.type,
      'label': instance.label,
      'results': instance.results?.map((e) => e.toJson()).toList(),
    };

ApiVehiclesFiltersGet$Response$Filters
    _$ApiVehiclesFiltersGet$Response$FiltersFromJson(
            Map<String, dynamic> json) =>
        ApiVehiclesFiltersGet$Response$Filters(
          manufacturer: (json['manufacturer'] as List<dynamic>?)
                  ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
          isVehicle: (json['is_vehicle'] as List<dynamic>?)
                  ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
          isGravlev: (json['is_gravlev'] as List<dynamic>?)
                  ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
          isSpaceship: (json['is_spaceship'] as List<dynamic>?)
                  ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
          size: (json['size'] as List<dynamic>?)
                  ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
          role: (json['role'] as List<dynamic>?)
                  ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
          career: (json['career'] as List<dynamic>?)
                  ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
          shieldFaceType: (json['shield.face_type'] as List<dynamic>?)
                  ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
        );

Map<String, dynamic> _$ApiVehiclesFiltersGet$Response$FiltersToJson(
        ApiVehiclesFiltersGet$Response$Filters instance) =>
    <String, dynamic>{
      'manufacturer': instance.manufacturer?.map((e) => e.toJson()).toList(),
      'is_vehicle': instance.isVehicle?.map((e) => e.toJson()).toList(),
      'is_gravlev': instance.isGravlev?.map((e) => e.toJson()).toList(),
      'is_spaceship': instance.isSpaceship?.map((e) => e.toJson()).toList(),
      'size': instance.size?.map((e) => e.toJson()).toList(),
      'role': instance.role?.map((e) => e.toJson()).toList(),
      'career': instance.career?.map((e) => e.toJson()).toList(),
      'shield.face_type':
          instance.shieldFaceType?.map((e) => e.toJson()).toList(),
    };

ApiCommLinksFiltersGet$Response$Filters
    _$ApiCommLinksFiltersGet$Response$FiltersFromJson(
            Map<String, dynamic> json) =>
        ApiCommLinksFiltersGet$Response$Filters(
          category: (json['category'] as List<dynamic>?)
                  ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
          channel: (json['channel'] as List<dynamic>?)
                  ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
          series: (json['series'] as List<dynamic>?)
                  ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
        );

Map<String, dynamic> _$ApiCommLinksFiltersGet$Response$FiltersToJson(
        ApiCommLinksFiltersGet$Response$Filters instance) =>
    <String, dynamic>{
      'category': instance.category?.map((e) => e.toJson()).toList(),
      'channel': instance.channel?.map((e) => e.toJson()).toList(),
      'series': instance.series?.map((e) => e.toJson()).toList(),
    };

ApiGalactapediaFiltersGet$Response$Filters
    _$ApiGalactapediaFiltersGet$Response$FiltersFromJson(
            Map<String, dynamic> json) =>
        ApiGalactapediaFiltersGet$Response$Filters(
          category: (json['category'] as List<dynamic>?)
                  ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
          tag: (json['tag'] as List<dynamic>?)
                  ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
          template: (json['template'] as List<dynamic>?)
                  ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
        );

Map<String, dynamic> _$ApiGalactapediaFiltersGet$Response$FiltersToJson(
        ApiGalactapediaFiltersGet$Response$Filters instance) =>
    <String, dynamic>{
      'category': instance.category?.map((e) => e.toJson()).toList(),
      'tag': instance.tag?.map((e) => e.toJson()).toList(),
      'template': instance.template?.map((e) => e.toJson()).toList(),
    };

ApiStarsystemsFiltersGet$Response$Filters
    _$ApiStarsystemsFiltersGet$Response$FiltersFromJson(
            Map<String, dynamic> json) =>
        ApiStarsystemsFiltersGet$Response$Filters(
          affiliation: (json['affiliation'] as List<dynamic>?)
                  ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
          status: (json['status'] as List<dynamic>?)
                  ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
          type: (json['type'] as List<dynamic>?)
                  ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
          size: (json['size'] as List<dynamic>?)
                  ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
        );

Map<String, dynamic> _$ApiStarsystemsFiltersGet$Response$FiltersToJson(
        ApiStarsystemsFiltersGet$Response$Filters instance) =>
    <String, dynamic>{
      'affiliation': instance.affiliation?.map((e) => e.toJson()).toList(),
      'status': instance.status?.map((e) => e.toJson()).toList(),
      'type': instance.type?.map((e) => e.toJson()).toList(),
      'size': instance.size?.map((e) => e.toJson()).toList(),
    };

ApiShipmatrixVehiclesFiltersGet$Response$Filters
    _$ApiShipmatrixVehiclesFiltersGet$Response$FiltersFromJson(
            Map<String, dynamic> json) =>
        ApiShipmatrixVehiclesFiltersGet$Response$Filters(
          manufacturer: (json['manufacturer'] as List<dynamic>?)
                  ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
          size: (json['size'] as List<dynamic>?)
                  ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
          type: (json['type'] as List<dynamic>?)
                  ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
          focus: (json['focus'] as List<dynamic>?)
                  ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
          productionStatus: (json['production_status'] as List<dynamic>?)
                  ?.map((e) => FilterValue.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
        );

Map<String, dynamic> _$ApiShipmatrixVehiclesFiltersGet$Response$FiltersToJson(
        ApiShipmatrixVehiclesFiltersGet$Response$Filters instance) =>
    <String, dynamic>{
      'manufacturer': instance.manufacturer?.map((e) => e.toJson()).toList(),
      'size': instance.size?.map((e) => e.toJson()).toList(),
      'type': instance.type?.map((e) => e.toJson()).toList(),
      'focus': instance.focus?.map((e) => e.toJson()).toList(),
      'production_status':
          instance.productionStatus?.map((e) => e.toJson()).toList(),
    };

ResourceNetwork$Usage$Power _$ResourceNetwork$Usage$PowerFromJson(
        Map<String, dynamic> json) =>
    ResourceNetwork$Usage$Power(
      min: (json['min'] as num?)?.toDouble(),
      max: (json['max'] as num?)?.toDouble(),
      minimum: (json['minimum'] as num?)?.toDouble(),
      maximum: (json['maximum'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ResourceNetwork$Usage$PowerToJson(
        ResourceNetwork$Usage$Power instance) =>
    <String, dynamic>{
      'min': instance.min,
      'max': instance.max,
      'minimum': instance.minimum,
      'maximum': instance.maximum,
    };

ResourceNetwork$Usage$Coolant _$ResourceNetwork$Usage$CoolantFromJson(
        Map<String, dynamic> json) =>
    ResourceNetwork$Usage$Coolant(
      min: (json['min'] as num?)?.toDouble(),
      max: (json['max'] as num?)?.toDouble(),
      minimum: (json['minimum'] as num?)?.toDouble(),
      maximum: (json['maximum'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ResourceNetwork$Usage$CoolantToJson(
        ResourceNetwork$Usage$Coolant instance) =>
    <String, dynamic>{
      'min': instance.min,
      'max': instance.max,
      'minimum': instance.minimum,
      'maximum': instance.maximum,
    };

MissionCombat$Summary$Total _$MissionCombat$Summary$TotalFromJson(
        Map<String, dynamic> json) =>
    MissionCombat$Summary$Total(
      min: (json['min'] as num?)?.toInt(),
      max: (json['max'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MissionCombat$Summary$TotalToJson(
        MissionCombat$Summary$Total instance) =>
    <String, dynamic>{
      'min': instance.min,
      'max': instance.max,
    };

MissionCombat$Summary$ByGroup$Item _$MissionCombat$Summary$ByGroup$ItemFromJson(
        Map<String, dynamic> json) =>
    MissionCombat$Summary$ByGroup$Item(
      groupName: json['group_name'] as String?,
      min: (json['min'] as num?)?.toInt(),
      max: (json['max'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MissionCombat$Summary$ByGroup$ItemToJson(
        MissionCombat$Summary$ByGroup$Item instance) =>
    <String, dynamic>{
      'group_name': instance.groupName,
      'min': instance.min,
      'max': instance.max,
    };

VehicleRelayEntry$ConnectedHardpoints$Item$Items$Item
    _$VehicleRelayEntry$ConnectedHardpoints$Item$Items$ItemFromJson(
            Map<String, dynamic> json) =>
        VehicleRelayEntry$ConnectedHardpoints$Item$Items$Item(
          hardpoint: json['hardpoint'] as String?,
          itemName: json['item_name'] as String?,
          className: json['class_name'] as String?,
          type: json['type'] as String?,
          uuid: json['uuid'] as String?,
        );

Map<String, dynamic>
    _$VehicleRelayEntry$ConnectedHardpoints$Item$Items$ItemToJson(
            VehicleRelayEntry$ConnectedHardpoints$Item$Items$Item instance) =>
        <String, dynamic>{
          'hardpoint': instance.hardpoint,
          'item_name': instance.itemName,
          'class_name': instance.className,
          'type': instance.type,
          'uuid': instance.uuid,
        };

GameVehicle$CargoLimits$Min _$GameVehicle$CargoLimits$MinFromJson(
        Map<String, dynamic> json) =>
    GameVehicle$CargoLimits$Min(
      x: (json['x'] as num?)?.toDouble(),
      y: (json['y'] as num?)?.toDouble(),
      z: (json['z'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$GameVehicle$CargoLimits$MinToJson(
        GameVehicle$CargoLimits$Min instance) =>
    <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
      'z': instance.z,
    };

GameVehicle$CargoLimits$Max _$GameVehicle$CargoLimits$MaxFromJson(
        Map<String, dynamic> json) =>
    GameVehicle$CargoLimits$Max(
      x: (json['x'] as num?)?.toDouble(),
      y: (json['y'] as num?)?.toDouble(),
      z: (json['z'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$GameVehicle$CargoLimits$MaxToJson(
        GameVehicle$CargoLimits$Max instance) =>
    <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
      'z': instance.z,
    };

GameVehicle$Shield$Resistance _$GameVehicle$Shield$ResistanceFromJson(
        Map<String, dynamic> json) =>
    GameVehicle$Shield$Resistance(
      physical: json['physical'] == null
          ? null
          : GameVehicle$Shield$Resistance$Physical.fromJson(
              json['physical'] as Map<String, dynamic>),
      energy: json['energy'] == null
          ? null
          : GameVehicle$Shield$Resistance$Energy.fromJson(
              json['energy'] as Map<String, dynamic>),
      distortion: json['distortion'] == null
          ? null
          : GameVehicle$Shield$Resistance$Distortion.fromJson(
              json['distortion'] as Map<String, dynamic>),
      thermal: json['thermal'] == null
          ? null
          : GameVehicle$Shield$Resistance$Thermal.fromJson(
              json['thermal'] as Map<String, dynamic>),
      biochemical: json['biochemical'] == null
          ? null
          : GameVehicle$Shield$Resistance$Biochemical.fromJson(
              json['biochemical'] as Map<String, dynamic>),
      stun: json['stun'] == null
          ? null
          : GameVehicle$Shield$Resistance$Stun.fromJson(
              json['stun'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GameVehicle$Shield$ResistanceToJson(
        GameVehicle$Shield$Resistance instance) =>
    <String, dynamic>{
      'physical': instance.physical?.toJson(),
      'energy': instance.energy?.toJson(),
      'distortion': instance.distortion?.toJson(),
      'thermal': instance.thermal?.toJson(),
      'biochemical': instance.biochemical?.toJson(),
      'stun': instance.stun?.toJson(),
    };

GameVehicle$Shield$Absorption _$GameVehicle$Shield$AbsorptionFromJson(
        Map<String, dynamic> json) =>
    GameVehicle$Shield$Absorption(
      physical: json['physical'] == null
          ? null
          : GameVehicle$Shield$Absorption$Physical.fromJson(
              json['physical'] as Map<String, dynamic>),
      energy: json['energy'] == null
          ? null
          : GameVehicle$Shield$Absorption$Energy.fromJson(
              json['energy'] as Map<String, dynamic>),
      distortion: json['distortion'] == null
          ? null
          : GameVehicle$Shield$Absorption$Distortion.fromJson(
              json['distortion'] as Map<String, dynamic>),
      thermal: json['thermal'] == null
          ? null
          : GameVehicle$Shield$Absorption$Thermal.fromJson(
              json['thermal'] as Map<String, dynamic>),
      biochemical: json['biochemical'] == null
          ? null
          : GameVehicle$Shield$Absorption$Biochemical.fromJson(
              json['biochemical'] as Map<String, dynamic>),
      stun: json['stun'] == null
          ? null
          : GameVehicle$Shield$Absorption$Stun.fromJson(
              json['stun'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GameVehicle$Shield$AbsorptionToJson(
        GameVehicle$Shield$Absorption instance) =>
    <String, dynamic>{
      'physical': instance.physical?.toJson(),
      'energy': instance.energy?.toJson(),
      'distortion': instance.distortion?.toJson(),
      'thermal': instance.thermal?.toJson(),
      'biochemical': instance.biochemical?.toJson(),
      'stun': instance.stun?.toJson(),
    };

GameVehicle$Agility$Acceleration _$GameVehicle$Agility$AccelerationFromJson(
        Map<String, dynamic> json) =>
    GameVehicle$Agility$Acceleration(
      main: (json['main'] as num?)?.toDouble(),
      retro: (json['retro'] as num?)?.toDouble(),
      vtol: (json['vtol'] as num?)?.toDouble(),
      maneuvering: (json['maneuvering'] as num?)?.toDouble(),
      mainG: (json['main_g'] as num?)?.toDouble(),
      retroG: (json['retro_g'] as num?)?.toDouble(),
      vtolG: (json['vtol_g'] as num?)?.toDouble(),
      maneuveringG: (json['maneuvering_g'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$GameVehicle$Agility$AccelerationToJson(
        GameVehicle$Agility$Acceleration instance) =>
    <String, dynamic>{
      'main': instance.main,
      'retro': instance.retro,
      'vtol': instance.vtol,
      'maneuvering': instance.maneuvering,
      'main_g': instance.mainG,
      'retro_g': instance.retroG,
      'vtol_g': instance.vtolG,
      'maneuvering_g': instance.maneuveringG,
    };

GameVehicle$Fuel$Usage _$GameVehicle$Fuel$UsageFromJson(
        Map<String, dynamic> json) =>
    GameVehicle$Fuel$Usage(
      main: (json['main'] as num?)?.toDouble(),
      retro: (json['retro'] as num?)?.toDouble(),
      vtol: (json['vtol'] as num?)?.toDouble(),
      maneuvering: (json['maneuvering'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$GameVehicle$Fuel$UsageToJson(
        GameVehicle$Fuel$Usage instance) =>
    <String, dynamic>{
      'main': instance.main,
      'retro': instance.retro,
      'vtol': instance.vtol,
      'maneuvering': instance.maneuvering,
    };

GameVehicle$Drive$Wheels _$GameVehicle$Drive$WheelsFromJson(
        Map<String, dynamic> json) =>
    GameVehicle$Drive$Wheels(
      count: (json['count'] as num?)?.toInt(),
      drivingCount: (json['driving_count'] as num?)?.toInt(),
      steeringCount: (json['steering_count'] as num?)?.toInt(),
      driveType: json['drive_type'] as String?,
    );

Map<String, dynamic> _$GameVehicle$Drive$WheelsToJson(
        GameVehicle$Drive$Wheels instance) =>
    <String, dynamic>{
      'count': instance.count,
      'driving_count': instance.drivingCount,
      'steering_count': instance.steeringCount,
      'drive_type': instance.driveType,
    };

GameVehicle$Drive$Agility _$GameVehicle$Drive$AgilityFromJson(
        Map<String, dynamic> json) =>
    GameVehicle$Drive$Agility(
      handling: (json['handling'] as num?)?.toDouble(),
      grip: (json['grip'] as num?)?.toDouble(),
      acceleration: (json['acceleration'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$GameVehicle$Drive$AgilityToJson(
        GameVehicle$Drive$Agility instance) =>
    <String, dynamic>{
      'handling': instance.handling,
      'grip': instance.grip,
      'acceleration': instance.acceleration,
    };

GameVehicle$Propulsion$Thrusters$Item
    _$GameVehicle$Propulsion$Thrusters$ItemFromJson(
            Map<String, dynamic> json) =>
        GameVehicle$Propulsion$Thrusters$Item(
          type: json['type'] as String?,
          count: (json['count'] as num?)?.toInt(),
          capacity: (json['capacity'] as num?)?.toDouble(),
          g: (json['g'] as num?)?.toDouble(),
        );

Map<String, dynamic> _$GameVehicle$Propulsion$Thrusters$ItemToJson(
        GameVehicle$Propulsion$Thrusters$Item instance) =>
    <String, dynamic>{
      'type': instance.type,
      'count': instance.count,
      'capacity': instance.capacity,
      'g': instance.g,
    };

GameVehicle$Propulsion$ThrustCapacity
    _$GameVehicle$Propulsion$ThrustCapacityFromJson(
            Map<String, dynamic> json) =>
        GameVehicle$Propulsion$ThrustCapacity(
          main: (json['main'] as num?)?.toDouble(),
          retro: (json['retro'] as num?)?.toDouble(),
          vtol: (json['vtol'] as num?)?.toDouble(),
          maneuvering: (json['maneuvering'] as num?)?.toDouble(),
        );

Map<String, dynamic> _$GameVehicle$Propulsion$ThrustCapacityToJson(
        GameVehicle$Propulsion$ThrustCapacity instance) =>
    <String, dynamic>{
      'main': instance.main,
      'retro': instance.retro,
      'vtol': instance.vtol,
      'maneuvering': instance.maneuvering,
    };

GameVehicle$Weaponry$FixedWeapons _$GameVehicle$Weaponry$FixedWeaponsFromJson(
        Map<String, dynamic> json) =>
    GameVehicle$Weaponry$FixedWeapons(
      dpsTotal: (json['dps_total'] as num?)?.toDouble(),
      sustainedDpsTotal: (json['sustained_dps_total'] as num?)?.toDouble(),
      alphaTotal: (json['alpha_total'] as num?)?.toDouble(),
      weapons: (json['weapons'] as List<dynamic>?)
          ?.map((e) => GameVehicle$Weaponry$FixedWeapons$Weapons$Item.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GameVehicle$Weaponry$FixedWeaponsToJson(
        GameVehicle$Weaponry$FixedWeapons instance) =>
    <String, dynamic>{
      'dps_total': instance.dpsTotal,
      'sustained_dps_total': instance.sustainedDpsTotal,
      'alpha_total': instance.alphaTotal,
      'weapons': instance.weapons?.map((e) => e.toJson()).toList(),
    };

GameVehicle$Weaponry$Missiles _$GameVehicle$Weaponry$MissilesFromJson(
        Map<String, dynamic> json) =>
    GameVehicle$Weaponry$Missiles(
      count: (json['count'] as num?)?.toInt(),
      damage: json['damage'] == null
          ? null
          : GameVehicle$Weaponry$Missiles$Damage.fromJson(
              json['damage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GameVehicle$Weaponry$MissilesToJson(
        GameVehicle$Weaponry$Missiles instance) =>
    <String, dynamic>{
      'count': instance.count,
      'damage': instance.damage?.toJson(),
    };

Starsystem$CelestialObject$CelestialObject
    _$Starsystem$CelestialObject$CelestialObjectFromJson(
            Map<String, dynamic> json) =>
        Starsystem$CelestialObject$CelestialObject(
          data: json['data'] == null
              ? null
              : CelestialObject.fromJson(json['data'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$Starsystem$CelestialObject$CelestialObjectToJson(
        Starsystem$CelestialObject$CelestialObject instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
    };

Starsystem$Jumppoints$Jumppoints _$Starsystem$Jumppoints$JumppointsFromJson(
        Map<String, dynamic> json) =>
    Starsystem$Jumppoints$Jumppoints(
      data: json['data'] == null
          ? null
          : Jumppoint.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$Starsystem$Jumppoints$JumppointsToJson(
        Starsystem$Jumppoints$Jumppoints instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
    };

ShipMatrixVehicle$Agility$Acceleration
    _$ShipMatrixVehicle$Agility$AccelerationFromJson(
            Map<String, dynamic> json) =>
        ShipMatrixVehicle$Agility$Acceleration(
          xAxis: (json['x_axis'] as num?)?.toDouble(),
          yAxis: (json['y_axis'] as num?)?.toDouble(),
          zAxis: (json['z_axis'] as num?)?.toDouble(),
        );

Map<String, dynamic> _$ShipMatrixVehicle$Agility$AccelerationToJson(
        ShipMatrixVehicle$Agility$Acceleration instance) =>
    <String, dynamic>{
      'x_axis': instance.xAxis,
      'y_axis': instance.yAxis,
      'z_axis': instance.zAxis,
    };

ApiSearchGet$Response$Data$Item$Results$Item
    _$ApiSearchGet$Response$Data$Item$Results$ItemFromJson(
            Map<String, dynamic> json) =>
        ApiSearchGet$Response$Data$Item$Results$Item(
          name: json['name'] as String?,
          className: json['class_name'] as String?,
          classification: json['classification'] as String?,
          classificationLabel: json['classification_label'] as String?,
          itemTypeLabel: json['item_type_label'] as String?,
          extraLabel: json['extra_label'] as String?,
          webUrl: json['web_url'] as String?,
          apiUrl: json['api_url'] as String?,
        );

Map<String, dynamic> _$ApiSearchGet$Response$Data$Item$Results$ItemToJson(
        ApiSearchGet$Response$Data$Item$Results$Item instance) =>
    <String, dynamic>{
      'name': instance.name,
      'class_name': instance.className,
      'classification': instance.classification,
      'classification_label': instance.classificationLabel,
      'item_type_label': instance.itemTypeLabel,
      'extra_label': instance.extraLabel,
      'web_url': instance.webUrl,
      'api_url': instance.apiUrl,
    };

GameVehicle$Shield$Resistance$Physical
    _$GameVehicle$Shield$Resistance$PhysicalFromJson(
            Map<String, dynamic> json) =>
        GameVehicle$Shield$Resistance$Physical(
          minimum: (json['minimum'] as num?)?.toDouble(),
          maximum: (json['maximum'] as num?)?.toDouble(),
        );

Map<String, dynamic> _$GameVehicle$Shield$Resistance$PhysicalToJson(
        GameVehicle$Shield$Resistance$Physical instance) =>
    <String, dynamic>{
      'minimum': instance.minimum,
      'maximum': instance.maximum,
    };

GameVehicle$Shield$Resistance$Energy
    _$GameVehicle$Shield$Resistance$EnergyFromJson(Map<String, dynamic> json) =>
        GameVehicle$Shield$Resistance$Energy(
          minimum: (json['minimum'] as num?)?.toDouble(),
          maximum: (json['maximum'] as num?)?.toDouble(),
        );

Map<String, dynamic> _$GameVehicle$Shield$Resistance$EnergyToJson(
        GameVehicle$Shield$Resistance$Energy instance) =>
    <String, dynamic>{
      'minimum': instance.minimum,
      'maximum': instance.maximum,
    };

GameVehicle$Shield$Resistance$Distortion
    _$GameVehicle$Shield$Resistance$DistortionFromJson(
            Map<String, dynamic> json) =>
        GameVehicle$Shield$Resistance$Distortion(
          minimum: (json['minimum'] as num?)?.toDouble(),
          maximum: (json['maximum'] as num?)?.toDouble(),
        );

Map<String, dynamic> _$GameVehicle$Shield$Resistance$DistortionToJson(
        GameVehicle$Shield$Resistance$Distortion instance) =>
    <String, dynamic>{
      'minimum': instance.minimum,
      'maximum': instance.maximum,
    };

GameVehicle$Shield$Resistance$Thermal
    _$GameVehicle$Shield$Resistance$ThermalFromJson(
            Map<String, dynamic> json) =>
        GameVehicle$Shield$Resistance$Thermal(
          minimum: (json['minimum'] as num?)?.toDouble(),
          maximum: (json['maximum'] as num?)?.toDouble(),
        );

Map<String, dynamic> _$GameVehicle$Shield$Resistance$ThermalToJson(
        GameVehicle$Shield$Resistance$Thermal instance) =>
    <String, dynamic>{
      'minimum': instance.minimum,
      'maximum': instance.maximum,
    };

GameVehicle$Shield$Resistance$Biochemical
    _$GameVehicle$Shield$Resistance$BiochemicalFromJson(
            Map<String, dynamic> json) =>
        GameVehicle$Shield$Resistance$Biochemical(
          minimum: (json['minimum'] as num?)?.toDouble(),
          maximum: (json['maximum'] as num?)?.toDouble(),
        );

Map<String, dynamic> _$GameVehicle$Shield$Resistance$BiochemicalToJson(
        GameVehicle$Shield$Resistance$Biochemical instance) =>
    <String, dynamic>{
      'minimum': instance.minimum,
      'maximum': instance.maximum,
    };

GameVehicle$Shield$Resistance$Stun _$GameVehicle$Shield$Resistance$StunFromJson(
        Map<String, dynamic> json) =>
    GameVehicle$Shield$Resistance$Stun(
      minimum: (json['minimum'] as num?)?.toDouble(),
      maximum: (json['maximum'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$GameVehicle$Shield$Resistance$StunToJson(
        GameVehicle$Shield$Resistance$Stun instance) =>
    <String, dynamic>{
      'minimum': instance.minimum,
      'maximum': instance.maximum,
    };

GameVehicle$Shield$Absorption$Physical
    _$GameVehicle$Shield$Absorption$PhysicalFromJson(
            Map<String, dynamic> json) =>
        GameVehicle$Shield$Absorption$Physical(
          minimum: (json['minimum'] as num?)?.toDouble(),
          maximum: (json['maximum'] as num?)?.toDouble(),
        );

Map<String, dynamic> _$GameVehicle$Shield$Absorption$PhysicalToJson(
        GameVehicle$Shield$Absorption$Physical instance) =>
    <String, dynamic>{
      'minimum': instance.minimum,
      'maximum': instance.maximum,
    };

GameVehicle$Shield$Absorption$Energy
    _$GameVehicle$Shield$Absorption$EnergyFromJson(Map<String, dynamic> json) =>
        GameVehicle$Shield$Absorption$Energy(
          minimum: (json['minimum'] as num?)?.toDouble(),
          maximum: (json['maximum'] as num?)?.toDouble(),
        );

Map<String, dynamic> _$GameVehicle$Shield$Absorption$EnergyToJson(
        GameVehicle$Shield$Absorption$Energy instance) =>
    <String, dynamic>{
      'minimum': instance.minimum,
      'maximum': instance.maximum,
    };

GameVehicle$Shield$Absorption$Distortion
    _$GameVehicle$Shield$Absorption$DistortionFromJson(
            Map<String, dynamic> json) =>
        GameVehicle$Shield$Absorption$Distortion(
          minimum: (json['minimum'] as num?)?.toDouble(),
          maximum: (json['maximum'] as num?)?.toDouble(),
        );

Map<String, dynamic> _$GameVehicle$Shield$Absorption$DistortionToJson(
        GameVehicle$Shield$Absorption$Distortion instance) =>
    <String, dynamic>{
      'minimum': instance.minimum,
      'maximum': instance.maximum,
    };

GameVehicle$Shield$Absorption$Thermal
    _$GameVehicle$Shield$Absorption$ThermalFromJson(
            Map<String, dynamic> json) =>
        GameVehicle$Shield$Absorption$Thermal(
          minimum: (json['minimum'] as num?)?.toDouble(),
          maximum: (json['maximum'] as num?)?.toDouble(),
        );

Map<String, dynamic> _$GameVehicle$Shield$Absorption$ThermalToJson(
        GameVehicle$Shield$Absorption$Thermal instance) =>
    <String, dynamic>{
      'minimum': instance.minimum,
      'maximum': instance.maximum,
    };

GameVehicle$Shield$Absorption$Biochemical
    _$GameVehicle$Shield$Absorption$BiochemicalFromJson(
            Map<String, dynamic> json) =>
        GameVehicle$Shield$Absorption$Biochemical(
          minimum: (json['minimum'] as num?)?.toDouble(),
          maximum: (json['maximum'] as num?)?.toDouble(),
        );

Map<String, dynamic> _$GameVehicle$Shield$Absorption$BiochemicalToJson(
        GameVehicle$Shield$Absorption$Biochemical instance) =>
    <String, dynamic>{
      'minimum': instance.minimum,
      'maximum': instance.maximum,
    };

GameVehicle$Shield$Absorption$Stun _$GameVehicle$Shield$Absorption$StunFromJson(
        Map<String, dynamic> json) =>
    GameVehicle$Shield$Absorption$Stun(
      minimum: (json['minimum'] as num?)?.toDouble(),
      maximum: (json['maximum'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$GameVehicle$Shield$Absorption$StunToJson(
        GameVehicle$Shield$Absorption$Stun instance) =>
    <String, dynamic>{
      'minimum': instance.minimum,
      'maximum': instance.maximum,
    };

GameVehicle$Weaponry$FixedWeapons$Weapons$Item
    _$GameVehicle$Weaponry$FixedWeapons$Weapons$ItemFromJson(
            Map<String, dynamic> json) =>
        GameVehicle$Weaponry$FixedWeapons$Weapons$Item(
          name: json['name'] as String?,
          dps: (json['dps'] as num?)?.toDouble(),
          sustainedDps: (json['sustained_dps'] as num?)?.toDouble(),
          alpha: (json['alpha'] as num?)?.toDouble(),
        );

Map<String, dynamic> _$GameVehicle$Weaponry$FixedWeapons$Weapons$ItemToJson(
        GameVehicle$Weaponry$FixedWeapons$Weapons$Item instance) =>
    <String, dynamic>{
      'name': instance.name,
      'dps': instance.dps,
      'sustained_dps': instance.sustainedDps,
      'alpha': instance.alpha,
    };

GameVehicle$Weaponry$Missiles$Damage
    _$GameVehicle$Weaponry$Missiles$DamageFromJson(Map<String, dynamic> json) =>
        GameVehicle$Weaponry$Missiles$Damage(
          physical: (json['physical'] as num?)?.toDouble(),
          energy: (json['energy'] as num?)?.toDouble(),
          distortion: (json['distortion'] as num?)?.toDouble(),
          thermal: (json['thermal'] as num?)?.toDouble(),
          biochemical: (json['biochemical'] as num?)?.toDouble(),
          stun: (json['stun'] as num?)?.toDouble(),
          total: (json['total'] as num?)?.toDouble(),
        );

Map<String, dynamic> _$GameVehicle$Weaponry$Missiles$DamageToJson(
        GameVehicle$Weaponry$Missiles$Damage instance) =>
    <String, dynamic>{
      'physical': instance.physical,
      'energy': instance.energy,
      'distortion': instance.distortion,
      'thermal': instance.thermal,
      'biochemical': instance.biochemical,
      'stun': instance.stun,
      'total': instance.total,
    };
