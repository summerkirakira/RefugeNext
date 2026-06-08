// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_version.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameVersion _$GameVersionFromJson(Map<String, dynamic> json) => $checkedCreate(
  'GameVersion',
  json,
  ($checkedConvert) {
    final val = GameVersion(
      code: $checkedConvert('code', (v) => v as String?),
      channel: $checkedConvert('channel', (v) => v as String?),
      releasedAt: $checkedConvert(
        'released_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      isDefault: $checkedConvert('is_default', (v) => v as bool?),
    );
    return val;
  },
  fieldKeyMap: const {'releasedAt': 'released_at', 'isDefault': 'is_default'},
);

Map<String, dynamic> _$GameVersionToJson(GameVersion instance) =>
    <String, dynamic>{
      'code': ?instance.code,
      'channel': ?instance.channel,
      'released_at': ?instance.releasedAt?.toIso8601String(),
      'is_default': ?instance.isDefault,
    };
