// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Translation _$TranslationFromJson(Map<String, dynamic> json) =>
    $checkedCreate('Translation', json, ($checkedConvert) {
      final val = Translation(
        en: $checkedConvert('en', (v) => v as String?),
        de: $checkedConvert('de', (v) => v as String?),
        zh: $checkedConvert('zh', (v) => v as String?),
        fr: $checkedConvert('fr', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$TranslationToJson(Translation instance) =>
    <String, dynamic>{
      'en': ?instance.en,
      'de': ?instance.de,
      'zh': ?instance.zh,
      'fr': ?instance.fr,
    };
