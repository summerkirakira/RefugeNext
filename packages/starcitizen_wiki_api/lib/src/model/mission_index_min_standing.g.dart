// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mission_index_min_standing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MissionIndexMinStanding _$MissionIndexMinStandingFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'MissionIndexMinStanding',
  json,
  ($checkedConvert) {
    final val = MissionIndexMinStanding(
      name: $checkedConvert('name', (v) => v as String?),
      minReputation: $checkedConvert(
        'min_reputation',
        (v) => (v as num?)?.toInt(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {'minReputation': 'min_reputation'},
);

Map<String, dynamic> _$MissionIndexMinStandingToJson(
  MissionIndexMinStanding instance,
) => <String, dynamic>{
  'name': ?instance.name,
  'min_reputation': ?instance.minReputation,
};
