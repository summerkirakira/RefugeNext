// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_container.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodContainer _$FoodContainerFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'FoodContainer',
      json,
      ($checkedConvert) {
        final val = FoodContainer(
          type: $checkedConvert('type', (v) => v as String?),
          closed: $checkedConvert('closed', (v) => v as bool?),
          canBeReclosed: $checkedConvert('can_be_reclosed', (v) => v as bool?),
          discardWhenConsumed: $checkedConvert(
            'discard_when_consumed',
            (v) => v as bool?,
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'canBeReclosed': 'can_be_reclosed',
        'discardWhenConsumed': 'discard_when_consumed',
      },
    );

Map<String, dynamic> _$FoodContainerToJson(FoodContainer instance) =>
    <String, dynamic>{
      'type': ?instance.type,
      'closed': ?instance.closed,
      'can_be_reclosed': ?instance.canBeReclosed,
      'discard_when_consumed': ?instance.discardWhenConsumed,
    };
