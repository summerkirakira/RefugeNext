// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mission_index_variants_inner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MissionIndexVariantsInner _$MissionIndexVariantsInnerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('MissionIndexVariantsInner', json, ($checkedConvert) {
  final val = MissionIndexVariantsInner(
    uuid: $checkedConvert('uuid', (v) => v as String?),
    title: $checkedConvert('title', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$MissionIndexVariantsInnerToJson(
  MissionIndexVariantsInner instance,
) => <String, dynamic>{'uuid': ?instance.uuid, 'title': ?instance.title};
