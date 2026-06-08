// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_durability.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemDurability _$ItemDurabilityFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ItemDurability', json, ($checkedConvert) {
      final val = ItemDurability(
        health: $checkedConvert('health', (v) => (v as num?)?.toDouble()),
        lifetime: $checkedConvert('lifetime', (v) => (v as num?)?.toDouble()),
        maxLifetime: $checkedConvert(
          'max_lifetime',
          (v) => (v as num?)?.toDouble(),
        ),
        repairable: $checkedConvert('repairable', (v) => v as bool?),
        salvageable: $checkedConvert('salvageable', (v) => v as bool?),
        resistance: $checkedConvert(
          'resistance',
          (v) => v == null
              ? null
              : ItemDurabilityResistance.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    }, fieldKeyMap: const {'maxLifetime': 'max_lifetime'});

Map<String, dynamic> _$ItemDurabilityToJson(ItemDurability instance) =>
    <String, dynamic>{
      'health': ?instance.health,
      'lifetime': ?instance.lifetime,
      'max_lifetime': ?instance.maxLifetime,
      'repairable': ?instance.repairable,
      'salvageable': ?instance.salvageable,
      'resistance': ?instance.resistance?.toJson(),
    };
