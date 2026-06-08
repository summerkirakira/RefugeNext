//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'mission_starmap_location.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MissionStarmapLocation {
  /// Returns a new [MissionStarmapLocation] instance.
  MissionStarmapLocation({

     this.uuid,

     this.name,

     this.system,

     this.type,

     this.link,

     this.webUrl,
  });

  @JsonKey(
    
    name: r'uuid',
    required: false,
    includeIfNull: false,
  )


  final String? uuid;



  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



  @JsonKey(
    
    name: r'system',
    required: false,
    includeIfNull: false,
  )


  final String? system;



  @JsonKey(
    
    name: r'type',
    required: false,
    includeIfNull: false,
  )


  final String? type;



  @JsonKey(
    
    name: r'link',
    required: false,
    includeIfNull: false,
  )


  final String? link;



  @JsonKey(
    
    name: r'web_url',
    required: false,
    includeIfNull: false,
  )


  final String? webUrl;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MissionStarmapLocation &&
      other.uuid == uuid &&
      other.name == name &&
      other.system == system &&
      other.type == type &&
      other.link == link &&
      other.webUrl == webUrl;

    @override
    int get hashCode =>
        (uuid == null ? 0 : uuid.hashCode) +
        (name == null ? 0 : name.hashCode) +
        (system == null ? 0 : system.hashCode) +
        (type == null ? 0 : type.hashCode) +
        (link == null ? 0 : link.hashCode) +
        (webUrl == null ? 0 : webUrl.hashCode);

  factory MissionStarmapLocation.fromJson(Map<String, dynamic> json) => _$MissionStarmapLocationFromJson(json);

  Map<String, dynamic> toJson() => _$MissionStarmapLocationToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

