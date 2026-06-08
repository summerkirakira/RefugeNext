//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/mission_faction_standing.dart';
import 'package:json_annotation/json_annotation.dart';

part 'mission_faction_reputation_scope.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MissionFactionReputationScope {
  /// Returns a new [MissionFactionReputationScope] instance.
  MissionFactionReputationScope({

     this.scopeName,

     this.standings,
  });

  @JsonKey(
    
    name: r'scope_name',
    required: false,
    includeIfNull: false,
  )


  final String? scopeName;



  @JsonKey(
    
    name: r'standings',
    required: false,
    includeIfNull: false,
  )


  final List<MissionFactionStanding>? standings;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MissionFactionReputationScope &&
      other.scopeName == scopeName &&
      other.standings == standings;

    @override
    int get hashCode =>
        (scopeName == null ? 0 : scopeName.hashCode) +
        standings.hashCode;

  factory MissionFactionReputationScope.fromJson(Map<String, dynamic> json) => _$MissionFactionReputationScopeFromJson(json);

  Map<String, dynamic> toJson() => _$MissionFactionReputationScopeToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

