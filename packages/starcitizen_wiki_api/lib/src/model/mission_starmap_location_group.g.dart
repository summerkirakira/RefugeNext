// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mission_starmap_location_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MissionStarmapLocationGroup _$MissionStarmapLocationGroupFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('MissionStarmapLocationGroup', json, ($checkedConvert) {
  final val = MissionStarmapLocationGroup(
    purpose: $checkedConvert('purpose', (v) => v as String?),
    locations: $checkedConvert(
      'locations',
      (v) => (v as List<dynamic>?)
          ?.map(
            (e) => MissionStarmapLocation.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    ),
  );
  return val;
});

Map<String, dynamic> _$MissionStarmapLocationGroupToJson(
  MissionStarmapLocationGroup instance,
) => <String, dynamic>{
  'purpose': ?instance.purpose,
  'locations': ?instance.locations?.map((e) => e.toJson()).toList(),
};
