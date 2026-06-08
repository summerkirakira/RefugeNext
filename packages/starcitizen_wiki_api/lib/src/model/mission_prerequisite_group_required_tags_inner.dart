//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'mission_prerequisite_group_required_tags_inner.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MissionPrerequisiteGroupRequiredTagsInner {
  /// Returns a new [MissionPrerequisiteGroupRequiredTagsInner] instance.
  MissionPrerequisiteGroupRequiredTagsInner({

     this.name,

     this.uuid,
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





    @override
    bool operator ==(Object other) => identical(this, other) || other is MissionPrerequisiteGroupRequiredTagsInner &&
      other.name == name &&
      other.uuid == uuid;

    @override
    int get hashCode =>
        (name == null ? 0 : name.hashCode) +
        (uuid == null ? 0 : uuid.hashCode);

  factory MissionPrerequisiteGroupRequiredTagsInner.fromJson(Map<String, dynamic> json) => _$MissionPrerequisiteGroupRequiredTagsInnerFromJson(json);

  Map<String, dynamic> toJson() => _$MissionPrerequisiteGroupRequiredTagsInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

