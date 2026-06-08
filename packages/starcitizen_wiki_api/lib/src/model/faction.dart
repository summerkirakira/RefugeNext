//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/faction_reputation_ladder.dart';
import 'package:json_annotation/json_annotation.dart';

part 'faction.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Faction {
  /// Returns a new [Faction] instance.
  Faction({

     this.uuid,

     this.name,

     this.factionType,

     this.lawful,

     this.isNpc,

     this.hasReputation,

     this.link,

     this.description,

     this.defaultReaction,

     this.ableToArrest,

     this.policesLawfulTrespass,

     this.policesCriminality,

     this.noLegalRights,

     this.headquarters,

     this.founded,

     this.leadership,

     this.area,

     this.focus,

     this.sortOrderScope,

     this.reputationLadder,
  });

      /// Unique faction identifier.
  @JsonKey(
    
    name: r'uuid',
    required: false,
    includeIfNull: false,
  )


  final String? uuid;



      /// Display name of the faction.
  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



      /// Category of the faction. One of: Lawful, Unlawful, LawEnforcement, PrivateSecurity.
  @JsonKey(
    
    name: r'faction_type',
    required: false,
    includeIfNull: false,
  )


  final String? factionType;



      /// Whether the faction is considered lawful.
  @JsonKey(
    
    name: r'lawful',
    required: false,
    includeIfNull: false,
  )


  final bool? lawful;



      /// Whether the faction is NPC-controlled.
  @JsonKey(
    
    name: r'is_npc',
    required: false,
    includeIfNull: false,
  )


  final bool? isNpc;



      /// Whether the faction tracks player reputation.
  @JsonKey(
    
    name: r'has_reputation',
    required: false,
    includeIfNull: false,
  )


  final bool? hasReputation;



      /// API URL for this faction.
  @JsonKey(
    
    name: r'link',
    required: false,
    includeIfNull: false,
  )


  final String? link;



      /// Lore description of the faction.
  @JsonKey(
    
    name: r'description',
    required: false,
    includeIfNull: false,
  )


  final String? description;



      /// Default reaction towards the player. One of: Friendly, Hostile, Neutral.
  @JsonKey(
    
    name: r'default_reaction',
    required: false,
    includeIfNull: false,
  )


  final String? defaultReaction;



      /// Whether the faction can arrest players.
  @JsonKey(
    
    name: r'able_to_arrest',
    required: false,
    includeIfNull: false,
  )


  final bool? ableToArrest;



      /// Whether the faction enforces trespass violations against lawful characters.
  @JsonKey(
    
    name: r'polices_lawful_trespass',
    required: false,
    includeIfNull: false,
  )


  final bool? policesLawfulTrespass;



      /// Whether the faction actively polices criminal activity.
  @JsonKey(
    
    name: r'polices_criminality',
    required: false,
    includeIfNull: false,
  )


  final bool? policesCriminality;



      /// Whether the faction operates without legal protections.
  @JsonKey(
    
    name: r'no_legal_rights',
    required: false,
    includeIfNull: false,
  )


  final bool? noLegalRights;



      /// Location of the faction's headquarters.
  @JsonKey(
    
    name: r'headquarters',
    required: false,
    includeIfNull: false,
  )


  final String? headquarters;



      /// Founding date or era of the faction.
  @JsonKey(
    
    name: r'founded',
    required: false,
    includeIfNull: false,
  )


  final String? founded;



      /// Current leadership of the faction.
  @JsonKey(
    
    name: r'leadership',
    required: false,
    includeIfNull: false,
  )


  final String? leadership;



      /// Primary area of operations.
  @JsonKey(
    
    name: r'area',
    required: false,
    includeIfNull: false,
  )


  final String? area;



      /// Primary focus or industry of the faction.
  @JsonKey(
    
    name: r'focus',
    required: false,
    includeIfNull: false,
  )


  final String? focus;



      /// Scope key used for sort ordering within reputation tiers.
  @JsonKey(
    
    name: r'sort_order_scope',
    required: false,
    includeIfNull: false,
  )


  final String? sortOrderScope;



      /// Reputation ladder with standings. Requires ?include=reputationLadder.
  @JsonKey(
    
    name: r'reputation_ladder',
    required: false,
    includeIfNull: false,
  )


  final FactionReputationLadder? reputationLadder;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Faction &&
      other.uuid == uuid &&
      other.name == name &&
      other.factionType == factionType &&
      other.lawful == lawful &&
      other.isNpc == isNpc &&
      other.hasReputation == hasReputation &&
      other.link == link &&
      other.description == description &&
      other.defaultReaction == defaultReaction &&
      other.ableToArrest == ableToArrest &&
      other.policesLawfulTrespass == policesLawfulTrespass &&
      other.policesCriminality == policesCriminality &&
      other.noLegalRights == noLegalRights &&
      other.headquarters == headquarters &&
      other.founded == founded &&
      other.leadership == leadership &&
      other.area == area &&
      other.focus == focus &&
      other.sortOrderScope == sortOrderScope &&
      other.reputationLadder == reputationLadder;

    @override
    int get hashCode =>
        uuid.hashCode +
        name.hashCode +
        factionType.hashCode +
        (lawful == null ? 0 : lawful.hashCode) +
        isNpc.hashCode +
        hasReputation.hashCode +
        link.hashCode +
        (description == null ? 0 : description.hashCode) +
        defaultReaction.hashCode +
        ableToArrest.hashCode +
        policesLawfulTrespass.hashCode +
        policesCriminality.hashCode +
        noLegalRights.hashCode +
        (headquarters == null ? 0 : headquarters.hashCode) +
        (founded == null ? 0 : founded.hashCode) +
        (leadership == null ? 0 : leadership.hashCode) +
        (area == null ? 0 : area.hashCode) +
        (focus == null ? 0 : focus.hashCode) +
        (sortOrderScope == null ? 0 : sortOrderScope.hashCode) +
        (reputationLadder == null ? 0 : reputationLadder.hashCode);

  factory Faction.fromJson(Map<String, dynamic> json) => _$FactionFromJson(json);

  Map<String, dynamic> toJson() => _$FactionToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

