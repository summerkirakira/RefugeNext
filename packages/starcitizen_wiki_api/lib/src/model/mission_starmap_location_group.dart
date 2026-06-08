//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:starcitizen_wiki_api/src/model/mission_starmap_location.dart';
import 'package:json_annotation/json_annotation.dart';

part 'mission_starmap_location_group.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MissionStarmapLocationGroup {
  /// Returns a new [MissionStarmapLocationGroup] instance.
  MissionStarmapLocationGroup({

     this.purpose,

     this.locations,
  });

  @JsonKey(
    
    name: r'purpose',
    required: false,
    includeIfNull: false,
  )


  final String? purpose;



  @JsonKey(
    
    name: r'locations',
    required: false,
    includeIfNull: false,
  )


  final List<MissionStarmapLocation>? locations;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MissionStarmapLocationGroup &&
      other.purpose == purpose &&
      other.locations == locations;

    @override
    int get hashCode =>
        purpose.hashCode +
        locations.hashCode;

  factory MissionStarmapLocationGroup.fromJson(Map<String, dynamic> json) => _$MissionStarmapLocationGroupFromJson(json);

  Map<String, dynamic> toJson() => _$MissionStarmapLocationGroupToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

