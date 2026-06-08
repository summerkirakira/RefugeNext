//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/mission_chain_link.dart';
import 'package:json_annotation/json_annotation.dart';

part 'mission_unlock_group.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MissionUnlockGroup {
  /// Returns a new [MissionUnlockGroup] instance.
  MissionUnlockGroup({

     this.tagName,

     this.tagUuid,

     this.missions,
  });

  @JsonKey(
    
    name: r'tag_name',
    required: false,
    includeIfNull: false,
  )


  final String? tagName;



  @JsonKey(
    
    name: r'tag_uuid',
    required: false,
    includeIfNull: false,
  )


  final String? tagUuid;



  @JsonKey(
    
    name: r'missions',
    required: false,
    includeIfNull: false,
  )


  final List<MissionChainLink>? missions;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MissionUnlockGroup &&
      other.tagName == tagName &&
      other.tagUuid == tagUuid &&
      other.missions == missions;

    @override
    int get hashCode =>
        (tagName == null ? 0 : tagName.hashCode) +
        (tagUuid == null ? 0 : tagUuid.hashCode) +
        missions.hashCode;

  factory MissionUnlockGroup.fromJson(Map<String, dynamic> json) => _$MissionUnlockGroupFromJson(json);

  Map<String, dynamic> toJson() => _$MissionUnlockGroupToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

