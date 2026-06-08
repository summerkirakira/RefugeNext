// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blueprint_aspect_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlueprintAspectInput _$BlueprintAspectInputFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'BlueprintAspectInput',
  json,
  ($checkedConvert) {
    final val = BlueprintAspectInput(
      kind: $checkedConvert('kind', (v) => v as String?),
      uuid: $checkedConvert('uuid', (v) => v as String?),
      name: $checkedConvert('name', (v) => v as String?),
      quantity: $checkedConvert('quantity', (v) => (v as num?)?.toDouble()),
      quantityScu: $checkedConvert(
        'quantity_scu',
        (v) => (v as num?)?.toDouble(),
      ),
      minQuality: $checkedConvert('min_quality', (v) => (v as num?)?.toInt()),
      webUrl: $checkedConvert('web_url', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'quantityScu': 'quantity_scu',
    'minQuality': 'min_quality',
    'webUrl': 'web_url',
  },
);

Map<String, dynamic> _$BlueprintAspectInputToJson(
  BlueprintAspectInput instance,
) => <String, dynamic>{
  'kind': ?instance.kind,
  'uuid': ?instance.uuid,
  'name': ?instance.name,
  'quantity': ?instance.quantity,
  'quantity_scu': ?instance.quantityScu,
  'min_quality': ?instance.minQuality,
  'web_url': ?instance.webUrl,
};
