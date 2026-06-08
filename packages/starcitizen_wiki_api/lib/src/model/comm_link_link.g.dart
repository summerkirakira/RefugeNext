// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comm_link_link.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommLinkLink _$CommLinkLinkFromJson(Map<String, dynamic> json) =>
    $checkedCreate('CommLinkLink', json, ($checkedConvert) {
      final val = CommLinkLink(
        href: $checkedConvert('href', (v) => v as String?),
        text: $checkedConvert('text', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$CommLinkLinkToJson(CommLinkLink instance) =>
    <String, dynamic>{'href': ?instance.href, 'text': ?instance.text};
