//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'mission_broker_reputation_prerequisites.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MissionBrokerReputationPrerequisites {
  /// Returns a new [MissionBrokerReputationPrerequisites] instance.
  MissionBrokerReputationPrerequisites({

     this.maxWantedLevel,

     this.minWantedLevel,
  });

  @JsonKey(
    
    name: r'max_wanted_level',
    required: false,
    includeIfNull: false,
  )


  final int? maxWantedLevel;



  @JsonKey(
    
    name: r'min_wanted_level',
    required: false,
    includeIfNull: false,
  )


  final int? minWantedLevel;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MissionBrokerReputationPrerequisites &&
      other.maxWantedLevel == maxWantedLevel &&
      other.minWantedLevel == minWantedLevel;

    @override
    int get hashCode =>
        (maxWantedLevel == null ? 0 : maxWantedLevel.hashCode) +
        (minWantedLevel == null ? 0 : minWantedLevel.hashCode);

  factory MissionBrokerReputationPrerequisites.fromJson(Map<String, dynamic> json) => _$MissionBrokerReputationPrerequisitesFromJson(json);

  Map<String, dynamic> toJson() => _$MissionBrokerReputationPrerequisitesToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

