//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'mission_index_min_standing.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MissionIndexMinStanding {
  /// Returns a new [MissionIndexMinStanding] instance.
  MissionIndexMinStanding({

     this.name,

     this.minReputation,
  });

  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



  @JsonKey(
    
    name: r'min_reputation',
    required: false,
    includeIfNull: false,
  )


  final int? minReputation;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MissionIndexMinStanding &&
      other.name == name &&
      other.minReputation == minReputation;

    @override
    int get hashCode =>
        (name == null ? 0 : name.hashCode) +
        (minReputation == null ? 0 : minReputation.hashCode);

  factory MissionIndexMinStanding.fromJson(Map<String, dynamic> json) => _$MissionIndexMinStandingFromJson(json);

  Map<String, dynamic> toJson() => _$MissionIndexMinStandingToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

