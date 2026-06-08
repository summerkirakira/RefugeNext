// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource_container_composition_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResourceContainerCompositionEntry _$ResourceContainerCompositionEntryFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ResourceContainerCompositionEntry', json, (
  $checkedConvert,
) {
  final val = ResourceContainerCompositionEntry(
    entry: $checkedConvert('entry', (v) => v as String?),
    weight: $checkedConvert('weight', (v) => (v as num?)?.toDouble()),
    commodity: $checkedConvert(
      'commodity',
      (v) => v == null
          ? null
          : ResourceContainerCommodityLink.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$ResourceContainerCompositionEntryToJson(
  ResourceContainerCompositionEntry instance,
) => <String, dynamic>{
  'entry': ?instance.entry,
  'weight': ?instance.weight,
  'commodity': ?instance.commodity?.toJson(),
};
