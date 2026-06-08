//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'mission_index_faction.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MissionIndexFaction {
  /// Returns a new [MissionIndexFaction] instance.
  MissionIndexFaction({

     this.name,

     this.uuid,

     this.link,
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
    
    name: r'link',
    required: false,
    includeIfNull: false,
  )


  final String? link;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MissionIndexFaction &&
      other.name == name &&
      other.uuid == uuid &&
      other.link == link;

    @override
    int get hashCode =>
        (name == null ? 0 : name.hashCode) +
        (uuid == null ? 0 : uuid.hashCode) +
        (link == null ? 0 : link.hashCode);

  factory MissionIndexFaction.fromJson(Map<String, dynamic> json) => _$MissionIndexFactionFromJson(json);

  Map<String, dynamic> toJson() => _$MissionIndexFactionToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

