// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_log_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GameLogStatusImpl _$$GameLogStatusImplFromJson(Map<String, dynamic> json) =>
    _$GameLogStatusImpl(
      latestGameTime: json['latestGameTime'] == null
          ? null
          : DateTime.parse(json['latestGameTime'] as String),
      lastRefreshTime: json['lastRefreshTime'] == null
          ? null
          : DateTime.parse(json['lastRefreshTime'] as String),
      missionCompletedCount: (json['missionCompletedCount'] as num?)?.toInt(),
      playerKillCount: (json['playerKillCount'] as num?)?.toInt(),
      playerDeathCount: (json['playerDeathCount'] as num?)?.toInt(),
      gamePlayTimeMinutes: (json['gamePlayTimeMinutes'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$GameLogStatusImplToJson(_$GameLogStatusImpl instance) =>
    <String, dynamic>{
      'latestGameTime': instance.latestGameTime?.toIso8601String(),
      'lastRefreshTime': instance.lastRefreshTime?.toIso8601String(),
      'missionCompletedCount': instance.missionCompletedCount,
      'playerKillCount': instance.playerKillCount,
      'playerDeathCount': instance.playerDeathCount,
      'gamePlayTimeMinutes': instance.gamePlayTimeMinutes,
    };
