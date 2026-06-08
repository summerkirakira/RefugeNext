//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/mission_faction_reputation_scope.dart';
import 'package:json_annotation/json_annotation.dart';

part 'mission_faction.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MissionFaction {
  /// Returns a new [MissionFaction] instance.
  MissionFaction({

     this.name,

     this.uuid,

     this.factionType,

     this.lawful,

     this.isNpc,

     this.hasReputation,

     this.headquarters,

     this.area,

     this.focus,

     this.founded,

     this.leadership,

     this.link,

     this.reputationLadder,
  });

  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



  @JsonKey(
    
    name: r'uuid',
    required: false,
    includeIfNull: false,
  )


  final String? uuid;



  @JsonKey(
    
    name: r'faction_type',
    required: false,
    includeIfNull: false,
  )


  final String? factionType;



  @JsonKey(
    
    name: r'lawful',
    required: false,
    includeIfNull: false,
  )


  final bool? lawful;



  @JsonKey(
    
    name: r'is_npc',
    required: false,
    includeIfNull: false,
  )


  final bool? isNpc;



  @JsonKey(
    
    name: r'has_reputation',
    required: false,
    includeIfNull: false,
  )


  final bool? hasReputation;



  @JsonKey(
    
    name: r'headquarters',
    required: false,
    includeIfNull: false,
  )


  final String? headquarters;



  @JsonKey(
    
    name: r'area',
    required: false,
    includeIfNull: false,
  )


  final String? area;



  @JsonKey(
    
    name: r'focus',
    required: false,
    includeIfNull: false,
  )


  final String? focus;



  @JsonKey(
    
    name: r'founded',
    required: false,
    includeIfNull: false,
  )


  final String? founded;



  @JsonKey(
    
    name: r'leadership',
    required: false,
    includeIfNull: false,
  )


  final String? leadership;



  @JsonKey(
    
    name: r'link',
    required: false,
    includeIfNull: false,
  )


  final String? link;



  @JsonKey(
    
    name: r'reputation_ladder',
    required: false,
    includeIfNull: false,
  )


  final MissionFactionReputationScope? reputationLadder;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MissionFaction &&
      other.name == name &&
      other.uuid == uuid &&
      other.factionType == factionType &&
      other.lawful == lawful &&
      other.isNpc == isNpc &&
      other.hasReputation == hasReputation &&
      other.headquarters == headquarters &&
      other.area == area &&
      other.focus == focus &&
      other.founded == founded &&
      other.leadership == leadership &&
      other.link == link &&
      other.reputationLadder == reputationLadder;

    @override
    int get hashCode =>
        (name == null ? 0 : name.hashCode) +
        (uuid == null ? 0 : uuid.hashCode) +
        (factionType == null ? 0 : factionType.hashCode) +
        (lawful == null ? 0 : lawful.hashCode) +
        isNpc.hashCode +
        hasReputation.hashCode +
        (headquarters == null ? 0 : headquarters.hashCode) +
        (area == null ? 0 : area.hashCode) +
        (focus == null ? 0 : focus.hashCode) +
        (founded == null ? 0 : founded.hashCode) +
        (leadership == null ? 0 : leadership.hashCode) +
        (link == null ? 0 : link.hashCode) +
        (reputationLadder == null ? 0 : reputationLadder.hashCode);

  factory MissionFaction.fromJson(Map<String, dynamic> json) => _$MissionFactionFromJson(json);

  Map<String, dynamic> toJson() => _$MissionFactionToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

