// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'starmap_location_mining_type_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StarmapLocationMiningTypeGroup _$StarmapLocationMiningTypeGroupFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'StarmapLocationMiningTypeGroup',
  json,
  ($checkedConvert) {
    final val = StarmapLocationMiningTypeGroup(
      groupName: $checkedConvert('group_name', (v) => v as String?),
      miningType: $checkedConvert('mining_type', (v) => v as String?),
      miningTypeSortOrder: $checkedConvert(
        'mining_type_sort_order',
        (v) => (v as num?)?.toInt(),
      ),
      resourceKind: $checkedConvert('resource_kind', (v) => v as String?),
      groupProbabilityMin: $checkedConvert(
        'group_probability_min',
        (v) => v as num?,
      ),
      groupProbabilityMax: $checkedConvert(
        'group_probability_max',
        (v) => v as num?,
      ),
      groupProbabilityMinPercent: $checkedConvert(
        'group_probability_min_percent',
        (v) => v as num?,
      ),
      groupProbabilityMaxPercent: $checkedConvert(
        'group_probability_max_percent',
        (v) => v as num?,
      ),
      resources: $checkedConvert(
        'resources',
        (v) => (v as List<dynamic>?)
            ?.map(
              (e) =>
                  StarmapLocationResource.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'groupName': 'group_name',
    'miningType': 'mining_type',
    'miningTypeSortOrder': 'mining_type_sort_order',
    'resourceKind': 'resource_kind',
    'groupProbabilityMin': 'group_probability_min',
    'groupProbabilityMax': 'group_probability_max',
    'groupProbabilityMinPercent': 'group_probability_min_percent',
    'groupProbabilityMaxPercent': 'group_probability_max_percent',
  },
);

Map<String, dynamic> _$StarmapLocationMiningTypeGroupToJson(
  StarmapLocationMiningTypeGroup instance,
) => <String, dynamic>{
  'group_name': ?instance.groupName,
  'mining_type': ?instance.miningType,
  'mining_type_sort_order': ?instance.miningTypeSortOrder,
  'resource_kind': ?instance.resourceKind,
  'group_probability_min': ?instance.groupProbabilityMin,
  'group_probability_max': ?instance.groupProbabilityMax,
  'group_probability_min_percent': ?instance.groupProbabilityMinPercent,
  'group_probability_max_percent': ?instance.groupProbabilityMaxPercent,
  'resources': ?instance.resources?.map((e) => e.toJson()).toList(),
};
