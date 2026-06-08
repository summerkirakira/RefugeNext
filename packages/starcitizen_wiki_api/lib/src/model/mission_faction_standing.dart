//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'mission_faction_standing.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MissionFactionStanding {
  /// Returns a new [MissionFactionStanding] instance.
  MissionFactionStanding({

     this.name,

     this.displayName,

     this.minReputation,
  });

  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



  @JsonKey(
    
    name: r'display_name',
    required: false,
    includeIfNull: false,
  )


  final String? displayName;



  @JsonKey(
    
    name: r'min_reputation',
    required: false,
    includeIfNull: false,
  )


  final int? minReputation;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MissionFactionStanding &&
      other.name == name &&
      other.displayName == displayName &&
      other.minReputation == minReputation;

    @override
    int get hashCode =>
        name.hashCode +
        (displayName == null ? 0 : displayName.hashCode) +
        minReputation.hashCode;

  factory MissionFactionStanding.fromJson(Map<String, dynamic> json) => _$MissionFactionStandingFromJson(json);

  Map<String, dynamic> toJson() => _$MissionFactionStandingToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

