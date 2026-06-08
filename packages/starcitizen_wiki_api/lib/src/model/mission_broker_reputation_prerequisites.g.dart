// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mission_broker_reputation_prerequisites.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MissionBrokerReputationPrerequisites
_$MissionBrokerReputationPrerequisitesFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'MissionBrokerReputationPrerequisites',
      json,
      ($checkedConvert) {
        final val = MissionBrokerReputationPrerequisites(
          maxWantedLevel: $checkedConvert(
            'max_wanted_level',
            (v) => (v as num?)?.toInt(),
          ),
          minWantedLevel: $checkedConvert(
            'min_wanted_level',
            (v) => (v as num?)?.toInt(),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'maxWantedLevel': 'max_wanted_level',
        'minWantedLevel': 'min_wanted_level',
      },
    );

Map<String, dynamic> _$MissionBrokerReputationPrerequisitesToJson(
  MissionBrokerReputationPrerequisites instance,
) => <String, dynamic>{
  'max_wanted_level': ?instance.maxWantedLevel,
  'min_wanted_level': ?instance.minWantedLevel,
};
