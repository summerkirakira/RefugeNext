//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'mission_index_reputation_gained_inner.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MissionIndexReputationGainedInner {
  /// Returns a new [MissionIndexReputationGainedInner] instance.
  MissionIndexReputationGainedInner({

     this.faction,

     this.factionUuid,

     this.scope,

     this.tier,

     this.amount,
  });

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



  @JsonKey(
    
    name: r'scope',
    required: false,
    includeIfNull: false,
  )


  final String? scope;



  @JsonKey(
    
    name: r'tier',
    required: false,
    includeIfNull: false,
  )


  final String? tier;



  @JsonKey(
    
    name: r'amount',
    required: false,
    includeIfNull: false,
  )


  final int? amount;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MissionIndexReputationGainedInner &&
      other.faction == faction &&
      other.factionUuid == factionUuid &&
      other.scope == scope &&
      other.tier == tier &&
      other.amount == amount;

    @override
    int get hashCode =>
        (faction == null ? 0 : faction.hashCode) +
        (factionUuid == null ? 0 : factionUuid.hashCode) +
        (scope == null ? 0 : scope.hashCode) +
        (tier == null ? 0 : tier.hashCode) +
        (amount == null ? 0 : amount.hashCode);

  factory MissionIndexReputationGainedInner.fromJson(Map<String, dynamic> json) => _$MissionIndexReputationGainedInnerFromJson(json);

  Map<String, dynamic> toJson() => _$MissionIndexReputationGainedInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

