//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'mission_reputation.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MissionReputation {
  /// Returns a new [MissionReputation] instance.
  MissionReputation({

     this.tier,

     this.scope,

     this.amount,

     this.faction,

     this.factionUuid,
  });

  @JsonKey(
    
    name: r'tier',
    required: false,
    includeIfNull: false,
  )


  final String? tier;



  @JsonKey(
    
    name: r'scope',
    required: false,
    includeIfNull: false,
  )


  final String? scope;



  @JsonKey(
    
    name: r'amount',
    required: false,
    includeIfNull: false,
  )


  final int? amount;



  @JsonKey(
    
    name: r'faction',
    required: false,
    includeIfNull: false,
  )


  final String? faction;



  @JsonKey(
    
    name: r'faction_uuid',
    required: false,
    includeIfNull: false,
  )


  final String? factionUuid;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MissionReputation &&
      other.tier == tier &&
      other.scope == scope &&
      other.amount == amount &&
      other.faction == faction &&
      other.factionUuid == factionUuid;

    @override
    int get hashCode =>
        (tier == null ? 0 : tier.hashCode) +
        (scope == null ? 0 : scope.hashCode) +
        (amount == null ? 0 : amount.hashCode) +
        (faction == null ? 0 : faction.hashCode) +
        (factionUuid == null ? 0 : factionUuid.hashCode);

  factory MissionReputation.fromJson(Map<String, dynamic> json) => _$MissionReputationFromJson(json);

  Map<String, dynamic> toJson() => _$MissionReputationToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

