//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'game_starmap_location_radar_contact_type.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GameStarmapLocationRadarContactType {
  /// Returns a new [GameStarmapLocationRadarContactType] instance.
  GameStarmapLocationRadarContactType({

     this.uuid,

     this.name,

     this.displayName,

     this.tagUuid,

     this.tagName,

     this.isObjectOfInterest,
  });

      /// UUID of the radar contact type.
  @JsonKey(
    
    name: r'uuid',
    required: false,
    includeIfNull: false,
  )


  final String? uuid;



      /// Internal name of the radar contact type.
  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



      /// Human-readable display name of the radar contact type.
  @JsonKey(
    
    name: r'display_name',
    required: false,
    includeIfNull: false,
  )


  final String? displayName;



      /// UUID of the associated hierarchy entity tag.
  @JsonKey(
    
    name: r'tag_uuid',
    required: false,
    includeIfNull: false,
  )


  final String? tagUuid;



      /// Name of the associated hierarchy entity tag.
  @JsonKey(
    
    name: r'tag_name',
    required: false,
    includeIfNull: false,
  )


  final String? tagName;



      /// Whether this location is marked as an object of interest.
  @JsonKey(
    
    name: r'is_object_of_interest',
    required: false,
    includeIfNull: false,
  )


  final bool? isObjectOfInterest;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GameStarmapLocationRadarContactType &&
      other.uuid == uuid &&
      other.name == name &&
      other.displayName == displayName &&
      other.tagUuid == tagUuid &&
      other.tagName == tagName &&
      other.isObjectOfInterest == isObjectOfInterest;

    @override
    int get hashCode =>
        (uuid == null ? 0 : uuid.hashCode) +
        (name == null ? 0 : name.hashCode) +
        (displayName == null ? 0 : displayName.hashCode) +
        (tagUuid == null ? 0 : tagUuid.hashCode) +
        (tagName == null ? 0 : tagName.hashCode) +
        (isObjectOfInterest == null ? 0 : isObjectOfInterest.hashCode);

  factory GameStarmapLocationRadarContactType.fromJson(Map<String, dynamic> json) => _$GameStarmapLocationRadarContactTypeFromJson(json);

  Map<String, dynamic> toJson() => _$GameStarmapLocationRadarContactTypeToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

