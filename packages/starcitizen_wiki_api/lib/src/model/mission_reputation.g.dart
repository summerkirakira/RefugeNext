// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mission_reputation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MissionReputation _$MissionReputationFromJson(Map<String, dynamic> json) =>
    $checkedCreate('MissionReputation', json, ($checkedConvert) {
      final val = MissionReputation(
        tier: $checkedConvert('tier', (v) => v as String?),
        scope: $checkedConvert('scope', (v) => v as String?),
        amount: $checkedConvert('amount', (v) => (v as num?)?.toInt()),
        faction: $checkedConvert('faction', (v) => v as String?),
        factionUuid: $checkedConvert('faction_uuid', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {'factionUuid': 'faction_uuid'});

Map<String, dynamic> _$MissionReputationToJson(MissionReputation instance) =>
    <String, dynamic>{
      'tier': ?instance.tier,
      'scope': ?instance.scope,
      'amount': ?instance.amount,
      'faction': ?instance.faction,
      'faction_uuid': ?instance.factionUuid,
    };
