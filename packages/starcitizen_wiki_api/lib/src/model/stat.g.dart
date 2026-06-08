// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Stat _$StatFromJson(Map<String, dynamic> json) =>
    $checkedCreate('Stat', json, ($checkedConvert) {
      final val = Stat(
        funds: $checkedConvert('funds', (v) => (v as num?)?.toDouble()),
        fans: $checkedConvert('fans', (v) => (v as num?)?.toInt()),
        fleet: $checkedConvert('fleet', (v) => (v as num?)?.toInt()),
        timestamp: $checkedConvert(
          'timestamp',
          (v) => v == null ? null : DateTime.parse(v as String),
        ),
      );
      return val;
    });

Map<String, dynamic> _$StatToJson(Stat instance) => <String, dynamic>{
  'funds': ?instance.funds,
  'fans': ?instance.fans,
  'fleet': ?instance.fleet,
  'timestamp': ?instance.timestamp?.toIso8601String(),
};
