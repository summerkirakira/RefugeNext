//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'faction_index.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class FactionIndex {
  /// Returns a new [FactionIndex] instance.
  FactionIndex({

     this.uuid,

     this.name,

     this.factionType,

     this.lawful,

     this.isNpc,

     this.hasReputation,

     this.link,
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





    @override
    bool operator ==(Object other) => identical(this, other) || other is FactionIndex &&
      other.uuid == uuid &&
      other.name == name &&
      other.factionType == factionType &&
      other.lawful == lawful &&
      other.isNpc == isNpc &&
      other.hasReputation == hasReputation &&
      other.link == link;

    @override
    int get hashCode =>
        uuid.hashCode +
        name.hashCode +
        (factionType == null ? 0 : factionType.hashCode) +
        (lawful == null ? 0 : lawful.hashCode) +
        isNpc.hashCode +
        hasReputation.hashCode +
        link.hashCode;

  factory FactionIndex.fromJson(Map<String, dynamic> json) => _$FactionIndexFromJson(json);

  Map<String, dynamic> toJson() => _$FactionIndexToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

