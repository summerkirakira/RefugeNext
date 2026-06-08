// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mission_reward_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MissionRewardItem _$MissionRewardItemFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'MissionRewardItem',
      json,
      ($checkedConvert) {
        final val = MissionRewardItem(
          name: $checkedConvert('name', (v) => v as String?),
          uuid: $checkedConvert('uuid', (v) => v as String?),
          amount: $checkedConvert('amount', (v) => (v as num?)?.toInt()),
          sendToHome: $checkedConvert('send_to_home', (v) => v as bool?),
          link: $checkedConvert('link', (v) => v as String?),
          webUrl: $checkedConvert('web_url', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {'sendToHome': 'send_to_home', 'webUrl': 'web_url'},
    );

Map<String, dynamic> _$MissionRewardItemToJson(MissionRewardItem instance) =>
    <String, dynamic>{
      'name': ?instance.name,
      'uuid': ?instance.uuid,
      'amount': ?instance.amount,
      'send_to_home': ?instance.sendToHome,
      'link': ?instance.link,
      'web_url': ?instance.webUrl,
    };
