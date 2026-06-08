//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'faction_standing.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class FactionStanding {
  /// Returns a new [FactionStanding] instance.
  FactionStanding({

     this.uuid,

     this.name,

     this.factionType,

     this.lawful,

     this.isNpc,

     this.hasReputation,

     this.link,

     this.displayName,

     this.minReputation,

     this.driftReputation,

     this.driftTimeHours,

     this.gated,
  });

      /// Unique standing identifier.
  @JsonKey(
    
    name: r'uuid',
    required: false,
    includeIfNull: false,
  )


  final String? uuid;



      /// Internal standing name.
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



      /// Human-readable standing name.
  @JsonKey(
    
    name: r'display_name',
    required: false,
    includeIfNull: false,
  )


  final String? displayName;



      /// Minimum reputation required for this standing.
  @JsonKey(
    
    name: r'min_reputation',
    required: false,
    includeIfNull: false,
  )


  final int? minReputation;



      /// Reputation change applied per drift cycle.
  @JsonKey(
    
    name: r'drift_reputation',
    required: false,
    includeIfNull: false,
  )


  final int? driftReputation;



      /// Hours between drift cycles.
  @JsonKey(
    
    name: r'drift_time_hours',
    required: false,
    includeIfNull: false,
  )


  final int? driftTimeHours;



      /// Whether this standing is gated and cannot be reached through normal progression.
  @JsonKey(
    
    name: r'gated',
    required: false,
    includeIfNull: false,
  )


  final bool? gated;





    @override
    bool operator ==(Object other) => identical(this, other) || other is FactionStanding &&
      other.uuid == uuid &&
      other.name == name &&
      other.factionType == factionType &&
      other.lawful == lawful &&
      other.isNpc == isNpc &&
      other.hasReputation == hasReputation &&
      other.link == link &&
      other.displayName == displayName &&
      other.minReputation == minReputation &&
      other.driftReputation == driftReputation &&
      other.driftTimeHours == driftTimeHours &&
      other.gated == gated;

    @override
    int get hashCode =>
        uuid.hashCode +
        name.hashCode +
        (factionType == null ? 0 : factionType.hashCode) +
        (lawful == null ? 0 : lawful.hashCode) +
        isNpc.hashCode +
        hasReputation.hashCode +
        link.hashCode +
        (displayName == null ? 0 : displayName.hashCode) +
        minReputation.hashCode +
        driftReputation.hashCode +
        driftTimeHours.hashCode +
        gated.hashCode;

  factory FactionStanding.fromJson(Map<String, dynamic> json) => _$FactionStandingFromJson(json);

  Map<String, dynamic> toJson() => _$FactionStandingToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

