//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'game_starmap_location_amenity.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GameStarmapLocationAmenity {
  /// Returns a new [GameStarmapLocationAmenity] instance.
  GameStarmapLocationAmenity({

     this.uuid,

     this.name,

     this.displayName,
  });

      /// Unique identifier of the amenity.
  @JsonKey(
    
    name: r'uuid',
    required: false,
    includeIfNull: false,
  )


  final String? uuid;



      /// Internal name of the amenity.
  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



      /// Human-readable display name of the amenity, may differ from internal name.
  @JsonKey(
    
    name: r'display_name',
    required: false,
    includeIfNull: false,
  )


  final String? displayName;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GameStarmapLocationAmenity &&
      other.uuid == uuid &&
      other.name == name &&
      other.displayName == displayName;

    @override
    int get hashCode =>
        uuid.hashCode +
        name.hashCode +
        (displayName == null ? 0 : displayName.hashCode);

  factory GameStarmapLocationAmenity.fromJson(Map<String, dynamic> json) => _$GameStarmapLocationAmenityFromJson(json);

  Map<String, dynamic> toJson() => _$GameStarmapLocationAmenityToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

