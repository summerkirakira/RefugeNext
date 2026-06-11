// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Translation _$TranslationFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Translation',
  json,
  ($checkedConvert) {
    final val = Translation(
      enEN: $checkedConvert('en_EN', (v) => v as String?),
      deDE: $checkedConvert('de_DE', (v) => v as String?),
      zhCN: $checkedConvert('zh_CN', (v) => v as String?),
      frFR: $checkedConvert('fr_FR', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'enEN': 'en_EN',
    'deDE': 'de_DE',
    'zhCN': 'zh_CN',
    'frFR': 'fr_FR',
  },
);

Map<String, dynamic> _$TranslationToJson(Translation instance) =>
    <String, dynamic>{
      'en_EN': ?instance.enEN,
      'de_DE': ?instance.deDE,
      'zh_CN': ?instance.zhCN,
      'fr_FR': ?instance.frFR,
    };
