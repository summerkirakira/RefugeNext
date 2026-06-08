// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jumppoint.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Jumppoint _$JumppointFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('Jumppoint', json, ($checkedConvert) {
  final val = Jumppoint(
    id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
    size: $checkedConvert('size', (v) => v as String?),
    direction: $checkedConvert('direction', (v) => v as String?),
    entry: $checkedConvert(
      'entry',
      (v) =>
          v == null ? null : JumppointEntry.fromJson(v as Map<String, dynamic>),
    ),
    exit: $checkedConvert(
      'exit',
      (v) =>
          v == null ? null : JumppointEntry.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$JumppointToJson(Jumppoint instance) => <String, dynamic>{
  'id': ?instance.id,
  'size': ?instance.size,
  'direction': ?instance.direction,
  'entry': ?instance.entry?.toJson(),
  'exit': ?instance.exit?.toJson(),
};
