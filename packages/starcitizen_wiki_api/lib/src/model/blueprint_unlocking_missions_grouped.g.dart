// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blueprint_unlocking_missions_grouped.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlueprintUnlockingMissionsGrouped _$BlueprintUnlockingMissionsGroupedFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('BlueprintUnlockingMissionsGrouped', json, (
  $checkedConvert,
) {
  final val = BlueprintUnlockingMissionsGrouped(
    label: $checkedConvert('label', (v) => v as String?),
    chance: $checkedConvert('chance', (v) => (v as num?)?.toDouble()),
    missions: $checkedConvert(
      'missions',
      (v) => (v as List<dynamic>?)
          ?.map(
            (e) => BlueprintUnlockingMissionsGroupedEntry.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
    ),
  );
  return val;
});

Map<String, dynamic> _$BlueprintUnlockingMissionsGroupedToJson(
  BlueprintUnlockingMissionsGrouped instance,
) => <String, dynamic>{
  'label': ?instance.label,
  'chance': ?instance.chance,
  'missions': ?instance.missions?.map((e) => e.toJson()).toList(),
};
