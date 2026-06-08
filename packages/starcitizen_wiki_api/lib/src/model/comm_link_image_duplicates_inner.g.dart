// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comm_link_image_duplicates_inner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommLinkImageDuplicatesInner _$CommLinkImageDuplicatesInnerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('CommLinkImageDuplicatesInner', json, ($checkedConvert) {
  final val = CommLinkImageDuplicatesInner(
    id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
    name: $checkedConvert('name', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$CommLinkImageDuplicatesInnerToJson(
  CommLinkImageDuplicatesInner instance,
) => <String, dynamic>{'id': ?instance.id, 'name': ?instance.name};
