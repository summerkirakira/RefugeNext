// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mission_faction_standing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MissionFactionStanding _$MissionFactionStandingFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'MissionFactionStanding',
  json,
  ($checkedConvert) {
    final val = MissionFactionStanding(
      name: $checkedConvert('name', (v) => v as String?),
      displayName: $checkedConvert('display_name', (v) => v as String?),
      minReputation: $checkedConvert(
        'min_reputation',
        (v) => (v as num?)?.toInt(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'displayName': 'display_name',
    'minReputation': 'min_reputation',
  },
);

Map<String, dynamic> _$MissionFactionStandingToJson(
  MissionFactionStanding instance,
) => <String, dynamic>{
  'name': ?instance.name,
  'display_name': ?instance.displayName,
  'min_reputation': ?instance.minReputation,
};
