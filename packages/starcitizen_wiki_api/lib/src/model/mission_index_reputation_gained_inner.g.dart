// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mission_index_reputation_gained_inner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MissionIndexReputationGainedInner _$MissionIndexReputationGainedInnerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'MissionIndexReputationGainedInner',
  json,
  ($checkedConvert) {
    final val = MissionIndexReputationGainedInner(
      faction: $checkedConvert('faction', (v) => v as String?),
      factionUuid: $checkedConvert('faction_uuid', (v) => v as String?),
      scope: $checkedConvert('scope', (v) => v as String?),
      tier: $checkedConvert('tier', (v) => v as String?),
      amount: $checkedConvert('amount', (v) => (v as num?)?.toInt()),
    );
    return val;
  },
  fieldKeyMap: const {'factionUuid': 'faction_uuid'},
);

Map<String, dynamic> _$MissionIndexReputationGainedInnerToJson(
  MissionIndexReputationGainedInner instance,
) => <String, dynamic>{
  'faction': ?instance.faction,
  'faction_uuid': ?instance.factionUuid,
  'scope': ?instance.scope,
  'tier': ?instance.tier,
  'amount': ?instance.amount,
};
