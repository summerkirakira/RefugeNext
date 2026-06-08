// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_starmap_location_jurisdiction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameStarmapLocationJurisdiction _$GameStarmapLocationJurisdictionFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'GameStarmapLocationJurisdiction',
  json,
  ($checkedConvert) {
    final val = GameStarmapLocationJurisdiction(
      uuid: $checkedConvert('uuid', (v) => v as String?),
      name: $checkedConvert('name', (v) => v as String?),
      baseFine: $checkedConvert('base_fine', (v) => (v as num?)?.toInt()),
      maxStolenGoodsPossessionScu: $checkedConvert(
        'max_stolen_goods_possession_scu',
        (v) => (v as num?)?.toInt(),
      ),
      isPrison: $checkedConvert('is_prison', (v) => v as bool?),
    );
    return val;
  },
  fieldKeyMap: const {
    'baseFine': 'base_fine',
    'maxStolenGoodsPossessionScu': 'max_stolen_goods_possession_scu',
    'isPrison': 'is_prison',
  },
);

Map<String, dynamic> _$GameStarmapLocationJurisdictionToJson(
  GameStarmapLocationJurisdiction instance,
) => <String, dynamic>{
  'uuid': ?instance.uuid,
  'name': ?instance.name,
  'base_fine': ?instance.baseFine,
  'max_stolen_goods_possession_scu': ?instance.maxStolenGoodsPossessionScu,
  'is_prison': ?instance.isPrison,
};
