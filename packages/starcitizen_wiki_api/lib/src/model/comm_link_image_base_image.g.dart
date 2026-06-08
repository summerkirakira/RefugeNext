// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comm_link_image_base_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommLinkImageBaseImage _$CommLinkImageBaseImageFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('CommLinkImageBaseImage', json, ($checkedConvert) {
  final val = CommLinkImageBaseImage(
    id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
    name: $checkedConvert('name', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$CommLinkImageBaseImageToJson(
  CommLinkImageBaseImage instance,
) => <String, dynamic>{'id': ?instance.id, 'name': ?instance.name};
