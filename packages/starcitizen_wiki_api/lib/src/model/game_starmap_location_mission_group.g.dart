// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_starmap_location_mission_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameStarmapLocationMissionGroup _$GameStarmapLocationMissionGroupFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('GameStarmapLocationMissionGroup', json, ($checkedConvert) {
  final val = GameStarmapLocationMissionGroup(
    purpose: $checkedConvert('purpose', (v) => v as String?),
    missions: $checkedConvert(
      'missions',
      (v) => (v as List<dynamic>?)
          ?.map((e) => MissionSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
  );
  return val;
});

Map<String, dynamic> _$GameStarmapLocationMissionGroupToJson(
  GameStarmapLocationMissionGroup instance,
) => <String, dynamic>{
  'purpose': ?instance.purpose,
  'missions': ?instance.missions?.map((e) => e.toJson()).toList(),
};
