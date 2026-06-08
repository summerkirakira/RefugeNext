// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mission_faction_reputation_scope.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MissionFactionReputationScope _$MissionFactionReputationScopeFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'MissionFactionReputationScope',
  json,
  ($checkedConvert) {
    final val = MissionFactionReputationScope(
      scopeName: $checkedConvert('scope_name', (v) => v as String?),
      standings: $checkedConvert(
        'standings',
        (v) => (v as List<dynamic>?)
            ?.map(
              (e) => MissionFactionStanding.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {'scopeName': 'scope_name'},
);

Map<String, dynamic> _$MissionFactionReputationScopeToJson(
  MissionFactionReputationScope instance,
) => <String, dynamic>{
  'scope_name': ?instance.scopeName,
  'standings': ?instance.standings?.map((e) => e.toJson()).toList(),
};
