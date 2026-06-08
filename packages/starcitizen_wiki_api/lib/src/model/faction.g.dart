// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Faction _$FactionFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Faction',
  json,
  ($checkedConvert) {
    final val = Faction(
      uuid: $checkedConvert('uuid', (v) => v as String?),
      name: $checkedConvert('name', (v) => v as String?),
      factionType: $checkedConvert('faction_type', (v) => v as String?),
      lawful: $checkedConvert('lawful', (v) => v as bool?),
      isNpc: $checkedConvert('is_npc', (v) => v as bool?),
      hasReputation: $checkedConvert('has_reputation', (v) => v as bool?),
      link: $checkedConvert('link', (v) => v as String?),
      description: $checkedConvert('description', (v) => v as String?),
      defaultReaction: $checkedConvert('default_reaction', (v) => v as String?),
      ableToArrest: $checkedConvert('able_to_arrest', (v) => v as bool?),
      policesLawfulTrespass: $checkedConvert(
        'polices_lawful_trespass',
        (v) => v as bool?,
      ),
      policesCriminality: $checkedConvert(
        'polices_criminality',
        (v) => v as bool?,
      ),
      noLegalRights: $checkedConvert('no_legal_rights', (v) => v as bool?),
      headquarters: $checkedConvert('headquarters', (v) => v as String?),
      founded: $checkedConvert('founded', (v) => v as String?),
      leadership: $checkedConvert('leadership', (v) => v as String?),
      area: $checkedConvert('area', (v) => v as String?),
      focus: $checkedConvert('focus', (v) => v as String?),
      sortOrderScope: $checkedConvert('sort_order_scope', (v) => v as String?),
      reputationLadder: $checkedConvert(
        'reputation_ladder',
        (v) => v == null
            ? null
            : FactionReputationLadder.fromJson(v as Map<String, dynamic>),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'factionType': 'faction_type',
    'isNpc': 'is_npc',
    'hasReputation': 'has_reputation',
    'defaultReaction': 'default_reaction',
    'ableToArrest': 'able_to_arrest',
    'policesLawfulTrespass': 'polices_lawful_trespass',
    'policesCriminality': 'polices_criminality',
    'noLegalRights': 'no_legal_rights',
    'sortOrderScope': 'sort_order_scope',
    'reputationLadder': 'reputation_ladder',
  },
);

Map<String, dynamic> _$FactionToJson(Faction instance) => <String, dynamic>{
  'uuid': ?instance.uuid,
  'name': ?instance.name,
  'faction_type': ?instance.factionType,
  'lawful': ?instance.lawful,
  'is_npc': ?instance.isNpc,
  'has_reputation': ?instance.hasReputation,
  'link': ?instance.link,
  'description': ?instance.description,
  'default_reaction': ?instance.defaultReaction,
  'able_to_arrest': ?instance.ableToArrest,
  'polices_lawful_trespass': ?instance.policesLawfulTrespass,
  'polices_criminality': ?instance.policesCriminality,
  'no_legal_rights': ?instance.noLegalRights,
  'headquarters': ?instance.headquarters,
  'founded': ?instance.founded,
  'leadership': ?instance.leadership,
  'area': ?instance.area,
  'focus': ?instance.focus,
  'sort_order_scope': ?instance.sortOrderScope,
  'reputation_ladder': ?instance.reputationLadder?.toJson(),
};
