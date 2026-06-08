//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/faction_standing.dart';
import 'package:json_annotation/json_annotation.dart';

part 'faction_reputation_ladder.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class FactionReputationLadder {
  /// Returns a new [FactionReputationLadder] instance.
  FactionReputationLadder({

     this.uuid,

     this.name,

     this.factionType,

     this.lawful,

     this.isNpc,

     this.hasReputation,

     this.link,

     this.scopeName,

     this.displayName,

     this.reputationCeiling,

     this.initialReputation,

     this.standings,
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



      /// API URL for the full faction detail.
  @JsonKey(
    
    name: r'link',
    required: false,
    includeIfNull: false,
  )


  final String? link;



      /// Internal scope name for the reputation system.
  @JsonKey(
    
    name: r'scope_name',
    required: false,
    includeIfNull: false,
  )


  final String? scopeName;



      /// Human-readable label for the reputation scope.
  @JsonKey(
    
    name: r'display_name',
    required: false,
    includeIfNull: false,
  )


  final String? displayName;



      /// Maximum attainable reputation value.
  @JsonKey(
    
    name: r'reputation_ceiling',
    required: false,
    includeIfNull: false,
  )


  final int? reputationCeiling;



      /// Starting reputation value for new players.
  @JsonKey(
    
    name: r'initial_reputation',
    required: false,
    includeIfNull: false,
  )


  final int? initialReputation;



      /// Ordered list of reputation tiers from highest to lowest.
  @JsonKey(
    
    name: r'standings',
    required: false,
    includeIfNull: false,
  )


  final List<FactionStanding>? standings;





    @override
    bool operator ==(Object other) => identical(this, other) || other is FactionReputationLadder &&
      other.uuid == uuid &&
      other.name == name &&
      other.factionType == factionType &&
      other.lawful == lawful &&
      other.isNpc == isNpc &&
      other.hasReputation == hasReputation &&
      other.link == link &&
      other.scopeName == scopeName &&
      other.displayName == displayName &&
      other.reputationCeiling == reputationCeiling &&
      other.initialReputation == initialReputation &&
      other.standings == standings;

    @override
    int get hashCode =>
        uuid.hashCode +
        name.hashCode +
        (factionType == null ? 0 : factionType.hashCode) +
        (lawful == null ? 0 : lawful.hashCode) +
        isNpc.hashCode +
        hasReputation.hashCode +
        link.hashCode +
        scopeName.hashCode +
        (displayName == null ? 0 : displayName.hashCode) +
        reputationCeiling.hashCode +
        initialReputation.hashCode +
        standings.hashCode;

  factory FactionReputationLadder.fromJson(Map<String, dynamic> json) => _$FactionReputationLadderFromJson(json);

  Map<String, dynamic> toJson() => _$FactionReputationLadderToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

